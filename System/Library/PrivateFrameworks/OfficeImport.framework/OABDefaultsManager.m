@implementation OABDefaultsManager

- (EshColor)strokeFgColor
{
  EshStroke *v2;

  LODWORD(v2->var0) = 255;
  return (EshColor)EshStroke::getDefaultColor(v2, (EshColor *)a2);
}

- (EshColor)fillFgColor
{
  EshFill *v2;

  LODWORD(v2->var0) = 255;
  return (EshColor)EshFill::getDefaultColor(v2, (EshColor *)a2);
}

- (id)fillBlipName
{
  void *DefaultBlipName;

  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName)
    DefaultBlipName = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", DefaultBlipName);
  return DefaultBlipName;
}

- (EshColor)fillBgColor
{
  EshFill *v2;

  LODWORD(v2->var0) = 255;
  return (EshColor)EshFill::getDefaultColor(v2, (EshColor *)a2);
}

- (id)strokeFillBlipName
{
  void *DefaultBlipName;

  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName)
    DefaultBlipName = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", DefaultBlipName);
  return DefaultBlipName;
}

- (EshColor)strokeBgColor
{
  EshFill *v2;

  LODWORD(v2->var0) = 255;
  return (EshColor)EshFill::getDefaultColor(v2, (EshColor *)a2);
}

- (EshColor)shadowColor
{
  EshShadow *v2;

  *(_DWORD *)v2 = 255;
  return (EshColor)EshShadow::getDefaultColor(v2, (EshColor *)a2);
}

- (EshBlip)fillBlipDataReference
{
  return 0;
}

- (EshBlip)strokeFillBlipDataReference
{
  return 0;
}

- (id)textPathUnicodeString
{
  void *DefaultBlipName;

  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName)
    DefaultBlipName = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", DefaultBlipName);
  return DefaultBlipName;
}

- (id)textPathFontFamily
{
  void *DefaultBlipName;

  DefaultBlipName = (void *)EshFill::getDefaultBlipName((EshFill *)self);
  if (DefaultBlipName)
    DefaultBlipName = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", DefaultBlipName);
  return DefaultBlipName;
}

@end
