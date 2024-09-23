@implementation PFXHtmlStyle

+ (void)loadCssPropertiesForHtmlEntry:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  PFSStyleSelector *v8;
  unint64_t v9;
  id v10;
  id v11;
  _BYTE *v12;
  _BYTE *v13;
  id v14;
  id v15;
  PFSStyleCache *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  id v20;

  v20 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = objc_msgSend(a3, "htmlReaderState");
  v6 = objc_msgSend(a3, "xmlElementId");
  if (v6)
  {
    if (objc_msgSend(v5, "orientationCount"))
    {
      v7 = 0;
      while (1)
      {
        objc_msgSend(v5, "switchToOrientation:", v7);
        if (objc_msgSend(objc_msgSend(objc_msgSend(v5, "currentHtmlDocMediaState"), "styleCache"), "hasAnyRulesForIdentifier:", v6))break;
        if (++v7 >= (unint64_t)objc_msgSend(v5, "orientationCount"))
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      v6 = 0;
    }
  }
  v8 = objc_alloc_init(PFSStyleSelector);
  objc_msgSend(a1, "insertElementAttributes:intoSelector:identifier:", a3, v8, v6);
  -[PFSStyleSelector freeze](v8, "freeze");
  objc_msgSend(a3, "setStyleSelector:", v8);
  if (objc_msgSend(v5, "orientationCount"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v5, "switchToOrientation:", v9);
      v10 = objc_msgSend(a3, "currentEntryMediaState");
      v11 = objc_msgSend(a1, "createStylesWithSelector:styleCache:isLeaf:", v8, objc_msgSend(objc_msgSend(v5, "currentHtmlDocMediaState"), "styleCache"), 1);
      objc_msgSend(v10, "setPropertySet:", v11);

      ++v9;
    }
    while (v9 < (unint64_t)objc_msgSend(v5, "orientationCount"));
  }

  v12 = objc_msgSend(objc_msgSend(a3, "styleAttribute"), "cString");
  if (v12)
  {
    v13 = v12;
    if (*v12)
    {
      v14 = objc_alloc_init((Class)NSMutableDictionary);
      v15 = objc_alloc_init((Class)NSMutableDictionary);
      +[PFXStylesheet readStylesheetFromStyleAttributeContents:sourceURL:toDictionary:toFontDictionary:readerState:](PFXStylesheet, "readStylesheetFromStyleAttributeContents:sourceURL:toDictionary:toFontDictionary:readerState:", v13, objc_msgSend(v5, "entryNSURL"), v14, v15, v5);
      +[PFXStylesheet registerFontsFromDictionary:readerState:](PFXStylesheet, "registerFontsFromDictionary:readerState:", v15, v5);
      v16 = objc_alloc_init(PFSStyleCache);
      -[PFSStyleCache addEntriesFromDictionary:](v16, "addEntriesFromDictionary:", v14);
      v17 = objc_msgSend(a1, "createStylesWithSelector:styleCache:isLeaf:", +[PFSStyleSelector allElementsSelector](PFSStyleSelector, "allElementsSelector"), v16, 1);

      if (objc_msgSend(v5, "orientationCount"))
      {
        v18 = 0;
        do
        {
          objc_msgSend(v5, "switchToOrientation:", v18);
          objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet"), "setPropertiesFromPropertySet:", v17);
          ++v18;
        }
        while (v18 < (unint64_t)objc_msgSend(v5, "orientationCount"));
      }

    }
  }
  if (objc_msgSend(v5, "orientationCount"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v5, "switchToOrientation:", v19);
      objc_msgSend(a1, "setupWhiteSpaceForCurrentOrientation:", a3);
      ++v19;
    }
    while (v19 < (unint64_t)objc_msgSend(v5, "orientationCount"));
  }

}

+ (BOOL)shouldTextInheritNodeProps:(id)a3
{
  return !+[PFXUtilities elementIsTableRelated:](PFXUtilities, "elementIsTableRelated:", objc_msgSend(a3, "xmlElementName"));
}

+ (id)createStylesWithSelector:(id)a3 styleCache:(id)a4 isLeaf:(BOOL)a5
{
  id v6;
  void *v7;

  if (!a4)
    return objc_alloc_init(PFSPropertySet);
  v6 = objc_msgSend(a4, "createPropertySetWithSelector:", a3);
  v7 = v6;
  if (!a5)
    objc_msgSend(v6, "removeUninheritedProperties");
  return v7;
}

+ (BOOL)isAtCollapseBorder:(id)a3
{
  return !objc_msgSend(a3, "parentEntry")
      || xmlStrEqual((const xmlChar *)"body", (const xmlChar *)objc_msgSend(a3, "xmlElementName"))
      || xmlStrEqual((const xmlChar *)"body", (const xmlChar *)objc_msgSend(objc_msgSend(a3, "parentEntry"), "xmlElementName")) != 0;
}

