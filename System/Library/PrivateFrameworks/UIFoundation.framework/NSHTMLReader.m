@implementation NSHTMLReader

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __NSLoadWebKit();
}

- (Class)_webViewClass
{
  Class result;

  result = (Class)_webViewClass__webViewClass;
  if (!_webViewClass__webViewClass)
  {
    result = objc_lookUpClass("WebView");
    _webViewClass__webViewClass = (uint64_t)result;
    if (!result)
    {
      __NSLoadWebKit();
      result = objc_lookUpClass("WebView");
      _webViewClass__webViewClass = (uint64_t)result;
      if (!result)
      {
        NSLog((NSString *)CFSTR("Could not dynamically load the WebKit framework."));
        return (Class)_webViewClass__webViewClass;
      }
    }
  }
  return result;
}

- (Class)_webArchiveClass
{
  Class result;

  result = (Class)_webArchiveClass__webArchiveClass;
  if (!_webArchiveClass__webArchiveClass)
  {
    result = objc_lookUpClass("WebArchive");
    _webArchiveClass__webArchiveClass = (uint64_t)result;
    if (!result)
    {
      __NSLoadWebKit();
      result = objc_lookUpClass("WebArchive");
      _webArchiveClass__webArchiveClass = (uint64_t)result;
      if (!result)
      {
        NSLog((NSString *)CFSTR("Could not dynamically load the WebKit framework."));
        return (Class)_webArchiveClass__webArchiveClass;
      }
    }
  }
  return result;
}

- (Class)_DOMHTMLTableCellElementClass
{
  Class result;

  result = (Class)_DOMHTMLTableCellElementClass__DOMHTMLTableCellElementClass;
  if (!_DOMHTMLTableCellElementClass__DOMHTMLTableCellElementClass)
  {
    result = objc_lookUpClass("DOMHTMLTableCellElement");
    _DOMHTMLTableCellElementClass__DOMHTMLTableCellElementClass = (uint64_t)result;
  }
  return result;
}

- (id)_webPreferences
{
  void *v2;

  v2 = (void *)_webPreferences__webPreferences;
  if (!_webPreferences__webPreferences)
  {
    v2 = (void *)objc_msgSend(objc_alloc(objc_lookUpClass("WebPreferences")), "initWithIdentifier:", CFSTR("com.apple.UIFoundationHTMLReader"));
    objc_msgSend(v2, "setDefaultFontSize:", 12);
    objc_msgSend(v2, "setDefaultFixedFontSize:", 12);
    objc_msgSend(v2, "setUserStyleSheetEnabled:", 0);
    objc_msgSend(v2, "setJavaEnabled:", 0);
    objc_msgSend(v2, "setJavaScriptEnabled:", 0);
    objc_msgSend(v2, "setJavaScriptCanOpenWindowsAutomatically:", 0);
    objc_msgSend(v2, "setPlugInsEnabled:", 0);
    objc_msgSend(v2, "setAllowsAnimatedImages:", 1);
    objc_msgSend(v2, "setAllowsAnimatedImageLooping:", 1);
    objc_msgSend(v2, "setLoadsImagesAutomatically:", 1);
    objc_msgSend(v2, "setAutosaves:", 0);
    objc_msgSend(v2, "setUsesPageCache:", 0);
    objc_msgSend(v2, "setCacheModel:", 0);
    _webPreferences__webPreferences = (uint64_t)v2;
  }
  return v2;
}

+ (id)defaultParagraphStyle
{
  id result;

  result = (id)defaultParagraphStyle_defaultParagraphStyle_0;
  if (!defaultParagraphStyle_defaultParagraphStyle_0)
  {
    defaultParagraphStyle_defaultParagraphStyle_0 = -[NSParagraphStyle mutableCopy](+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"), "mutableCopy");
    objc_msgSend((id)defaultParagraphStyle_defaultParagraphStyle_0, "setDefaultTabInterval:", 36.0);
    objc_msgSend((id)defaultParagraphStyle_defaultParagraphStyle_0, "setTabStops:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
    return (id)defaultParagraphStyle_defaultParagraphStyle_0;
  }
  return result;
}

+ (BOOL)_usesLibXML2ForOptions:(id)a3
{
  return 0;
}

+ (BOOL)allowsAttributedStringAgentForOptions:(id)a3
{
  if (allowsAttributedStringAgentForOptions__onceToken != -1)
    dispatch_once(&allowsAttributedStringAgentForOptions__onceToken, &__block_literal_global_71_0);
  return allowsAttributedStringAgentForOptions__triesAgent
      && (objc_msgSend(a1, "_usesLibXML2ForOptions:", a3) & 1) == 0
      && !objc_msgSend(a3, "objectForKeyedSubscript:", NSWebPreferencesDocumentOption)
      && !objc_msgSend(a3, "objectForKeyedSubscript:", NSWebResourceLoadDelegateDocumentOption)
      && !objc_msgSend(a3, "objectForKeyedSubscript:", __NSHTMLReaderDelegateDocumentOption)
      && objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WebPolicyDelegate")) == 0;
}

void *__54__NSHTMLReader_allowsAttributedStringAgentForOptions___block_invoke()
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("_NSAttributedStringForcesAttributedAgent"));
  if (result)
  {
    result = (void *)objc_msgSend(result, "BOOLValue");
    allowsAttributedStringAgentForOptions__triesAgent = (char)result;
  }
  return result;
}

- (id)_childrenForNode:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_msgSend(a3, "firstChild");
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v4, "addObject:", v6);
      v6 = (void *)objc_msgSend(v6, "nextSibling");
    }
    while (v6);
  }
  return v4;
}

- (id)_computedStyleForElement:(id)a3
{
  void *v5;
  Class v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *computedStylesForElements;
  uint64_t v12;

  v5 = (void *)objc_msgSend(a3, "ownerDocument");
  if ((_computedStyleForElement__checkedSelector & 1) == 0)
  {
    v6 = objc_lookUpClass("DOMDocument");
    if (v6
      && -[objc_class instancesRespondToSelector:](v6, "instancesRespondToSelector:", sel_getComputedStyle_pseudoElement_))
    {
      _computedStyleForElement__useNewSelector = 1;
    }
    _computedStyleForElement__checkedSelector = 1;
  }
  v7 = -[NSMutableDictionary objectForKey:](self->_computedStylesForElements, "objectForKey:", a3);
  if (v7)
  {
    v8 = (void *)v7;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E38], "null"), "isEqual:", v7))
      return 0;
    else
      return v8;
  }
  else
  {
    if (_computedStyleForElement__useNewSelector == 1)
      v10 = objc_msgSend(v5, "getComputedStyle:pseudoElement:", a3, &stru_1E260C7D0);
    else
      v10 = objc_msgSend(v5, "getComputedStyle::", a3, &stru_1E260C7D0);
    v9 = (void *)v10;
    computedStylesForElements = self->_computedStylesForElements;
    v12 = v10;
    if (!v10)
      v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    -[NSMutableDictionary setObject:forKey:](computedStylesForElements, "setObject:forKey:", v12, a3);
  }
  return v9;
}

- (id)_specifiedStyleForElement:(id)a3
{
  uint64_t v5;
  void *v6;
  NSMutableDictionary *specifiedStylesForElements;
  uint64_t v8;

  v5 = -[NSMutableDictionary objectForKey:](self->_specifiedStylesForElements, "objectForKey:");
  if (v5)
  {
    v6 = (void *)v5;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E38], "null"), "isEqual:", v5))
      return 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(a3, "style");
    specifiedStylesForElements = self->_specifiedStylesForElements;
    v8 = (uint64_t)v6;
    if (!v6)
      v8 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    -[NSMutableDictionary setObject:forKey:](specifiedStylesForElements, "setObject:forKey:", v8, a3);
  }
  return v6;
}

- (id)_computedStringForNode:(id)a3 property:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  float v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __CFString *v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  const __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  __CFString *v32;
  id v33;
  uint64_t v34;
  int v36;

  if (a3 && objc_msgSend(a3, "nodeType") == 1)
  {
    v7 = -[NSHTMLReader _computedStyleForElement:](self, "_computedStyleForElement:", a3);
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(v7, "getPropertyCSSValue:", a4);
      if (v9)
      {
        v10 = v9;
        v11 = objc_msgSend(v9, "cssValueType");
        if (v11 == 2)
        {
          v16 = objc_msgSend(v8, "getPropertyValue:", a4);
          goto LABEL_13;
        }
        if (v11 == 1)
        {
          v12 = objc_msgSend(v10, "primitiveType");
          if ((v12 - 19) <= 3)
          {
            v13 = (__CFString *)objc_msgSend(v10, "getStringValue");
            if (v13)
            {
              v14 = v13;
              if (-[__CFString length](v13, "length"))
                goto LABEL_14;
            }
            goto LABEL_17;
          }
          if (v12 == 2)
          {
            objc_msgSend(v10, "getFloatValue:", 2);
            v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g%%"), v18);
LABEL_13:
            v14 = (__CFString *)v16;
            if (v16)
              goto LABEL_14;
          }
        }
      }
    }
