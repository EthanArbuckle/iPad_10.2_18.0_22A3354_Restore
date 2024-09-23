@implementation OAXStroke

+ (id)readStrokeFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  OADStroke *v10;
  double v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _xmlNode *i;
  void *v21;
  OADRoundLineJoin *v22;
  double v23;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(OADStroke);
  v28 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", &v28))
  {
    v11 = (double)v28 / 12700.0;
    *(float *)&v11 = v11;
    -[OADStroke setWidth:](v10, "setWidth:", v11);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"cap", 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v12;
  if (v12)
  {
    objc_msgSend(a1, "lineCapEnumMap", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "valueForString:", v12);

    -[OADStroke setCap:](v10, "setCap:", v14);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"cmpd", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(a1, "compoundLineEnumMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "valueForString:", v26);

    -[OADStroke setCompoundType:](v10, "setCompoundType:", v16);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"algn", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(a1, "penAlignmentEnumMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "valueForString:", v17);

    -[OADStroke setPenAlignment:](v10, "setPenAlignment:", v19);
  }
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE)
      continue;
    +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v8, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[OADStroke setFill:](v10, "setFill:", v21);
    }
    else
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"prstDash"))
      {
        objc_msgSend(a1, "readPresetDashFromXmlNode:", i);
        v22 = (OADRoundLineJoin *)objc_claimAutoreleasedReturnValue();
        -[OADStroke setDash:](v10, "setDash:", v22);
LABEL_30:

        goto LABEL_31;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"custDash"))
      {
        objc_msgSend(a1, "readCustomDashFromXmlNode:drawingState:", i, v9);
        v22 = (OADRoundLineJoin *)objc_claimAutoreleasedReturnValue();
        -[OADStroke setDash:](v10, "setDash:", v22);
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"round"))
      {
        v22 = objc_alloc_init(OADRoundLineJoin);
        -[OADStroke setJoin:](v10, "setJoin:", v22);
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"bevel"))
      {
        v22 = objc_alloc_init(OADBevelLineJoin);
        -[OADStroke setJoin:](v10, "setJoin:", v22);
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"miter"))
      {
        v22 = objc_alloc_init(OADMiterLineJoin);
        v27 = 0.0;
        if (CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"lim", &v27))
        {
          HIDWORD(v23) = HIDWORD(v27);
          *(float *)&v23 = v27;
          -[OADRoundLineJoin setLimit:](v22, "setLimit:", v23);
        }
        -[OADStroke setJoin:](v10, "setJoin:", v22, v25);
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"headEnd"))
      {
        objc_msgSend(a1, "readLineEndFromXmlNode:", i);
        v22 = (OADRoundLineJoin *)objc_claimAutoreleasedReturnValue();
        -[OADStroke setTail:](v10, "setTail:", v22);
        goto LABEL_30;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"tailEnd"))
      {
        objc_msgSend(a1, "readLineEndFromXmlNode:", i);
        v22 = (OADRoundLineJoin *)objc_claimAutoreleasedReturnValue();
        -[OADStroke setHead:](v10, "setHead:", v22);
        goto LABEL_30;
      }
    }
LABEL_31:

  }
  return v10;
}

+ (id)lineCapEnumMap
{
  if (+[OAXStroke(Private) lineCapEnumMap]::once != -1)
    dispatch_once(&+[OAXStroke(Private) lineCapEnumMap]::once, &__block_literal_global_27_0);
  return (id)+[OAXStroke(Private) lineCapEnumMap]::lineCapEnumMap;
}

+ (id)compoundLineEnumMap
{
  if (+[OAXStroke(Private) compoundLineEnumMap]::once != -1)
    dispatch_once(&+[OAXStroke(Private) compoundLineEnumMap]::once, &__block_literal_global_51);
  return (id)+[OAXStroke(Private) compoundLineEnumMap]::compoundLineEnumMap;
}

+ (id)penAlignmentEnumMap
{
  if (+[OAXStroke(Private) penAlignmentEnumMap]::once != -1)
    dispatch_once(&+[OAXStroke(Private) penAlignmentEnumMap]::once, &__block_literal_global_35_0);
  return (id)+[OAXStroke(Private) penAlignmentEnumMap]::penAlignmentEnumMap;
}

+ (id)readPresetDashFromXmlNode:(_xmlNode *)a3
{
  OADPresetDash *v5;
  void *v6;
  void *v7;
  char v8;

  v5 = objc_alloc_init(OADPresetDash);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "presetDashEnumMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "valueForString:", v6);

    -[OADPresetDash setType:](v5, "setType:", v8);
  }

  return v5;
}

+ (id)presetDashEnumMap
{
  if (+[OAXStroke(Private) presetDashEnumMap]::once != -1)
    dispatch_once(&+[OAXStroke(Private) presetDashEnumMap]::once, &__block_literal_global_65);
  return (id)+[OAXStroke(Private) presetDashEnumMap]::presetDashEnumMap;
}

+ (id)lineEndTypeEnumMap
{
  if (+[OAXStroke(Private) lineEndTypeEnumMap]::once != -1)
    dispatch_once(&+[OAXStroke(Private) lineEndTypeEnumMap]::once, &__block_literal_global_41);
  return (id)+[OAXStroke(Private) lineEndTypeEnumMap]::lineEndTypeEnumMap;
}

