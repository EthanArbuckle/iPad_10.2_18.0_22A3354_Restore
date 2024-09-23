@implementation OIXMLNode

- (void)setStringValue:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OIXMLNode.m"), 38, CFSTR("Please override -[%@ %@]"), v5, v6);

}

- (NSString)name
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OIXMLNode.m"), 26, CFSTR("Please override -[%@ %@]"), v5, v6);

  return 0;
}

- (NSString)XMLString
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLNode _appendXMLStringToString:level:](self, "_appendXMLStringToString:level:", v3, 0);
  return (NSString *)v3;
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, *(_QWORD *)&a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OIXMLNode.m"), 158, CFSTR("Please override -[%@ %@]"), v6, v7);

}

- (NSString)stringValue
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OIXMLNode.m"), 32, CFSTR("Please override -[%@ %@]"), v5, v6);

  return 0;
}

+ (void)_escapeCharacters:(const unsigned __int16 *)a3 amount:(unsigned int)a4 escapeWhiteSpaces:(BOOL)a5 inString:(id)a6 appendingToString:(__CFString *)a7
{
  _BOOL4 v8;
  uint64_t v11;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v14;
  CFIndex v15;
  char v16;
  int64_t v17;
  UniChar *v18;
  int64_t v19;
  UniChar v20;
  const __CFString *v21;
  uint64_t v22;
  const unsigned __int16 *v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  int64_t v27;
  int64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  __CFString *theString;
  UniChar buffer[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CFStringRef v40;
  UniChar *v41;
  const char *v42;
  uint64_t v43;
  int64_t v44;
  int64_t v45;
  int64_t v46;
  CFRange v47;
  CFRange v48;
  CFRange v49;
  CFRange v50;

  v8 = a5;
  theString = (__CFString *)a6;
  if (!theString)
    goto LABEL_44;
  if (qword_255AFDBA0 != -1)
    dispatch_once(&qword_255AFDBA0, &__block_literal_global_110);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  *(_OWORD *)buffer = 0u;
  v33 = 0u;
  v11 = -[__CFString length](theString, "length");
  v40 = theString;
  v43 = 0;
  v44 = v11;
  CharactersPtr = CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  v41 = (UniChar *)CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  v45 = 0;
  v46 = 0;
  v42 = CStringPtr;
  if (!v11)
  {
    v15 = 0;
    goto LABEL_42;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  do
  {
    if (v14 < 0 || (v17 = v44, v44 <= v14))
    {
      v20 = 0;
      if (!v8)
        goto LABEL_19;
    }
    else
    {
      v18 = v41;
      if (v41)
      {
        v19 = v43 + v14;
        goto LABEL_12;
      }
      if (!v42)
      {
        if (v46 <= v14 || (v27 = v45, v45 > v14))
        {
          v28 = v14 - 4;
          if ((unint64_t)v14 < 4)
            v28 = 0;
          if (v28 + 64 < v44)
            v17 = v28 + 64;
          v45 = v28;
          v46 = v17;
          v47.location = v43 + v28;
          v47.length = v17 - v28;
          CFStringGetCharacters(v40, v47, buffer);
          v27 = v45;
        }
        v19 = v14 - v27;
        v18 = buffer;
LABEL_12:
        v20 = v18[v19];
        if (!v8)
          goto LABEL_19;
        goto LABEL_15;
      }
      v20 = v42[v43 + v14];
      if (!v8)
        goto LABEL_19;
    }
LABEL_15:
    if (v20 != 32)
    {
      v16 = 0;
LABEL_19:
      v22 = a4;
      v23 = a3;
      if (!a4)
        goto LABEL_26;
      while (1)
      {
        v24 = *v23++;
        if (v24 == v20)
          break;
        if (!--v22)
          goto LABEL_26;
      }
      v49.length = v14 - v15;
      v49.location = v15;
      v25 = CFStringCreateWithSubstring(0, theString, v49);
      CFStringAppend(a7, v25);
      CFRelease(v25);
      v26 = (const __CFString *)NSMapGet((NSMapTable *)_MergedGlobals_1, (const void *)v20);
      CFStringAppend(a7, v26);
LABEL_24:
      v15 = v14 + 1;
      goto LABEL_26;
    }
    if ((v16 & 1) != 0)
    {
      v48.length = v14 - v15;
      v48.location = v15;
      v21 = CFStringCreateWithSubstring(0, theString, v48);
      CFStringAppend(a7, v21);
      CFRelease(v21);
      CFStringAppend(a7, CFSTR("&nbsp;"));
      v16 = 0;
      goto LABEL_24;
    }
    v16 = 1;
LABEL_26:
    ++v14;
  }
  while (v14 != v11);
  if (!v15)
  {
    CFStringAppend(a7, theString);
    goto LABEL_44;
  }
LABEL_42:
  v50.length = v11 - v15;
  v50.location = v15;
  v29 = CFStringCreateWithSubstring(0, theString, v50);
  if (v29)
  {
    v30 = v29;
    CFStringAppend(a7, v29);
    CFRelease(v30);
  }
LABEL_44:

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("OIXMLNode.m"), 20, CFSTR("Please override -[%@ %@]"), v6, v7);

  return 0;
}

+ (void)_escapeHTMLAttributeCharacters:(id)a3 withQuote:(unsigned __int16)a4 appendingToString:(__CFString *)a5
{
  id v7;
  CFIndex Length;
  _WORD v9[2];
  CFRange v10;

  v7 = a3;
  Length = CFStringGetLength(a5);
  v9[0] = 38;
  v9[1] = a4;
  +[OIXMLNode _escapeCharacters:amount:escapeWhiteSpaces:inString:appendingToString:](OIXMLNode, "_escapeCharacters:amount:escapeWhiteSpaces:inString:appendingToString:", v9, 2, 0, v7, a5);

  v10.length = CFStringGetLength(a5) - Length;
  v10.location = Length;
  CFStringFindAndReplace(a5, CFSTR("&amp;{"), CFSTR("&{"), v10, 0);
}

void __83__OIXMLNode__escapeCharacters_amount_escapeWhiteSpaces_inString_appendingToString___block_invoke()
{
  NSMapTable *v0;
  void *v1;
  NSMapTableValueCallBacks v2;
  NSMapTableKeyCallBacks keyCallBacks;

  memset(&keyCallBacks, 0, 40);
  keyCallBacks.notAKeyMarker = (const void *)0x8000000000000000;
  v2 = *(NSMapTableValueCallBacks *)*(_QWORD *)&MEMORY[0x24BDD1110];
  v0 = NSCreateMapTable(&keyCallBacks, &v2, 4uLL);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x3C, CFSTR("&lt;"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x26, CFSTR("&amp;"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x27, CFSTR("&apos;"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)9, CFSTR(" &nbsp; &nbsp;"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x22, CFSTR("&quot;"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xA0, CFSTR("&nbsp;"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x7EC, CFSTR("<br>"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x7ED, CFSTR("<br>"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xB, CFSTR("<br>"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xD, CFSTR("<br>"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xE, CFSTR("<br>"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xF0A7, CFSTR("&bull;"));
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xF0B7, CFSTR("&bull;"));
}

- (NSString)openingTagString
{
  return (NSString *)&stru_24F3BFFF8;
}

- (NSString)closingTagString
{
  return (NSString *)&stru_24F3BFFF8;
}

@end