LABEL_17:
    v19 = -[NSHTMLReader _specifiedStyleForElement:](self, "_specifiedStyleForElement:", a3);
    if (!v19)
      goto LABEL_27;
    v20 = v19;
    v21 = (void *)objc_msgSend(v19, "getPropertyCSSValue:", a4);
    if (!v21)
      goto LABEL_27;
    v22 = v21;
    v23 = objc_msgSend(v21, "cssValueType");
    if (!v23)
    {
      v17 = 1;
      goto LABEL_28;
    }
    if (v23 == 2)
    {
LABEL_25:
      v14 = (__CFString *)objc_msgSend(v20, "getPropertyValue:", a4);
      v17 = 0;
      if (v14)
        goto LABEL_123;
LABEL_28:
      if (objc_msgSend(CFSTR("display"), "isEqualToString:", a4))
      {
        v25 = objc_msgSend(a3, "tagName");
        if ((objc_msgSend(CFSTR("HEAD"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("SCRIPT"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("APPLET"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("NOFRAMES"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("none");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("ADDRESS"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("BLOCKQUOTE"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("BODY"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("CENTER"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("DD"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("DIR"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("DIV"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("DL"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("DT"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("FIELDSET"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("FORM"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("FRAME"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("FRAMESET"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("HR"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("HTML"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("H1"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("H2"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("H3"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("H4"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("H5"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("H6"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("IFRAME"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("MENU"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("NOSCRIPT"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("OL"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("P"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("PRE"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("UL"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("block");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("LI"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("list-item");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("TABLE"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("TR"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table-row");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("TH"), "isEqualToString:", v25) & 1) != 0
          || (objc_msgSend(CFSTR("TD"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table-cell");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("THEAD"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table-header-group");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("TBODY"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table-row-group");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("TFOOT"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table-footer-group");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("COL"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table-column");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("COLGROUP"), "isEqualToString:", v25) & 1) != 0)
        {
          v14 = CFSTR("table-column-group");
          goto LABEL_123;
        }
        v36 = objc_msgSend(CFSTR("CAPTION"), "isEqualToString:", v25);
        v28 = CFSTR("table-caption");
        v27 = v36 == 0;
        goto LABEL_38;
      }
      if (objc_msgSend(CFSTR("white-space"), "isEqualToString:", a4))
      {
        v26 = objc_msgSend(CFSTR("PRE"), "isEqualToString:", objc_msgSend(a3, "tagName"));
        v27 = v26 == 0;
        if (!v26)
          v17 = 1;
        v28 = CFSTR("pre");
LABEL_38:
        if (v27)
          v14 = 0;
        else
          v14 = (__CFString *)v28;
        goto LABEL_123;
      }
      if (objc_msgSend(CFSTR("font-style"), "isEqualToString:", a4))
      {
        v29 = objc_msgSend(a3, "tagName");
        if ((objc_msgSend(CFSTR("I"), "isEqualToString:", v29) & 1) != 0
          || (objc_msgSend(CFSTR("CITE"), "isEqualToString:", v29) & 1) != 0
          || (objc_msgSend(CFSTR("EM"), "isEqualToString:", v29) & 1) != 0)
        {
          v14 = CFSTR("italic");
          goto LABEL_123;
        }
        v14 = CFSTR("italic");
        if ((objc_msgSend(CFSTR("VAR"), "isEqualToString:", v29) & 1) == 0)
        {
          v30 = CFSTR("ADDRESS");
          goto LABEL_90;
        }
        goto LABEL_123;
      }
      if (objc_msgSend(CFSTR("font-weight"), "isEqualToString:", a4))
      {
        v29 = objc_msgSend(a3, "tagName");
        if ((objc_msgSend(CFSTR("B"), "isEqualToString:", v29) & 1) != 0)
        {
          v14 = CFSTR("bolder");
          goto LABEL_123;
        }
        v14 = CFSTR("bolder");
        if ((objc_msgSend(CFSTR("STRONG"), "isEqualToString:", v29) & 1) != 0)
          goto LABEL_123;
        goto LABEL_84;
      }
      if (objc_msgSend(CFSTR("text-decoration"), "isEqualToString:", a4))
      {
        v29 = objc_msgSend(a3, "tagName");
        if ((objc_msgSend(CFSTR("U"), "isEqualToString:", v29) & 1) != 0
          || (objc_msgSend(CFSTR("INS"), "isEqualToString:", v29) & 1) != 0)
        {
          v14 = CFSTR("underline");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("S"), "isEqualToString:", v29) & 1) != 0)
        {
          v14 = CFSTR("line-through");
          goto LABEL_123;
        }
        v14 = CFSTR("line-through");
        if ((objc_msgSend(CFSTR("STRIKE"), "isEqualToString:", v29) & 1) == 0)
        {
          v30 = CFSTR("DEL");
LABEL_90:
          if (!-[__CFString isEqualToString:](v30, "isEqualToString:", v29))
          {
            v17 = 1;
            v14 = 0;
          }
        }
LABEL_123:
        v15 = v17 == 0;
        if (v14)
          goto LABEL_127;
        goto LABEL_124;
      }
      if (objc_msgSend(CFSTR("text-align"), "isEqualToString:", a4))
      {
        v29 = objc_msgSend(a3, "tagName");
        if ((objc_msgSend(CFSTR("CENTER"), "isEqualToString:", v29) & 1) != 0)
        {
          v14 = CFSTR("center");
          goto LABEL_123;
        }
        v14 = CFSTR("center");
        if ((objc_msgSend(CFSTR("CAPTION"), "isEqualToString:", v29) & 1) != 0)
          goto LABEL_123;
LABEL_84:
        v30 = CFSTR("TH");
        goto LABEL_90;
      }
      if (objc_msgSend(CFSTR("vertical-align"), "isEqualToString:", a4))
      {
        v31 = objc_msgSend(a3, "tagName");
        if ((objc_msgSend(CFSTR("SUP"), "isEqualToString:", v31) & 1) != 0)
        {
          v14 = CFSTR("super");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("SUB"), "isEqualToString:", v31) & 1) != 0)
        {
          v14 = CFSTR("sub");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("THEAD"), "isEqualToString:", v31) & 1) != 0
          || (objc_msgSend(CFSTR("TBODY"), "isEqualToString:", v31) & 1) != 0
          || (objc_msgSend(CFSTR("TFOOT"), "isEqualToString:", v31) & 1) != 0)
        {
          v14 = CFSTR("middle");
          goto LABEL_123;
        }
        if ((objc_msgSend(CFSTR("TR"), "isEqualToString:", v31) & 1) != 0
          || (objc_msgSend(CFSTR("TH"), "isEqualToString:", v31) & 1) != 0)
        {
          goto LABEL_122;
        }
        v32 = CFSTR("TD");
        v33 = (id)v31;
      }
      else
      {
        if ((objc_msgSend(CFSTR("font-family"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("font-variant"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("font-effect"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("text-transform"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("text-shadow"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("visibility"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("border-collapse"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("empty-cells"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("word-spacing"), "isEqualToString:", a4) & 1) != 0
          || (objc_msgSend(CFSTR("list-style-type"), "isEqualToString:", a4) & 1) != 0)
        {
          goto LABEL_122;
        }
        v32 = CFSTR("direction");
        v33 = a4;
      }
      if (!-[__CFString isEqualToString:](v32, "isEqualToString:", v33))
      {
        v14 = 0;
        goto LABEL_123;
      }
LABEL_122:
      v14 = 0;
      v17 = 1;
      goto LABEL_123;
    }
    if (v23 != 1 || objc_msgSend(v22, "primitiveType") - 19 > 3)
    {
LABEL_27:
      v17 = 0;
      goto LABEL_28;
    }
    v24 = (__CFString *)objc_msgSend(v22, "getStringValue");
    if (!v24)
      goto LABEL_25;
    v14 = v24;
    if (!-[__CFString length](v24, "length"))
      goto LABEL_25;
LABEL_14:
    v17 = 0;
    goto LABEL_123;
  }
  v15 = 0;
  v14 = 0;
LABEL_124:
  if (!v15)
  {
    v34 = objc_msgSend(a3, "parentNode");
    if (!v34)
      return 0;
    v14 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v34, a4);
  }
LABEL_127:
  if (v14)
    return (id)-[__CFString lowercaseString](v14, "lowercaseString");
  return 0;
}

- (id)_stringForNode:(id)a3 property:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  v7 = (id)-[NSMutableDictionary objectForKey:](self->_stringsForNodes, "objectForKey:");
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_stringsForNodes, "setObject:forKey:", v7, a3);

  }
  v8 = objc_msgSend(v7, "objectForKey:", a4);
  if (v8)
  {
    v9 = (void *)v8;
    if (objc_msgSend(&stru_1E260C7D0, "isEqualToString:", v8))
      return 0;
    else
      return v9;
  }
  else
  {
    v11 = -[NSHTMLReader _computedStringForNode:property:](self, "_computedStringForNode:property:", a3, a4);
    v10 = v11;
    if (v11)
      v12 = v11;
    else
      v12 = &stru_1E260C7D0;
    objc_msgSend(v7, "setObject:forKey:", v12, a4);
  }
  return (id)v10;
}

- (BOOL)_getComputedFloat:(double *)a3 forNode:(id)a4 property:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  void *v15;
  int v16;
  float v17;
  double v18;
  float v19;
  double v20;
  double v21;
  float v22;
  float v23;
  double v24;
  double v25;
  float v26;
  float v27;
  double v29;

  v29 = 0.0;
  if (a4 && objc_msgSend(a4, "nodeType") == 1)
  {
    v9 = -[NSHTMLReader _computedStyleForElement:](self, "_computedStyleForElement:", a4);
    if (v9)
    {
      v10 = (void *)objc_msgSend(v9, "getPropertyCSSValue:", a5);
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v10, "cssValueType") == 1)
        {
          switch(objc_msgSend(v11, "primitiveType"))
          {
            case 5u:
LABEL_13:
              objc_msgSend(v11, "getFloatValue:", 5);
              v18 = v17;
              break;
            case 6u:
LABEL_23:
              objc_msgSend(v11, "getFloatValue:", 6);
              v20 = v19 * 96.0;
              v21 = 2.54;
              goto LABEL_27;
            case 7u:
LABEL_24:
              objc_msgSend(v11, "getFloatValue:", 7);
              v20 = v22 * 96.0;
              v21 = 25.4;
              goto LABEL_27;
            case 8u:
LABEL_25:
              objc_msgSend(v11, "getFloatValue:", 8);
              v24 = v23;
              v25 = 96.0;
              goto LABEL_29;
            case 9u:
LABEL_26:
              objc_msgSend(v11, "getFloatValue:", 9);
              v20 = v26 * 4.0;
              v21 = 3.0;
LABEL_27:
              v18 = v20 / v21;
              break;
            case 0xAu:
LABEL_28:
              objc_msgSend(v11, "getFloatValue:", 10);
              v24 = v27;
              v25 = 16.0;
LABEL_29:
              v18 = v24 * v25;
              break;
            default:
              goto LABEL_8;
          }
          LODWORD(v11) = 0;
          v29 = v18;
          LODWORD(v12) = 1;
LABEL_31:
          v13 = (_DWORD)v11 == 0;
          if ((v12 & 1) != 0)
            goto LABEL_35;
          goto LABEL_32;
        }
      }
    }
LABEL_8:
    v14 = -[NSHTMLReader _specifiedStyleForElement:](self, "_specifiedStyleForElement:", a4);
    if (v14)
    {
      v15 = (void *)objc_msgSend(v14, "getPropertyCSSValue:", a5);
      v11 = v15;
      if (!v15)
      {
LABEL_15:
        if ((objc_msgSend(CFSTR("text-indent"), "isEqualToString:", a5) & 1) != 0
          || (objc_msgSend(CFSTR("letter-spacing"), "isEqualToString:", a5) & 1) != 0
          || (objc_msgSend(CFSTR("word-spacing"), "isEqualToString:", a5) & 1) != 0
          || (objc_msgSend(CFSTR("line-height"), "isEqualToString:", a5) & 1) != 0
          || (objc_msgSend(CFSTR("widows"), "isEqualToString:", a5) & 1) != 0
          || (LODWORD(v12) = objc_msgSend(CFSTR("orphans"), "isEqualToString:", a5), (_DWORD)v12))
        {
          LODWORD(v12) = 0;
          LODWORD(v11) = 1;
        }
        goto LABEL_31;
      }
      v16 = objc_msgSend(v15, "cssValueType");
      if (!v16)
      {
        LODWORD(v11) = 1;
        goto LABEL_15;
      }
      if (v16 == 1)
      {
        switch(objc_msgSend(v11, "primitiveType"))
        {
          case 5u:
            goto LABEL_13;
          case 6u:
            goto LABEL_23;
          case 7u:
            goto LABEL_24;
          case 8u:
            goto LABEL_25;
          case 9u:
            goto LABEL_26;
          case 0xAu:
            goto LABEL_28;
          default:
            break;
        }
      }
    }
    LODWORD(v11) = 0;
    goto LABEL_15;
  }
  LODWORD(v12) = 0;
  v13 = 0;
LABEL_32:
  if (!v13)
  {
    v12 = objc_msgSend(a4, "parentNode");
    if (!v12)
      return v12;
    LODWORD(v12) = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v29, v12, a5);
  }
LABEL_35:
  if (a3 && (_DWORD)v12)
    *a3 = v29;
  return v12;
}

- (BOOL)_getFloat:(double *)a3 forNode:(id)a4 property:(id)a5
{
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  double v14;
  double v16;

  v16 = 0.0;
  v9 = (id)-[NSMutableDictionary objectForKey:](self->_floatsForNodes, "objectForKey:", a4);
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_floatsForNodes, "setObject:forKey:", v9, a4);

  }
  v10 = objc_msgSend(v9, "objectForKey:", a5);
  if (v10)
  {
    v11 = (void *)v10;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E38], "null"), "isEqual:", v10) & 1) != 0)
    {
      LOBYTE(v12) = 0;
      return v12;
    }
    objc_msgSend(v11, "doubleValue");
    v16 = v14;
    v12 = 1;
    if (!a3)
      return v12;
    goto LABEL_12;
  }
  v12 = -[NSHTMLReader _getComputedFloat:forNode:property:](self, "_getComputedFloat:forNode:property:", &v16, a4, a5);
  if (v12)
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  else
    v13 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v9, "setObject:forKey:", v13, a5);
  if (a3)
  {
LABEL_12:
    if (v12)
    {
      *a3 = v16;
      LOBYTE(v12) = 1;
    }
  }
  return v12;
}

- (BOOL)_elementIsBlockLevel:(id)a3
{
  void *v5;
  uint64_t v7;
  id v8;
  id v9;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_elementIsBlockLevel, "objectForKey:");
  if (v5)
    return objc_msgSend(v5, "BOOLValue");
  v7 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("display"));
  v8 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("float"));
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(CFSTR("left"), "isEqualToString:", v8) & 1) != 0
      || (objc_msgSend(CFSTR("right"), "isEqualToString:", v9) & 1) != 0)
    {
LABEL_9:
      v7 = 1;
      goto LABEL_10;
    }
  }
  if (v7)
  {
    if ((objc_msgSend(CFSTR("block"), "isEqualToString:", v7) & 1) == 0
      && (objc_msgSend(CFSTR("list-item"), "isEqualToString:", v7) & 1) == 0)
    {
      v7 = objc_msgSend((id)v7, "hasPrefix:", CFSTR("table"));
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:
  -[NSMutableDictionary setObject:forKey:](self->_elementIsBlockLevel, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7), a3);
  return v7;
}

- (BOOL)_elementHasOwnBackgroundColor:(id)a3
{
  int v5;
  uint64_t v6;
  id v7;

  v5 = -[NSHTMLReader _elementIsBlockLevel:](self, "_elementIsBlockLevel:");
  if (v5)
  {
    v6 = objc_msgSend(a3, "tagName");
    v7 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("display"));
    if ((objc_msgSend(CFSTR("HTML"), "isEqualToString:", v6) & 1) != 0
      || (objc_msgSend(CFSTR("BODY"), "isEqualToString:", v6) & 1) != 0
      || (v5 = objc_msgSend(v7, "hasPrefix:", CFSTR("table"))) != 0)
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)_blockLevelElementForNode:(id)a3
{
  id v3;

  v3 = a3;
  if (!a3)
    return v3;
  while (objc_msgSend(v3, "nodeType") != 1)
  {
    v3 = (id)objc_msgSend(v3, "parentNode");
    if (!v3)
      return v3;
  }
  if (!-[NSHTMLReader _elementIsBlockLevel:](self, "_elementIsBlockLevel:", v3))
    return -[NSHTMLReader _blockLevelElementForNode:](self, "_blockLevelElementForNode:", objc_msgSend(v3, "parentNode"));
  else
    return v3;
}

- (id)_computedColorForNode:(id)a3 property:(id)a4
{
  char v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id result;
  BOOL v17;
  id v18;

  v7 = objc_msgSend(CFSTR("color"), "isEqualToString:", a4);
  v8 = objc_msgSend(CFSTR("background-color"), "isEqualToString:", a4);
  if (a3 && objc_msgSend(a3, "nodeType") == 1)
  {
    v9 = -[NSHTMLReader _computedStyleForElement:](self, "_computedStyleForElement:", a3);
    if (v9)
    {
      v10 = (void *)objc_msgSend(v9, "getPropertyCSSValue:", a4);
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v10, "cssValueType") == 1
          && objc_msgSend(v11, "primitiveType") == 25)
        {
          goto LABEL_12;
        }
      }
    }
    v12 = -[NSHTMLReader _specifiedStyleForElement:](self, "_specifiedStyleForElement:", a3);
    if (v12)
    {
      v13 = (void *)objc_msgSend(v12, "getPropertyCSSValue:", a4);
      v11 = v13;
      if (!v13)
        goto LABEL_16;
      v14 = objc_msgSend(v13, "cssValueType");
      if (!v14)
      {
        LODWORD(v11) = 1;
        if ((v7 & 1) != 0)
          goto LABEL_21;
        goto LABEL_17;
      }
      if (v14 == 1 && objc_msgSend(v11, "primitiveType") == 25)
      {
LABEL_12:
        v15 = (void *)objc_msgSend(v11, "getRGBColorValue");
        result = (id)objc_msgSend((Class)getUIColorClass_0[0](), "colorWithCGColor:", objc_msgSend(v15, "color"));
        LODWORD(v11) = 0;
        if (result)
          goto LABEL_22;
LABEL_17:
        if (!v8 || -[NSHTMLReader _elementHasOwnBackgroundColor:](self, "_elementHasOwnBackgroundColor:", a3))
        {
          result = 0;
          goto LABEL_22;
        }
LABEL_21:
        result = 0;
        LODWORD(v11) = 1;
LABEL_22:
        v17 = (_DWORD)v11 == 0;
        if (result)
          return result;
        goto LABEL_23;
      }
    }
    LODWORD(v11) = 0;
LABEL_16:
    if ((v7 & 1) != 0)
      goto LABEL_21;
    goto LABEL_17;
  }
  result = 0;
  v17 = 0;
LABEL_23:
  if (!v17)
  {
    result = (id)objc_msgSend(a3, "parentNode");
    if (result)
    {
      v18 = result;
      if (v8
        && objc_msgSend(result, "nodeType") == 1
        && -[NSHTMLReader _elementHasOwnBackgroundColor:](self, "_elementHasOwnBackgroundColor:", v18))
      {
        return 0;
      }
      else
      {
        return -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", v18, a4);
      }
    }
  }
  return result;
}

- (id)_colorForNode:(id)a3 property:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  double v10;

  v7 = (id)-[NSMutableDictionary objectForKey:](self->_colorsForNodes, "objectForKey:");
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_colorsForNodes, "setObject:forKey:", v7, a3);

  }
  v8 = (id)objc_msgSend(v7, "objectForKey:", a4);
  if (!v8)
  {
    v8 = -[NSHTMLReader _computedColorForNode:property:](self, "_computedColorForNode:property:", a3, a4);
    v9 = (uint64_t)v8;
    if (!v8)
      v9 = objc_msgSend((Class)getNSColorClass_4[0](), "clearColor");
    objc_msgSend(v7, "setObject:forKey:", v9, a4);
  }
  if ((objc_msgSend((id)objc_msgSend((Class)getNSColorClass_4[0](), "clearColor"), "isEqual:", v8) & 1) != 0)
    return 0;
  objc_msgSend(v8, "alphaComponent");
  if (v10 == 0.0)
    return 0;
  return v8;
}

- (id)_computedAttributesForElement:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double defaultFontSize;
  double v13;
  double minimumFontSize;
  double v15;
  double v16;
  NSFont *v17;
  NSString *standardFontFamily;
  id v19;
  double v20;
  void *v21;
  uint64_t v22;
  UIFont *v23;
  uint64_t v24;
  UIFont *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  float v43;
  double v44;
  float v45;
  double v46;
  float v47;
  double v48;
  double v49;
  void *v50;
  float v51;
  NSArray *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSString *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  NSArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  float v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  float v93;
  double v94;
  NSShadow *v95;
  void *v96;
  void *v97;
  _BOOL4 v98;
  int v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  double v108;
  unsigned int v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  double webViewTextSizeMultiplier;
  id v116;
  id v117;
  id v118;
  id v119;
  void *v120;
  NSMutableDictionary *fontCache;
  id v122;
  id v123;
  id v124;
  id v125;
  __int128 v126;
  id v127;
  id v128;
  id v129;
  unint64_t v130;
  _BOOL4 v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  double v142[18];

  v142[16] = *(double *)MEMORY[0x1E0C80C00];
  v5 = -[NSHTMLReader _blockLevelElementForNode:](self, "_blockLevelElementForNode:");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v128 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("font-effect"));
  v7 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("text-decoration"));
  v8 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("vertical-align"));
  v9 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("text-shadow"));
  v127 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("font-variant-ligatures"));
  *(_QWORD *)&v126 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("font-kerning"));
  v10 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("letter-spacing"));
  v136 = 0.0;
  v137 = 0.0;
  v135 = 0.0;
  v124 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a3, CFSTR("color"));
  v129 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a3, CFSTR("background-color"));
  v125 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a3, CFSTR("-webkit-text-stroke-color"));
  v11 = (void *)objc_msgSend(a3, "_font");
  if (!-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v137, a3, CFSTR("font-size"))
    || (defaultFontSize = v137, v137 <= 0.0))
  {
    defaultFontSize = self->_defaultFontSize;
  }
  v13 = self->_textSizeMultiplier * defaultFontSize;
  v137 = v13;
  minimumFontSize = self->_minimumFontSize;
  if (v13 < minimumFontSize)
  {
    v137 = self->_minimumFontSize;
    v13 = minimumFontSize;
  }
  v15 = floor(v13 * 2.0 + 0.5) * 0.5;
  if (vabdd_f64(v15, v13) >= 0.05)
  {
    v16 = floor(v13 * 10.0 + 0.5) / 10.0;
    if (vabdd_f64(v16, v13) < 0.005)
    {
      v137 = v16;
      v13 = v16;
    }
  }
  else
  {
    v137 = v15;
    v13 = v15;
  }
  *((_QWORD *)&v126 + 1) = v10;
  if (v13 <= 0.0)
  {
    v137 = 12.0;
    v13 = 12.0;
  }
  if (v11)
  {
    v17 = (NSFont *)objc_msgSend(v11, "fontWithSize:", v13);
    if (v17)
      goto LABEL_31;
  }
  v123 = v7;
  standardFontFamily = (NSString *)objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("font-family"), v13), "capitalizedString");
  v19 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("font-style"));
  v122 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("font-weight"));
  if (!standardFontFamily)
  {
    standardFontFamily = self->_standardFontFamily;
    if (!standardFontFamily)
    {
LABEL_19:
      v17 = +[NSFont fontWithName:size:](NSFont, "fontWithName:size:", CFSTR("Times"), v137);
      goto LABEL_22;
    }
  }
  v20 = v137;
  fontCache = self->_fontCache;
  v21 = (void *)-[NSMutableDictionary objectForKey:](fontCache, "objectForKey:", standardFontFamily);
  if (v21)
  {
    v17 = (NSFont *)objc_msgSend(v21, "fontWithSize:", v20);
    goto LABEL_18;
  }
  v117 = v19;
  v118 = v8;
  v119 = v5;
  v120 = v6;
  v17 = +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", standardFontFamily, v20);
  if (!v17)
  {
    v52 = +[UIFont familyNames](UIFont, "familyNames");
    v53 = -[NSString rangeOfString:options:](standardFontFamily, "rangeOfString:options:", CFSTR(" "), 4);
    v55 = v54;
    v56 = -[NSString rangeOfString:options:](standardFontFamily, "rangeOfString:options:", CFSTR("-"), 4);
    if (v55 && v57)
    {
      if (v53 <= v56)
        v58 = v57;
      else
        v58 = v55;
      if (v53 <= v56)
        v53 = v56;
    }
    else
    {
      if (v55)
        v58 = v55;
      else
        v58 = v57;
      if (!v55)
        v53 = v56;
      if (!v58)
        goto LABEL_129;
    }
    v59 = -[NSString substringToIndex:](standardFontFamily, "substringToIndex:", v53);
    if (!-[NSArray containsObject:](v52, "containsObject:", v59))
    {
      do
      {
        v53 = -[NSString rangeOfString:options:](v59, "rangeOfString:options:", CFSTR(" "), 4);
        v61 = v60;
        v62 = -[NSString rangeOfString:options:](v59, "rangeOfString:options:", CFSTR("-"), 4);
        if (v61)
          v64 = v63 == 0;
        else
          v64 = 1;
        if (v64)
        {
          if (v61)
            v58 = v61;
          else
            v58 = v63;
          if (!v61)
            v53 = v62;
          if (!v58)
            goto LABEL_129;
        }
        else
        {
          if (v53 <= v62)
            v58 = v63;
          else
            v58 = v61;
          if (v53 <= v62)
            v53 = v62;
        }
        v59 = -[NSString substringToIndex:](standardFontFamily, "substringToIndex:", v53);
      }
      while (!-[NSArray containsObject:](v52, "containsObject:", v59));
    }
    v65 = -[NSString substringFromIndex:](standardFontFamily, "substringFromIndex:", v58 + v53);
    v66 = +[UIFont fontNamesForFamilyName:](UIFont, "fontNamesForFamilyName:", v59);
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v67 = -[NSArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v139;
      v116 = v9;
LABEL_119:
      v70 = 0;
      while (1)
      {
        if (*(_QWORD *)v139 != v69)
          objc_enumerationMutation(v66);
        v71 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v70);
        if (!objc_msgSend(v71, "compare:options:", v65, 1))
          break;
        if (v68 == ++v70)
        {
          v68 = -[NSArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
          v9 = v116;
          if (v68)
            goto LABEL_119;
          goto LABEL_127;
        }
      }
      v17 = +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v71, v20);
      v9 = v116;
      if (v17)
        goto LABEL_21;
    }
