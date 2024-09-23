@implementation OABWordArt

+ (void)readFromShapeManager:(id)a3 toShape:(id)a4 state:(id)a5
{
  OADPresetShapeGeometry *v8;
  void *v9;
  void *v10;
  OADPresetTextWarp *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  OADPresetTextWarp *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  id v32;

  v32 = a3;
  v30 = a4;
  v31 = a5;
  v8 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADShapeGeometry setIsEscher:](v8, "setIsEscher:", 1);
  -[OADPresetShapeGeometry setType:](v8, "setType:", 1);
  objc_msgSend(v30, "setGeometry:", v8);

  objc_msgSend(v30, "textBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "properties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADTextBodyProperties defaultEscherWordArtProperties](OADTextBodyProperties, "defaultEscherWordArtProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setParent:", v10);

  v11 = objc_alloc_init(OADPresetTextWarp);
  -[OADPresetTextWarp setPresetTextWarpType:](v11, "setPresetTextWarpType:", 29);
  objc_msgSend(v28, "setTextWarp:", v11);
  v29 = objc_msgSend(a1, "readTextAlignment:", objc_msgSend(v32, "textPathTextAlignment"));
  objc_msgSend(v32, "textPathUnicodeString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v27, "mutableCopy");
  objc_msgSend(v26, "tc_replaceAllSubstr:with:", CFSTR("\r\n"), CFSTR("\r"));
  objc_msgSend(v26, "tc_replaceAllSubstr:with:", CFSTR("\n"), CFSTR("\r"));
  v25 = v11;
  objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("\r"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  while (1)
  {
    v14 = v13;
    if (objc_msgSend(v12, "count") <= (unint64_t)v13)
      break;
    objc_msgSend(v12, "objectAtIndex:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    objc_msgSend(v9, "addParagraph");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlign:", v29);
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v17, "addRegularTextRun");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setString:", v15);

      objc_msgSend(v19, "properties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "readFromShapeManager:toCharacterProperties:state:", v32, v21, v31);

    }
    objc_msgSend(v17, "paragraphEndCharacterProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFromShapeManager:toCharacterProperties:state:", v32, v22, v31);
    objc_msgSend(v30, "graphicProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "hasFill"))
    {
      objc_msgSend(v23, "fill");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFill:", v24);

      objc_msgSend(v23, "setFill:", 0);
    }

    v13 = v14 + 1;
    v9 = v16;
  }

}

+ (unsigned)readTextAlignment:(int)a3
{
  unint64_t v3;

  v3 = 0x50502000103uLL >> (8 * a3);
  if (a3 >= 6)
    LOBYTE(v3) = 0;
  return v3 & 7;
}

+ (void)readFromShapeManager:(id)a3 toCharacterProperties:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v14, "textPathFontFamily");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "setLatinFont:", v9);
  *(float *)&v10 = (float)(int)EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v14, "textPathFontSize"));
  objc_msgSend(v7, "setSize:", v10);
  objc_msgSend(v7, "setIsBold:", objc_msgSend(v14, "textPathBold"));
  objc_msgSend(v7, "setIsItalic:", objc_msgSend(v14, "textPathItalic"));
  objc_msgSend(v7, "setUnderlineType:", 0);
  objc_msgSend(v14, "textPathSmallcaps");
  objc_msgSend(v7, "setStrikeThroughType:", 0);
  +[OABFill readFillFromFillPropertiesManager:state:](OABFill, "readFillFromFillPropertiesManager:state:", v14, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill:", v11);
  +[OABStroke readStrokeFromShapeBaseManager:state:](OABStroke, "readStrokeFromShapeBaseManager:state:", v14, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStroke:", v12);
  +[OABShadow readShadowFromShapeBaseManager:state:](OABShadow, "readShadowFromShapeBaseManager:state:", v14, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffects:", v13);

}

@end
