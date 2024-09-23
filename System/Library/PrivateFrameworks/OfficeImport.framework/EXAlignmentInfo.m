@implementation EXAlignmentInfo

+ (id)edAlignmentInfoFromXmlAlignmentInfoElement:(_xmlNode *)a3 state:(id)a4
{
  void *v6;
  _BOOL4 v7;
  id v8;
  _BOOL4 v9;
  id v10;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  id v15;
  id v16;

  +[EDAlignmentInfo alignmentInfo](EDAlignmentInfo, "alignmentInfo", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v16 = 0;
    v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"horizontal", &v16);
    v8 = v16;
    if (v7)
      objc_msgSend(v6, "setHorizontalAlignment:", objc_msgSend(a1, "edHorizontalAlignFromHorizontalAlignString:", v8));
    v15 = 0;
    v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vertical", &v15);
    v10 = v15;
    if (v9)
      objc_msgSend(v6, "setVerticalAlignment:", objc_msgSend(a1, "edVerticalAlignFromVerticalAlignString:", v10));
    v14 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"indent", &v14))
      objc_msgSend(v6, "setIndent:", v14);
    v13 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"wrapText", &v13))
      objc_msgSend(v6, "setTextWrapped:", v13);
    v12 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"textRotation", &v12))
      objc_msgSend(v6, "setTextRotation:", v12);

  }
  return v6;
}

+ (int)edVerticalAlignFromVerticalAlignString:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("top")))
  {
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("center")))
    {
      v5 = 1;
      goto LABEL_8;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("bottom")))
    {
      v5 = 2;
      goto LABEL_8;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("justify")))
    {
      v5 = 3;
      goto LABEL_8;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("distributed")))
    {
      v5 = 4;
      goto LABEL_8;
    }
  }
  v5 = 0;
LABEL_8:

  return v5;
}

+ (int)edHorizontalAlignFromHorizontalAlignString:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("general")))
  {
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("left")))
    {
      v5 = 1;
      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("center")))
    {
      v5 = 2;
      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("centerContinuous")))
    {
      v5 = 6;
      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("right")))
    {
      v5 = 3;
      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("justify")))
    {
      v5 = 5;
      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("distributed")))
    {
      v5 = 7;
      goto LABEL_10;
    }
  }
  v5 = 0;
LABEL_10:

  return v5;
}

+ (id)edAlignmentInfoFromVmlAlignmentInfoElement:(_xmlNode *)a3 state:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  +[EDAlignmentInfo alignmentInfo](EDAlignmentInfo, "alignmentInfo", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "TextHAlign");
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v7);
      objc_msgSend(v6, "setHorizontalAlignment:", objc_msgSend(a1, "edHorizontalAlignFromHorizontalAlignString:", v8));

    }
    v9 = OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "TextVAlign");
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v9);
      objc_msgSend(v6, "setVerticalAlignment:", objc_msgSend(a1, "edVerticalAlignFromVerticalAlignString:", v10));

    }
  }
  return v6;
}

+ (id)horizontalAlignmentEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_19, 0, &dword_22A0CC000);
  }
  if (+[EXAlignmentInfo horizontalAlignmentEnumMap]::once != -1)
    dispatch_once(&+[EXAlignmentInfo horizontalAlignmentEnumMap]::once, &__block_literal_global_70);
  return (id)+[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentEnumMap;
}

void __45__EXAlignmentInfo_horizontalAlignmentEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentStructs, 7, 1);
  v1 = (void *)+[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentEnumMap;
  +[EXAlignmentInfo horizontalAlignmentEnumMap]::sHorizontalAlignmentEnumMap = (uint64_t)v0;

}

+ (id)verticalAlignmentEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_18, 0, &dword_22A0CC000);
  }
  if (+[EXAlignmentInfo verticalAlignmentEnumMap]::once != -1)
    dispatch_once(&+[EXAlignmentInfo verticalAlignmentEnumMap]::once, &__block_literal_global_19);
  return (id)+[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
}

void __43__EXAlignmentInfo_verticalAlignmentEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentStructs, 5, 1);
  v1 = (void *)+[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
  +[EXAlignmentInfo verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap = (uint64_t)v0;

}

@end