LABEL_127:
    if (-[NSArray count](v66, "count"))
    {
      v17 = +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v59, v20);
      if (v17)
        goto LABEL_21;
    }
LABEL_129:
    v17 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v20);
    v5 = v119;
    v6 = v120;
    v19 = v117;
    v8 = v118;
LABEL_18:
    -[NSMutableDictionary setObject:forKey:](fontCache, "setObject:forKey:", v17, standardFontFamily);
    if (v17)
      goto LABEL_22;
    goto LABEL_19;
  }
LABEL_21:
  -[NSMutableDictionary setObject:forKey:](fontCache, "setObject:forKey:", v17, standardFontFamily);
  v5 = v119;
  v6 = v120;
  v19 = v117;
  v8 = v118;
LABEL_22:
  if ((objc_msgSend(CFSTR("italic"), "isEqualToString:", v19) & 1) != 0
    || objc_msgSend(CFSTR("oblique"), "isEqualToString:", v19))
  {
    v22 = -[UIFont familyName](v17, "familyName");
    -[UIFont pointSize](v17, "pointSize");
    v23 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v22, 1);
    if (v23)
      v17 = (NSFont *)v23;
  }
  v7 = v123;
  if ((objc_msgSend(v122, "hasPrefix:", CFSTR("bold")) & 1) != 0 || objc_msgSend(v122, "integerValue") >= 700)
  {
    v24 = -[UIFont familyName](v17, "familyName");
    -[UIFont pointSize](v17, "pointSize");
    v25 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v24, 2);
    if (v25)
      v17 = (NSFont *)v25;
  }
  if (v17)
LABEL_31:
    objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("NSFont"));
  if (v124)
    objc_msgSend(v6, "setObject:forKey:", v124, CFSTR("NSColor"));
  if (v129 && !-[NSHTMLReader _elementHasOwnBackgroundColor:](self, "_elementHasOwnBackgroundColor:", a3))
    objc_msgSend(v6, "setObject:forKey:", v129, CFSTR("NSBackgroundColor"));
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v135, a3, CFSTR("-webkit-text-stroke-width")))
  {
    v26 = v135;
    -[UIFont pointSize](v17, "pointSize");
    *(float *)&v27 = v26 / (v27 * 0.01);
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&v27), CFSTR("NSStrokeWidth"));
  }
  if (v125)
    objc_msgSend(v6, "setObject:forKey:", v125, CFSTR("NSStrokeColor"));
  if (v128)
  {
    if (objc_msgSend(v128, "rangeOfString:", CFSTR("outline")) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.0), CFSTR("NSStrokeWidth"));
    if (objc_msgSend(v128, "rangeOfString:", CFSTR("emboss")) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "setObject:forKey:", objc_alloc_init(NSShadow), CFSTR("NSShadow"));
  }
  if (v126 != 0)
  {
    if (objc_msgSend(v128, "rangeOfString:", CFSTR("none")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v29 = &unk_1E2631828;
LABEL_54:
      objc_msgSend(v6, "setObject:forKey:", v29, CFSTR("NSKern"));
      goto LABEL_55;
    }
    if (*((_QWORD *)&v126 + 1))
      objc_msgSend(*((id *)&v126 + 1), "doubleValue");
    else
      v28 = 0.0;
    if (fabs(v28) >= 2.22044605e-16)
    {
      v29 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      goto LABEL_54;
    }
  }
LABEL_55:
  if (v127 && objc_msgSend(v128, "rangeOfString:", CFSTR("normal")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v128, "rangeOfString:", CFSTR("common-ligatures")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = &unk_1E26317E0;
      goto LABEL_61;
    }
    if (objc_msgSend(v128, "rangeOfString:", CFSTR("no-common-ligatures")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = &unk_1E26317F8;
LABEL_61:
      objc_msgSend(v6, "setObject:forKey:", v30, CFSTR("NSLigature"));
    }
  }
  if (v7 && (unint64_t)objc_msgSend(v7, "length") >= 5)
  {
    if (objc_msgSend(v7, "rangeOfString:", CFSTR("underline")) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1), CFSTR("NSUnderline"));
    if (objc_msgSend(v7, "rangeOfString:", CFSTR("line-through")) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1), CFSTR("NSStrikethrough"));
  }
  if (v8)
  {
    if (objc_msgSend(v8, "rangeOfString:", CFSTR("super")) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1), CFSTR("NSSuperScript"));
    if (objc_msgSend(v8, "rangeOfString:", CFSTR("sub")) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1), CFSTR("NSSuperScript"));
  }
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v136, a3, CFSTR("vertical-align")))
  {
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v136), CFSTR("NSBaselineOffset"));
  }
  if (v9)
  {
    if ((unint64_t)objc_msgSend(v9, "length") >= 5)
    {
      v130 = objc_msgSend(v9, "length");
      v33 = objc_msgSend(v9, "rangeOfString:", CFSTR("("));
      v35 = v34;
      v36 = objc_msgSend(v9, "rangeOfString:", CFSTR(")"));
      v38 = v37;
      v39 = objc_msgSend(v9, "rangeOfString:", CFSTR("rgba("));
      if (v35)
      {
        if (v38)
        {
          v31 = v33 + v35;
          v32 = v36 - (v33 + v35);
          if (v36 > v33 + v35)
          {
            v40 = v39;
            v41 = (void *)objc_msgSend((id)objc_msgSend(v9, "substringWithRange:", v31, v32), "componentsSeparatedByString:", CFSTR(","));
            if ((unint64_t)objc_msgSend(v41, "count") >= 3)
            {
              v42 = v9;
              objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 0), "floatValue");
              v44 = v43 / 255.0;
              objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 1), "floatValue");
              v46 = v45 / 255.0;
              objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 2), "floatValue");
              v48 = v47 / 255.0;
              v49 = 1.0;
              if ((unint64_t)objc_msgSend(v41, "count") < 4)
              {
                v50 = v9;
              }
              else
              {
                v50 = v9;
                if (v40 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 3), "floatValue");
                  v49 = v51;
                }
              }
              v72 = objc_msgSend((Class)getNSColorClass_4[0](), "colorWithCalibratedRed:green:blue:alpha:", v44, v46, v48, v49);
              v73 = objc_msgSend(v50, "rangeOfString:", CFSTR("px"));
              v75 = v73;
              v76 = v74;
              if (v74)
              {
                if (v130 > v73 + v74)
                {
                  v77 = objc_msgSend(v42, "rangeOfString:options:range:", CFSTR("px"), 0, v73 + v74, v130 - (v73 + v74));
LABEL_136:
                  if (v74)
                  {
                    if (v130 <= v77 + v74)
                    {
                      v78 = 0;
                      v79 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else
                    {
                      v79 = objc_msgSend(v42, "rangeOfString:options:range:", CFSTR("px"), 0, v77 + v74, v130 - (v77 + v74));
                    }
                    if (v75 && v76 && v78)
                    {
                      v80 = objc_msgSend(v42, "rangeOfString:options:range:", CFSTR(" "), 4, 0, v75);
                      v82 = v81 ? v80 : 0;
                      objc_msgSend((id)objc_msgSend(v42, "substringWithRange:", v82 + v81, v75 - (v82 + v81)), "floatValue");
                      v84 = v83;
                      v85 = objc_msgSend(v42, "rangeOfString:options:range:", CFSTR(" "), 4, 0, v77);
                      v87 = v86 ? v85 : 0;
                      objc_msgSend((id)objc_msgSend(v42, "substringWithRange:", v87 + v86, v77 - (v87 + v86)), "floatValue");
                      v89 = v88;
                      v90 = objc_msgSend(v42, "rangeOfString:options:range:", CFSTR(" "), 4, 0, v79);
                      v92 = v91 ? v90 : 0;
                      objc_msgSend((id)objc_msgSend(v42, "substringWithRange:", v92 + v91, v79 - (v92 + v91)), "floatValue");
                      v94 = v93;
                      v95 = objc_alloc_init(NSShadow);
                      -[NSShadow setShadowColor:](v95, "setShadowColor:", v72);
                      -[NSShadow setShadowOffset:](v95, "setShadowOffset:", v84, v89);
                      -[NSShadow setShadowBlurRadius:](v95, "setShadowBlurRadius:", v94);
                      if (v95)
                        objc_msgSend(v6, "setObject:forKey:", v95, CFSTR("NSShadow"));
                    }
                  }
                  goto LABEL_154;
                }
                v74 = 0;
              }
              v77 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_136;
            }
          }
        }
      }
    }
  }
LABEL_154:
  if (v5 != a3 && -[NSMutableArray count](self->_writingDirectionArray, "count", v31, v32))
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_writingDirectionArray), CFSTR("NSWritingDirection"));
  if (v5)
  {
    v96 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "defaultParagraphStyle"), "mutableCopy");
    v97 = (void *)objc_msgSend(v5, "tagName");
    if ((objc_msgSend(CFSTR("P"), "isEqualToString:", v97) & 1) != 0
      || (objc_msgSend(CFSTR("LI"), "isEqualToString:", v97) & 1) != 0)
    {
      v98 = 1;
    }
    else
    {
      if (!objc_msgSend(v97, "hasPrefix:", CFSTR("H")))
      {
        v131 = 0;
LABEL_162:
        v99 = objc_msgSend(CFSTR("BLOCKQUOTE"), "isEqualToString:", v97);
        v100 = v5;
        v101 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v5, CFSTR("text-align"));
        v102 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v100, CFSTR("direction"));
        v103 = v100;
        v104 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v100, CFSTR("-webkit-hyphens"));
        v142[0] = 0.0;
        *(_QWORD *)&v138 = 0;
        v133 = 0.0;
        v134 = 0.0;
        v132 = 0.0;
        if (!v101)
          goto LABEL_175;
        if ((objc_msgSend(v101, "hasSuffix:", CFSTR("left")) & 1) != 0)
        {
          v105 = 0;
        }
        else if ((objc_msgSend(v101, "hasSuffix:", CFSTR("right")) & 1) != 0)
        {
          v105 = 2;
        }
        else if ((objc_msgSend(v101, "hasSuffix:", CFSTR("center")) & 1) != 0)
        {
          v105 = 1;
        }
        else
        {
          if (!objc_msgSend(v101, "hasSuffix:", CFSTR("justify")))
            goto LABEL_175;
          v105 = 3;
        }
        objc_msgSend(v96, "setAlignment:", v105);
LABEL_175:
        if (v102)
        {
          if ((objc_msgSend(v102, "isEqualToString:", CFSTR("ltr")) & 1) != 0)
          {
            v106 = 0;
LABEL_180:
            objc_msgSend(v96, "setBaseWritingDirection:", v106);
            goto LABEL_181;
          }
          if (objc_msgSend(v102, "isEqualToString:", CFSTR("rtl")))
          {
            v106 = 1;
            goto LABEL_180;
          }
        }
LABEL_181:
        if (v104)
        {
          v107 = objc_msgSend(v104, "isEqualToString:", CFSTR("auto"));
          LODWORD(v108) = 0;
          if (v107)
            *(float *)&v108 = 1.0;
          objc_msgSend(v96, "setHyphenationFactor:", v108);
        }
        if (objc_msgSend(v97, "hasPrefix:", CFSTR("H")))
        {
          if (objc_msgSend(v97, "length") == 2)
          {
            v109 = objc_msgSend(v97, "characterAtIndex:", 1);
            if (v109 - 49 <= 5)
              objc_msgSend(v96, "setHeaderLevel:", v109 - 48);
          }
        }
        if (v99)
        {
          v110 = objc_msgSend(MEMORY[0x1E0CB3890], "blockQuoteIntentWithIdentity:nestedInsideIntent:", 1, 0);
          objc_msgSend(v6, "setObject:forKey:", v110, *MEMORY[0x1E0CB3040]);
        }
        if (v131)
        {
          if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", v142, v103, CFSTR("margin-left")))
          {
            v111 = v142[0];
            if (v142[0] > 0.0)
              objc_msgSend(v96, "setHeadIndent:", v142[0]);
          }
          if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v133, v103, CFSTR("text-indent"), v111))
          {
            objc_msgSend(v96, "headIndent");
            objc_msgSend(v96, "setFirstLineHeadIndent:", v112 + v133);
          }
          if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v138, v103, CFSTR("margin-right")))
          {
            v113 = *(double *)&v138;
            if (*(double *)&v138 > 0.0)
              objc_msgSend(v96, "setTailIndent:", -*(double *)&v138);
          }
          if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v134, v103, CFSTR("margin-bottom"), v113)&& v134 > 0.0)
          {
            objc_msgSend(v96, "setParagraphSpacing:", v134);
          }
        }
        webViewTextSizeMultiplier = self->_webViewTextSizeMultiplier;
        if (webViewTextSizeMultiplier > 0.0)
        {
          if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v132, a3, CFSTR("line-height")))
          {
            webViewTextSizeMultiplier = v132;
            if (v132 > 0.0)
              objc_msgSend(v96, "setMinimumLineHeight:", v132 / self->_webViewTextSizeMultiplier);
          }
        }
        if (-[NSMutableArray count](self->_textLists, "count", webViewTextSizeMultiplier))
          objc_msgSend(v96, "setTextLists:", self->_textLists);
        if (-[NSMutableArray count](self->_textBlocks, "count"))
          objc_msgSend(v96, "setTextBlocks:", self->_textBlocks);
        objc_msgSend(v6, "setObject:forKey:", v96, CFSTR("NSParagraphStyle"));

        return v6;
      }
      v98 = objc_msgSend(v97, "length") == 2;
    }
    v131 = v98;
    goto LABEL_162;
  }
  return v6;
}

- (id)_attributesForElement:(id)a3
{
  id v5;

  if (!a3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_attributesForElements, "objectForKey:");
  if (!v5)
  {
    v5 = -[NSHTMLReader _computedAttributesForElement:](self, "_computedAttributesForElement:", a3);
    -[NSMutableDictionary setObject:forKey:](self->_attributesForElements, "setObject:forKey:", v5, a3);
  }
  return v5;
}

- (void)_newParagraphForElement:(id)a3 tag:(id)a4 allowEmpty:(BOOL)a5 suppressTrailingSpace:(BOOL)a6 isEntering:(BOOL)a7
{
  _BOOL4 v8;
  unint64_t v13;
  int v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags;
  uint64_t v19;
  id v20;

  v8 = a6;
  v13 = -[NSMutableAttributedString length](self->_attrStr, "length");
  if (v13)
  {
    v14 = objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v13 - 1);
    if (!v8)
      goto LABEL_9;
  }
  else
  {
    v14 = 10;
    if (!v8)
      goto LABEL_9;
  }
  if ((*(_BYTE *)&self->_flags & 1) == 0 || v14 != 8232 && v14 != 32)
  {
LABEL_9:
    v15 = 0;
    if (!a5 && v14 == 10)
      return;
    goto LABEL_11;
  }
  --v13;
  v15 = 1;
LABEL_11:
  v16 = &stru_1E260C7D0;
  if ((objc_msgSend(CFSTR("BODY"), "isEqualToString:", a4) & 1) == 0
    && !objc_msgSend(CFSTR("HTML"), "isEqualToString:", a4))
  {
    v16 = CFSTR("\n");
  }
  -[NSMutableArray removeAllObjects](self->_writingDirectionArray, "removeAllObjects");
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v13, v15, v16);
  if (v13 < self->_domRangeStartIndex)
    self->_domRangeStartIndex += -[__CFString length](v16, "length") - v15;
  v17 = -[__CFString length](v16, "length");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0 && !a7)
  {
    v19 = v17;
    v20 = -[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", a3);
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
      if (v19)
      {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v20, v13, v19);
        flags = self->_flags;
      }
    }
  }
  self->_flags = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&flags | 1);
}

- (void)_newLineForElement:(id)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t domRangeStartIndex;
  id v10;
  __int16 v11;

  v11 = 8232;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v11, 1);
  v6 = -[NSMutableAttributedString length](self->_attrStr, "length");
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v6, 0, v5);
  v7 = objc_msgSend(v5, "length");
  v8 = v7;
  domRangeStartIndex = self->_domRangeStartIndex;
  if (v6 < domRangeStartIndex)
    self->_domRangeStartIndex = domRangeStartIndex + v7;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    v10 = -[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", a3);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      if (v8)
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v10, v6, v8);
    }
  }

  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_newTabForElement:(id)a3
{
  unint64_t v5;
  $0C7FF0FC465E944347A24E3ECE87D1B8 *p_flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t domRangeStartIndex;
  id v11;

  v5 = -[NSMutableAttributedString length](self->_attrStr, "length");
  if (v5)
  {
    p_flags = &self->_flags;
    v7 = *(_BYTE *)&self->_flags & (objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v5 - 1) == 32);
    v5 -= v7;
  }
  else
  {
    v7 = 0;
    p_flags = &self->_flags;
  }
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v5, v7, CFSTR("\t"));
  v8 = objc_msgSend(CFSTR("\t"), "length");
  v9 = v8;
  domRangeStartIndex = self->_domRangeStartIndex;
  if (v5 < domRangeStartIndex)
    self->_domRangeStartIndex = domRangeStartIndex + v8;
  if ((*(_BYTE *)p_flags & 8) == 0)
  {
    v11 = -[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", a3);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      if (v9)
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v11, v5, v9);
    }
  }

  *(_DWORD *)p_flags |= 1u;
}