+ (void)insertElementAttributes:(id)a3 intoSelector:(id)a4 identifier:(const char *)a5
{
  PFSStyleSimpleSelector *v9;
  char *v10;
  char *v11;
  int v12;
  int v13;
  char v14;
  char *v15;
  int v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  const char *v20;
  const char *v21;
  unsigned __int8 v22;
  size_t v23;
  size_t v24;
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  BOOL v29;

  if ((objc_msgSend(a1, "isAtCollapseBorder:") & 1) == 0)
    objc_msgSend(a1, "insertElementAttributes:intoSelector:identifier:", objc_msgSend(a3, "parentHtmlStackEntry"), a4, a5);
  v9 = (PFSStyleSimpleSelector *)objc_msgSend(a4, "addSimpleSelector");
  PFSStyleSimpleSelector::setElement(v9, (char *)objc_msgSend(a3, "xmlElementName"));
  v10 = (char *)objc_msgSend(objc_msgSend(a3, "classAttribute"), "cString");
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  LOBYTE(v12) = *v10;
  if (!*v10)
    goto LABEL_20;
  do
  {
    while (1)
    {
      if ((v12 & 0x80) != 0)
      {
        if (__maskrune((char)v12, 0x4000uLL))
          goto LABEL_7;
        break;
      }
      if ((_DefaultRuneLocale.__runetype[(char)v12] & 0x4000) == 0)
        break;
LABEL_7:
      v13 = *++v11;
      LOBYTE(v12) = v13;
      if (!v13)
        goto LABEL_20;
    }
    v14 = *v11;
    if (!*v11)
      break;
    v15 = v11;
    while ((v14 & 0x80) == 0)
    {
      if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) != 0)
        goto LABEL_18;
LABEL_16:
      v16 = *++v15;
      v14 = v16;
      if (!v16)
      {
        v12 = 0;
        goto LABEL_19;
      }
    }
    if (!__maskrune(v14, 0x4000uLL))
      goto LABEL_16;
LABEL_18:
    v12 = *v15;
LABEL_19:
    *v15 = 0;
    PFSStyleSimpleSelector::addClass((uint64_t *)v9, v11);
    *v15 = v12;
    v11 = v15;
  }
  while (v12);
LABEL_20:
  if (a5)
    PFSStyleSimpleSelector::addHashIdentifier(v9, (char *)a5);
  v17 = objc_msgSend(a3, "xmlAttributes");
  v18 = v17 + 1;
  v19 = (_QWORD *)*v17;
  if ((_QWORD *)*v17 != v17 + 1)
  {
    do
    {
      v20 = (const char *)v19[4];
      v21 = (const char *)objc_msgSend((id)v19[5], "cString");
      v22 = atomic_load((unsigned __int8 *)&qword_543370);
      if ((v22 & 1) == 0 && __cxa_guard_acquire(&qword_543370))
      {
        byte_543368 = 1;
        __cxa_guard_release(&qword_543370);
      }
      v23 = strlen(v20);
      v24 = strlen(v21);
      if (byte_543368)
        v25 = 3;
      else
        v25 = 0;
      v26 = (char *)malloc_type_malloc(v23 + v24 + v25 + 1, 0xD7E799DDuLL);
      sprintf(v26, "%s%s%s", v20, " = ", v21);
      PFSStyleSimpleSelector::addAttrib(v9, v26);
      free(v26);
      v27 = (_QWORD *)v19[1];
      if (v27)
      {
        do
        {
          v28 = v27;
          v27 = (_QWORD *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          v28 = (_QWORD *)v19[2];
          v29 = *v28 == (_QWORD)v19;
          v19 = v28;
        }
        while (!v29);
      }
      v19 = v28;
    }
    while (v28 != v18);
  }
}

+ (int)whiteSpacePropertyForCurrentOrientation:(id)a3
{
  id v5;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "currentEntryMediaState");
  if (objc_msgSend(v5, "whitespace") != 5)
    return objc_msgSend(v5, "whitespace");
  if (xmlStrEqual((const xmlChar *)"table", (const xmlChar *)objc_msgSend(a3, "xmlElementName")))
    return 0;
  return objc_msgSend(a1, "whiteSpacePropertyForCurrentOrientation:", objc_msgSend(a3, "parentHtmlStackEntry"));
}

+ (void)setupWhiteSpaceForCurrentOrientation:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = objc_msgSend(a3, "currentEntryMediaState");
  v6 = objc_msgSend(objc_msgSend(v5, "propertySet"), "valueForProperty:", "white-space");
  if (v6)
  {
    v7 = objc_msgSend(v6, "lastObject");
    if (objc_msgSend(v7, "type") == &stru_108
      && (v8 = objc_msgSend(v7, "value"), (objc_msgSend(CFSTR("normal"), "isEqualToString:", v8) & 1) == 0))
    {
      if ((objc_msgSend(CFSTR("pre"), "isEqualToString:", v8) & 1) != 0)
      {
        v9 = &dword_0 + 1;
      }
      else if ((objc_msgSend(CFSTR("nowrap"), "isEqualToString:", v8) & 1) != 0)
      {
        v9 = &dword_0 + 2;
      }
      else if ((objc_msgSend(CFSTR("pre-wrap"), "isEqualToString:", v8) & 1) != 0)
      {
        v9 = &dword_0 + 3;
      }
      else if (objc_msgSend(CFSTR("pre-line"), "isEqualToString:", v8))
      {
        v9 = &dword_4;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = objc_msgSend(a1, "whiteSpacePropertyForCurrentOrientation:", a3);
  }
  objc_msgSend(v5, "setWhitespace:", v9);
}

@end
