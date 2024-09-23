@implementation WBSMetadataExtractor

+ (id)metadataExtractorScriptSource
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  return objc_autoreleaseReturnValue((id)objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", "//# sourceURL=__InjectedScript_MetadataExtractor.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\nfunction getIconType(e){var o=e.getAttribute(\"rel\");return\"apple-touch-ico"
                                           "n\"===o?IconTypeAppleTouchIcon:\"apple-touch-icon-precomposed\"===o?IconTypeA"
                                           "ppleTouchIconPrecomposed:IconTypeFavicon}function compareIconsDescending(e,o)"
                                           "{var c=getIconType(e),t=getIconType(o);if (c===IconTypeFavicon&&t!==IconTypeFa"
                                           "vicon)return 1;if (t===IconTypeFavicon&&c!==IconTypeFavicon)return-1;var n=e.g"
                                           "etAttribute(\"sizes\"),r=o.getAttribute(\"sizes\"),p=0,a=0;return n?p=parseIn"
                                           "t(n):n||c!==IconTypeAppleTouchIcon&&c!==IconTypeAppleTouchIconPrecomposed||(p"
                                           "=AppleTouchIconDefaultWidth),r?a=parseInt(r):r||t!==IconTypeAppleTouchIcon&&t"
                                           "!==IconTypeAppleTouchIconPrecomposed||(a=AppleTouchIconDefaultWidth),a>p?1:a<"
                                           "p?-1:c!==IconTypeAppleTouchIconPrecomposed&&t===IconTypeAppleTouchIconPrecomp"
                                           "osed?1:t!==IconTypeAppleTouchIconPrecomposed&&c===IconTypeAppleTouchIconPreco"
                                           "mposed?-1:0}function colorComponentsFromString(e){var o=document.createElemen"
                                           "t(\"canvas\");o.width=1,o.height=1;var c=o.getContext(\"2d\");c.fillStyle=e,c"
                                           ".fillRect(0,0,1,1);var t=c.getImageData(0,0,1,1);return[t.data[0],t.data[1],t"
                                           ".data[2]]}var MetadataExtractor=function(){};const IconTypeFavicon=0,IconType"
                                           "AppleTouchIcon=1,IconTypeAppleTouchIconPrecomposed=2,AppleTouchIconDefaultWid"
                                           "th=60;MetadataExtractor.prototype={extractAndSortIconsWithSelector:function(e"
                                           "){var o=document.head.querySelectorAll(e);return o.length?Array.prototype.sli"
                                           "ce.call(o).sort(compareIconsDescending):[]},extractAppleTouchIconURLs:functio"
                                           "n(){for (var e=this.extractAndSortIconsWithSelector(\"link[rel=apple-touch-ico"
                                           "n], link[rel=apple-touch-icon-precomposed]\"),o=[],c=0;c<e.length;++c){var t="
                                           "e[c].href;t&&o.push(t)}return o},extractFaviconURLs:function(){for (var e=this"
                                           ".extractAndSortIconsWithSelector(\"link[rel='shortcut icon'], link[rel=icon]\"
                                           "),o=[],c=e.length,t=0;t<c;++t)o.push(e[t].href);return o},extractTemplateIcon"
                                           "URLAndColor:function(){var e=document.head.querySelector(\"link[rel=mask-icon"
                                           "]\");if (!e)return null;var o=e.getAttribute(\"color\");return o&&e.href?{url:"
                                           "e.href,color:colorComponentsFromString(o)}:null}};var MetadataExtractorJS=new"
                                           " MetadataExtractor;",
                                           metadataExtractorSourceLength,
                                           4,
                                           0));
}

- (WBSMetadataExtractor)initWithWebProcessPlugInFrame:(id)a3
{
  return -[WBSMetadataExtractor initWithWebProcessPlugInFrame:useNormalWorld:](self, "initWithWebProcessPlugInFrame:useNormalWorld:", a3, 0);
}