- (BOOL)_addAttachmentForElement:(id)a3 URL:(id)a4 needsParagraph:(BOOL)a5 usePlaceholder:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _BOOL4 v17;
  WebResource *v18;
  char v19;
  unint64_t v21;
  NSTextAttachment *v22;
  void *v23;
  void *v24;
  id v25;
  float v26;
  double v27;
  float v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t domRangeStartIndex;
  id v35;

  v6 = a6;
  v7 = a5;
  v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "webFrame"), "dataSource");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return 0;
  v12 = (void *)v11;
  v13 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", __NSHTMLReaderDelegateDocumentOption);
  if (!v13
    || (v14 = v13, (objc_opt_respondsToSelector() & 1) == 0)
    || (v15 = (id)objc_msgSend(v14, "fileWrapperForURL:", a4)) == 0)
  {
    if (!objc_msgSend(a4, "isFileURL")
      || !objc_msgSend((id)objc_msgSend(a4, "path"), "stringByStandardizingPath")
      || (v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", a4, 0, 0)) == 0)
    {
      v18 = (WebResource *)objc_msgSend(v12, "subresourceForURL:", a4);
      if (!v18)
        v18 = -[WebDataSource subresourceForURL:](self->_dataSource, "subresourceForURL:", a4);
      v19 = 0;
      if (v6 && v18)
        v19 = objc_msgSend(CFSTR("text/html"), "isEqual:", -[WebResource MIMEType](v18, "MIMEType"));
      v16 = 0;
      if ((v19 & 1) == 0 && v18)
      {
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", -[WebResource data](v18, "data"));
        objc_msgSend(v16, "setPreferredFilename:", objc_msgSend(a4, "_web_suggestedFilenameWithMIMEType:", -[WebResource MIMEType](v18, "MIMEType")));
      }
      v17 = v16 == 0;
      if (v16 || v6)
        goto LABEL_20;
      return 0;
    }
  }
  v16 = v15;
  v17 = 0;
LABEL_20:
  v21 = -[NSMutableAttributedString length](self->_attrStr, "length");
  v22 = -[NSTextAttachment initWithFileWrapper:]([NSTextAttachment alloc], "initWithFileWrapper:", v16);
  v23 = (void *)objc_msgSend(a3, "getAttribute:", CFSTR("aria-label"));
  if (objc_msgSend(v23, "length"))
    -[NSTextAttachment setAccessibilityLabel:](v22, "setAccessibilityLabel:", v23);
  v24 = (void *)objc_msgSend(a3, "getAttribute:", CFSTR("alt"));
  if (objc_msgSend(v24, "length"))
    -[NSTextAttachment setAccessibilityLabel:](v22, "setAccessibilityLabel:", v24);
  v25 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("vertical-align"));
  objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("horizontal-align")), "floatValue");
  v27 = v26 / 100.0 * (double)(int)objc_msgSend(a3, "clientWidth");
  objc_msgSend(v25, "floatValue");
  -[NSTextAttachment setBounds:](v22, "setBounds:", v27, v28 / 100.0 * (double)(int)objc_msgSend(a3, "clientHeight"), (double)(int)objc_msgSend(a3, "clientWidth"), (double)(int)objc_msgSend(a3, "clientHeight"));
  if (v7)
    v29 = CFSTR("\uFFFC\n");
  else
    v29 = CFSTR("\uFFFC");
  if (v17)
  {
    v30 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WebKit"));
    if (!v30)
    {
      v30 = (void *)objc_msgSend(-[NSArray firstObject](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1), "firstObject"), "stringByAppendingPathComponent:", CFSTR("Frameworks/WebKit.framework"));
      if (v30)
        v30 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v30);
    }
    v31 = objc_msgSend(v30, "URLForResource:withExtension:", CFSTR("missing_image"), CFSTR("tiff"));
    if (v31)
      -[NSTextAttachment setFileWrapper:](v22, "setFileWrapper:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v31, 0, 0));
  }
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v21, 0, v29);
  v32 = -[__CFString length](v29, "length");
  v33 = v32;
  domRangeStartIndex = self->_domRangeStartIndex;
  if (v21 < domRangeStartIndex)
    self->_domRangeStartIndex = domRangeStartIndex + v32;
  v35 = -[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", a3);
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    if (v33)
    {
      -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v35, v21, v33);
      -[NSMutableAttributedString addAttribute:value:range:](self->_attrStr, "addAttribute:value:range:", CFSTR("NSAttachment"), v22, v21, 1);
    }
  }

  *(_DWORD *)&self->_flags &= ~1u;
  return 1;
}

- (void)_addQuoteForElement:(id)a3 opening:(BOOL)a4 level:(int64_t)a5
{
  __int16 v7;
  __int16 v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t domRangeStartIndex;
  id v14;
  __int16 v15;

  if (a4)
    v7 = 8220;
  else
    v7 = 8221;
  if (a4)
    v8 = 8216;
  else
    v8 = 8217;
  if ((a5 & 1) != 0)
    v7 = v8;
  v15 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v15, 1);
  v10 = -[NSMutableAttributedString length](self->_attrStr, "length");
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v10, 0, v9);
  v11 = objc_msgSend(v9, "length");
  v12 = v11;
  domRangeStartIndex = self->_domRangeStartIndex;
  if (v10 < domRangeStartIndex)
    self->_domRangeStartIndex = domRangeStartIndex + v11;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    v14 = -[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", a3);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      if (v12)
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v14, v10, v12);
    }
  }

  *(_DWORD *)&self->_flags &= ~1u;
}

- (void)_addValue:(id)a3 forElement:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t domRangeStartIndex;
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags;
  id v12;

  v7 = -[NSMutableAttributedString length](self->_attrStr, "length");
  v8 = objc_msgSend(a3, "length");
  if (v8)
  {
    v9 = v8;
    -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v7, 0, a3);
    domRangeStartIndex = self->_domRangeStartIndex;
    if (v7 < domRangeStartIndex)
      self->_domRangeStartIndex = domRangeStartIndex + v9;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
      v12 = -[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", a4);
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 0x10) == 0)
      {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v12, v7, v9);
        flags = self->_flags;
      }
    }
    self->_flags = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&flags & 0xFFFFFFFE);
  }
}

- (void)_fillInBlock:(id)a3 forElement:(id)a4 backgroundColor:(id)a5 extraMargin:(double)a6 extraPadding:(double)a7 isTable:(BOOL)a8
{
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  double v19;
  _BOOL4 v20;
  double v21;
  _BOOL4 v22;
  double v23;
  _BOOL4 v24;
  double v25;
  _BOOL4 v26;
  double v27;
  _BOOL4 v28;
  double v29;
  _BOOL4 v30;
  double v31;
  _BOOL4 v32;
  double v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  double v39;

  v39 = 0.0;
  -[NSHTMLReader _DOMHTMLTableCellElementClass](self, "_DOMHTMLTableCellElementClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(a4, "width");
    v16 = objc_msgSend(a4, "height");
  }
  else
  {
    v15 = (void *)objc_msgSend(a4, "getAttribute:", CFSTR("width"));
    v16 = objc_msgSend(a4, "getAttribute:", CFSTR("height"));
  }
  v17 = (void *)v16;
  if ((v15 && objc_msgSend(v15, "length") || !a8)
    && -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("width")))
  {
    objc_msgSend(a3, "setValue:type:forDimension:", 0, 0, v39);
  }
  if (v17)
    objc_msgSend(v17, "length");
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("min-width")))
    objc_msgSend(a3, "setValue:type:forDimension:", 0, 1, v39);
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("max-width")))
    objc_msgSend(a3, "setValue:type:forDimension:", 0, 2, v39);
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("min-height")))
    objc_msgSend(a3, "setValue:type:forDimension:", 0, 5, v39);
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("max-height")))
    objc_msgSend(a3, "setValue:type:forDimension:", 0, 6, v39);
  v18 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("padding-left"));
  v19 = v39;
  if (!v18)
    v19 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, -1, 0, v19 + a7);
  v20 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("padding-top"));
  v21 = v39;
  if (!v20)
    v21 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, -1, 1, v21 + a7);
  v22 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("padding-right"));
  v23 = v39;
  if (!v22)
    v23 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, -1, 2, v23 + a7);
  v24 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("padding-bottom"));
  v25 = v39;
  if (!v24)
    v25 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, -1, 3, v25 + a7);
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("border-left-width")))
  {
    objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 0, 0, v39);
  }
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("border-top-width")))
  {
    objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 0, 1, v39);
  }
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("border-right-width")))
  {
    objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 0, 2, v39);
  }
  if (-[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("border-bottom-width")))
  {
    objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 0, 3, v39);
  }
  v26 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("margin-left"));
  v27 = v39;
  if (!v26)
    v27 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 1, 0, v27 + a6);
  v28 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("margin-top"));
  v29 = v39;
  if (!v28)
    v29 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 1, 1, v29 + a6);
  v30 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("margin-right"));
  v31 = v39;
  if (!v30)
    v31 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 1, 2, v31 + a6);
  v32 = -[NSHTMLReader _getFloat:forNode:property:](self, "_getFloat:forNode:property:", &v39, a4, CFSTR("margin-bottom"));
  v33 = v39;
  if (!v32)
    v33 = -0.0;
  objc_msgSend(a3, "setWidth:type:forLayer:edge:", 0, 1, 3, v33 + a6);
  v34 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a4, CFSTR("background-color"));
  if (v34 || (v34 = a5) != 0)
    objc_msgSend(a3, "setBackgroundColor:", v34);
  v35 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a4, CFSTR("border-left-color"));
  if (v35)
    objc_msgSend(a3, "setBorderColor:forEdge:", v35, 0);
  v36 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a4, CFSTR("border-top-color"));
  if (v36)
    objc_msgSend(a3, "setBorderColor:forEdge:", v36, 1);
  v37 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a4, CFSTR("border-right-color"));
  if (v37)
    objc_msgSend(a3, "setBorderColor:forEdge:", v37, 2);
  v38 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a4, CFSTR("border-bottom-color"));
  if (v38)
    objc_msgSend(a3, "setBorderColor:forEdge:", v38, 3);
}

- (void)_processMetaElementWithName:(id)a3 content:(id)a4
{
  uint64_t v7;
  NSMutableDictionary *documentAttrs;
  id v9;
  __CFString *v10;
  double v11;
  double v12;
  NSMutableDictionary *v13;
  __CFString **v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  NSAttributedStringDocumentAttributeKey *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;

  if (!objc_msgSend(CFSTR("CocoaVersion"), "compare:options:", a3, 1))
  {
    objc_msgSend(a4, "doubleValue");
    if (v11 <= 0.0)
      return;
    v12 = v11;
    -[NSMutableDictionary removeObjectForKey:](self->_documentAttrs, "removeObjectForKey:", NSConvertedDocumentAttribute);
    documentAttrs = self->_documentAttrs;
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v10 = CFSTR("CocoaRTFVersion");
    goto LABEL_20;
  }
  if (!objc_msgSend(CFSTR("Generator"), "compare:options:", a3, 1))
  {
    v14 = &NSGeneratorDocumentAttribute;
    if (!a4)
      return;
    goto LABEL_44;
  }
  if (!objc_msgSend(CFSTR("Keywords"), "compare:options:", a3, 1))
  {
    if (!a4 || !objc_msgSend(a4, "length"))
      return;
    objc_msgSend(a4, "rangeOfString:", CFSTR(", "));
    if (v15 || (v17 = CFSTR(","), objc_msgSend(a4, "rangeOfString:", CFSTR(",")), !v18))
    {
      objc_msgSend(a4, "rangeOfString:", CFSTR(", "));
      if (v16 || (v17 = CFSTR(" "), objc_msgSend(a4, "rangeOfString:", CFSTR(" ")), !v19))
        v17 = CFSTR(", ");
    }
    v9 = (id)objc_msgSend(a4, "componentsSeparatedByString:", v17);
    v13 = self->_documentAttrs;
    v20 = &NSKeywordsDocumentAttribute;
LABEL_40:
    v10 = (__CFString *)*v20;
    goto LABEL_47;
  }
  if (!objc_msgSend(CFSTR("Author"), "compare:options:", a3, 1))
  {
    v14 = (__CFString **)&NSAuthorDocumentAttribute;
    if (!a4)
      return;
    goto LABEL_44;
  }
  if (!objc_msgSend(CFSTR("LastAuthor"), "compare:options:", a3, 1))
  {
    v14 = (__CFString **)&NSEditorDocumentAttribute;
    if (!a4)
      return;
    goto LABEL_44;
  }
  if (!objc_msgSend(CFSTR("Company"), "compare:options:", a3, 1))
  {
    v14 = (__CFString **)&NSCompanyDocumentAttribute;
    if (!a4)
      return;
    goto LABEL_44;
  }
  if (!objc_msgSend(CFSTR("Copyright"), "compare:options:", a3, 1))
  {
    v14 = (__CFString **)&NSCopyrightDocumentAttribute;
    if (!a4)
      return;
    goto LABEL_44;
  }
  if (!objc_msgSend(CFSTR("Subject"), "compare:options:", a3, 1))
  {
    v14 = (__CFString **)&NSSubjectDocumentAttribute;
    if (!a4)
      return;
LABEL_44:
    v21 = *v14;
    if (*v14 && objc_msgSend(a4, "length"))
    {
      v13 = self->_documentAttrs;
      v9 = a4;
      v10 = v21;
      goto LABEL_47;
    }
    return;
  }
  if (!objc_msgSend(CFSTR("Description"), "compare:options:", a3, 1)
    || !objc_msgSend(CFSTR("Comment"), "compare:options:", a3, 1))
  {
    v14 = (__CFString **)&NSCommentDocumentAttribute;
    if (!a4)
      return;
    goto LABEL_44;
  }
  if (!objc_msgSend(CFSTR("CreationTime"), "compare:options:", a3, 1))
  {
    if (!a4)
      return;
    if (!objc_msgSend(a4, "length"))
      return;
    v22 = _dateForString(a4);
    if (!v22)
      return;
    v9 = (id)v22;
    v13 = self->_documentAttrs;
    v20 = &NSCreationTimeDocumentAttribute;
    goto LABEL_40;
  }
  if (!objc_msgSend(CFSTR("ModificationTime"), "compare:options:", a3, 1))
  {
    if (!a4)
      return;
    if (!objc_msgSend(a4, "length"))
      return;
    v23 = _dateForString(a4);
    if (!v23)
      return;
    v9 = (id)v23;
    v13 = self->_documentAttrs;
    v20 = &NSModificationTimeDocumentAttribute;
    goto LABEL_40;
  }
  if (!objc_msgSend(CFSTR("DisplayName"), "compare:options:", a3, 1)
    || !objc_msgSend(CFSTR("IndexTitle"), "compare:options:", a3, 1))
  {
    v14 = &NSDisplayNameDocumentAttribute;
    if (!a4)
      return;
    goto LABEL_44;
  }
  if (!objc_msgSend(CFSTR("robots"), "compare:options:", a3, 1))
  {
    objc_msgSend(a4, "rangeOfString:options:", CFSTR("noindex"), 1);
    if (v7)
    {
      documentAttrs = self->_documentAttrs;
      v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v10 = NSNoIndexDocumentAttribute;
LABEL_20:
      v13 = documentAttrs;
LABEL_47:
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v9, v10);
    }
  }
}

- (void)_processHeadElement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = -[NSHTMLReader _childrenForNode:](self, "_childrenForNode:", a3);
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(v4, "objectAtIndex:", i);
      if (objc_msgSend(v8, "nodeType") == 1)
      {
        if (objc_msgSend(CFSTR("META"), "isEqualToString:", objc_msgSend(v8, "tagName")))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v9 = objc_msgSend(v8, "name");
            v10 = objc_msgSend(v8, "content");
            if (v9)
            {
              if (v10)
                -[NSHTMLReader _processMetaElementWithName:content:](self, "_processMetaElementWithName:content:", v9, v10);
            }
          }
        }
      }
    }
  }
}

- (BOOL)_enterElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6 embedded:(BOOL)a7
{
  BOOL v12;

  if (objc_msgSend(CFSTR("HEAD"), "isEqualToString:", a4) && !a7)
  {
    -[NSHTMLReader _processHeadElement:](self, "_processHeadElement:", a3);
    return 0;
  }
  if (a5
    && ((objc_msgSend(CFSTR("none"), "isEqualToString:", a5) & 1) != 0
     || (objc_msgSend(CFSTR("table-column"), "isEqualToString:", a5) & 1) != 0
     || (objc_msgSend(CFSTR("table-column-group"), "isEqualToString:", a5) & 1) != 0))
  {
    return 0;
  }
  if (!-[NSHTMLReader _elementIsBlockLevel:](self, "_elementIsBlockLevel:", a3)
    || (objc_msgSend(CFSTR("BR"), "isEqualToString:", a4) & 1) != 0
    || objc_msgSend(CFSTR("table-cell"), "isEqualToString:", a5)
    && !-[NSMutableArray count](self->_textTables, "count")
    || -[NSMutableArray count](self->_textLists, "count")
    && objc_msgSend(CFSTR("block"), "isEqualToString:", a5)
    && (objc_msgSend(CFSTR("LI"), "isEqualToString:", a4) & 1) == 0
    && (objc_msgSend(CFSTR("UL"), "isEqualToString:", a4) & 1) == 0
    && !objc_msgSend(CFSTR("OL"), "isEqualToString:", a4))
  {
    return 1;
  }
  v12 = 1;
  -[NSHTMLReader _newParagraphForElement:tag:allowEmpty:suppressTrailingSpace:isEntering:](self, "_newParagraphForElement:tag:allowEmpty:suppressTrailingSpace:isEntering:", a3, a4, 0, 1, 1);
  return v12;
}

