@implementation NSArray

BOOL __38__NSArray_FormField___fieldsOfSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EFF19038) & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = objc_msgSend(v4, "fieldSource") == *(_QWORD *)(a1 + 32);
LABEL_6:

  return v5;
}

BOOL __36__NSArray_FormField___fieldsOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EFF19038) & 1) == 0)
  {

    v4 = 0;
    goto LABEL_5;
  }
  v4 = v3;

  if (!v4)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = objc_msgSend(v4, "fieldType") == *(_QWORD *)(a1 + 32);
LABEL_6:

  return v5;
}

BOOL __38__NSArray_FormField___nonFieldRegions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  CRCastAsClass<CROutputRegion>(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "type") != 0x2000;
  else
    v4 = 0;

  return v4;
}

@end
