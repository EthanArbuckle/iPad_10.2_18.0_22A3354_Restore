@implementation EXString

+ (id)readStringWithAsciiCodeFromXmlStringElement:(_xmlNode *)a3
{
  _xmlNode *v3;

  v3 = a3;
  if (a3)
  {
    v3 = (_xmlNode *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "tc_initWithContentOfXmlNode:", a3);
    if (!v3)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(a1, "parseStringWithAsciiCode:", v3);
  }
  return v3;
}

+ (void)parseStringWithAsciiCode:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  unsigned __int16 v16;
  uint64_t i;
  int8x8_t v18;
  int8x8_t v19;
  uint16x4_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  int16x4_t v24[2];

  v24[1] = *(int16x4_t *)MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "rangeOfString:", CFSTR("_x")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789abcdefABCDEF"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("_x"));
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      while (1)
      {
        v5 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("_"), 0, v4 + 2, objc_msgSend(v3, "length") - (v4 + 2));
        v6 = v5;
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_28;
        if (v5 == v4 + 6)
          break;
        v4 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("_x"), 0, v5 + 1, objc_msgSend(v3, "length") - (v5 + 1));
LABEL_27:
        if (v4 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_28;
      }
      objc_msgSend(v3, "substringWithRange:", v4 + 2, 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = &stru_24F3BFFF8;
      if (objc_msgSend(v3, "length") >= (unint64_t)(v6 + 7))
      {
        objc_msgSend(v3, "substringWithRange:", v6 + 1, 6);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("005F"))
        && -[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("x"))
        && -[__CFString hasSuffix:](v8, "hasSuffix:", CFSTR("_"))
        && (-[__CFString substringWithRange:](v8, "substringWithRange:", 1, 4),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v22),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "isEqualToString:", &stru_24F3BFFF8),
            v10,
            v9,
            v11))
      {
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 6, &stru_24F3BFFF8);
        v12 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("_x"), 0, v4 + 7, objc_msgSend(v3, "length") - (v4 + 7));
      }
      else
      {
        objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", &stru_24F3BFFF8);

        if (v14)
        {
          v23 = 0;
          objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "scanHexInt:", &v23);
          if (v23 >> 11 == 27)
          {
            v16 = 0;
          }
          else
          {
            for (i = 0; i != 4; ++i)
              v24[0].i16[i] = objc_msgSend(v7, "characterAtIndex:", i);
            v18 = (int8x8_t)vcgt_u16((uint16x4_t)0x1A001A001A001ALL, (uint16x4_t)vadd_s16(v24[0], (int16x4_t)0x40004000400040));
            v19 = vand_s8((int8x8_t)vcgt_u16((uint16x4_t)0x9000900090009, (uint16x4_t)vadd_s16(v24[0], (int16x4_t)0x39003900390039)), (int8x8_t)vcgt_u16((uint16x4_t)0x19001900190019, (uint16x4_t)vadd_s16(v24[0], (int16x4_t)0x5A005A005A005ALL)));
            v20 = vshl_u16((uint16x4_t)vadd_s16((int16x4_t)vorr_s8((int8x8_t)(*(_QWORD *)&v19 & 0xFFA9FFA9FFA9FFA9), vbic_s8(vorr_s8((int8x8_t)(*(_QWORD *)&v18 & 0xFFC9FFC9FFC9FFC9), (int8x8_t)(*(_QWORD *)&vmvn_s8(v18) & 0xFFD0FFD0FFD0FFD0)), v19)), v24[0]), (uint16x4_t)0x40008000CLL);
            v16 = v20.i16[0] | v20.i16[2] | ((v20.i32[0] | v20.i32[1]) >> 16);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 7, v21);
          if (objc_msgSend(v3, "length") <= (unint64_t)(v4 + 1))
            v4 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v4 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("_x"), 0, v4 + 1, objc_msgSend(v3, "length") - (v4 + 1));

          goto LABEL_26;
        }
        v12 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("_x"), 0, v6 + 1, objc_msgSend(v3, "length") - (v6 + 1));
      }
      v4 = v12;
LABEL_26:

      goto LABEL_27;
    }
LABEL_28:

  }
}

+ (id)edStringWithRunsFromXmlStringElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  EDString *v6;
  CXNamespace *v7;
  _xmlNode *Child;
  uint64_t v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  CXNamespace *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CXNamespace *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CXNamespace *v25;
  CXNamespace *v26;
  uint64_t v27;
  void *v28;
  _xmlNode *v30;
  EDString *v31;
  id v32;

  v5 = a4;
  v6 = objc_alloc_init(EDString);
  v32 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v5, "EXSpreadsheetMLNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v7, "r");

  if (!Child)
    goto LABEL_27;
  v30 = a3;
  v31 = v6;
  v9 = 0;
  v10 = 0;
  do
  {
    objc_msgSend(v5, "EXSpreadsheetMLNamespace", v30);
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = (_xmlNode *)OCXFindChild(Child, v11, "rPr");

    if (v12)
    {
      if (!v10)
      {
        +[EDCollection collection](EDRunsCollection, "collection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)OCXFindChild(v12, v13, "effectLst");

      if (v14)
      {
        objc_msgSend(v5, "workbookPart");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "officeArtState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", v14, v15, v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[EXFont edFontFromXmlFontElement:inConditionalFormat:returnDefaultIfEmpty:state:](EXFont, "edFontFromXmlFontElement:inConditionalFormat:returnDefaultIfEmpty:state:", v12, 0, 1, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resources");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDRun runWithCharIndex:font:effects:resources:](EDRun, "runWithCharIndex:font:effects:resources:", v9, v17, v14, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addObject:", v19);
    }
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = OCXFindChild(Child, v20, "t");

    if (v21)
    {
      objc_msgSend(a1, "readStringWithAsciiCodeFromXmlStringElement:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = objc_msgSend(v22, "length");
        objc_msgSend(v32, "appendString:", v23);
        v9 += v24;
      }

    }
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v25, (xmlChar *)"r");

  }
  while (Child);
  a3 = v30;
  v6 = v31;
  if (v10)
  {
    -[EDString setRuns:](v31, "setRuns:", v10);
  }
  else
  {
LABEL_27:
    if (!objc_msgSend(v32, "length"))
    {
      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v27 = OCXFindChild(a3, v26, "t");

      if (v27)
      {
        objc_msgSend(a1, "readStringWithAsciiCodeFromXmlStringElement:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v32, "appendString:", v28);

      }
    }
    v10 = 0;
  }
  if (v32)
    -[EDString setString:](v6, "setString:", v32);

  return v6;
}

+ (id)edTextFromXmlStringElement:(_xmlNode *)a3 state:(id)a4
{
  CXNamespace *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "EXSpreadsheetMLNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = OCXFindChild(a3, v6, "t");

  if (v7
    && (objc_msgSend(a1, "readStringWithAsciiCodeFromXmlStringElement:", v7),
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    +[EDString edStringWithString:](EDString, "edStringWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)edStringWithRunsFromXmlDivElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  if (a3)
  {
    +[EDString string](EDString, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "buildEDString:fromNode:edFont:keepWhitespace:state:", v7, a3, 0, 0, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)buildEDString:(id)a3 fromChildrenOfNode:(_xmlNode *)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  _xmlNode *i;
  int v15;
  xmlElementType type;
  void *v18;
  id v19;

  v8 = a6;
  v19 = a3;
  v12 = a5;
  v13 = a7;
  for (i = OCXFirstChild(a4); i; i = OCXNextSibling(i))
  {
    v15 = xmlStrEqual(i->name, (const xmlChar *)"br");
    type = i->type;
    if (type == XML_ELEMENT_NODE && v15 == 0)
    {
      objc_msgSend(a1, "buildEDString:fromNode:edFont:keepWhitespace:state:", v19, i, v12, v8, v13);
    }
    else if (type == XML_TEXT_NODE)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", i);
      objc_msgSend(a1, "buildEDString:fromText:edFont:keepWhitespace:state:", v19, v18, v12, v8, v13);

    }
    else if (v15)
    {
      objc_msgSend(a1, "buildEDString:fromText:edFont:keepWhitespace:state:", v19, CFSTR("\n"), v12, 1, v13);
    }
  }

}

+ (void)buildEDString:(id)a3 fromNode:(_xmlNode *)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7
{
  id v11;
  id v12;
  id v13;
  EDFont *v14;
  EDFont *v15;
  void *v16;
  _BOOL4 v17;
  NSString *v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  _BOOL4 v30;
  __CFString *v31;
  id v32;
  uint64_t v33;
  id v34;

  v30 = a6;
  v11 = a3;
  v12 = a5;
  v13 = a7;
  if (a4)
  {
    v14 = (EDFont *)objc_msgSend(v12, "copy");
    if (!v14)
    {
      v15 = [EDFont alloc];
      objc_msgSend(v13, "resources");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[EDFont initWithResources:](v15, "initWithResources:", v16);

    }
    if (xmlStrEqual(a4->name, (const xmlChar *)"font"))
    {
      v28 = a1;
      v34 = 0;
      v29 = v11;
      v17 = CXOptionalStringAttribute(a4, (void *)CXNoNamespace, (xmlChar *)"face", &v34);
      v18 = (NSString *)v34;
      if (v17)
        -[EDFont setName:](v14, "setName:", v18);
      v33 = 0;
      if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"size", &v33))
        -[EDFont setHeight:](v14, "setHeight:", (double)v33);
      v32 = 0;
      v19 = CXOptionalStringAttribute(a4, (void *)CXNoNamespace, (xmlChar *)"color", &v32);
      v20 = v32;
      v21 = v20;
      if (v19)
      {
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("auto")))
        {
          objc_msgSend(v13, "resources");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[EDColorReference colorReferenceWithSystemColorID:resources:](EDColorReference, "colorReferenceWithSystemColorID:resources:", 11, v22);
        }
        else
        {
          v25 = objc_msgSend(v21, "intValue");
          objc_msgSend(v13, "resources");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[EDColorReference colorReferenceWithColorIndex:resources:](EDColorReference, "colorReferenceWithColorIndex:resources:", v25, v22);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[EDFont setColorReference:](v14, "setColorReference:", v26);
      }
    }
    else
    {
      if (!xmlStrEqual(a4->name, (const xmlChar *)"span"))
      {
        if (xmlStrEqual(a4->name, (const xmlChar *)"b"))
        {
          -[EDFont setBold:](v14, "setBold:", 1);
        }
        else if (xmlStrEqual(a4->name, (const xmlChar *)"i"))
        {
          -[EDFont setItalic:](v14, "setItalic:", 1);
        }
        else if (xmlStrEqual(a4->name, (const xmlChar *)"u"))
        {
          -[EDFont setUnderline:](v14, "setUnderline:", 1);
        }
        else
        {
          if (!xmlStrEqual(a4->name, (const xmlChar *)"s"))
          {
            if (xmlStrEqual(a4->name, (const xmlChar *)"sup"))
            {
              v27 = 1;
            }
            else
            {
              if (!xmlStrEqual(a4->name, (const xmlChar *)"sub"))
                goto LABEL_19;
              v27 = 2;
            }
            -[EDFont setScript:](v14, "setScript:", v27);
            goto LABEL_19;
          }
          -[EDFont setStrike:](v14, "setStrike:", 1);
        }
LABEL_19:
        objc_msgSend(a1, "buildEDString:fromChildrenOfNode:edFont:keepWhitespace:state:", v11, a4, v14, v30, v13);

        goto LABEL_20;
      }
      v28 = a1;
      v29 = v11;
      v31 = &stru_24F3BFFF8;
      CXOptionalStringAttribute(a4, (void *)CXNoNamespace, (xmlChar *)"style", &v31);
      v18 = v31;
      OAVReadComposite(v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("mso-spacerun"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
        v30 = objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("yes")) == 0;

    }
    a1 = v28;
    v11 = v29;
    goto LABEL_19;
  }
LABEL_20:

}

+ (void)buildEDString:(id)a3 fromText:(id)a4 edFont:(id)a5 keepWhitespace:(BOOL)a6 state:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!a6)
  {
    objc_msgSend(a1, "cleanupWhitespace:", v12);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v15;
  }
  if (v12 && objc_msgSend(v12, "length"))
  {
    objc_msgSend(v25, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");
    objc_msgSend(v14, "resources");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDRun runWithCharIndex:font:resources:](EDRun, "runWithCharIndex:font:resources:", v17, v13, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "runs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v20, "count") - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = objc_msgSend(v21, "fontIndex");
        if (v23 == objc_msgSend(v19, "fontIndex"))
        {
LABEL_13:
          if (v16)
          {
            objc_msgSend(v16, "stringByAppendingString:", v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = v12;
          }
          objc_msgSend(v25, "setString:", v24);
          if (v16)

          goto LABEL_19;
        }
      }
      if (!v20)
        goto LABEL_11;
    }
    else
    {
      v22 = 0;
      if (!v20)
      {
LABEL_11:
        +[EDCollection collection](EDRunsCollection, "collection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setRuns:", v20);
      }
    }
    objc_msgSend(v20, "addObject:", v19);
    goto LABEL_13;
  }
LABEL_19:

}

+ (id)stringInEDString:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  void *v7;
  void *v8;

  objc_msgSend(a3, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringWithRange:", a4, a5 - a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringInEDString:(id)a3 forRunIndex:(unsigned int)a4
{
  void *v4;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = *(void **)&a4;
  v6 = a3;
  objc_msgSend(v6, "runs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = v4;

  if (v8 <= v4)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v6, "runs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "charIndex");
    objc_msgSend(v6, "runs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") - 1;
    if (v14 == v4)
    {
      objc_msgSend(v6, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");
    }
    else
    {
      objc_msgSend(v6, "runs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", ((_DWORD)v4 + 1));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v4, "charIndex");
    }
    objc_msgSend(a1, "stringInEDString:start:end:", v6, v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 != v9)

  }
  return v17;
}

+ (id)cleanupWhitespace:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "tc_componentsSeparatedByWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "count");
  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && objc_msgSend(v8, "length"))
      {
        if (v5)
        {
          objc_msgSend(v5, "stringByAppendingString:", CFSTR(" "));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByAppendingString:", v9);
          v11 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v11;
        }
        else
        {
          v5 = v9;
        }
      }

      ++v7;
    }
    while (v6 != v7);
  }

  return v5;
}

@end
