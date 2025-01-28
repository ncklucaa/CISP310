/*

Nick Luca
CISP 310
Prof Al Juboori
Assignment #1 Q5

*/

#include <iostream>
#include <cmath>
#include <string>

using namespace std;

string binaryNumToHexadecimal(const string& binaryNum);
bool HandleInput(string& binaryNum);

string binaryNumToHexadecimal(const string& binaryNum)
{
	string fixedWidth = binaryNum;
	string hexaDecimal = "";

	char set[4];
	int setFill = 0;

	while (fixedWidth.length() % 4 != 0)
	{
		fixedWidth = "0" + fixedWidth;
	}

	for (int i = 0; i < static_cast<int>(fixedWidth.length()); i++)
	{
		set[setFill++] = fixedWidth[i];

		if (setFill == 4)
		{
			int decValue = 0;

			for (int k = 0; k < 4; k++)
			{
				if (set[k] == '1')
				{
					decValue += pow(2, 3 - k);
				}
			}

			if (decValue < 10)
			{
				hexaDecimal += ('0' + decValue);
			}
			else
			{
				hexaDecimal += ('A' + (decValue - 10));
			}

			setFill = 0;
		}
	}

	return hexaDecimal;
}

bool HandleInput(string& binaryNum)
{
	cout << "Binary Number: ";
	cin >> binaryNum;

	for (int i = 0; i < binaryNum.length(); i++)
	{
		if (binaryNum[i] != '0' && binaryNum[i] != '1')
		{
			cout << "Invalid Input\n" << endl;

			return false;
		}
	}

	return true;
}

int main()
{
	string binaryNum;
	char userInput;

	do
	{
		while (!HandleInput(binaryNum)) {}

		string hexaDecimal = binaryNumToHexadecimal(binaryNum);

		cout << "Hexadecimal: " << hexaDecimal << endl;

		do
		{
			cout << "\nRun the program again? (y/n): ";
			cin >> userInput;
			cout << endl;

			if (cin.fail() || (toupper(userInput) != 'Y' && toupper(userInput) != 'N'))
			{
				cin.clear();
				cin.ignore(1000, '\n');
			}
			else
			{
				userInput = toupper(userInput);
			}
		} while (userInput != 'Y' && userInput != 'N');
	} while (userInput == 'Y');

	return 0;
}