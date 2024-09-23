@implementation PBColorScheme

+ (void)readFromColorScheme:(PptColorSchemeAtom *)a3 toColorScheme:(id)a4 colorMap:(id)a5 state:(id)a6
{
  id v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = v9;
  if (__PAIR64__(a3->var7.var1, a3->var7.var0) == 0xFF000000FFLL && a3->var7.var2 == 255 && a3->var7.var3 == 255)
    v11 = 1;
  else
    v11 = a3->var8.var0 == 255 && !a3->var8.var1 && !a3->var8.var2 && a3->var8.var3 == 0;
  objc_msgSend(v9, "addDefaultMappings:", v11);
  v12 = 0;
  do
  {
    objc_msgSend(a1, "addColorWithIndex:fromScheme:atIndex:inScheme:", v12, a3, +[OADColor mapSchemeColorID:colorMap:](OADColor, "mapSchemeColorID:colorMap:", objc_msgSend(a1, "oadSchemeColorValueForEshSchemeColorIndex:", (unsigned __int16)v12), v10), v13);
    v12 = (v12 + 1);
  }
  while ((_DWORD)v12 != 8);

}

+ (void)addColorWithIndex:(int)a3 fromScheme:(PptColorSchemeAtom *)a4 atIndex:(int)a5 inScheme:(id)a6
{
  objc_msgSend(a1, "addColorWithIndex:fromScheme:colorTransform:atIndex:inScheme:", *(_QWORD *)&a3, a4, 0, *(_QWORD *)&a5, a6);
}

+ (void)addColorWithIndex:(int)a3 fromScheme:(PptColorSchemeAtom *)a4 colorTransform:(void *)a5 atIndex:(int)a6 inScheme:(id)a7
{
  uint64_t v7;
  unsigned __int16 v10;
  unsigned __int16 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  OADRgbColor *v15;
  double v16;
  double v17;
  double v18;
  OADRgbColor *v19;
  id v20;

  v7 = *(_QWORD *)&a6;
  v10 = a3;
  v20 = a7;
  v11 = (unsigned __int16 *)(*((uint64_t (**)(PptColorSchemeAtom *, _QWORD))a4->var0 + 19))(a4, v10);
  v12 = v11[1];
  v13 = v11[2];
  v14 = v11[3];
  if (a5)
  {
    v12 = ((uint64_t (*)(_QWORD))a5)(v11[1]);
    LODWORD(v13) = ((uint64_t (*)(uint64_t))a5)(v13);
    LODWORD(v14) = ((uint64_t (*)(uint64_t))a5)(v14);
  }
  v15 = [OADRgbColor alloc];
  *(float *)&v16 = (float)v12;
  *(float *)&v17 = (float)v13;
  *(float *)&v18 = (float)v14;
  v19 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v15, "initWithRedByte:greenByte:blueByte:", v16, v17, v18);
  objc_msgSend(v20, "addColor:index:", v19, v7);

}

+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3
{
  if (a3 > 7u)
    return -1;
  else
    return oadSchemeColorValueArray[a3];
}

+ (unsigned)eshSchemeColorIndexForOADSchemeColorValue:(int)a3
{
  uint64_t v3;

  v3 = 0;
  while (oadSchemeColorValueArray[v3] != a3)
  {
    if (++v3 == 8)
    {
      LOWORD(v3) = -1;
      return v3;
    }
  }
  return v3;
}

@end