+ (id)lineEndWidthEnumMap
{
  if (+[OAXStroke(Private) lineEndWidthEnumMap]::once != -1)
    dispatch_once(&+[OAXStroke(Private) lineEndWidthEnumMap]::once, &__block_literal_global_55);
  return (id)+[OAXStroke(Private) lineEndWidthEnumMap]::lineEndWidthEnumMap;
}

+ (id)lineEndLengthEnumMap
{
  if (+[OAXStroke(Private) lineEndLengthEnumMap]::once != -1)
    dispatch_once(&+[OAXStroke(Private) lineEndLengthEnumMap]::once, &__block_literal_global_63);
  return (id)+[OAXStroke(Private) lineEndLengthEnumMap]::lineEndLengthEnumMap;
}

void __41__OAXStroke_Private__compoundLineEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_12, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ41__OAXStroke_Private__compoundLineEnumMap_EUb_E23compoundLineEnumStructs, 5, 1);
  v2 = (void *)+[OAXStroke(Private) compoundLineEnumMap]::compoundLineEnumMap;
  +[OAXStroke(Private) compoundLineEnumMap]::compoundLineEnumMap = (uint64_t)v1;

}

void __36__OAXStroke_Private__lineCapEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&_ZGVZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_34, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ36__OAXStroke_Private__lineCapEnumMap_EUb0_E18lineCapEnumStructs, 3, 1);
  v2 = (void *)+[OAXStroke(Private) lineCapEnumMap]::lineCapEnumMap;
  +[OAXStroke(Private) lineCapEnumMap]::lineCapEnumMap = (uint64_t)v1;

}

void __41__OAXStroke_Private__penAlignmentEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_40, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ41__OAXStroke_Private__penAlignmentEnumMap_EUb1_E23penAlignmentEnumStructs, 2, 1);
  v2 = (void *)+[OAXStroke(Private) penAlignmentEnumMap]::penAlignmentEnumMap;
  +[OAXStroke(Private) penAlignmentEnumMap]::penAlignmentEnumMap = (uint64_t)v1;

}

void __40__OAXStroke_Private__lineEndTypeEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_54, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ40__OAXStroke_Private__lineEndTypeEnumMap_EUb2_E22lineEndTypeEnumStructs, 6, 1);
  v2 = (void *)+[OAXStroke(Private) lineEndTypeEnumMap]::lineEndTypeEnumMap;
  +[OAXStroke(Private) lineEndTypeEnumMap]::lineEndTypeEnumMap = (uint64_t)v1;

}

void __41__OAXStroke_Private__lineEndWidthEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_62, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ41__OAXStroke_Private__lineEndWidthEnumMap_EUb3_E23lineEndWidthEnumStructs, 3, 1);
  v2 = (void *)+[OAXStroke(Private) lineEndWidthEnumMap]::lineEndWidthEnumMap;
  +[OAXStroke(Private) lineEndWidthEnumMap]::lineEndWidthEnumMap = (uint64_t)v1;

}

void __42__OAXStroke_Private__lineEndLengthEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_64, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ42__OAXStroke_Private__lineEndLengthEnumMap_EUb4_E24lineEndLengthEnumStructs, 3, 1);
  v2 = (void *)+[OAXStroke(Private) lineEndLengthEnumMap]::lineEndLengthEnumMap;
  +[OAXStroke(Private) lineEndLengthEnumMap]::lineEndLengthEnumMap = (uint64_t)v1;

}

void __39__OAXStroke_Private__presetDashEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_88, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ39__OAXStroke_Private__presetDashEnumMap_EUb5_E21presetDashEnumStructs, 11, 1);
  v2 = (void *)+[OAXStroke(Private) presetDashEnumMap]::presetDashEnumMap;
  +[OAXStroke(Private) presetDashEnumMap]::presetDashEnumMap = (uint64_t)v1;

}

+ (id)readLineEndFromXmlNode:(_xmlNode *)a3
{
  OADLineEnd *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unsigned __int8 v17;

  v5 = objc_alloc_init(OADLineEnd);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "lineEndTypeEnumMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "valueForString:", v6);

    v9 = 0;
    if (v8 < 0x100)
      v9 = v8;
    -[OADLineEnd setType:](v5, "setType:", v9);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "lineEndWidthEnumMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "valueForString:", v10);

    v13 = 0;
    if (v12 < 0x100)
      v13 = v12;
    -[OADLineEnd setWidth:](v5, "setWidth:", v13);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"len", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "lineEndLengthEnumMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "valueForString:", v14);

    v17 = 0;
    if (v16 < 0x100)
      v17 = v16;
    -[OADLineEnd setLength:](v5, "setLength:", v17);
  }

  return v5;
}

+ (id)readCustomDashFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  OADCustomDash *v6;
  id v7;
  CXNamespace *v8;
  _xmlNode *Child;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  CXNamespace *v15;

  v5 = a4;
  v6 = objc_alloc_init(OADCustomDash);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v8, "ds");

  while (Child)
  {
    +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", Child, "d");
    v11 = v10;
    +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", Child, "sp");
    LODWORD(v13) = v12;
    LODWORD(v14) = v11;
    +[OADDashStop addStopWithDash:space:toArray:](OADDashStop, "addStopWithDash:space:toArray:", v7, v14, v13);
    objc_msgSend(v5, "OAXMainNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v15, (xmlChar *)"ds");

  }
  -[OADCustomDash setStops:](v6, "setStops:", v7);

  return v6;
}

@end
