@implementation TypistThaiSyllable

+ (BOOL)isThaiCharacter:(unsigned __int16)a3
{
  return (a3 - 3584) < 0x81;
}

+ (id)tallCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 3650, 3);
}

+ (id)upperCombiningCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("◌ี◌ื◌ั◌ั◌็◌ิ◌̍◌̎◌ํ◌ึ◌์◌่◌้◌๊◌๋"));
}

+ (id)smallCharacers
{
  return (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 3585, 47);
}

@end
