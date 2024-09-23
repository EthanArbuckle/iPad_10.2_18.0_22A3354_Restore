@implementation OAVWordArt

+ (void)readFromManager:(id)a3 toShape:(id)a4 state:(id)a5
{
  OADPresetShapeGeometry *v7;
  void *v8;
  void *v9;
  _xmlNode *v10;
  _xmlNode *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  unsigned int i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  NSString *v30;
  OADPresetTextWarp *v31;
  void *v32;
  id v33;
  void *v34;
  id v36;
  id v37;

  v37 = a3;
  v33 = a4;
  v36 = a5;
  v7 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADShapeGeometry setIsEscher:](v7, "setIsEscher:", 1);
  -[OADPresetShapeGeometry setType:](v7, "setType:", 1);
  objc_msgSend(v33, "setGeometry:", v7);

  objc_msgSend(v33, "textBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADTextBodyProperties defaultEscherWordArtProperties](OADTextBodyProperties, "defaultEscherWordArtProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setParent:", v9);

  v31 = objc_alloc_init(OADPresetTextWarp);
  -[OADPresetTextWarp setPresetTextWarpType:](v31, "setPresetTextWarpType:", 29);
  objc_msgSend(v32, "setTextWarp:", v31);
  v10 = (_xmlNode *)objc_msgSend(v37, "shape");
  v11 = (_xmlNode *)OCXFindChild(v10, (CXNamespace *)OAVOfficeMainNamespace, "textpath");
  CXDefaultStringAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", 0);
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadComposite(v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKey:", CFSTR("v-text-align"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = (const __CFString *)v12;
  else
    v13 = CFSTR("left");
  v29 = (__CFString *)v13;
  v14 = objc_msgSend(a1, "readTextAlign:");
  CXDefaultStringAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"string", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v28, "mutableCopy");
  objc_msgSend(v27, "tc_replaceAllSubstr:with:", CFSTR("\r\n"), CFSTR("\r"));
  objc_msgSend(v27, "tc_replaceAllSubstr:with:", CFSTR("\n"), CFSTR("\r"));
  objc_msgSend(v27, "componentsSeparatedByString:", CFSTR("\r"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v15, "count") > (unint64_t)i; ++i)
  {
    objc_msgSend(v15, "objectAtIndex:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    objc_msgSend(v8, "addParagraph");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "properties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlign:", v14);
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(v19, "addRegularTextRun");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setString:", v17);

      objc_msgSend(v21, "properties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "readFromStyle:manager:toCharacterProperties:state:", v34, v37, v23, v36);

    }
    objc_msgSend(v19, "paragraphEndCharacterProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFromStyle:manager:toCharacterProperties:state:", v34, v37, v24, v36);
    objc_msgSend(v33, "graphicProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "hasFill"))
    {
      objc_msgSend(v25, "fill");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFill:", v26);

      objc_msgSend(v25, "setFill:", 0);
    }

    v8 = v18;
  }

}

+ (unsigned)readTextAlign:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v3 = a3;
  v4 = (void *)+[OAVWordArt(Private) readTextAlign:]::enumMap;
  if (!+[OAVWordArt(Private) readTextAlign:]::enumMap)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, CFSTR("justify"), v7, CFSTR("center"), v8, CFSTR("left"), v9, CFSTR("right"), v10, CFSTR("letter-justify"), v11, CFSTR("stretch-justify"), 0);
    v13 = (void *)+[OAVWordArt(Private) readTextAlign:]::enumMap;
    +[OAVWordArt(Private) readTextAlign:]::enumMap = v12;

    v4 = (void *)+[OAVWordArt(Private) readTextAlign:]::enumMap;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  return v15;
}

+ (void)readFromStyle:(id)a3 manager:(id)a4 toCharacterProperties:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v24, "objectForKey:", CFSTR("font-family"));
  v12 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v12;
  if (v12)
    objc_msgSend(v10, "setLatinFont:", v12);
  objc_msgSend(v24, "objectForKey:", CFSTR("font-size"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = (NSString *)v13;
  else
    v14 = (NSString *)CFSTR("36pt");
  *(float *)&v15 = (float)(unint64_t)OAVReadLength(v14);
  objc_msgSend(v10, "setSize:", v15);
  objc_msgSend(v24, "objectForKey:", CFSTR("font-weight"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsBold:", objc_msgSend(v16, "isEqualToString:", CFSTR("bold")));
  objc_msgSend(v24, "objectForKey:", CFSTR("font-style"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsItalic:", objc_msgSend(v17, "isEqualToString:", CFSTR("italic")));
  objc_msgSend(v24, "objectForKey:", CFSTR("text-decoration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("underline")))
    objc_msgSend(v10, "setUnderlineType:", 2);
  objc_msgSend(v10, "setStrikeThroughType:", objc_msgSend(v18, "isEqualToString:", CFSTR("line-through")));
  objc_msgSend(v24, "objectForKey:", CFSTR("font-variant"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "isEqualToString:", CFSTR("small-caps"));
  v20 = v9;
  +[OAVFill readFromManager:state:](OAVFill, "readFromManager:state:", v9, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill:", v21);
  +[OAVStroke readFromManager:](OAVStroke, "readFromManager:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStroke:", v22);

}

@end