- (void)_addTableForElement:(id)a3
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  NSTextTable *v16;

  v16 = objc_alloc_init(NSTextTable);
  -[NSTextTable setNumberOfColumns:](v16, "setNumberOfColumns:", 1);
  -[NSTextTable setLayoutAlgorithm:](v16, "setLayoutAlgorithm:", 0);
  -[NSTextTable setCollapsesBorders:](v16, "setCollapsesBorders:", 0);
  -[NSTextTable setHidesEmptyCells:](v16, "setHidesEmptyCells:", 0);
  if (a3)
  {
    v5 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("border-collapse"));
    v6 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("empty-cells"));
    v7 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("table-layout"));
    v8 = 1.0;
    v9 = 1.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(a3, "cellSpacing");
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v10, "length"))
        {
          if ((objc_msgSend(v11, "hasSuffix:", CFSTR("%")) & 1) == 0)
          {
            objc_msgSend(v11, "doubleValue");
            v9 = v12;
          }
        }
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(a3, "cellPadding");
      if (v13)
      {
        v14 = v13;
        if (objc_msgSend(v13, "length"))
        {
          if ((objc_msgSend(v14, "hasSuffix:", CFSTR("%")) & 1) == 0)
          {
            objc_msgSend(v14, "doubleValue");
            v8 = v15;
          }
        }
      }
    }
    -[NSHTMLReader _fillInBlock:forElement:backgroundColor:extraMargin:extraPadding:isTable:](self, "_fillInBlock:forElement:backgroundColor:extraMargin:extraPadding:isTable:", v16, a3, 0, 1, 0.0, 0.0);
    if (objc_msgSend(CFSTR("collapse"), "isEqualToString:", v5))
    {
      -[NSTextTable setCollapsesBorders:](v16, "setCollapsesBorders:", 1);
      v9 = 0.0;
    }
    if (objc_msgSend(CFSTR("hide"), "isEqualToString:", v6))
      -[NSTextTable setHidesEmptyCells:](v16, "setHidesEmptyCells:", 1);
    if (objc_msgSend(CFSTR("fixed"), "isEqualToString:", v7))
      -[NSTextTable setLayoutAlgorithm:](v16, "setLayoutAlgorithm:", 1);
  }
  else
  {
    v9 = 1.0;
    v8 = 1.0;
  }
  -[NSMutableArray addObject:](self->_textTables, "addObject:", v16);
  -[NSMutableArray addObject:](self->_textTableSpacings, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9));
  -[NSMutableArray addObject:](self->_textTablePaddings, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8));
  -[NSMutableArray addObject:](self->_textTableRows, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0));
  -[NSMutableArray addObject:](self->_textTableRowArrays, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));

}

- (void)_addTableCellForElement:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  NSTextTableBlock *v22;
  id v23;
  uint64_t v24;
  int v25;
  void *v26;
  NSTextTableBlock *v27;

  v5 = -[NSMutableArray lastObject](self->_textTables, "lastObject");
  v6 = objc_msgSend((id)-[NSMutableArray lastObject](self->_textTableRows, "lastObject"), "integerValue");
  v7 = (void *)-[NSMutableArray lastObject](self->_textTableRowArrays, "lastObject");
  v8 = objc_msgSend(v7, "count");
  if (-[NSMutableArray count](self->_textTableRowBackgroundColors, "count"))
    v9 = (void *)-[NSMutableArray lastObject](self->_textTableRowBackgroundColors, "lastObject");
  else
    v9 = 0;
  objc_msgSend((id)-[NSMutableArray lastObject](self->_textTableSpacings, "lastObject"), "doubleValue");
  v11 = v10;
  if (objc_msgSend(v9, "isEqual:", objc_msgSend((Class)getNSColorClass_4[0](), "clearColor")))
    v12 = 0;
  else
    v12 = v9;
  v26 = v12;
  if (!v8)
  {
    v14 = 0;
    if (a3)
      goto LABEL_14;
LABEL_19:
    v19 = 1;
LABEL_25:
    v21 = 1;
    goto LABEL_26;
  }
  v13 = 0;
  v14 = 0;
  do
  {
    v15 = (void *)objc_msgSend(v7, "objectAtIndex:", v13, v26);
    if (v14 >= objc_msgSend(v15, "startingColumn"))
    {
      v16 = objc_msgSend(v15, "startingColumn");
      if (v14 < objc_msgSend(v15, "columnSpan") + v16)
      {
        v17 = objc_msgSend(v15, "startingColumn");
        v14 = objc_msgSend(v15, "columnSpan") + v17;
      }
    }
    ++v13;
  }
  while (v8 != v13);
  if (!a3)
    goto LABEL_19;
LABEL_14:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = objc_msgSend(a3, "rowSpan");
    if (v18 <= 1)
      v19 = 1;
    else
      v19 = v18;
  }
  else
  {
    v19 = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_25;
  v20 = objc_msgSend(a3, "colSpan");
  if (v20 <= 1)
    v21 = 1;
  else
    v21 = v20;
LABEL_26:
  v22 = -[NSTextTableBlock initWithTable:startingRow:rowSpan:startingColumn:columnSpan:]([NSTextTableBlock alloc], "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:", v5, v6, v19, v14, v21);
  v27 = v22;
  if (a3)
  {
    v23 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("vertical-align"));
    -[NSHTMLReader _fillInBlock:forElement:backgroundColor:extraMargin:extraPadding:isTable:](self, "_fillInBlock:forElement:backgroundColor:extraMargin:extraPadding:isTable:", v27, a3, v26, 0, v11 * 0.5, 0.0);
    if ((objc_msgSend(CFSTR("middle"), "isEqualToString:", v23) & 1) != 0)
    {
      v24 = 1;
    }
    else if ((objc_msgSend(CFSTR("bottom"), "isEqualToString:", v23) & 1) != 0)
    {
      v24 = 2;
    }
    else
    {
      if ((objc_msgSend(CFSTR("baseline"), "isEqualToString:", v23) & 1) == 0)
      {
        v25 = objc_msgSend(CFSTR("top"), "isEqualToString:", v23);
        v22 = v27;
        if (!v25)
          goto LABEL_35;
        v24 = 0;
        goto LABEL_34;
      }
      v24 = 3;
    }
    v22 = v27;
LABEL_34:
    -[NSTextBlock setVerticalAlignment:](v22, "setVerticalAlignment:", v24, v26);
    v22 = v27;
  }
LABEL_35:
  -[NSMutableArray addObject:](self->_textBlocks, "addObject:", v22, v26);
  objc_msgSend(v7, "addObject:", v27);
  objc_msgSend(v7, "sortUsingFunction:context:", _colCompare, 0);

}

- (BOOL)_processElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6
{
  _BOOL8 v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  int v33;
  BOOL v34;
  __CFString *v35;
  const __CFString *v36;
  NSTextList *v37;
  NSTextList *v38;
  __CFString *v39;
  const __CFString *v40;
  NSTextList *v41;
  NSTextList *v42;
  void *v43;
  void *v44;
  void *v45;

  v11 = -[NSHTMLReader _elementIsBlockLevel:](self, "_elementIsBlockLevel:");
  if (v11)
  {
    -[NSMutableArray removeAllObjects](self->_writingDirectionArray, "removeAllObjects");
  }
  else
  {
    v12 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("unicode-bidi"));
    if (v12)
    {
      v13 = v12;
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("embed")))
      {
        v14 = objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("direction")), "isEqualToString:", CFSTR("rtl"));
      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("bidi-override")))
          goto LABEL_11;
        if (objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("direction")), "isEqualToString:", CFSTR("rtl")))v14 = 3;
        else
          v14 = 2;
      }
      -[NSMutableArray addObject:](self->_writingDirectionArray, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14));
    }
  }
LABEL_11:
  if ((objc_msgSend(CFSTR("table"), "isEqualToString:", a5) & 1) != 0
    || !-[NSMutableArray count](self->_textTables, "count")
    && objc_msgSend(CFSTR("table-row-group"), "isEqualToString:", a5))
  {
    if (objc_msgSend(CFSTR("table-row-group"), "isEqualToString:", a5))
    {
      v15 = -[NSHTMLReader _blockLevelElementForNode:](self, "_blockLevelElementForNode:", objc_msgSend(a3, "parentNode"));
      if (objc_msgSend(CFSTR("table"), "isEqualToString:", -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v15, CFSTR("display"))))a3 = v15;
    }
    while (1)
    {
      v16 = -[NSMutableArray count](self->_textTables, "count");
      if (v16 <= -[NSMutableArray count](self->_textBlocks, "count"))
        break;
      -[NSHTMLReader _addTableCellForElement:](self, "_addTableCellForElement:", 0);
    }
    -[NSHTMLReader _addTableForElement:](self, "_addTableForElement:", a3);
    goto LABEL_19;
  }
  if (objc_msgSend(CFSTR("table-footer-group"), "isEqualToString:", a5)
    && -[NSMutableArray count](self->_textTables, "count"))
  {
    -[NSMutableDictionary setObject:forKey:](self->_textTableFooters, "setObject:forKey:", a3, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", -[NSMutableArray lastObject](self->_textTables, "lastObject")));
LABEL_26:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (objc_msgSend(CFSTR("table-row"), "isEqualToString:", a5)
    && -[NSMutableArray count](self->_textTables, "count"))
  {
    v18 = -[NSHTMLReader _colorForNode:property:](self, "_colorForNode:property:", a3, CFSTR("background-color"));
    if (!v18)
      v18 = (id)objc_msgSend((Class)getNSColorClass_4[0](), "clearColor");
    -[NSMutableArray addObject:](self->_textTableRowBackgroundColors, "addObject:", v18);
    goto LABEL_19;
  }
  if (objc_msgSend(CFSTR("table-cell"), "isEqualToString:", a5))
  {
    while (1)
    {
      v19 = -[NSMutableArray count](self->_textTables, "count");
      if (v19 >= -[NSMutableArray count](self->_textBlocks, "count") + 1)
        break;
      -[NSHTMLReader _addTableForElement:](self, "_addTableForElement:", 0);
    }
    -[NSHTMLReader _addTableCellForElement:](self, "_addTableCellForElement:", a3);
    goto LABEL_19;
  }
  if (objc_msgSend(CFSTR("IMG"), "isEqualToString:", a4))
  {
    v20 = (void *)objc_msgSend(a3, "getAttribute:", CFSTR("src"));
    if (v20)
    {
      v21 = v20;
      if (objc_msgSend(v20, "length"))
      {
        v22 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v21);
        if (v22
          || (v22 = objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithString:relativeToURL:", objc_msgSend(v21, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), self->_baseURL)) != 0)
        {
          -[NSHTMLReader _addAttachmentForElement:URL:needsParagraph:usePlaceholder:](self, "_addAttachmentForElement:URL:needsParagraph:usePlaceholder:", a3, v22, v11, 0);
        }
      }
    }
    goto LABEL_26;
  }
  if (objc_msgSend(CFSTR("OBJECT"), "isEqualToString:", a4))
  {
    v23 = (void *)objc_msgSend(a3, "getAttribute:", CFSTR("codebase"));
    v24 = (void *)objc_msgSend(a3, "getAttribute:", CFSTR("data"));
    v25 = objc_msgSend(a3, "getAttribute:", CFSTR("declare"));
    if (v24)
    {
      v26 = v25;
      if (objc_msgSend(v24, "length"))
      {
        if ((objc_msgSend(CFSTR("true"), "isEqualToString:", v26) & 1) == 0
          && (v23
           && objc_msgSend(v23, "length")
           && ((v27 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v23)) != 0
            || (v27 = objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithString:relativeToURL:", objc_msgSend(v23, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), self->_baseURL)) != 0)&& (v28 = objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithString:relativeToURL:", objc_msgSend(v24, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), v27)) != 0|| (v28 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v24)) != 0|| (v28 = objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithString:relativeToURL:",
                       objc_msgSend(v24, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet")), self->_baseURL)) != 0))
        {
          LODWORD(v11) = !-[NSHTMLReader _addAttachmentForElement:URL:needsParagraph:usePlaceholder:](self, "_addAttachmentForElement:URL:needsParagraph:usePlaceholder:", a3, v28, v11, 0);
          return v11;
        }
      }
    }
    goto LABEL_19;
  }
  if (objc_msgSend(CFSTR("FRAME"), "isEqualToString:", a4))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_26;
    v29 = objc_msgSend(a3, "contentDocument");
    if (!v29)
      goto LABEL_26;
    goto LABEL_61;
  }
  if (objc_msgSend(CFSTR("IFRAME"), "isEqualToString:", a4))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v29 = objc_msgSend(a3, "contentDocument");
      if (v29)
      {
LABEL_61:
        -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", v29, a6 + 1, 1);
        goto LABEL_26;
      }
    }
  }
  else if (objc_msgSend(CFSTR("BR"), "isEqualToString:", a4))
  {
    v30 = -[NSHTMLReader _blockLevelElementForNode:](self, "_blockLevelElementForNode:", objc_msgSend(a3, "parentNode"));
    v31 = objc_msgSend(a3, "getAttribute:", CFSTR("class"));
    v32 = (void *)objc_msgSend(v30, "tagName");
    v33 = objc_msgSend(CFSTR("Apple-interchange-newline"), "isEqualToString:", v31);
    if ((objc_msgSend(CFSTR("P"), "isEqualToString:", v32) & 1) != 0
      || (objc_msgSend(CFSTR("LI"), "isEqualToString:", v32) & 1) != 0)
    {
      v34 = 0;
    }
    else if (objc_msgSend(v32, "hasPrefix:", CFSTR("H")))
    {
      v34 = objc_msgSend(v32, "length") != 2;
    }
    else
    {
      v34 = 1;
    }
    if (v33)
    {
      *(_DWORD *)&self->_flags |= 0x20u;
    }
    else
    {
      if (!v30)
        v34 = 1;
      if (v34)
      {
        LOBYTE(v11) = 1;
        -[NSHTMLReader _newParagraphForElement:tag:allowEmpty:suppressTrailingSpace:isEntering:](self, "_newParagraphForElement:tag:allowEmpty:suppressTrailingSpace:isEntering:", a3, a4, 1, 0, 0);
        return v11;
      }
      -[NSHTMLReader _newLineForElement:](self, "_newLineForElement:", a3);
    }
  }
  else if (objc_msgSend(CFSTR("UL"), "isEqualToString:", a4))
  {
    v35 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("list-style-type"));
    if (!v35 || (v36 = v35, !-[__CFString length](v35, "length")))
      v36 = CFSTR("disc");
    v37 = [NSTextList alloc];
    v38 = -[NSTextList initWithMarkerFormat:options:](v37, "initWithMarkerFormat:options:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}"), v36), 0);
    -[NSMutableArray addObject:](self->_textLists, "addObject:", v38);

  }
  else if (objc_msgSend(CFSTR("OL"), "isEqualToString:", a4))
  {
    v39 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("list-style-type"));
    if (!v39 || (v40 = v39, !-[__CFString length](v39, "length")))
      v40 = CFSTR("decimal");
    v41 = [NSTextList alloc];
    v42 = -[NSTextList initWithMarkerFormat:options:](v41, "initWithMarkerFormat:options:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@}."), v40), 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSTextList setStartingItemNumber:](v42, "setStartingItemNumber:", (int)objc_msgSend(a3, "start"));
    -[NSMutableArray addObject:](self->_textLists, "addObject:", v42);

  }
  else
  {
    if (objc_msgSend(CFSTR("Q"), "isEqualToString:", a4))
    {
      ++self->_quoteLevel;
      LOBYTE(v11) = 1;
      -[NSHTMLReader _addQuoteForElement:opening:level:](self, "_addQuoteForElement:opening:level:", a3, 1);
      return v11;
    }
    if (objc_msgSend(CFSTR("INPUT"), "isEqualToString:", a4))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v11) = 1;
        if (objc_msgSend(CFSTR("text"), "compare:options:", objc_msgSend(a3, "type"), 1))
          return v11;
        v43 = (void *)objc_msgSend(a3, "value");
        if (v43)
        {
          v44 = v43;
          if (objc_msgSend(v43, "length"))
            -[NSHTMLReader _addValue:forElement:](self, "_addValue:forElement:", v44, a3);
        }
      }
    }
    else if (objc_msgSend(CFSTR("TEXTAREA"), "isEqualToString:", a4))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v45 = (void *)objc_msgSend(a3, "value");
        v11 = (_BOOL8)v45;
        if (!v45)
          return v11;
        if (objc_msgSend(v45, "length"))
          -[NSHTMLReader _addValue:forElement:](self, "_addValue:forElement:", v11, a3);
      }
      goto LABEL_26;
    }
  }
LABEL_19:
  LOBYTE(v11) = 1;
  return v11;
}

