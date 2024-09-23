@implementation OAVFormula

+ (void)readFormulasFromManager:(id)a3 toGeometry:(id)a4
{
  id v6;
  _xmlNode *v7;
  _xmlNode *v8;
  _xmlNode *i;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (_xmlNode *)objc_msgSend(v11, "shape");
  v8 = (_xmlNode *)OCXFindChild(v7, (CXNamespace *)OAVOfficeMainNamespace, "formulas");
  if (v8)
  {
    for (i = (_xmlNode *)OCXFindChild(v8, (CXNamespace *)OAVOfficeMainNamespace, "f");
          i;
          i = OCXFindNextChild(i, (CXNamespace *)OAVOfficeMainNamespace, (xmlChar *)"f"))
    {
      objc_msgSend(a1, "readFormula:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addFormula:", v10);

    }
  }

}

+ (id)readFormula:(_xmlNode *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  OADFormula *v20;
  OADFormula *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"eqn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[OAVFormula(Private) readFormula:]::typeMap)
  {
    v5 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v36 = (void *)v7;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v31, CFSTR("val"), v6, CFSTR("sum"), v36, CFSTR("prod"), v8, CFSTR("mid"), v37, CFSTR("abs"), v35, CFSTR("min"), v30, CFSTR("max"), v34, CFSTR("if"), v33,
      CFSTR("mod"),
      v29,
      CFSTR("atan2"),
      v28,
      CFSTR("sin"),
      v27,
      CFSTR("cos"),
      v32,
      CFSTR("cosatan2"),
      v26,
      CFSTR("sinatan2"),
      v25,
      CFSTR("sqrt"),
      v24,
      CFSTR("sumangle"),
      v9,
      CFSTR("ellipse"),
      v23,
      CFSTR("tan"),
      0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)+[OAVFormula(Private) readFormula:]::typeMap;
    +[OAVFormula(Private) readFormula:]::typeMap = v10;

  }
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v13 = (void *)+[OAVFormula(Private) readFormula:]::typeMap;
  objc_msgSend(v12, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "intValue");
  v17 = 0;
  do
  {
    v18 = v17 + 1;
    if (objc_msgSend(v12, "count") <= (unint64_t)(v17 + 1))
      break;
    objc_msgSend(v12, "objectAtIndex:", v17 + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(&v38 + v17) = objc_msgSend(a1, "readArgument:", v19);

    ++v17;
  }
  while (v18 != 3);
  v20 = [OADFormula alloc];
  v21 = -[OADFormula initWithType:arg0:arg1:arg2:](v20, "initWithType:arg0:arg1:arg2:", v16, v38, v39, v40);

  return v21;
}

+ (OADFormulaArg)readArgument:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = a3;
  if (!+[OAVFormula(Private) readArgument:]::keywordMap)
  {
    v4 = (void *)MEMORY[0x24BDBCE70];
    v24 = v3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 320);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 321);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 322);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 323);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 339);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 340);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1271);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1272);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1273);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1276);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1277);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1278);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1279);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v23, CFSTR("xcenter"), v5, CFSTR("ycenter"), v27, CFSTR("width"), v26, CFSTR("height"), v10, CFSTR("xlimo"), v7, CFSTR("ylimo"), v8, CFSTR("pixellinewidth"), v9, CFSTR("pixelwidth"), v22,
      CFSTR("pixelheight"),
      v25,
      CFSTR("emuwidth"),
      v12,
      CFSTR("emuheight"),
      v13,
      CFSTR("emuwidth2"),
      v14,
      CFSTR("emuheight2"),
      0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)+[OAVFormula(Private) readArgument:]::keywordMap;
    +[OAVFormula(Private) readArgument:]::keywordMap = v15;

    v3 = v24;
  }
  v17 = objc_msgSend(v3, "characterAtIndex:", 0);
  if (v17 <= 0xFF && ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v17 + 60) >> 10) & 1) != 0 || v17 == 45)
  {
    v19 = objc_msgSend(v3, "intValue");
    v20 = 1;
  }
  else
  {
    if (v17 == 64)
    {
      objc_msgSend(v3, "substringFromIndex:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");
      v20 = 3;
    }
    else if (v17 == 35)
    {
      objc_msgSend(v3, "substringFromIndex:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");
      v20 = 2;
    }
    else
    {
      objc_msgSend((id)+[OAVFormula(Private) readArgument:]::keywordMap, "objectForKey:", v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");
      v20 = 4;
    }

  }
  return (OADFormulaArg)(v20 | (v19 << 32));
}

@end
