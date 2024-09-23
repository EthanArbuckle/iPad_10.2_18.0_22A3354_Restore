@implementation PHUtilityCollection(PXDisplayAssetAdoption)

- (uint64_t)px_isUtilityCollection
{
  return 1;
}

- (const)px_symbolImageName
{
  unsigned int v1;

  v1 = objc_msgSend(a1, "type") - 1;
  if (v1 > 5)
    return CFSTR("rectangle.stack");
  else
    return off_1E51305A8[(unsigned __int16)v1];
}

@end