- (void)_addMarkersToList:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v17;
  double v18;
  NSUInteger v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  unint64_t domRangeStartIndex;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  double v33;
  _BOOL4 v35;
  uint64_t v37;
  NSTextTab *v38;
  uint64_t v39;
  NSTextTab *v40;
  NSTextTab *v41;
  id v42;
  uint64_t v43;
  NSUInteger v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;

  if (self->_includesTextListMarkers)
  {
    length = a4.length;
    location = a4.location;
    v6 = a3;
    v8 = objc_msgSend(a3, "startingItemNumber");
    v46 = (void *)-[NSMutableAttributedString string](self->_attrStr, "string");
    v47 = 0;
    v48 = 0;
    v9 = -[NSMutableAttributedString length](self->_attrStr, "length");
    if (length)
    {
      v10 = v9;
      v11 = v9 - location;
      if (v9 > location)
      {
        v12 = (void *)-[NSMutableAttributedString attribute:atIndex:effectiveRange:](self->_attrStr, "attribute:atIndex:effectiveRange:");
        if (v12)
        {
          if (location + length <= v10)
            v11 = length;
          v13 = (void *)objc_msgSend(v12, "textLists");
          v14 = objc_msgSend(v13, "indexOfObject:", v6);
          if (v13)
            v15 = v14 == 0x7FFFFFFFFFFFFFFFLL;
          else
            v15 = 1;
          if (!v15 && location < v11 + location)
          {
            v17 = v14 + 1;
            v18 = (double)(unint64_t)(v14 + 1) * 36.0;
            v19 = location;
            v44 = location;
            v42 = 0;
            v43 = v14 + 1;
            do
            {
              v20 = objc_msgSend(v46, "paragraphRangeForRange:", v19, 0);
              v22 = v21;
              v23 = (void *)-[NSMutableAttributedString attribute:atIndex:effectiveRange:](self->_attrStr, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v19, &v47);
              if (objc_msgSend((id)objc_msgSend(v23, "textLists"), "count") == v17)
              {
                v24 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@\t"), objc_msgSend(v6, "markerForItemNumber:", v8));
                v25 = objc_msgSend(v24, "length");
                v45 = v8;
                if ((*(_BYTE *)&self->_flags & 0x18) == 0)
                  v42 = +[NSTextList _standardMarkerAttributesForAttributes:](NSTextList, "_standardMarkerAttributesForAttributes:", -[NSMutableAttributedString attributesAtIndex:effectiveRange:](self->_attrStr, "attributesAtIndex:effectiveRange:", v20, 0));
                -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v20, 0, v24);
                if ((*(_BYTE *)&self->_flags & 0x18) == 0)
                  -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v42, v20, v25);
                v26 = v6;
                domRangeStartIndex = self->_domRangeStartIndex;
                if (v20 < domRangeStartIndex)
                  self->_domRangeStartIndex = domRangeStartIndex + v25;
                v28 = (void *)objc_msgSend(v23, "mutableCopy");
                objc_msgSend(v28, "setFirstLineHeadIndent:", 0.0);
                objc_msgSend(v28, "setHeadIndent:", v18);
                v29 = objc_msgSend((id)objc_msgSend(v28, "tabStops"), "count");
                if (v29)
                {
                  v30 = v29;
                  do
                  {
                    v31 = 0;
                    do
                    {
                      v32 = (void *)objc_msgSend((id)objc_msgSend(v28, "tabStops"), "objectAtIndex:", v31);
                      objc_msgSend(v32, "location");
                      ++v31;
                      v35 = v33 > v18 || v32 == 0;
                    }
                    while (v35 && v31 < v30);
                    if (v35)
                      break;
                    objc_msgSend(v28, "removeTabStop:", v32);
                    v30 = objc_msgSend((id)objc_msgSend(v28, "tabStops"), "count");
                  }
                  while (v30);
                }
                v37 = v25 + v22;
                v38 = [NSTextTab alloc];
                v39 = MEMORY[0x1E0C9AA70];
                v40 = -[NSTextTab initWithTextAlignment:location:options:](v38, "initWithTextAlignment:location:options:", 0, MEMORY[0x1E0C9AA70], v18 + -25.0);
                objc_msgSend(v28, "addTabStop:", v40);

                v41 = -[NSTextTab initWithTextAlignment:location:options:]([NSTextTab alloc], "initWithTextAlignment:location:options:", 4, v39, v18);
                objc_msgSend(v28, "addTabStop:", v41);

                if ((*(_BYTE *)&self->_flags & 0x18) == 0)
                  -[NSMutableAttributedString addAttribute:value:range:](self->_attrStr, "addAttribute:value:range:", CFSTR("NSParagraphStyle"), v28, v20, v37);
                v8 = v45 + 1;
                v11 += v25;

                v19 = v37 + v20;
                v6 = v26;
                v17 = v43;
                location = v44;
              }
              else
              {
                v19 = v48 + v47;
              }
            }
            while (v19 < v11 + location);
          }
        }
      }
    }
  }
}

- (void)_exitElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6 startIndex:(unint64_t)a7
{
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableArray *textTableRowArrays;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  NSMutableString *v48;
  NSMutableString *v49;
  NSMutableString *v50;
  NSMutableString *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t domRangeStartIndex;

  v13 = -[NSMutableAttributedString length](self->_attrStr, "length");
  if (v13 != a7)
  {
    if (objc_msgSend(CFSTR("A"), "isEqualToString:", a4))
    {
      v14 = (void *)objc_msgSend(a3, "getAttribute:", CFSTR("href"));
      v15 = objc_msgSend(v14, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
      if (v14)
      {
        v16 = (void *)v15;
        if (objc_msgSend(v14, "length"))
        {
          if (v16 && objc_msgSend(v16, "length") && (objc_msgSend(v16, "hasPrefix:", CFSTR("#")) & 1) == 0)
          {
            v17 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v14);
            if (!v17)
            {
              v17 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v16);
              if (!v17)
                v17 = objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithString:relativeToURL:", v16, self->_baseURL);
            }
            if ((*(_BYTE *)&self->_flags & 0x18) == 0)
            {
              if (v17)
                v18 = (void *)v17;
              else
                v18 = v14;
              -[NSMutableAttributedString addAttribute:value:range:](self->_attrStr, "addAttribute:value:range:", CFSTR("NSLink"), v18, a7, v13 - a7);
            }
          }
        }
      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0 || !-[NSHTMLReader _elementIsBlockLevel:](self, "_elementIsBlockLevel:", a3))
  {
    if (-[NSMutableArray count](self->_writingDirectionArray, "count"))
    {
      v19 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("unicode-bidi"));
      if (v19)
      {
        v20 = v19;
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("embed")) & 1) != 0
          || objc_msgSend(v20, "isEqualToString:", CFSTR("bidi-override")))
        {
          -[NSMutableArray removeLastObject](self->_writingDirectionArray, "removeLastObject");
        }
      }
    }
  }
  else
  {
    -[NSMutableArray removeAllObjects](self->_writingDirectionArray, "removeAllObjects");
    if (objc_msgSend(CFSTR("table-cell"), "isEqualToString:", a5)
      && !-[NSMutableArray count](self->_textBlocks, "count"))
    {
      -[NSHTMLReader _newTabForElement:](self, "_newTabForElement:", a3);
    }
    else if (!-[NSMutableArray count](self->_textLists, "count")
           || !objc_msgSend(CFSTR("block"), "isEqualToString:", a5)
           || (objc_msgSend(CFSTR("LI"), "isEqualToString:", a4) & 1) != 0
           || (objc_msgSend(CFSTR("UL"), "isEqualToString:", a4) & 1) != 0
           || (objc_msgSend(CFSTR("OL"), "isEqualToString:", a4) & 1) != 0)
    {
      -[NSHTMLReader _newParagraphForElement:tag:allowEmpty:suppressTrailingSpace:isEntering:](self, "_newParagraphForElement:tag:allowEmpty:suppressTrailingSpace:isEntering:", a3, a4, v13 == a7, 0, 0);
    }
    else
    {
      -[NSHTMLReader _newLineForElement:](self, "_newLineForElement:", a3);
    }
  }
  v21 = -[NSMutableAttributedString length](self->_attrStr, "length");
  if (objc_msgSend(CFSTR("table"), "isEqualToString:", a5)
    && -[NSMutableArray count](self->_textTables, "count"))
  {
    v22 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", -[NSMutableArray lastObject](self->_textTables, "lastObject"));
    v23 = -[NSMutableDictionary objectForKey:](self->_textTableFooters, "objectForKey:", v22);
    while (1)
    {
      v24 = -[NSMutableArray count](self->_textTables, "count");
      if (v24 >= -[NSMutableArray count](self->_textBlocks, "count") + 1)
        break;
      -[NSMutableArray removeLastObject](self->_textBlocks, "removeLastObject");
    }
    if (v23)
    {
      -[NSHTMLReader _traverseFooterNode:depth:](self, "_traverseFooterNode:depth:", v23, a6 + 1);
      -[NSMutableDictionary removeObjectForKey:](self->_textTableFooters, "removeObjectForKey:", v22);
    }
    -[NSMutableArray removeLastObject](self->_textTables, "removeLastObject");
    -[NSMutableArray removeLastObject](self->_textTableSpacings, "removeLastObject");
    -[NSMutableArray removeLastObject](self->_textTablePaddings, "removeLastObject");
    -[NSMutableArray removeLastObject](self->_textTableRows, "removeLastObject");
    textTableRowArrays = self->_textTableRowArrays;
    goto LABEL_71;
  }
  if (objc_msgSend(CFSTR("table-row"), "isEqualToString:", a5)
    && -[NSMutableArray count](self->_textTables, "count"))
  {
    v25 = (void *)-[NSMutableArray lastObject](self->_textTables, "lastObject");
    v26 = (void *)-[NSMutableArray lastObject](self->_textTableRowArrays, "lastObject");
    v27 = objc_msgSend(v25, "numberOfColumns");
    v28 = objc_msgSend((id)-[NSMutableArray lastObject](self->_textTableRows, "lastObject"), "integerValue");
    do
    {
      ++v28;
      v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v30 = objc_msgSend(v26, "count");
      if (v30)
      {
        v31 = v30;
        for (i = 0; i != v31; ++i)
        {
          v33 = (void *)objc_msgSend(v26, "objectAtIndex:", i);
          v34 = objc_msgSend(v33, "startingColumn");
          if (objc_msgSend(v33, "columnSpan") + v34 > v27)
          {
            v35 = objc_msgSend(v33, "startingColumn");
            v27 = objc_msgSend(v33, "columnSpan") + v35;
          }
          v36 = objc_msgSend(v33, "startingRow");
          if (objc_msgSend(v33, "rowSpan") + v36 > v28)
            objc_msgSend(v29, "addObject:", v33);
        }
      }
      v37 = objc_msgSend(v29, "count");
      if (v37)
      {
        v38 = v37;
        v39 = 0;
        for (j = 0; j != v38; ++j)
        {
          v41 = (void *)objc_msgSend(v29, "objectAtIndex:", j);
          if (v39 >= objc_msgSend(v41, "startingColumn"))
          {
            v42 = objc_msgSend(v41, "startingColumn");
            if (v39 < objc_msgSend(v41, "columnSpan") + v42)
            {
              v43 = objc_msgSend(v41, "startingColumn");
              v39 = objc_msgSend(v41, "columnSpan") + v43;
            }
          }
        }
      }
      else
      {
        v39 = 0;
      }
      v26 = v29;
    }
    while (v39 >= v27);
    if (v27 > (unint64_t)objc_msgSend(v25, "numberOfColumns"))
      objc_msgSend(v25, "setNumberOfColumns:", v27);
    -[NSMutableArray removeLastObject](self->_textTableRows, "removeLastObject");
    -[NSMutableArray addObject:](self->_textTableRows, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28));
    -[NSMutableArray removeLastObject](self->_textTableRowArrays, "removeLastObject");
    -[NSMutableArray addObject:](self->_textTableRowArrays, "addObject:", v29);
    if (-[NSMutableArray count](self->_textTableRowBackgroundColors, "count"))
    {
      textTableRowArrays = self->_textTableRowBackgroundColors;
LABEL_71:
      -[NSMutableArray removeLastObject](textTableRowArrays, "removeLastObject");
      return;
    }
    return;
  }
  if (objc_msgSend(CFSTR("table-cell"), "isEqualToString:", a5)
    && -[NSMutableArray count](self->_textBlocks, "count"))
  {
    while (1)
    {
      v46 = -[NSMutableArray count](self->_textTables, "count");
      if (v46 <= -[NSMutableArray count](self->_textBlocks, "count"))
        break;
      -[NSMutableArray removeLastObject](self->_textTables, "removeLastObject");
      -[NSMutableArray removeLastObject](self->_textTableSpacings, "removeLastObject");
      -[NSMutableArray removeLastObject](self->_textTablePaddings, "removeLastObject");
      -[NSMutableArray removeLastObject](self->_textTableRows, "removeLastObject");
      -[NSMutableArray removeLastObject](self->_textTableRowArrays, "removeLastObject");
    }
    textTableRowArrays = self->_textBlocks;
    goto LABEL_71;
  }
  v45 = v21 - a7;
  if (((objc_msgSend(CFSTR("UL"), "isEqualToString:", a4) & 1) != 0
     || objc_msgSend(CFSTR("OL"), "isEqualToString:", a4))
    && -[NSMutableArray count](self->_textLists, "count"))
  {
    -[NSHTMLReader _addMarkersToList:range:](self, "_addMarkersToList:range:", -[NSMutableArray lastObject](self->_textLists, "lastObject"), a7, v21 - a7);
    textTableRowArrays = self->_textLists;
    goto LABEL_71;
  }
  if (objc_msgSend(CFSTR("Q"), "isEqualToString:", a4))
  {
    --self->_quoteLevel;
    -[NSHTMLReader _addQuoteForElement:opening:level:](self, "_addQuoteForElement:opening:level:", a3, 0);
    return;
  }
  if (objc_msgSend(CFSTR("SPAN"), "isEqualToString:", a4))
  {
    v47 = objc_msgSend(a3, "getAttribute:", CFSTR("class"));
    if (objc_msgSend(CFSTR("Apple-converted-space"), "isEqualToString:", v47))
    {
      v48 = -[NSMutableAttributedString mutableString](self->_attrStr, "mutableString");
      if (v21 > a7)
      {
        v49 = v48;
        do
        {
          if (-[NSMutableString characterAtIndex:](v49, "characterAtIndex:", a7) == 160)
            -[NSMutableString replaceCharactersInRange:withString:](v49, "replaceCharactersInRange:withString:", a7, 1, CFSTR(" "));
          ++a7;
        }
        while (v21 != a7);
      }
      return;
    }
    if (!objc_msgSend(CFSTR("Apple-converted-tab"), "isEqualToString:", v47))
      return;
    v50 = -[NSMutableAttributedString mutableString](self->_attrStr, "mutableString");
    if (v21 <= a7)
      return;
    v51 = v50;
    v52 = 0;
    v53 = a7;
    while (1)
    {
      if ((-[NSMutableString characterAtIndex:](v51, "characterAtIndex:", v53) & 0xFFFFFF7F) == 0x20)
      {
        v54 = v52 + 1;
        if ((unint64_t)(v52 + 1) <= 3 && v53 + 1 < v21)
          goto LABEL_106;
        v55 = v53 - v52++;
        if (!v54)
          goto LABEL_106;
      }
      else
      {
        if (v52)
          v54 = v52;
        else
          v54 = 0;
        if (v52)
          v55 = v53 - v52;
        else
          v55 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v52)
          v52 = 0;
        if (!v52)
          goto LABEL_106;
      }
      -[NSMutableString replaceCharactersInRange:withString:](v51, "replaceCharactersInRange:withString:", v55, v52, CFSTR("\t"));
      v45 -= v52 - 1;
      v53 -= v52 - 1;
      domRangeStartIndex = self->_domRangeStartIndex;
      if (v55 + v52 <= domRangeStartIndex)
        break;
      if (v55 < domRangeStartIndex)
        goto LABEL_105;
      v54 = 0;
LABEL_106:
      ++v53;
      v21 = v45 + a7;
      v52 = v54;
      if (v53 >= v45 + a7)
        return;
    }
    v55 = domRangeStartIndex - (v52 - 1);
LABEL_105:
    v54 = 0;
    self->_domRangeStartIndex = v55;
    goto LABEL_106;
  }
}

- (void)_processText:(id)a3
{
  DOMNode *v3;
  __CFString *v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  $0C7FF0FC465E944347A24E3ECE87D1B8 *p_flags;
  BOOL v11;
  id v12;
  id v13;
  DOMRange *domRange;
  unint64_t v15;
  int v16;
  uint64_t v17;
  __CFString *Mutable;
  uint64_t v19;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  UniChar v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  uint64_t v38;
  uint64_t v39;
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
  uint64_t v47;
  $0C7FF0FC465E944347A24E3ECE87D1B8 *v48;
  NSHTMLReader *v49;
  int v50;
  UniChar buffer[8];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CFStringRef v59;
  const UniChar *v60;
  const char *v61;
  uint64_t v62;
  int64_t v63;
  int64_t v64;
  int64_t v65;
  UniChar chars[256];
  uint64_t v67;
  CFRange v68;

  v3 = (DOMNode *)a3;
  v67 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)objc_msgSend(a3, "data");
  v6 = -[NSMutableAttributedString length](self->_attrStr, "length");
  v7 = -[__CFString length](v5, "length");
  if (!v6)
  {
    p_flags = &self->_flags;
    goto LABEL_14;
  }
  v8 = objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v6 - 1);
  p_flags = &self->_flags;
  if ((*(_BYTE *)&self->_flags & (v8 == 32)) != 0)
  {
LABEL_14:
    v50 = 1;
    goto LABEL_15;
  }
  v50 = 1;
  v11 = (v8 > 0xD || ((1 << v8) & 0x3600) == 0) && v8 - 8232 >= 2;
  if (v11 && v8 != 133)
    v50 = 0;
LABEL_15:
  v12 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v3, CFSTR("white-space"));
  v13 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v3, CFSTR("text-transform"));
  domRange = self->_domRange;
  if (!domRange)
    goto LABEL_23;
  if (-[DOMRange startContainer](domRange, "startContainer") == v3)
  {
    v15 = -[DOMRange startOffset](self->_domRange, "startOffset");
    self->_domRangeStartIndex = -[NSMutableAttributedString length](self->_attrStr, "length");
    *(_DWORD *)&self->_flags |= 2u;
  }
  else
  {
    v15 = 0;
  }
  if (-[DOMRange endContainer](self->_domRange, "endContainer") != v3)
  {
    if (v15)
      goto LABEL_21;
LABEL_70:
    if (v7 >= -[__CFString length](v5, "length"))
      goto LABEL_23;
    goto LABEL_22;
  }
  v7 = -[DOMRange endOffset](self->_domRange, "endOffset");
  *(_DWORD *)&self->_flags |= 4u;
  if (!v15)
    goto LABEL_70;
LABEL_21:
  if (v7 >= v15)
LABEL_22:
    v5 = (__CFString *)-[__CFString substringWithRange:](v5, "substringWithRange:", v15, v7 - v15);
