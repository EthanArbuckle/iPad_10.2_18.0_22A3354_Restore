@implementation PBCharacterProperties

+ (void)readCharacterProperties:(id)a3 characterProperty:(PptCharProperty *)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  double v19;
  int v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  $4A9E05CF4EB813CDA9C8B3A246960F55 var0;
  int var1;
  unsigned int v34;
  unsigned int var2;
  unsigned int var3;
  OADRgbColor *v37;
  double v38;
  double v39;
  double v40;
  OADSchemeColor *v41;
  OADSchemeColor *v42;
  OADSolidFill *v43;
  id v44;

  v44 = a3;
  v7 = a5;
  objc_msgSend(v7, "currentMacCharStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8
    && (v10 = (const void *)objc_msgSend(v8, "eshObject")) != 0
  {
    v14 = *(_QWORD *)(v13 + 8 * v12);
  }
  else
  {
    v14 = 0;
  }
  if ((objc_msgSend(v7, "hasCharacterPropertyBulletIndex") & 1) == 0)
    objc_msgSend(v7, "setBulletIndex:", (*((unsigned __int16 *)a4 + 2) >> 10) & 0xF);
  objc_msgSend(v44, "setIsBold:", *((_WORD *)a4 + 2) & 1);
  objc_msgSend(v44, "setIsItalic:", (*((unsigned __int16 *)a4 + 2) >> 1) & 1);
  objc_msgSend(v44, "setUnderlineType:", (*((unsigned __int8 *)a4 + 4) >> 1) & 2);
  if ((*((_WORD *)a4 + 2) & 0x10) != 0)
  {
    v15 = +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
    if (!+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects)
    {
      v16 = objc_alloc(MEMORY[0x24BDBCE30]);
      v17 = objc_msgSend(v16, "initWithObjects:", kOADAutoTextShadowEffect, 0);
      v18 = (void *)+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
      +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects = v17;

      v15 = +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
    }
  }
  else
  {
    if (+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::once != -1)
      dispatch_once(&+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::once, &__block_literal_global_98);
    v15 = +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
  }
  objc_msgSend(v44, "setEffects:", v15);
  if (v14 && *(_BYTE *)(v14 + 8))
  {
    *(float *)&v19 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)*(unsigned int *)(v14 + 12));
    objc_msgSend(v44, "setOpacity:", v19);
  }
  v20 = *((unsigned __int16 *)a4 + 2);
  if ((v20 & 8) != 0)
    v21 = 1;
  else
    v21 = (v20 << 22 >> 31) & 3;
  objc_msgSend(v44, "setFormatType:", v21);
  v22 = (double)a4->var19 / 100.0;
  *(float *)&v22 = v22;
  objc_msgSend(v44, "setBaseline:", v22);
  if ((*((_BYTE *)&a4->var0 + 1) & 0x40) != 0)
  {
    LOWORD(v23) = a4->var17;
    *(float *)&v23 = (float)LODWORD(v23);
    objc_msgSend(v44, "setSize:", v23);
  }
  if (a4->var13 != 0xFFFFLL)
  {
    objc_msgSend(v7, "fontEntityAtIndex:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "faceName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setLatinFont:", v25);

  }
  if ((*((_BYTE *)&a4->var0 + 1) & 0x10) != 0 && a4->var15 != 0xFFFFLL)
  {
    objc_msgSend(v7, "fontEntityAtIndex:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "faceName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setHAnsiFont:", v27);

  }
  if (a4->var14 != 0xFFFFLL)
  {
    objc_msgSend(v7, "fontEntityAtIndex:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "faceName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setEastAsianFont:", v29);

  }
  if (((__int16)a4->var16 & 0x80000000) == 0)
  {
    objc_msgSend(v7, "fontEntityAtIndex:", a4->var16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "faceName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setSymbolFont:", v31);

  }
  var0 = a4->var0;
  if ((*(_DWORD *)&a4->var0 & 0x40) != 0 && (*((_WORD *)a4 + 2) & 0x40) != 0)
  {
    objc_msgSend(v44, "setFormatKerningType:", 2);
    var0 = a4->var0;
  }
  if ((*(_WORD *)&var0 & 0x100) != 0 && (*((_WORD *)a4 + 2) & 0x100) != 0)
    objc_msgSend(v44, "setFormatKerningType:", 1);
  var1 = a4->var18.var1;
  if (var1 != 255)
  {
    if (var1 == 254)
    {
      v34 = a4->var18.var0.var1;
      var2 = a4->var18.var0.var2;
      var3 = a4->var18.var0.var3;
      v37 = [OADRgbColor alloc];
      *(float *)&v38 = (float)v34;
      *(float *)&v39 = (float)var2;
      *(float *)&v40 = (float)var3;
      v41 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v37, "initWithRedByte:greenByte:blueByte:", v38, v39, v40);
    }
    else
    {
      v41 = -[OADSchemeColor initWithSchemeColorIndex:]([OADSchemeColor alloc], "initWithSchemeColorIndex:", +[PBColorScheme oadSchemeColorValueForEshSchemeColorIndex:](PBColorScheme, "oadSchemeColorValueForEshSchemeColorIndex:", (unsigned __int16)a4->var18.var1));
    }
    v42 = v41;
    v43 = objc_alloc_init(OADSolidFill);
    -[OADSolidFill setColor:](v43, "setColor:", v42);
    objc_msgSend(v44, "setFill:", v43);

  }
}

+ (void)readCharacterProperties:(id)a3 characterPropertyRun:(PptCharRun *)a4 state:(id)a5
{
  objc_msgSend(a1, "readCharacterProperties:characterProperty:state:", a3, &a4->var1, a5);
}

void __73__PBCharacterProperties_readCharacterProperties_characterProperty_state___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v1 = (void *)+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
  +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects = (uint64_t)v0;

}

+ (void)readCharacterProperties:(id)a3 specialInfoRun:(const void *)a4 state:(id)a5
{
  objc_msgSend(a1, "readCharacterProperties:specialInfo:state:", a3, (char *)a4 + 8, a5);
}

+ (void)readCharacterProperties:(id)a3 specialInfo:(const PptSpecialInfo *)a4 state:(id)a5
{
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&a4->var0 & 2) != 0)
    objc_msgSend(v6, "setLanguage:", *(_DWORD *)&a4->var1);

}

@end
