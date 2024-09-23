@implementation SVXNSLocaleFactory

- (id)canonicalLocaleIdentifierFromString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", a3);
}

- (id)localeWithLocaleIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a3);
}

@end