LABEL_23:
  if (objc_msgSend(v12, "hasPrefix:", CFSTR("pre")))
  {
    if (v6
      && -[__CFString length](v5, "length")
      && (*(_BYTE *)p_flags & 1) != 0
      && ((v45 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", 0), v45 <= 0xD)
       && ((1 << v45) & 0x3400) != 0
       || v45 - 8232 < 2
       || v45 == 133))
    {
      v16 = 0;
      Mutable = 0;
      --v6;
      v17 = 1;
    }
    else
    {
      v16 = 0;
      v17 = 0;
      Mutable = 0;
    }
    goto LABEL_74;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  *(_OWORD *)buffer = 0u;
  v52 = 0u;
  v19 = -[__CFString length](v5, "length");
  Mutable = CFStringCreateMutable(0, 0);
  v59 = v5;
  v62 = 0;
  v63 = v19;
  CharactersPtr = CFStringGetCharactersPtr(v5);
  CStringPtr = 0;
  v60 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  v64 = 0;
  v65 = 0;
  v61 = CStringPtr;
  if (!v19)
  {
    v16 = 0;
    goto LABEL_73;
  }
  v49 = self;
  v46 = v13;
  v47 = v6;
  v48 = p_flags;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  LOBYTE(v16) = 0;
  v25 = 64;
  v26 = 1;
  do
  {
    if ((unint64_t)v24 >= 4)
      v27 = 4;
    else
      v27 = v24;
    if (v24 < 0 || (v28 = v63, v63 <= v24))
    {
      v29 = 0;
    }
    else
    {
      if (v60)
      {
        v29 = v60[v24 + v62];
      }
      else if (v61)
      {
        v29 = v61[v62 + v24];
      }
      else
      {
        if (v65 <= v24 || (v30 = v64, v64 > v24))
        {
          v31 = -v27;
          v32 = v27 + v22;
          v33 = v25 - v27;
          v34 = v24 + v31;
          v35 = v34 + 64;
          if (v34 + 64 >= v63)
            v35 = v63;
          v64 = v34;
          v65 = v35;
          if (v63 >= v33)
            v28 = v33;
          v68.length = v28 + v32;
          v68.location = v34 + v62;
          CFStringGetCharacters(v59, v68, buffer);
          v30 = v64;
        }
        v29 = buffer[v24 - v30];
      }
      if (v29 <= 0x20u && ((1 << v29) & 0x100003600) != 0 || v29 == 8203)
      {
        v16 = v50 & v26 ^ 1;
        goto LABEL_64;
      }
    }
    if ((v16 & 1) != 0)
      chars[v23++] = 32;
    chars[v23++] = v29;
    if (v23 >= 0xFF)
    {
      CFStringAppendCharacters(Mutable, chars, v23);
      v16 = 0;
      v26 = 0;
      v23 = 0;
    }
    else
    {
      v16 = 0;
      v26 = 0;
    }
LABEL_64:
    ++v24;
    --v22;
    ++v25;
  }
  while (v19 != v24);
  if (v16)
    chars[v23++] = 32;
  p_flags = v48;
  self = v49;
  v13 = v46;
  v6 = v47;
  if (v23)
    CFStringAppendCharacters(Mutable, chars, v23);
LABEL_73:
  v17 = 0;
  v5 = Mutable;
LABEL_74:
  if (-[__CFString length](v5, "length", v46, v47, v48, v49))
  {
    if (objc_msgSend(CFSTR("capitalize"), "isEqualToString:", v13))
    {
      v38 = -[__CFString capitalizedString](v5, "capitalizedString");
      goto LABEL_81;
    }
    if (objc_msgSend(CFSTR("uppercase"), "isEqualToString:", v13))
    {
      v38 = -[__CFString uppercaseString](v5, "uppercaseString");
      goto LABEL_81;
    }
    if (objc_msgSend(CFSTR("lowercase"), "isEqualToString:", v13))
    {
      v38 = -[__CFString lowercaseString](v5, "lowercaseString");
LABEL_81:
      v5 = (__CFString *)v38;
    }
    -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v6, v17, v5);
    v39 = -[__CFString length](v5, "length");
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
      v41 = v39;
      v42 = 0;
      if (v3)
      {
        do
        {
          if (-[DOMNode nodeType](v3, "nodeType") == 1)
          {
            v43 = (void *)objc_msgSend(-[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", v3), "mutableCopy");
            v44 = v43;
            if (v42)
            {
              objc_msgSend(v43, "addEntriesFromDictionary:", v42);

            }
            v42 = v44;
          }
          v3 = -[DOMNode parentNode](v3, "parentNode");
        }
        while (v3);
        flags = *p_flags;
      }
      if ((*(_BYTE *)&flags & 0x10) == 0 && v41)
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v42, v6, v41);

      flags = *p_flags;
    }
    *p_flags = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&flags & 0xFFFFFFFE | v16);
  }
  if (Mutable)
    CFRelease(Mutable);
}

- (void)_traverseNode:(id)a3 depth:(int64_t)a4 embedded:(BOOL)a5
{
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags;
  _BOOL8 v6;
  NSMutableArray *domStartAncestors;
  int v11;
  uint64_t v12;
  DOMRange *domRange;
  DOMNode *v14;
  _BOOL4 v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  BOOL v22;
  char v23;
  int v24;
  unint64_t v25;
  $0C7FF0FC465E944347A24E3ECE87D1B8 v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v32;
  char v33;
  int v34;
  $0C7FF0FC465E944347A24E3ECE87D1B8 v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  id v39;
  id v40;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
    v6 = a5;
    if ((*(_BYTE *)&flags & 2) != 0
      || !self->_domRange
      || (domStartAncestors = self->_domStartAncestors) == 0
      || -[NSMutableArray containsObject:](domStartAncestors, "containsObject:", a3))
    {
      v11 = objc_msgSend(a3, "nodeType");
      v40 = -[NSHTMLReader _childrenForNode:](self, "_childrenForNode:", a3);
      v12 = objc_msgSend(v40, "count");
      domRange = self->_domRange;
      if (domRange)
      {
        v14 = -[DOMRange startContainer](domRange, "startContainer");
        v15 = v14 == a3;
        if (v14 == a3)
        {
          v16 = -[DOMRange startOffset](self->_domRange, "startOffset");
          *(_DWORD *)&self->_flags |= 2u;
        }
        else
        {
          v16 = 0;
        }
        if (-[DOMRange endContainer](self->_domRange, "endContainer") == a3)
        {
          v18 = -[DOMRange endOffset](self->_domRange, "endOffset");
          v17 = 1;
LABEL_14:
          if ((v11 & 0xFFFFFFFD) == 9)
          {
            v19 = 0;
            v20 = a4 + 1;
            do
            {
              if (v12 == v19)
                break;
              if (v16 == v19 && v15)
                self->_domRangeStartIndex = -[NSMutableAttributedString length](self->_attrStr, "length");
              v22 = v16 > v19 && v15;
              if (v18 <= v19)
                v23 = v17;
              else
                v23 = 0;
              if (!v22 && (v23 & 1) == 0)
                -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", objc_msgSend(v40, "objectAtIndex:", v19), v20, v6);
              if (++v19 >= v18)
                v24 = v17;
              else
                v24 = 0;
              if (v24 == 1)
                *(_DWORD *)&self->_flags |= 4u;
              if (self->_thumbnailLimit <= 0)
              {
                v26 = self->_flags;
              }
              else
              {
                v25 = -[NSMutableAttributedString length](self->_attrStr, "length");
                v26 = self->_flags;
                if (v25 >= self->_thumbnailLimit)
                {
                  v26 = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&v26 | 4);
                  self->_flags = v26;
                }
              }
            }
            while ((*(_BYTE *)&v26 & 4) == 0);
LABEL_79:
            if (v17)
              *(_DWORD *)&self->_flags |= 4u;
            return;
          }
          if (v11 != 1)
          {
            if ((v11 - 3) <= 1)
              -[NSHTMLReader _processText:](self, "_processText:", a3);
            goto LABEL_79;
          }
          v38 = objc_msgSend(a3, "tagName");
          v39 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("display"));
          v27 = -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, CFSTR("float"));
          if (!v27
            || (v28 = v27, (objc_msgSend(CFSTR("left"), "isEqualToString:", v27) & 1) == 0)
            && (objc_msgSend(CFSTR("right"), "isEqualToString:", v28) & 1) == 0)
          {
            if (!v39)
            {
              v29 = 0;
              goto LABEL_54;
            }
            if ((objc_msgSend(CFSTR("block"), "isEqualToString:", v39) & 1) == 0
              && (objc_msgSend(CFSTR("list-item"), "isEqualToString:", v39) & 1) == 0)
            {
              v29 = objc_msgSend(v39, "hasPrefix:", CFSTR("table"));
              goto LABEL_54;
            }
          }
          v29 = 1;
LABEL_54:
          -[NSMutableDictionary setObject:forKey:](self->_elementIsBlockLevel, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29), a3);
          if (-[NSHTMLReader _enterElement:tag:display:depth:embedded:](self, "_enterElement:tag:display:depth:embedded:", a3, v38, v39, a4, v6))
          {
            v36 = -[NSMutableAttributedString length](self->_attrStr, "length");
            if (-[NSHTMLReader _processElement:tag:display:depth:](self, "_processElement:tag:display:depth:", a3, v38, v39, a4))
            {
              v37 = v6;
              v30 = 0;
              do
              {
                if (v12 == v30)
                  break;
                if (v16 == v30 && v15)
                  self->_domRangeStartIndex = -[NSMutableAttributedString length](self->_attrStr, "length");
                v32 = v16 > v30 && v15;
                if (v18 <= v30)
                  v33 = v17;
                else
                  v33 = 0;
                if (!v32 && (v33 & 1) == 0)
                  -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", objc_msgSend(v40, "objectAtIndex:", v30), a4 + 1, v37);
                if (++v30 >= v18)
                  v34 = v17;
                else
                  v34 = 0;
                v35 = self->_flags;
                if (v34 == 1)
                {
                  v35 = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&v35 | 4);
                  self->_flags = v35;
                }
              }
              while ((*(_BYTE *)&v35 & 4) == 0);
              -[NSHTMLReader _exitElement:tag:display:depth:startIndex:](self, "_exitElement:tag:display:depth:startIndex:", a3, v38, v39, a4, v36);
            }
          }
          goto LABEL_79;
        }
      }
      else
      {
        v16 = 0;
        v15 = 0;
      }
      v17 = 0;
      v18 = v12;
      goto LABEL_14;
    }
  }
}

- (void)_traverseFooterNode:(id)a3 depth:(int64_t)a4
{
  id v7;
  uint64_t v8;
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags;
  uint64_t v10;
  DOMRange *domRange;
  DOMNode *v12;
  _BOOL4 v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  BOOL v21;
  char v22;
  int v23;
  $0C7FF0FC465E944347A24E3ECE87D1B8 v24;
  uint64_t v25;
  int64_t v26;

  v7 = -[NSHTMLReader _childrenForNode:](self, "_childrenForNode:");
  v8 = objc_msgSend(v7, "count");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    return;
  v10 = v8;
  domRange = self->_domRange;
  if ((*(_BYTE *)&flags & 2) == 0 && domRange)
  {
    if (!self->_domStartAncestors)
      goto LABEL_8;
    if (!-[NSMutableArray containsObject:](self->_domStartAncestors, "containsObject:", a3))
      return;
    domRange = self->_domRange;
  }
  if (!domRange)
  {
    v14 = 0;
    v13 = 0;
LABEL_13:
    v15 = 0;
    v16 = v10;
    goto LABEL_15;
  }
LABEL_8:
  v12 = -[DOMRange startContainer](domRange, "startContainer");
  v13 = v12 == a3;
  if (v12 == a3)
  {
    v14 = -[DOMRange startOffset](self->_domRange, "startOffset");
    *(_DWORD *)&self->_flags |= 2u;
  }
  else
  {
    v14 = 0;
  }
  if (-[DOMRange endContainer](self->_domRange, "endContainer") != a3)
    goto LABEL_13;
  v16 = -[DOMRange endOffset](self->_domRange, "endOffset");
  v15 = 1;
LABEL_15:
  if (-[NSHTMLReader _enterElement:tag:display:depth:embedded:](self, "_enterElement:tag:display:depth:embedded:", a3, CFSTR("TBODY"), CFSTR("table-row-group"), a4, 1))
  {
    v17 = -[NSMutableAttributedString length](self->_attrStr, "length");
    if (-[NSHTMLReader _processElement:tag:display:depth:](self, "_processElement:tag:display:depth:", a3, CFSTR("TBODY"), CFSTR("table-row-group"), a4))
    {
      v25 = v17;
      v26 = a4;
      v18 = 0;
      v19 = a4 + 1;
      do
      {
        if (v10 == v18)
          break;
        if (v14 == v18 && v13)
          self->_domRangeStartIndex = -[NSMutableAttributedString length](self->_attrStr, "length");
        v21 = v14 > v18 && v13;
        if (v16 <= v18)
          v22 = v15;
        else
          v22 = 0;
        if (!v21 && (v22 & 1) == 0)
          -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", objc_msgSend(v7, "objectAtIndex:", v18), v19, 1);
        v23 = ++v18 >= v16 ? v15 : 0;
        v24 = self->_flags;
        if (v23 == 1)
        {
          v24 = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&v24 | 4);
          self->_flags = v24;
        }
      }
      while ((*(_BYTE *)&v24 & 4) == 0);
      -[NSHTMLReader _exitElement:tag:display:depth:startIndex:](self, "_exitElement:tag:display:depth:startIndex:", a3, CFSTR("TBODY"), CFSTR("table-row-group"), v26, v25, v25, v26);
    }
  }
  if (v15)
    *(_DWORD *)&self->_flags |= 4u;
}

- (void)_parseNode:(id)a3
{
  -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", a3, 0, 0);
}

- (void)_adjustTrailingNewline
{
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  BOOL v6;

  v3 = -[NSMutableAttributedString length](self->_attrStr, "length");
  if (!v3
    || ((v4 = objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v3 - 1), v4 >> 1 != 4116)? (v5 = v4 == 10): (v5 = 1), !v5 ? (v6 = v4 == 13) : (v6 = 1), !v6 && v4 != 133))
  {
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v3, 0, CFSTR("\n"));
  }
}

- (BOOL)_sanitizeWebArchiveArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(a3);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !-[NSHTMLReader _sanitizeWebArchiveDictionary:](self, "_sanitizeWebArchiveDictionary:", v10))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || !-[NSHTMLReader _sanitizeWebArchiveArray:](self, "_sanitizeWebArchiveArray:", v10))
        {
          continue;
        }
      }
      v7 = 1;
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v6);
  return v7;
}

- (BOOL)_sanitizeWebArchiveDictionary:(id)a3
{
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("WebResourceResponse"));
  v6 = v5 != 0;
  if (v5)
    objc_msgSend(a3, "removeObjectForKey:", CFSTR("WebResourceResponse"));
  v7 = (void *)objc_msgSend(a3, "allKeys");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && -[NSHTMLReader _sanitizeWebArchiveDictionary:](self, "_sanitizeWebArchiveDictionary:", v12)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && -[NSHTMLReader _sanitizeWebArchiveArray:](self, "_sanitizeWebArchiveArray:", v12))
        {
          v6 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return v6;
}

- (id)_createWebArchiveForData:(id)a3
{
  objc_class *v5;
  objc_class *v6;
  void *v7;
  id result;

  v5 = -[NSHTMLReader _webArchiveClass](self, "_webArchiveClass");
  if (!a3)
    return 0;
  v6 = v5;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 1, 0, 0);
  if (!v7)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (-[NSHTMLReader _sanitizeWebArchiveDictionary:](self, "_sanitizeWebArchiveDictionary:", v7))
  {
    a3 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, 0);
    if (!a3)
      return 0;
    return (id)objc_msgSend([v6 alloc], "initWithData:", a3);
  }
  result = (id)objc_msgSend(v7, "objectForKey:", CFSTR("WebMainResource"));
  if (result)
    return (id)objc_msgSend([v6 alloc], "initWithData:", a3);
  return result;
}