- (WBSMetadataExtractor)initWithWebProcessPlugInFrame:(id)a3 useNormalWorld:(BOOL)a4
{
  id v7;
  WBSMetadataExtractor *v8;
  WBSMetadataExtractor *v9;
  uint64_t v10;
  WKWebProcessPlugInScriptWorld *webProcessPlugInScriptWorld;
  WBSMetadataExtractor *v12;

  v7 = a3;
  v8 = -[WBSMetadataExtractor init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_webProcessPlugInFrame, a3);
    if (a4)
      objc_msgSend(MEMORY[0x1E0CEF628], "normalWorld");
    else
      objc_msgSend(MEMORY[0x1E0CEF628], "world");
    v10 = objc_claimAutoreleasedReturnValue();
    webProcessPlugInScriptWorld = v9->_webProcessPlugInScriptWorld;
    v9->_webProcessPlugInScriptWorld = (WKWebProcessPlugInScriptWorld *)v10;

    v12 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[WKWebProcessPlugInScriptWorld clearWrappers](self->_webProcessPlugInScriptWorld, "clearWrappers");
  v3.receiver = self;
  v3.super_class = (Class)WBSMetadataExtractor;
  -[WBSMetadataExtractor dealloc](&v3, sel_dealloc);
}

- (id)makeContext
{
  return (id)-[WKWebProcessPlugInFrame jsContextForWorld:](self->_webProcessPlugInFrame, "jsContextForWorld:", self->_webProcessPlugInScriptWorld);
}

- (JSContext)context
{
  JSContext *context;
  JSContext *v3;
  JSContext *v5;
  JSContext *v6;
  void *v7;
  id v8;

  context = self->_context;
  if (context)
  {
    v3 = context;
  }
  else
  {
    -[WBSMetadataExtractor makeContext](self, "makeContext");
    v5 = (JSContext *)objc_claimAutoreleasedReturnValue();
    v6 = self->_context;
    self->_context = v5;

    objc_msgSend((id)objc_opt_class(), "metadataExtractorScriptSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[JSContext evaluateScript:](self->_context, "evaluateScript:", v7);
    v3 = self->_context;

  }
  return v3;
}

- (id)_resultForInvokingFunctionWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  -[WBSMetadataExtractor context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", CFSTR("MetadataExtractorJS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isUndefined") & 1) != 0
    || (objc_msgSend(v7, "valueForProperty:", v4),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isUndefined"),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "invokeMethod:withArguments:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)appleTouchIconURLs
{
  void *v2;
  void *v3;
  void *v4;

  -[WBSMetadataExtractor _resultForInvokingFunctionWithName:](self, "_resultForInvokingFunctionWithName:", CFSTR("extractAppleTouchIconURLs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__WBSMetadataExtractor_appleTouchIconURLs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "safari_isHTTPFamilyURL"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)faviconURLs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WBSMetadataExtractor _resultForInvokingFunctionWithName:](self, "_resultForInvokingFunctionWithName:", CFSTR("extractFaviconURLs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "safari_isHTTPFamilyURL"))
            objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_colorFromColorComponents:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 3)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v6 / 255.0, v9 / 255.0, v12 / 255.0, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)getTemplateIconURL:(id *)a3 andColor:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  *a3 = 0;
  *a4 = 0;
  -[WBSMetadataExtractor _resultForInvokingFunctionWithName:](self, "_resultForInvokingFunctionWithName:", CFSTR("extractTemplateIconURLAndColor"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "safari_stringForKey:", CFSTR("url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v10;

    }
    else
    {
      *a3 = 0;
    }
    objc_msgSend(v8, "safari_arrayForKey:", CFSTR("color"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSMetadataExtractor _colorFromColorComponents:](self, "_colorFromColorComponents:", v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (id)firstElementForSelector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WBSMetadataExtractor context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("document.querySelector('%@')"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "evaluateScript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WKWebProcessPlugInFrame)webProcessPlugInFrame
{
  return self->_webProcessPlugInFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webProcessPlugInFrame, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_webProcessPlugInScriptWorld, 0);
}

@end