- (void)_loadUsingWebKit
{
  objc_class *v4;
  id v5;
  CFStringRef v6;
  id v7;
  id v8;
  uint64_t v9;
  NSUInteger v10;
  NSData *data;
  unint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  BOOL v20;
  size_t v21;
  const char *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  WebView *v26;
  const __CFString *v27;
  WebFrame *v28;
  NSHTMLWebDelegate *v29;
  NSHTMLWebDelegate *v30;
  NSHTMLWebDelegate *v31;
  int v32;
  unint64_t v33;
  CFStringEncoding v34;
  double textSizeMultiplier;
  double v36;
  double v37;
  double v38;
  WebFrame *v39;
  void *v40;
  double v41;
  WebDataSource *v42;
  uint64_t v43;
  void *v44;
  DOMDocument *v45;
  NSString *v46;
  NSString *v47;
  void *v48;
  double v49;
  const __CFString *v50;
  uint64_t v51;
  id v52;
  id v53;
  NSHTMLWebDelegate *v54;
  NSHTMLWebDelegate *v55;
  id v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  __int16 v62;
  unsigned __int8 v63;
  unsigned __int8 v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (self->_errorCode != -1)
    return;
  softLinkWebThreadLock[0]();
  v4 = -[NSHTMLReader _webViewClass](self, "_webViewClass");
  v5 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", NSBaseURLDocumentOption);
  v53 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("CharacterEncoding"));
  v6 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", NSTextEncodingNameDocumentOption);
  v55 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", NSWebResourceLoadDelegateDocumentOption);
  v54 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("WebPolicyDelegate"));
  v7 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", NSWebPreferencesDocumentOption);
  v8 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", NSTimeoutDocumentOption);
  v56 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", NSTextSizeMultiplierDocumentOption);
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSHTMLReaderMode"));
  bzero(&v61, 0x201uLL);
  v10 = -[NSData length](self->_data, "length");
  self->_errorCode = 1;
  if (!v4)
    return;
  data = self->_data;
  if (!data)
    return;
  v51 = v9;
  v52 = v8;
  if (v10 >= 0x200)
    v12 = 512;
  else
    v12 = v10;
  -[NSData getBytes:length:](data, "getBytes:length:", &v61, v12);
  if (!v12)
    goto LABEL_22;
  v50 = v6;
  v13 = v5;
  v14 = 0;
  v15 = MEMORY[0x1E0C80978];
  do
  {
    v16 = *((unsigned __int8 *)&v61 + v14);
    if (*((char *)&v61 + v14) < 0)
      v17 = __maskrune(v16, 0x4000uLL);
    else
      v17 = *(_DWORD *)(v15 + 4 * v16 + 60) & 0x4000;
    if (v17)
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v18 = v14;
    ++v14;
  }
  while (v18 == 0x7FFFFFFFFFFFFFFFLL && v14 < v12);
  v5 = v13;
  v6 = v50;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_22:
    v18 = 0;
  if (v12 >= 9
    && (v61 == 1768714338 ? (v20 = v62 == 29811) : (v20 = 0),
        v20 && v63 >= 0x30u && v63 <= 0x39u && v64 >= 0x30u && v64 < 0x3Au)
    || (v21 = v12 - v18, v21 >= 0x41)
    && (v22 = (char *)&v61 + v18, !strncasecmp((const char *)&v61 + v18, "<?xml", 5uLL))
    && (strnstr(v22, "<!DOCTYPE plist", v21) || strnstr(v22, "<!doctype plist", v21))
    && strnstr(v22, "<plist", v21))
  {
    v23 = -[NSHTMLReader _createWebArchiveForData:](self, "_createWebArchiveForData:", self->_data, v50);
    v24 = (const __CFString *)v51;
    v25 = v52;
    if (!v23)
      return;
  }
  else
  {
    v23 = 0;
    v24 = (const __CFString *)v51;
    v25 = v52;
  }
  v26 = (WebView *)objc_msgSend([v4 alloc], "initWithFrame:", 0.0, 0.0, 800.0, 600.0);
  self->_webView = v26;
  if (v24)
    v27 = v24;
  else
    v27 = (const __CFString *)*MEMORY[0x1E0C99748];
  v28 = -[WebView mainFrame](v26, "mainFrame", v50);
  v29 = -[NSHTMLWebDelegate initWithBaseURL:]([NSHTMLWebDelegate alloc], "initWithBaseURL:", v5);
  self->_webDelegate = v29;
  if (v55)
    v30 = v55;
  else
    v30 = v29;
  if (v54)
    v31 = v54;
  else
    v31 = v29;
  -[WebView setResourceLoadDelegate:](self->_webView, "setResourceLoadDelegate:", v30);
  -[WebView setFrameLoadDelegate:](self->_webView, "setFrameLoadDelegate:", self->_webDelegate);
  -[WebView setPolicyDelegate:](self->_webView, "setPolicyDelegate:", v31);
  if (!v7)
    v7 = -[NSHTMLReader _webPreferences](self, "_webPreferences");
  -[WebView setPreferences:](self->_webView, "setPreferences:", v7);
  objc_msgSend(v7, "setDefaultFontSize:", objc_msgSend(v7, "defaultFontSize"));
  self->_standardFontFamily = (NSString *)(id)objc_msgSend(v7, "standardFontFamily");
  self->_defaultFontSize = (double)(int)objc_msgSend(v7, "defaultFontSize");
  v32 = objc_msgSend(v7, "minimumFontSize");
  self->_minimumFontSize = (double)v32;
  if (self->_defaultFontSize <= 0.0)
    self->_defaultFontSize = 12.0;
  if (v32 <= 0)
    self->_minimumFontSize = 1.0;
  if (!v6 && v53)
  {
    v33 = objc_msgSend(v53, "unsignedIntegerValue");
    if (!v33 || (v34 = CFStringConvertNSStringEncodingToEncoding(v33), v34 == -1))
      v6 = 0;
    else
      v6 = CFStringConvertEncodingToIANACharSetName(v34);
  }
  if (v56)
  {
    objc_msgSend(v56, "doubleValue");
    self->_textSizeMultiplier = textSizeMultiplier;
  }
  else
  {
    textSizeMultiplier = self->_textSizeMultiplier;
  }
  if (textSizeMultiplier <= 0.0)
  {
    self->_textSizeMultiplier = 1.0;
    textSizeMultiplier = 1.0;
  }
  self->_webViewTextSizeMultiplier = textSizeMultiplier;
  *(float *)&textSizeMultiplier = textSizeMultiplier;
  -[WebView setTextSizeMultiplier:](self->_webView, "setTextSizeMultiplier:", textSizeMultiplier);
  v36 = 0.1;
  if (v25)
  {
    objc_msgSend(v25, "doubleValue");
    if (v37 <= 0.0)
      v38 = 60.0;
    else
      v38 = v37;
    if (v38 < 1.0)
      v36 = v38 / 10.0;
    if (v23)
      goto LABEL_73;
LABEL_75:
    v39 = v28;
    -[WebFrame loadData:MIMEType:textEncodingName:baseURL:](v28, "loadData:MIMEType:textEncodingName:baseURL:", self->_data, CFSTR("text/html"), v6, objc_msgSend(v5, "absoluteURL"));
    goto LABEL_76;
  }
  v38 = 60.0;
  if (!v23)
    goto LABEL_75;
LABEL_73:
  v39 = v28;
  -[WebFrame loadArchive:](v28, "loadArchive:", v23);

LABEL_76:
  v40 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v38);
  if ((softLinkWebThreadIsLocked[0]() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSHTMLReader.m"), 2646, CFSTR("before nested web runloop"));
  v41 = 10.0;
  do
  {
    if ((objc_msgSend(self->_webDelegate, "loadDidFinish", v41) & 1) != 0)
      break;
    CFRunLoopRunInMode(v27, v36 * 10.0, 1u);
    softLinkWebThreadLock[0]();
    if ((softLinkWebThreadIsLocked[0]() & 1) == 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSHTMLReader.m"), 2652, CFSTR("after nested web runloop"));
    objc_msgSend(v40, "timeIntervalSinceNow");
  }
  while (v41 >= v36);
  -[WebFrame stopLoading](v39, "stopLoading");
  if (objc_msgSend(self->_webDelegate, "loadDidSucceed"))
  {
    v42 = -[WebFrame dataSource](v39, "dataSource");
    self->_dataSource = v42;
    if (v42)
    {
      v43 = -[WebDataSource representation](v42, "representation");
      if (v43)
      {
        v44 = (void *)v43;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v45 = (DOMDocument *)objc_msgSend(v44, "DOMDocument");
          self->_document = v45;
          if (v45)
          {
            self->_errorCode = 0;
            -[NSHTMLReader _parseNode:](self, "_parseNode:", v45);
            if (self->_thumbnailLimit >= 1
              && (unint64_t)-[NSMutableAttributedString length](self->_attrStr, "length") > self->_thumbnailLimit)
            {
              -[NSMutableAttributedString deleteCharactersInRange:](self->_attrStr, "deleteCharactersInRange:");
            }
            -[NSHTMLReader _adjustTrailingNewline](self, "_adjustTrailingNewline");
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v46 = -[DOMDocument title](self->_document, "title");
              if (v46)
              {
                v47 = v46;
                if (-[NSString length](v46, "length"))
                  -[NSMutableDictionary setObject:forKey:](self->_documentAttrs, "setObject:forKey:", v47, CFSTR("NSTitleDocumentAttribute"));
              }
            }
            v48 = (void *)objc_msgSend((Class)getNSColorClass_4[0](), "_disambiguated_due_to_CIImage_colorWithCGColor:", -[WebFrame _bodyBackgroundColor](v39, "_bodyBackgroundColor"));
            v59 = 0;
            v60 = 0;
            v57 = 0.0;
            v58 = 0;
            objc_msgSend(v48, "getRed:green:blue:alpha:", &v60, &v59, &v58, &v57);
            if (v48)
            {
              v49 = v57;
              if (v57 > 0.0)
                -[NSMutableDictionary setObject:forKey:](self->_documentAttrs, "setObject:forKey:", v48, CFSTR("BackgroundColor"), v57);
            }
            if (v5)
              -[NSMutableDictionary setObject:forKey:](self->_documentAttrs, "setObject:forKey:", v5, CFSTR("BaseURL"), v49);
          }
        }
      }
    }
  }
  -[WebView close](self->_webView, "close");
  -[WebView setResourceLoadDelegate:](self->_webView, "setResourceLoadDelegate:", 0);
  -[WebView setFrameLoadDelegate:](self->_webView, "setFrameLoadDelegate:", 0);
  -[WebView setPolicyDelegate:](self->_webView, "setPolicyDelegate:", 0);
  if (_NSRunWebKitOnAppKitThread == 1)
  {

    self->_webView = 0;
    self->_computedStylesForElements = 0;

    self->_specifiedStylesForElements = 0;
    self->_stringsForNodes = 0;

    self->_floatsForNodes = 0;
    self->_colorsForNodes = 0;

    self->_attributesForElements = 0;
    self->_elementIsBlockLevel = 0;
  }
}

- (void)_loadFromDOMRange
{
  DOMNode *v3;
  DOMNode *v4;
  DOMDocument *v5;
  WebFrame *v6;
  WebView *v7;
  WebView *v8;
  WebPreferences *v9;
  float v10;
  double v11;
  int64_t domRangeStartIndex;

  if (self->_errorCode == -1)
  {
    v3 = -[DOMRange commonAncestorContainer](self->_domRange, "commonAncestorContainer");
    v4 = -[DOMRange startContainer](self->_domRange, "startContainer");
    for (self->_domStartAncestors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v4;
          v4 = -[DOMNode parentNode](v4, "parentNode"))
    {
      -[NSMutableArray addObject:](self->_domStartAncestors, "addObject:", v4);
      if (v4 == v3)
        break;
    }
    v5 = -[DOMNode ownerDocument](v3, "ownerDocument");
    self->_document = v5;
    v6 = -[DOMDocument webFrame](v5, "webFrame");
    self->_dataSource = -[WebFrame dataSource](v6, "dataSource");
    v7 = -[WebFrame webView](v6, "webView");
    if (v7)
    {
      v8 = v7;
      v9 = -[WebView preferences](v7, "preferences");
      -[WebView textSizeMultiplier](v8, "textSizeMultiplier");
      v11 = v10;
      self->_textSizeMultiplier = v11;
      self->_webViewTextSizeMultiplier = v11;
      if (v9)
      {
        self->_standardFontFamily = -[WebPreferences standardFontFamily](v9, "standardFontFamily");
        self->_defaultFontSize = (double)-[WebPreferences defaultFontSize](v9, "defaultFontSize");
        self->_minimumFontSize = (double)-[WebPreferences minimumFontSize](v9, "minimumFontSize");
      }
    }
    if (self->_textSizeMultiplier <= 0.0)
      self->_textSizeMultiplier = 1.0;
    if (self->_defaultFontSize <= 0.0)
      self->_defaultFontSize = 12.0;
    if (self->_minimumFontSize < 1.0)
      self->_minimumFontSize = 1.0;
    if (self->_document)
    {
      if (self->_dataSource)
      {
        self->_domRangeStartIndex = 0;
        self->_errorCode = 0;
        -[NSHTMLReader _parseNode:](self, "_parseNode:", v3);
        domRangeStartIndex = self->_domRangeStartIndex;
        if (domRangeStartIndex >= 1
          && domRangeStartIndex <= (unint64_t)-[NSMutableAttributedString length](self->_attrStr, "length"))
        {
          -[NSMutableAttributedString deleteCharactersInRange:](self->_attrStr, "deleteCharactersInRange:", 0, self->_domRangeStartIndex);
        }
      }
    }
  }
}

- (void)_loadUsingWebKitOnMainThread
{
  -[NSMutableAttributedString beginEditing](self->_attrStr, "beginEditing");
  -[NSHTMLReader _loadUsingWebKit](self, "_loadUsingWebKit");
  -[NSMutableAttributedString endEditing](self->_attrStr, "endEditing");
}

- (void)_load
{
  void *v3;
  int v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = _NSRunWebKitOnAppKitThread;
  if (_NSRunWebKitOnAppKitThread == 254)
  {
    if (!objc_msgSend(v3, "objectForKey:", CFSTR("NSRunWebKitOnAppKitThread")))
    {
      _NSRunWebKitOnAppKitThread = 1;
      if (self->_domRange)
        goto LABEL_5;
      goto LABEL_9;
    }
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSRunWebKitOnAppKitThread"));
    _NSRunWebKitOnAppKitThread = v4;
  }
  if (self->_domRange)
  {
LABEL_5:
    -[NSHTMLReader _loadFromDOMRange](self, "_loadFromDOMRange");
    return;
  }
  if (v4 != 1)
    goto LABEL_10;
LABEL_9:
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
LABEL_10:
    -[NSHTMLReader _loadUsingWebKit](self, "_loadUsingWebKit");
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[NSMutableAttributedString _isEditing](self->_attrStr, "_isEditing"))
  {
    -[NSMutableAttributedString endEditing](self->_attrStr, "endEditing");
    -[NSHTMLReader performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__loadUsingWebKitOnMainThread, 0, 1);
    -[NSMutableAttributedString beginEditing](self->_attrStr, "beginEditing");
  }
  else
  {
    -[NSHTMLReader performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__loadUsingWebKit, 0, 1);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTMLReader;
  -[NSHTMLReader dealloc](&v3, sel_dealloc);
}

- (NSHTMLReader)initWithData:(id)a3 options:(id)a4
{
  void *v7;
  char *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v20.receiver = self;
  v20.super_class = (Class)NSHTMLReader;
  v8 = -[NSHTMLReader init](&v20, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = objc_alloc_init(MEMORY[0x1E0CB3778]);
    *((_QWORD *)v8 + 2) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 3) = a3;
    *((_QWORD *)v8 + 5) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", a4);
    *((_QWORD *)v8 + 18) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 19) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 20) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 21) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 22) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 23) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 24) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 25) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 26) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v8 + 27) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 28) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 29) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 30) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 31) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 33) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 34) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v8 + 35) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_OWORD *)(v8 + 104) = xmmword_18D6CBF70;
    *(_OWORD *)(v8 + 120) = xmmword_18D6CC640;
    *((_QWORD *)v8 + 17) = 0x3FF0000000000000;
    *((_QWORD *)v8 + 38) = 0;
    *((_QWORD *)v8 + 39) = -1;
    v9 = (uint64_t *)(v8 + 296);
    *((_QWORD *)v8 + 37) = 0;
    v8[332] = 1;
    v10 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("NSIndexing"));
    if (v10)
    {
      v11 = objc_msgSend(v10, "integerValue");
    }
    else
    {
      if (objc_msgSend(v7, "objectForKey:", CFSTR("NSHTMLIndexing")))
      {
        v12 = CFSTR("NSHTMLIndexing");
      }
      else
      {
        if (!objc_msgSend(v7, "objectForKey:", CFSTR("NSTextIndexing")))
        {
          v11 = *v9;
LABEL_10:
          *((_DWORD *)v8 + 82) = *((_DWORD *)v8 + 82) & 0xFFFFFFF7 | (8 * (v11 > 0));
          v13 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("NSThumbnail"));
          if (v13)
            *((_QWORD *)v8 + 38) = objc_msgSend(v13, "integerValue");
          v14 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("NSTesting"));
          if (v14)
          {
            v15 = objc_msgSend(v14, "integerValue") > 0;
          }
          else
          {
            if (!objc_msgSend(v7, "objectForKey:", CFSTR("NSHTMLTesting")))
            {
LABEL_20:
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 612.0, 792.0), CFSTR("PaperSize"));
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 90.0), CFSTR("LeftMargin"));
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 90.0), CFSTR("RightMargin"));
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 72.0), CFSTR("TopMargin"));
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 72.0), CFSTR("BottomMargin"));
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", 72.0, 90.0, 72.0, 90.0), CFSTR("PaperMargin"));
              v17 = (void *)*((_QWORD *)v8 + 2);
              v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
              objc_msgSend(v17, "setObject:forKey:", v18, NSConvertedDocumentAttribute);
              return (NSHTMLReader *)v8;
            }
            v15 = objc_msgSend(v7, "BOOLForKey:", CFSTR("NSHTMLTesting"));
          }
          if (v15)
            v16 = 16;
          else
            v16 = 0;
          *((_DWORD *)v8 + 82) = *((_DWORD *)v8 + 82) & 0xFFFFFFEF | v16;
          goto LABEL_20;
        }
        v12 = CFSTR("NSTextIndexing");
      }
      v11 = objc_msgSend(v7, "integerForKey:", v12);
    }
    *v9 = v11;
    goto LABEL_10;
  }
  return (NSHTMLReader *)v8;
}

- (NSHTMLReader)initWithPath:(id)a3 options:(id)a4
{
  return -[NSHTMLReader initWithData:options:](self, "initWithData:options:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3), a4);
}

- (NSHTMLReader)initWithDOMRange:(id)a3
{
  NSHTMLReader *v4;

  v4 = -[NSHTMLReader initWithData:options:](self, "initWithData:options:", 0, 0);
  if (v4)
    v4->_domRange = (DOMRange *)a3;
  return v4;
}

- (id)attributedString
{
  -[NSHTMLReader _load](self, "_load");
  if (self->_errorCode)
    return 0;
  else
    return self->_attrStr;
}

- (id)documentAttributes
{
  -[NSHTMLReader _load](self, "_load");
  if (self->_errorCode)
    return 0;
  else
    return self->_documentAttrs;
}

- (void)setMutableAttributedString:(id)a3
{
  NSMutableAttributedString *attrStr;
  uint64_t v6;
  NSMutableAttributedString *v7;

  attrStr = self->_attrStr;
  if (attrStr != a3)
  {
    if (attrStr)
    {
      v6 = -[NSMutableAttributedString length](attrStr, "length");
      v7 = self->_attrStr;
      if (v6)
      {
        objc_msgSend(a3, "setAttributedString:", v7);
        v7 = self->_attrStr;
      }
    }
    else
    {
      v7 = 0;
    }

    self->_attrStr = (NSMutableAttributedString *)a3;
  }
}

- (BOOL)includesTextListMarkers
{
  return self->_includesTextListMarkers;
}

- (void)setIncludesTextListMarkers:(BOOL)a3
{
  self->_includesTextListMarkers = a3;
}

@end
