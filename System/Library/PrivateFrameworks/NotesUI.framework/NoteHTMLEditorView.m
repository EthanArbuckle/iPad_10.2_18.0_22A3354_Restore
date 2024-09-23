@implementation NoteHTMLEditorView

+ (id)baseHTMLString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  _noteStyleSheet();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<!DOCTYPE html><html>    <head>        <meta name=\"viewport\" content=\"initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0\" />        <style>            %@        </style>    </head>    <body id=\"editor\">    </body></html>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NoteHTMLEditorView)initWithFrame:(CGRect)a3
{
  NoteHTMLEditorView *v3;
  NoteHTMLEditorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NoteHTMLEditorView;
  v3 = -[NoteHTMLEditorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[NoteHTMLEditorView setupWebView](v3, "setupWebView");
  return v4;
}

- (NoteHTMLEditorView)initWithCoder:(id)a3
{
  NoteHTMLEditorView *v3;
  NoteHTMLEditorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NoteHTMLEditorView;
  v3 = -[NoteHTMLEditorView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[NoteHTMLEditorView setupWebView](v3, "setupWebView");
  return v4;
}

- (void)removeScriptHandlers
{
  void *v2;
  void *v3;
  id v4;

  -[NoteHTMLEditorView webView](self, "webView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllScriptMessageHandlers");

}

- (void)setupWebView
{
  NoteWKWebView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NoteWKWebView *v13;
  void *v14;
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
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[6];

  v58[4] = *MEMORY[0x1E0C80C00];
  v3 = [NoteWKWebView alloc];
  -[NoteHTMLEditorView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NoteHTMLEditorView webViewConfiguration](self, "webViewConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NoteWKWebView initWithFrame:configuration:](v3, "initWithFrame:configuration:", v12, v5, v7, v9, v11);
  -[NoteHTMLEditorView setWebView:](self, "setWebView:", v13);

  -[NoteHTMLEditorView webView](self, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[NoteHTMLEditorView webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOpaque:", 0);

  -[NoteHTMLEditorView webView](self, "webView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsLinkPreview:", 1);

  -[NoteHTMLEditorView webView](self, "webView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShowsHorizontalScrollIndicator:", 0);

  -[NoteHTMLEditorView webView](self, "webView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlwaysBounceHorizontal:", 0);

  -[NoteHTMLEditorView webView](self, "webView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDirectionalLockEnabled:", 1);

  -[NoteHTMLEditorView webView](self, "webView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_setInputDelegate:", self);

  -[NoteHTMLEditorView webView](self, "webView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUIDelegate:", self);

  -[NoteHTMLEditorView webView](self, "webView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNavigationDelegate:", self);

  -[NoteHTMLEditorView webView](self, "webView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNoteHTMLEditorView:", self);

  -[NoteHTMLEditorView webView](self, "webView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView addSubview:](self, "addSubview:", v29);

  v30 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:blank"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "requestWithURL:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v32;
  objc_msgSend(v32, "_setNonAppInitiated:", 1);
  -[NoteHTMLEditorView webView](self, "webView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0CB3940];
  _noteStyleSheet();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("<!DOCTYPE html><html>    <head>        <meta name=\"viewport\" content=\"initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0\" />        <style>            %@        </style>    </head>    <body id=\"editor\">    </body></html>"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v33, "loadSimulatedRequest:responseHTMLString:", v32, v36);

  -[NoteHTMLEditorView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x1E0CB3718];
  -[NoteHTMLEditorView webView](self, "webView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v53;
  -[NoteHTMLEditorView webView](self, "webView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v48;
  -[NoteHTMLEditorView webView](self, "webView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v42;
  -[NoteHTMLEditorView webView](self, "webView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "activateConstraints:", v47);

}

- (id)webViewConfiguration
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NoteHTMLEditorViewURLSchemeHandler *v12;
  NoteHTMLEditorViewScriptMessageHandler *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(v3, "_setGroupIdentifier:", CFSTR("com.apple.mobilenotes.text"));
  v4 = *MEMORY[0x1E0C8A2C8];
  v34[0] = *MEMORY[0x1E0C8A2D0];
  v34[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAdditionalSupportedImageTypes:", v5);

  objc_msgSend(v3, "_setAllowsJavaScriptMarkup:", 0);
  objc_msgSend(MEMORY[0x1E0CEF650], "nonPersistentDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWebsiteDataStore:", v6);

  objc_msgSend(v3, "_setAllowUniversalAccessFromFileURLs:", 0);
  objc_msgSend(v3, "_setAttachmentElementEnabled:", 1);
  objc_msgSend(v3, "_setColorFilterEnabled:", 1);
  objc_msgSend(v3, "_setRespectsImageOrientation:", 1);
  objc_msgSend(v3, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
  objc_msgSend(v3, "_setInvisibleAutoplayNotPermitted:", 1);
  objc_msgSend(v3, "_setApplePayEnabled:", 0);
  objc_msgSend(v3, "_setAllowsMetaRefresh:", 0);
  objc_msgSend(v3, "setAllowsInlinePredictions:", 1);
  objc_msgSend(v3, "setIgnoresViewportScaleLimits:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0CEF5F0]);
  objc_msgSend(v3, "setPreferences:", v7);

  objc_msgSend(v3, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setJavaScriptCanOpenWindowsAutomatically:", 0);

  objc_msgSend(v3, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setColorFilterEnabled:", 1);

  objc_msgSend(v3, "preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setJavaScriptCanAccessClipboard:", 1);

  objc_msgSend(v3, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setEditableLinkBehavior:", 3);

  v12 = -[NoteHTMLEditorViewURLSchemeHandler initWithNoteHMLEditorView:]([NoteHTMLEditorViewURLSchemeHandler alloc], "initWithNoteHMLEditorView:", self);
  -[NoteHTMLEditorView setUrlSchemeHandler:](self, "setUrlSchemeHandler:", v12);

  v13 = -[NoteHTMLEditorViewScriptMessageHandler initWithNoteHMLEditorView:]([NoteHTMLEditorViewScriptMessageHandler alloc], "initWithNoteHMLEditorView:", self);
  -[NoteHTMLEditorView setScriptMessageHandler:](self, "setScriptMessageHandler:", v13);

  -[NoteHTMLEditorView urlSchemeHandler](self, "urlSchemeHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setURLSchemeHandler:forURLScheme:", v14, CFSTR("cid"));

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF610]), "initWithSource:injectionTime:forMainFrameOnly:", &cfstr_VarNotewkwebvi, 1, 1);
  objc_msgSend(v3, "userContentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addUserScript:", v15);

  objc_msgSend(v3, "userContentController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addScriptMessageHandler:name:", v18, CFSTR("textDidChange"));

  objc_msgSend(v3, "userContentController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addScriptMessageHandler:name:", v20, CFSTR("attachmentsDidChange"));

  objc_msgSend(v3, "userContentController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addScriptMessageHandler:name:", v22, CFSTR("titleDidChange"));

  objc_msgSend(v3, "userContentController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addScriptMessageHandler:name:", v24, CFSTR("selectionDidChange"));

  objc_msgSend(v3, "userContentController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addScriptMessageHandler:name:", v26, CFSTR("clickedAttachment"));

  objc_msgSend(v3, "userContentController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addScriptMessageHandler:name:", v28, CFSTR("doubleClickedAttachment"));

  objc_msgSend(v3, "userContentController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addScriptMessageHandler:name:", v30, CFSTR("editorDidBlur"));

  objc_msgSend(v3, "userContentController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView scriptMessageHandler](self, "scriptMessageHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addScriptMessageHandler:name:", v32, CFSTR("anchorTouchesDidEnd"));

  return v3;
}

- (UIViewPrintFormatter)viewPrintFormatter
{
  void *v2;
  void *v3;

  -[NoteHTMLEditorView webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewPrintFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewPrintFormatter *)v3;
}

- (WebArchive)webArchive
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id obj;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[NoteHTMLEditorView htmlString](self, "htmlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0DD9788]);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///index.html"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v4;
  v37 = (void *)objc_msgSend(v5, "initWithData:URL:MIMEType:textEncodingName:frameName:", v4, v6, CFSTR("text/html"), CFSTR("utf-8"), 0);

  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NoteHTMLEditorView attachmentContentIDs](self, "attachmentContentIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[NoteHTMLEditorView attachmentContentIDs](self, "attachmentContentIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v9)
  {
    v10 = v9;
    v43 = *(_QWORD *)v48;
    v39 = (void *)*MEMORY[0x1E0CEC4A0];
    v40 = *MEMORY[0x1E0CB28A8];
    v11 = 0x1E0CEC000uLL;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v43)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "ic_newURLForContentID:percentEscaped:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NoteHTMLEditorView delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          -[NoteHTMLEditorView delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "noteHTMLEditorView:fileURLForAttachmentWithContentID:", self, v13);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v19 = *(void **)(v11 + 1016);
            objc_msgSend(v18, "pathExtension");
            v20 = v11;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "typeWithFilenameExtension:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(*(id *)(v20 + 1016), "typeWithIdentifier:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "preferredMIMEType");
              v25 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v39, "preferredMIMEType");
              v25 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v18);
            v29 = (id)objc_claimAutoreleasedReturnValue();
            v31 = objc_alloc(MEMORY[0x1E0DD9788]);
            v32 = v29;
            v33 = v14;
            v34 = v25;
            goto LABEL_18;
          }
        }
        -[NoteHTMLEditorView delegate](self, "delegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_respondsToSelector();

        if ((v27 & 1) == 0
          || (-[NoteHTMLEditorView delegate](self, "delegate"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v28, "noteHTMLEditorView:attachmentPresentationForContentID:", self, v13),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v28,
              !v23))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v40, 4, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          goto LABEL_20;
        }
        v45 = 0;
        v46 = 0;
        v44 = 0;
        objc_msgSend(v23, "getPresentationData:mimeType:error:", &v46, &v45, &v44);
        v25 = v46;
        v29 = v45;
        v18 = v44;
        v30 = 0;
        if (v25 && v29)
        {
          v31 = objc_alloc(MEMORY[0x1E0DD9788]);
          v32 = v25;
          v33 = v14;
          v34 = v29;
LABEL_18:
          v30 = (void *)objc_msgSend(v31, "initWithData:URL:MIMEType:textEncodingName:frameName:", v32, v33, v34, 0, 0);
        }

        v11 = 0x1E0CEC000;
LABEL_20:

        if (v30)
          objc_msgSend(v42, "addObject:", v30);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v10);
  }

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9728]), "initWithMainResource:subresources:subframeArchives:", v37, v42, 0);
  return (WebArchive *)v35;
}

- (double)textZoomFactor
{
  void *v2;
  double v3;
  double v4;

  -[NoteHTMLEditorView webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_textZoomFactor");
  v4 = v3;

  return v4;
}

- (void)setTextZoomFactor:(double)a3
{
  id v4;

  -[NoteHTMLEditorView webView](self, "webView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTextZoomFactor:", a3);

}

- (ICSelectorDelayer)updateContentDelayer
{
  ICSelectorDelayer *updateContentDelayer;
  ICSelectorDelayer *v4;
  ICSelectorDelayer *v5;

  updateContentDelayer = self->_updateContentDelayer;
  if (!updateContentDelayer)
  {
    v4 = (ICSelectorDelayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_updateContent, 1, 1, 0.01);
    v5 = self->_updateContentDelayer;
    self->_updateContentDelayer = v4;

    updateContentDelayer = self->_updateContentDelayer;
  }
  return updateContentDelayer;
}

- (void)setHtmlString:(id)a3 attachments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSString *htmlString;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  CGImageSource *v25;
  CGImageSource *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  NoteHTMLEditorView *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id *location;
  id v55;
  id v56;
  NoteHTMLEditorView *v57;
  uint64_t v59;
  uint64_t v60;
  id obj;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  CFURLRef url;
  _QWORD v69[5];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NoteHTMLEditorView webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLoading");

  if (v9)
  {
    -[NoteHTMLEditorView setHtmlStringToLoad:](self, "setHtmlStringToLoad:", v6);
    -[NoteHTMLEditorView setAttachmentsToLoad:](self, "setAttachmentsToLoad:", v7);
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("cidURL.resourceSpecifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteHTMLEditorView setAttachmentContentIDs:](self, "setAttachmentContentIDs:", v10);

    -[NoteHTMLEditorView setHasAttachments:](self, "setHasAttachments:", objc_msgSend(v7, "count") != 0);
    goto LABEL_56;
  }
  htmlString = self->_htmlString;
  if (!htmlString
    || -[NSString isEqualToString:](htmlString, "isEqualToString:", &stru_1E5C2F8C0)
    || (objc_msgSend(v6, "isEqualToString:", self->_htmlString) & 1) == 0)
  {
    location = (id *)&self->_htmlString;
    v57 = self;
    -[NoteHTMLEditorView updateDataOwnerForCopyAndPaste](self, "updateDataOwnerForCopyAndPaste");
    v56 = v6;
    objc_msgSend(v6, "ic_htmlStringEscapingQuotesAndLineBreaks");
    v53 = objc_claimAutoreleasedReturnValue();
    v12 = 0x1E0C99000uLL;
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v55 = v7;
    obj = v7;
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (!v64)
      goto LABEL_50;
    v13 = *(_QWORD *)v72;
    v62 = (void *)*MEMORY[0x1E0CEC4A0];
    v66 = *MEMORY[0x1E0CEC520];
    v59 = *MEMORY[0x1E0C99998];
    v60 = *(_QWORD *)v72;
    while (1)
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v72 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        v16 = objc_alloc_init(*(Class *)(v12 + 3592));
        objc_msgSend(v15, "fileURL");
        url = (CFURLRef)objc_claimAutoreleasedReturnValue();
        -[__CFURL pathExtension](url, "pathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mimeType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = 0;
        }
        v67 = v17;
        if (objc_msgSend(v17, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            goto LABEL_24;
        }
        else
        {
          v22 = 0;
        }
        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqual:", v62);

          if (v24 && (v25 = CGImageSourceCreateWithURL(url, 0)) != 0)
          {
            v26 = v25;
            CGImageSourceGetType(v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v27;
            if (v27)
              v28 = v27;
            CFRelease(v26);

          }
          else
          {
            v22 = 0;
          }
          goto LABEL_28;
        }
LABEL_24:
        if (!v20)
        {
          if (!v22)
            goto LABEL_37;
          goto LABEL_31;
        }
LABEL_28:
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v29;
        if (objc_msgSend(v29, "conformsToType:", v66))
        {

LABEL_36:
          objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("image"));
          goto LABEL_46;
        }
        if (!v22)
        {

          v22 = 0;
          goto LABEL_37;
        }
LABEL_31:
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "conformsToType:", v66);

        if (v20)
        {

          if ((v31 & 1) != 0)
            goto LABEL_36;
        }
        else if (v31)
        {
          goto LABEL_36;
        }
LABEL_37:
        v70 = 0;
        -[__CFURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v70, v59, 0);
        v32 = v70;
        objc_msgSend(v15, "fileURL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v36 = v22;
        }
        else if (v20)
        {
          v36 = v20;
        }
        else
        {
          objc_msgSend(v62, "identifier");
          v36 = (id)objc_claimAutoreleasedReturnValue();
        }
        v37 = v36;
        if (objc_msgSend(v32, "longLongValue") < 1)
        {
          v38 = &stru_1E5C2F8C0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v32, "longLongValue"), 0);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("image"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, CFSTR("title"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v38, CFSTR("subtitle"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v37, CFSTR("type"));

        v12 = 0x1E0C99000;
        v13 = v60;
LABEL_46:
        objc_msgSend(v15, "cidURL");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "absoluteString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v16, v40);

      }
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      if (!v64)
      {
LABEL_50:

        v41 = v57;
        -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](v57, "jsonStringFromDictionaryOrArray:", v63);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(location, a3);
        if (v53)
          v43 = (__CFString *)v53;
        else
          v43 = &stru_1E5C2F8C0;
        objc_msgSend(obj, "valueForKeyPath:", CFSTR("cidURL.resourceSpecifier"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NoteHTMLEditorView setAttachmentContentIDs:](v57, "setAttachmentContentIDs:", v44);

        -[NoteHTMLEditorView setHasAttachments:](v57, "setHasAttachments:", objc_msgSend(obj, "count") != 0);
        -[NoteHTMLEditorView setEnableSmartLists:](v57, "setEnableSmartLists:", +[ICTextStyle autoListInsertionEnabled](ICTextStyle, "autoListInsertionEnabled"));
        -[NoteHTMLEditorView delegate](v57, "delegate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_opt_respondsToSelector();

        if ((v46 & 1) != 0)
        {
          -[NoteHTMLEditorView delegate](v57, "delegate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "allowsAttachmentsInNoteHTMLEditorView:", v57);

          v41 = v57;
          -[NoteHTMLEditorView setEnableAttachments:](v57, "setEnableAttachments:", v48);
        }
        -[NoteHTMLEditorView webView](v41, "webView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "findInteraction");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "dismissFindNavigator");

        -[NoteHTMLEditorView webView](v41, "webView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.setHTMLContentWithAttachmentInfos(\"%@\", %@);"),
          v43,
          v42);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __48__NoteHTMLEditorView_setHtmlString_attachments___block_invoke;
        v69[3] = &unk_1E5C20E90;
        v69[4] = v41;
        objc_msgSend(v51, "evaluateJavaScript:completionHandler:", v52, v69);

        v7 = v55;
        v6 = v56;
        break;
      }
    }
  }
LABEL_56:

}

uint64_t __48__NoteHTMLEditorView_setHtmlString_attachments___block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isInsideSiriSnippet"))
  {
    objc_msgSend(*(id *)(a1 + 32), "webView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_doAfterNextPresentationUpdate:", &__block_literal_global_49);

  }
  objc_msgSend(*(id *)(a1 + 32), "updateDataDetectors");
  return objc_msgSend(*(id *)(a1 + 32), "updateWebViewEditability");
}

void __48__NoteHTMLEditorView_setHtmlString_attachments___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SiriNoteTextViewSizeDidChangeNotification"), 0);

}

- (void)setEnableAttachments:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[NoteHTMLEditorView webView](self, "webView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("false");
  if (v3)
    v4 = CFSTR("true");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setEnableAttachments(%@);"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_evaluateJavaScript:", v5);

}

- (void)setEnableSmartLists:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[NoteHTMLEditorView webView](self, "webView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("false");
  if (v3)
    v4 = CFSTR("true");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setEnableSmartLists(%@);"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_evaluateJavaScript:", v5);

}

- (void)setEnableShiftNewlinesInSmartLists:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[NoteHTMLEditorView webView](self, "webView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("false");
  if (v3)
    v4 = CFSTR("true");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setEnableShiftNewLinesInSmartLists(%@);"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_evaluateJavaScript:", v5);

}

- (void)insertHTMLString:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "ic_htmlStringEscapingQuotesAndLineBreaks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.insertHTML(\"%@\");"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_evaluateJavaScript:", v5);

}

- (void)insertLinkWithURL:(id)a3 title:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  objc_msgSend(a3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_htmlStringEscapingQuotesAndLineBreaks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ic_htmlStringEscapingQuotesAndLineBreaks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.insertLink(\"%@\", \"%@\");"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__NoteHTMLEditorView_insertLinkWithURL_title___block_invoke;
  v12[3] = &unk_1E5C20E90;
  v12[4] = self;
  objc_msgSend(v11, "evaluateJavaScript:completionHandler:", v10, v12);

}

uint64_t __46__NoteHTMLEditorView_insertLinkWithURL_title___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDataDetectors");
}

- (void)insertLinksWithURLs:(id)a3 titles:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  objc_msgSend(a3, "valueForKey:", CFSTR("absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](self, "jsonStringFromDictionaryOrArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](self, "jsonStringFromDictionaryOrArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.insertLinks(%@, %@);"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__NoteHTMLEditorView_insertLinksWithURLs_titles___block_invoke;
  v12[3] = &unk_1E5C20E90;
  v12[4] = self;
  objc_msgSend(v11, "evaluateJavaScript:completionHandler:", v10, v12);

}

uint64_t __49__NoteHTMLEditorView_insertLinksWithURLs_titles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDataDetectors");
}

- (void)copyNoteHTMLToPasteboard
{
  id v2;

  -[NoteHTMLEditorView webView](self, "webView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_evaluateJavaScript:", CFSTR("notewkwebview.copyNoteHTMLToPasteboard()"));

}

- (id)attachmentInfoDictionaryForAttachmentPresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  void *v26;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mimeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v3, "contentIDURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("contentIDURL"));

  v14 = (_QWORD *)MEMORY[0x1E0CEC520];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "conformsToType:", *v14))
    {

LABEL_15:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("image"));
      goto LABEL_29;
    }
    if (v11)
      goto LABEL_13;
    v26 = v6;

LABEL_19:
    v17 = 1;
    goto LABEL_20;
  }
  if (!v11)
  {
    v26 = v6;
    goto LABEL_19;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "conformsToType:", *v14);

  if (v9)
  {

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else if (v16)
  {
    goto LABEL_15;
  }
  v26 = v6;
  v17 = 0;
LABEL_20:
  objc_msgSend(v3, "dataSizeNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filename");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v17 & 1) != 0)
  {
    if (v9)
    {
      v22 = v9;
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v22 = v11;
  }
  v23 = v22;
  if (objc_msgSend(v18, "longLongValue") < 1)
  {
    v24 = &stru_1E5C2F8C0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v18, "longLongValue"), 0);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("image"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("title"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("subtitle"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("type"));

  v6 = v26;
LABEL_29:

  return v4;
}

- (id)jsonStringFromDictionaryOrArray:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v9);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v5)
    {
      v6 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:].cold.1();

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:].cold.2(v3, v4);

    v7 = 0;
    v5 = 0;
  }

  return v7;
}

- (void)replaceSelectionWithAttachmentPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NoteHTMLEditorView attachmentInfoDictionaryForAttachmentPresentation:](self, "attachmentInfoDictionaryForAttachmentPresentation:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](self, "jsonStringFromDictionaryOrArray:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.insertAttachment(%@);"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_evaluateJavaScript:", v6);

}

- (void)undoablyReplaceSelectionWithAttachmentPresentations:(id)a3 undoManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        -[NoteHTMLEditorView attachmentInfoDictionaryForAttachmentPresentation:](self, "attachmentInfoDictionaryForAttachmentPresentation:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "prepareWithInvocationTarget:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "undoablyRemoveAttachmentPresentations:undoManager:", v9, v7);

  -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](self, "jsonStringFromDictionaryOrArray:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.insertAttachments(%@);"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_evaluateJavaScript:", v18);

}

- (void)undoablyRemoveAttachmentPresentations:(id)a3 undoManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        -[NoteHTMLEditorView attachmentInfoDictionaryForAttachmentPresentation:](self, "attachmentInfoDictionaryForAttachmentPresentation:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "prepareWithInvocationTarget:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "undoablyReplaceSelectionWithAttachmentPresentations:undoManager:", v9, v7);

  -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](self, "jsonStringFromDictionaryOrArray:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.removeAttachments(%@);"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_evaluateJavaScript:", v18);

}

- (void)replaceContentIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](self, "jsonStringFromDictionaryOrArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView attachmentContentIDs](self, "attachmentContentIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[NoteHTMLEditorView attachmentContentIDs](self, "attachmentContentIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __40__NoteHTMLEditorView_replaceContentIDs___block_invoke;
  v18[3] = &unk_1E5C20ED8;
  v19 = v10;
  v12 = v10;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v18);

  -[NoteHTMLEditorView setAttachmentContentIDs:](self, "setAttachmentContentIDs:", v12);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notewkwebview.replaceAttachmentContentIDs(%@);"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoteHTMLEditorView webView](self, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2;
  v16[3] = &unk_1E5C20F00;
  v16[4] = self;
  v17 = v7;
  v15 = v7;
  objc_msgSend(v14, "evaluateJavaScript:completionHandler:", v13, v16);

}

void __40__NoteHTMLEditorView_replaceContentIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a3;
  objc_msgSend(v5, "URLWithString:", a2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "resourceSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceSpecifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v15, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("cid")) & 1) != 0)
    {
      objc_msgSend(v7, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("cid"));

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v8));
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
      }
    }
    else
    {

    }
  }

}

void __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setAttachmentContentIDs:", *(_QWORD *)(a1 + 40));
  }

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NoteHTMLEditorView;
  v3 = a3;
  -[NoteHTMLEditorView buildMenuWithBuilder:](&v11, sel_buildMenuWithBuilder_, v3);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("INSERT_PHOTO"), CFSTR("Insert Photo"), 0, 1, v11.receiver, v11.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3678];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("camera"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandWithTitle:image:action:propertyList:", v4, v6, sel_insertImage_, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC39D0];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:image:identifier:options:children:", &stru_1E5C2F8C0, 0, 0, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "insertChildMenu:atEndOfMenuForIdentifier:", v10, *MEMORY[0x1E0DC50E0]);
  objc_msgSend(v3, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", *MEMORY[0x1E0DC5158], &__block_literal_global_190);

}

id __43__NoteHTMLEditorView_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0DC3678];
  v3 = (void *)MEMORY[0x1E0D64218];
  v4 = a2;
  objc_msgSend(v3, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Strikethrough"), CFSTR("Strikethrough"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("strikethrough"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandWithTitle:image:action:propertyList:", v5, v6, sel_strikethrough_, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateDataDetectors
{
  _BOOL4 v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = -[NoteHTMLEditorView isEditing](self, "isEditing");
  -[NoteHTMLEditorView webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_removeDataDetectedLinks:", 0);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__NoteHTMLEditorView_updateDataDetectors__block_invoke;
    v6[3] = &unk_1E5C1D540;
    v6[4] = self;
    objc_msgSend(v4, "_detectDataWithTypes:completionHandler:", -1, v6);

  }
}

void __41__NoteHTMLEditorView_updateDataDetectors__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_evaluateJavaScript:", CFSTR("notewkwebview.updateAnchorListeners();"));

}

- (void)setEditable:(BOOL)a3
{
  void *v4;
  char v5;

  self->_editable = a3;
  -[NoteHTMLEditorView webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLoading");

  if ((v5 & 1) == 0)
    -[NoteHTMLEditorView adoptEditableState](self, "adoptEditableState");
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  -[NoteHTMLEditorView updateDataDetectors](self, "updateDataDetectors");
  -[NoteHTMLEditorView updateWebViewEditability](self, "updateWebViewEditability");
}

- (void)updateWebViewEditability
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  if (self->_editing)
  {
    v3 = 1;
  }
  else
  {
    -[NoteHTMLEditorView webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "findInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isFindNavigatorVisible");

  }
  -[NoteHTMLEditorView webView](self, "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isEditable");

  if ((_DWORD)v3 != v7)
  {
    -[NoteHTMLEditorView webView](self, "webView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setEditable:", v3);

  }
}

- (void)adoptEditableState
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = -[NoteHTMLEditorView isEditable](self, "isEditable");
  -[NoteHTMLEditorView webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
    v5 = CFSTR("notewkwebview.enableEditor()");
  else
    v5 = CFSTR("notewkwebview.disableEditor()");
  objc_msgSend(v4, "ic_evaluateJavaScript:", v5);

}

- (void)startEditing
{
  void *v3;
  char v4;
  id v5;

  -[NoteHTMLEditorView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoading");

  if ((v4 & 1) != 0)
  {
    -[NoteHTMLEditorView setStartEditingAfterLoad:](self, "setStartEditingAfterLoad:", 1);
  }
  else
  {
    -[NoteHTMLEditorView setEditing:](self, "setEditing:", 1);
    -[NoteHTMLEditorView webView](self, "webView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_evaluateJavaScript:", CFSTR("notewkwebview.startEditing()"));

  }
}

- (void)stopEditing
{
  -[NoteHTMLEditorView stopEditingWithCompletion:](self, "stopEditingWithCompletion:", 0);
}

- (void)stopEditingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  __CFString *v8;
  id v9;

  v4 = a3;
  -[NoteHTMLEditorView setEditing:](self, "setEditing:", 0);
  -[NoteHTMLEditorView webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke;
  v7[3] = &unk_1E5C20F68;
  v8 = CFSTR("notewkwebview.stopEditing()");
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", CFSTR("notewkwebview.stopEditing()"), v7);

}

void __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke_cold_1();

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v6 == 0);

}

- (void)setInsideSiriSnippet:(BOOL)a3
{
  self->_insideSiriSnippet = a3;
}

- (void)updateContent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  if (-[NoteHTMLEditorView updatingContent](self, "updatingContent"))
  {
    -[NoteHTMLEditorView updateContentDelayer](self, "updateContentDelayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestFire");

  }
  else
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[NoteHTMLEditorView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "noteHTMLEditorViewWillChange:", self);

    }
    -[NoteHTMLEditorView setUpdatingContent:](self, "setUpdatingContent:", 1);
    objc_initWeak(&location, self);
    -[NoteHTMLEditorView webView](self, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__NoteHTMLEditorView_updateContent__block_invoke;
    v8[3] = &unk_1E5C20F90;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    objc_msgSend(v6, "evaluateJavaScript:completionHandler:", CFSTR("getHTMLContentAndAttachmentContentIDURLs();"), v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __35__NoteHTMLEditorView_updateContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("htmlContent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attachmentContentIDURLs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v29 = v7;
      v30 = v5;
      v31 = a1;
      v32 = WeakRetained;
      v33 = v3;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v28 = v9;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v35;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v15);
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v16);
            objc_msgSend(v17, "resourceSpecifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v10, "addObject:", v18);
            }
            else
            {
              v19 = os_log_create("com.apple.notes", "UI");
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v39 = v16;
                _os_log_debug_impl(&dword_1AC7A1000, v19, OS_LOG_TYPE_DEBUG, "couldn't convert content ID URL string %@ to URL", buf, 0xCu);
              }

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v13);
      }

      WeakRetained = v32;
      objc_msgSend(v32, "setAttachmentContentIDs:", v10);
      objc_msgSend(v32, "setHasAttachments:", objc_msgSend(v10, "count") != 0);
      v3 = v33;
      v5 = v30;
      a1 = v31;
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(*(id *)(v31 + 32), "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_opt_respondsToSelector();

        if ((v21 & 1) != 0)
        {
          objc_msgSend(*(id *)(v31 + 32), "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "noteHTMLEditorView:updateAttachments:", *(_QWORD *)(v31 + 32), v11);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "count"))
            objc_msgSend(*(id *)(v31 + 32), "replaceContentIDs:", v23);

        }
      }

      v9 = v28;
      v7 = v29;
    }
    if (v7)
    {
      v24 = objc_msgSend(v7, "isEqualToString:", WeakRetained[60]);
      objc_storeStrong(WeakRetained + 60, v7);
      if ((v24 & 1) == 0)
      {
        objc_msgSend(WeakRetained, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_respondsToSelector();

        if ((v26 & 1) != 0)
        {
          objc_msgSend(WeakRetained, "delegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "noteHTMLEditorViewDidChange:", *(_QWORD *)(a1 + 32));

        }
      }
    }
    objc_msgSend(WeakRetained, "setUpdatingContent:", 0, v28);

  }
}

- (void)insertImage:(id)a3
{
  id v4;

  -[NoteHTMLEditorView actionDelegate](self, "actionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertImageInNoteHTMLEditorView:", self);

}

- (void)insertBulletedList:(id)a3
{
  id v3;

  -[NoteHTMLEditorView webView](self, "webView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_evaluateJavaScript:", CFSTR("notewkwebview.insertBulletedList();"));

}

- (void)insertDashedList:(id)a3
{
  id v3;

  -[NoteHTMLEditorView webView](self, "webView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_evaluateJavaScript:", CFSTR("notewkwebview.insertDashedList();"));

}

- (void)insertOrderedList:(id)a3
{
  id v3;

  -[NoteHTMLEditorView webView](self, "webView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_evaluateJavaScript:", CFSTR("notewkwebview.insertNumberedList();"));

}

- (void)removeStyle:(id)a3
{
  id v3;

  -[NoteHTMLEditorView webView](self, "webView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_evaluateJavaScript:", CFSTR("notewkwebview.removeStyle();"));

}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  id v3;

  -[NoteHTMLEditorView webView](self, "webView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_evaluateJavaScript:", CFSTR("notewkwebview.scrollSelectionToVisible()"));

}

- (void)getRectForSelectionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NoteHTMLEditorView webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke;
  v7[3] = &unk_1E5C20FB8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", CFSTR("notewkwebview.getSelectionRects()"), v7);

}

void __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double x;
  double y;
  double width;
  double height;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    v8 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke_cold_1();

    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v7);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v17, "count") == 4)
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            v20 = v19;
            objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v23 = v22;
            objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            v26 = v25;
            objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "doubleValue");
            v29 = v28;

            v38.origin.x = x;
            v38.origin.y = y;
            v38.size.width = width;
            v38.size.height = height;
            v40.origin.x = v20;
            v40.origin.y = v23;
            v40.size.width = v26;
            v40.size.height = v29;
            v39 = CGRectUnion(v38, v40);
            x = v39.origin.x;
            y = v39.origin.y;
            width = v39.size.width;
            height = v39.size.height;
          }
        }
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v14);
    }
  }
  v30 = *(_QWORD *)(a1 + 32);
  if (v30)
    (*(void (**)(uint64_t, id, double, double, double, double))(v30 + 16))(v30, v5, x, y, width, height);

}

- (void)setSelectionToStart
{
  void *v3;
  char v4;
  id v5;

  -[NoteHTMLEditorView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoading");

  if ((v4 & 1) == 0)
  {
    -[NoteHTMLEditorView webView](self, "webView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_evaluateJavaScript:", CFSTR("notewkwebview.setSelectionToStart();"));

  }
}

- (void)setSelectionToEnd
{
  void *v3;
  char v4;
  id v5;

  -[NoteHTMLEditorView webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoading");

  if ((v4 & 1) != 0)
  {
    -[NoteHTMLEditorView setSetSelectionToEndAfterLoad:](self, "setSetSelectionToEndAfterLoad:", 1);
  }
  else
  {
    -[NoteHTMLEditorView webView](self, "webView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_evaluateJavaScript:", CFSTR("notewkwebview.setSelectionToEnd();"));

  }
}

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[NoteHTMLEditorView webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  if (sel_insertImage_ == a3)
  {
    if (-[NoteHTMLEditorView isEditing](self, "isEditing"))
    {
      -[NoteHTMLEditorView actionDelegate](self, "actionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "canInsertImagesInNoteHTMLEditorView:", self);

      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if (sel_strikethrough_ == a3)
  {
    if (-[NoteHTMLEditorView isEditing](self, "isEditing"))
    {
      v7 = -[NoteHTMLEditorView selectionLength](self, "selectionLength") > 0;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)NoteHTMLEditorView;
  v7 = -[NoteHTMLEditorView canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, v6);
LABEL_9:

  return v7;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  NoteHTMLEditorView *v7;
  NoteHTMLEditorView *v8;
  objc_super v10;

  v6 = a4;
  if (-[NoteHTMLEditorView canPerformAction:withSender:](self, "canPerformAction:withSender:", a3, v6))
  {
    v7 = self;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NoteHTMLEditorView;
    -[NoteHTMLEditorView targetForAction:withSender:](&v10, sel_targetForAction_withSender_, a3, v6);
    v7 = (NoteHTMLEditorView *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  int v6;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self);

  if (v6)
    -[NoteHTMLEditorView startEditing](self, "startEditing");
}

- (void)scrollViewDidScroll:(id)a3
{
  double v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  if (v3 != 0.0)
  {
    objc_msgSend(v4, "contentOffset");
    objc_msgSend(v4, "setContentOffset:", 0.0);
  }

}

- (BOOL)_webView:(id)a3 focusShouldStartInputSession:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[NoteHTMLEditorView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "noteHTMLEditorViewShouldBeginEditing:isUserInitiated:", self, objc_msgSend(v5, "isUserInitiated"));

  }
  else
  {
    v9 = -[NoteHTMLEditorView isEditable](self, "isEditable");
  }

  return v9;
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  void *v5;
  char v6;
  id v7;

  objc_msgSend(a4, "setAccessoryViewShouldNotShow:", 1);
  -[NoteHTMLEditorView setEditing:](self, "setEditing:", 1);
  -[NoteHTMLEditorView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteHTMLEditorViewDidBeginEditing:", self);

  }
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  int v8;

  -[NoteHTMLEditorView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 1;
  -[NoteHTMLEditorView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNoteManagedForNoteHTMLEditorView:", self);

  if (v8)
    return 2;
  else
    return 1;
}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  int v8;

  -[NoteHTMLEditorView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 1;
  -[NoteHTMLEditorView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNoteManagedForNoteHTMLEditorView:", self);

  if (v8)
    return 2;
  else
    return 1;
}

- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  BOOL v13;

  v5 = a4;
  -[NoteHTMLEditorView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "noteHTMLEditorView:canAddAttachmentItemProviders:", self, v5);

    if (!v9)
      goto LABEL_5;
  }
  -[NoteHTMLEditorView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "noteHTMLEditorView:addAttachmentItemProviders:", self, v5);

    v13 = 1;
  }
  else
  {
LABEL_5:
    v13 = 0;
  }

  return v13;
}

- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("cid"));

  if (v11)
  {
    objc_msgSend(v9, "resourceSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteHTMLEditorView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "noteHTMLEditorView:attachmentPresentationForContentID:", self, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3650]);
      objc_msgSend(v14, "dataFileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v17 = (void *)objc_msgSend(v15, "initWithURL:options:error:", v16, 0, &v36);
      v18 = v36;

      if (v18 || !v17)
      {
        v20 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "dataFileURL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v38 = v12;
          v39 = 2112;
          v40 = v32;
          v41 = 2112;
          v42 = v18;
          _os_log_error_impl(&dword_1AC7A1000, v20, OS_LOG_TYPE_ERROR, "Could not create file wrapper for content ID %@ and URL: %@ – %@", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(v14, "mimeType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke;
        v33[3] = &unk_1E5C20FE0;
        v34 = v14;
        v35 = v12;
        objc_msgSend(v7, "setFileWrapper:contentType:completion:", v17, v19, v33);

        v20 = v34;
      }

    }
    goto LABEL_17;
  }
  -[NoteHTMLEditorView delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fileWrapper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "noteHTMLEditorView:createAttachmentPresentationWithFileWrapper:mimeType:", self, v25, v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v8 && objc_msgSend(v8, "length"))
    {
      objc_msgSend(v12, "contentIDURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "absoluteString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, v8);
    }
    else
    {
      objc_msgSend(v12, "contentIDURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "absoluteString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, v31);

    }
    -[NoteHTMLEditorView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_replaceContentIDs_, v28, 0.0);

LABEL_17:
  }

}

void __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke_cold_1(a1, v3, v4);

  }
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v7 = (void (**)(id, void *))a5;
  objc_msgSend(v18, "_activatedElementInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") == 1)
  {
    objc_msgSend(v8, "imageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "type") == 2)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("cid"));

  if (v13)
  {
    objc_msgSend(v9, "resourceSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[NoteHTMLEditorView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "noteHTMLEditorView:attachmentPresentationForContentID:", self, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NoteHTMLEditorView contextMenuConfigurationForElement:presentation:](self, "contextMenuConfigurationForElement:presentation:", v18, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v16, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("about:blank")))
  {
    v11 = objc_msgSend(v16, "navigationType");

    if (v11 == -1)
    {
      v12 = 1;
      goto LABEL_9;
    }
  }
  else
  {

  }
  if ((-[NoteHTMLEditorView performActionForDataDetectedInURL:](self, "performActionForDataDetectedInURL:", v9) & 1) == 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[NoteHTMLEditorView delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "noteHTMLEditorView:openURL:", self, v9);

    }
  }
  v12 = 0;
LABEL_9:
  v7[2](v7, v12);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NoteHTMLEditorView htmlStringToLoad](self, "htmlStringToLoad", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NoteHTMLEditorView htmlStringToLoad](self, "htmlStringToLoad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteHTMLEditorView attachmentsToLoad](self, "attachmentsToLoad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NoteHTMLEditorView setHtmlStringToLoad:](self, "setHtmlStringToLoad:", 0);
    -[NoteHTMLEditorView setAttachmentsToLoad:](self, "setAttachmentsToLoad:", 0);
    -[NoteHTMLEditorView setHtmlString:attachments:](self, "setHtmlString:attachments:", v6, v7);

  }
  -[NoteHTMLEditorView adoptEditableState](self, "adoptEditableState");
  -[NoteHTMLEditorView webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[NoteHTMLEditorView setEnableShiftNewlinesInSmartLists:](self, "setEnableShiftNewlinesInSmartLists:", 0);
  if (-[NoteHTMLEditorView setSelectionToEndAfterLoad](self, "setSelectionToEndAfterLoad"))
  {
    -[NoteHTMLEditorView setSetSelectionToEndAfterLoad:](self, "setSetSelectionToEndAfterLoad:", 0);
    -[NoteHTMLEditorView setSelectionToEnd](self, "setSelectionToEnd");
  }
  if (-[NoteHTMLEditorView startEditingAfterLoad](self, "startEditingAfterLoad"))
  {
    -[NoteHTMLEditorView setStartEditingAfterLoad:](self, "setStartEditingAfterLoad:", 0);
    -[NoteHTMLEditorView startEditing](self, "startEditing");
  }
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  NSString *htmlString;
  void *v5;
  void *v6;
  char v7;
  id v8;

  htmlString = self->_htmlString;
  self->_htmlString = 0;

  -[NoteHTMLEditorView setAttachmentContentIDs:](self, "setAttachmentContentIDs:", 0);
  -[NoteHTMLEditorView webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[NoteHTMLEditorView setupWebView](self, "setupWebView");
  -[NoteHTMLEditorView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noteHTMLEditorViewNeedsContentReload:", self);

  }
}

- (void)didReceiveScriptMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  dispatch_time_t v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD block[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("textDidChange"));

  if (v6)
  {
    -[NoteHTMLEditorView updateContentDelayer](self, "updateContentDelayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestFire");
LABEL_32:

    goto LABEL_33;
  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("attachmentsDidChange"));

  if (v9)
  {
    objc_opt_class();
    objc_msgSend(v4, "body");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v4, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[NoteHTMLEditorView setHasAttachments:](self, "setHasAttachments:", objc_msgSend(v13, "BOOLValue"));
    if (v11)
    {
      v48 = v13;
      v50 = v4;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v49 = v11;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v53;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v53 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v19);
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v20);
            objc_msgSend(v21, "resourceSpecifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_msgSend(v14, "addObject:", v22);
            }
            else
            {
              v23 = os_log_create("com.apple.notes", "UI");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v57 = v20;
                _os_log_debug_impl(&dword_1AC7A1000, v23, OS_LOG_TYPE_DEBUG, "couldn't convert content ID URL string %@ to URL", buf, 0xCu);
              }

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        }
        while (v17);
      }

      -[NoteHTMLEditorView setAttachmentContentIDs:](self, "setAttachmentContentIDs:", v14);
      -[NoteHTMLEditorView setHasAttachments:](self, "setHasAttachments:", objc_msgSend(v14, "count") != 0);

      v4 = v50;
      v13 = v48;
      v11 = v49;
    }
    else
    {
      -[NoteHTMLEditorView updateContentDelayer](self, "updateContentDelayer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "requestFire");

    }
    goto LABEL_25;
  }
  objc_msgSend(v4, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("titleDidChange"));

  if (v25)
  {
    objc_opt_class();
    objc_msgSend(v4, "body");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NoteHTMLEditorView setTitle:](self, "setTitle:", v7);
    goto LABEL_32;
  }
  objc_msgSend(v4, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("selectionDidChange"));

  if (v31)
  {
    objc_opt_class();
    objc_msgSend(v4, "body");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("selectionLength"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(v13, "integerValue");
    objc_opt_class();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("listStyle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[NoteHTMLEditorView setSelectionLength:](self, "setSelectionLength:", v34);
    -[NoteHTMLEditorView setListStyle:](self, "setListStyle:", objc_msgSend(v36, "characterAtIndex:", 0));

LABEL_25:
    goto LABEL_33;
  }
  objc_msgSend(v4, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("editorDidBlur"));

  if (v39)
  {
    -[NoteHTMLEditorView setEditing:](self, "setEditing:", 0);
    -[NoteHTMLEditorView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteHTMLEditorViewDidEndEditing:", self);
    goto LABEL_32;
  }
  objc_msgSend(v4, "name");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("anchorTouchesDidEnd"));

  if (v41)
  {
    v42 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__NoteHTMLEditorView_didReceiveScriptMessage___block_invoke;
    block[3] = &unk_1E5C1D540;
    block[4] = self;
    dispatch_after(v42, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    objc_msgSend(v4, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("clickedAttachment"));

    if (v44)
    {
      objc_opt_class();
      objc_msgSend(v4, "body");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "scheme");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lowercaseString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "isEqualToString:", CFSTR("cid"));

      goto LABEL_32;
    }
  }
LABEL_33:

}

uint64_t __46__NoteHTMLEditorView_didReceiveScriptMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adoptEditableState");
}

- (void)loadAttachmentContentForURLSchemeTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CB34C8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__NoteHTMLEditorView_loadAttachmentContentForURLSchemeTask___block_invoke;
  v12[3] = &unk_1E5C1F098;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "blockOperationWithBlock:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v10);

  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v7);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __60__NoteHTMLEditorView_loadAttachmentContentForURLSchemeTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("cid"));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "resourceSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0
      && (objc_msgSend(WeakRetained, "delegate"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "noteHTMLEditorView:fileURLForAttachmentWithContentID:", WeakRetained, v10),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v13))
    {
      v14 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v13, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "typeWithFilenameExtension:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "preferredMIMEType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "preferredMIMEType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc(MEMORY[0x1E0CB39E8]);
      objc_msgSend(*(id *)(a1 + 32), "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "URL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v32, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v34, v19, objc_msgSend(v31, "length"), 0);

      objc_msgSend(*(id *)(a1 + 32), "didReceiveResponse:", v35);
      objc_msgSend(*(id *)(a1 + 32), "didReceiveData:", v31);
      objc_msgSend(*(id *)(a1 + 32), "didFinish");

      v20 = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0
        && (objc_msgSend(WeakRetained, "delegate"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v23, "noteHTMLEditorView:attachmentPresentationForContentID:", WeakRetained, v10),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v23,
            v24))
      {
        v37 = 0;
        v38 = 0;
        v36 = 0;
        objc_msgSend(v24, "getPresentationData:mimeType:error:", &v38, &v37, &v36);
        v25 = v38;
        v26 = v37;
        v20 = v36;
        v27 = objc_alloc(MEMORY[0x1E0CB39E8]);
        objc_msgSend(*(id *)(a1 + 32), "request");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "URL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v27, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v29, v26, objc_msgSend(v25, "length"), 0);

        objc_msgSend(*(id *)(a1 + 32), "didReceiveResponse:", v30);
        objc_msgSend(*(id *)(a1 + 32), "didReceiveData:", v25);
        objc_msgSend(*(id *)(a1 + 32), "didFinish");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1100, 0);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "didFailWithError:", v20);
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1002, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "didFailWithError:", v20);
  }

}

- (id)contextMenuConfigurationForElement:(id)a3 presentation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  NoteHTMLEditorView *v16;

  v6 = a4;
  objc_msgSend(a3, "_activatedElementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC36B8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_2;
  v13[3] = &unk_1E5C21098;
  v14 = v6;
  v15 = v7;
  v16 = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "configurationWithIdentifier:previewProvider:actionProvider:", 0, &__block_literal_global_272, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke()
{
  return 0;
}

id __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *);
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Copy"), CFSTR("Copy"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_3;
  v21[3] = &unk_1E5C21048;
  v22 = *(id *)(a1 + 32);
  objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v4, CFSTR("doc.on.doc"), v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v6);
  v7 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Share"), CFSTR("Share"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v15 = 3221225472;
  v16 = __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_4;
  v17 = &unk_1E5C21070;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v18 = v9;
  v19 = v10;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v7, "ic_actionWithTitle:imageName:handler:", v8, CFSTR("square.and.arrow.up"), &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v11, v14, v15, v16, v17);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5C2F8C0, 0, 0, 0, v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mimeType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(*(id *)(a1 + 32), "mimeType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "typeWithMIMEType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v7 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(*(id *)(a1 + 32), "dataFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithContentsOfURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v9, v6);
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSuggestedName:", v11);

  objc_msgSend(v10, "setPreferredPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setItemProviders:", v13);

}

void __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_4(id *a1)
{
  double MidX;
  double MidY;
  id v4;
  void *v5;
  id v6;
  CGRect v7;
  CGRect v8;

  objc_msgSend(a1[4], "boundingRect");
  MidX = CGRectGetMidX(v7);
  objc_msgSend(a1[4], "boundingRect");
  MidY = CGRectGetMidY(v8);
  objc_msgSend(a1[5], "actionDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = a1[5];
  objc_msgSend(a1[6], "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteHTMLEditorView:showShareSheetForAttachment:atPoint:", v4, v5, MidX, MidY);

}

- (void)updateDataOwnerForCopyAndPaste
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[NoteHTMLEditorView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NoteHTMLEditorView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isNoteManagedForNoteHTMLEditorView:", self);

    if (v6)
      v7 = 2;
    else
      v7 = 1;
  }
  else
  {
    v7 = 1;
  }
  -[NoteHTMLEditorView _setDataOwnerForCopy:](self, "_setDataOwnerForCopy:", v7);
  -[NoteHTMLEditorView _setDataOwnerForPaste:](self, "_setDataOwnerForPaste:", v7);
  -[NoteHTMLEditorView webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setDataOwnerForCopy:", v7);

  -[NoteHTMLEditorView webView](self, "webView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDataOwnerForPaste:", v7);

}

- (NoteHTMLEditorViewDelegate)delegate
{
  return (NoteHTMLEditorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NoteHTMLEditorViewActionDelegate)actionDelegate
{
  return (NoteHTMLEditorViewActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (NoteHTMLEditorViewLayoutDelegate)layoutDelegate
{
  return (NoteHTMLEditorViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (NSLayoutConstraint)contentSizeHeightConstraint
{
  return self->_contentSizeHeightConstraint;
}

- (void)setContentSizeHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeHeightConstraint, a3);
}

- (NSLayoutConstraint)contentSizeWidthConstraint
{
  return self->_contentSizeWidthConstraint;
}

- (void)setContentSizeWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeWidthConstraint, a3);
}

- (NoteWKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSString)htmlString
{
  return self->_htmlString;
}

- (void)setHtmlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSArray)attachmentContentIDs
{
  return self->_attachmentContentIDs;
}

- (void)setAttachmentContentIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (int64_t)selectionLength
{
  return self->_selectionLength;
}

- (void)setSelectionLength:(int64_t)a3
{
  self->_selectionLength = a3;
}

- (unsigned)listStyle
{
  return self->_listStyle;
}

- (void)setListStyle:(unsigned __int16)a3
{
  self->_listStyle = a3;
}

- (BOOL)isInsideSiriSnippet
{
  return self->_insideSiriSnippet;
}

- (NSString)htmlStringToLoad
{
  return self->_htmlStringToLoad;
}

- (void)setHtmlStringToLoad:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSArray)attachmentsToLoad
{
  return self->_attachmentsToLoad;
}

- (void)setAttachmentsToLoad:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void)setUpdateContentDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_updateContentDelayer, a3);
}

- (BOOL)updatingContent
{
  return self->_updatingContent;
}

- (void)setUpdatingContent:(BOOL)a3
{
  self->_updatingContent = a3;
}

- (BOOL)setSelectionToEndAfterLoad
{
  return self->_setSelectionToEndAfterLoad;
}

- (void)setSetSelectionToEndAfterLoad:(BOOL)a3
{
  self->_setSelectionToEndAfterLoad = a3;
}

- (BOOL)startEditingAfterLoad
{
  return self->_startEditingAfterLoad;
}

- (void)setStartEditingAfterLoad:(BOOL)a3
{
  self->_startEditingAfterLoad = a3;
}

- (NoteHTMLEditorViewURLSchemeHandler)urlSchemeHandler
{
  return self->_urlSchemeHandler;
}

- (void)setUrlSchemeHandler:(id)a3
{
  objc_storeStrong((id *)&self->_urlSchemeHandler, a3);
}

- (NoteHTMLEditorViewScriptMessageHandler)scriptMessageHandler
{
  return self->_scriptMessageHandler;
}

- (void)setScriptMessageHandler:(id)a3
{
  objc_storeStrong((id *)&self->_scriptMessageHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptMessageHandler, 0);
  objc_storeStrong((id *)&self->_urlSchemeHandler, 0);
  objc_storeStrong((id *)&self->_updateContentDelayer, 0);
  objc_storeStrong((id *)&self->_attachmentsToLoad, 0);
  objc_storeStrong((id *)&self->_htmlStringToLoad, 0);
  objc_storeStrong((id *)&self->_attachmentContentIDs, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_htmlString, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentSizeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentSizeHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)jsonStringFromDictionaryOrArray:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Error converting object to JSON: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)jsonStringFromDictionaryOrArray:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Trying to convert an object to JSON which is not an array or dictionary, class: %@", v4, 0xCu);

}

void __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Could not replace attachment content IDs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_3(&dword_1AC7A1000, v0, v1, "failed to execute JavaScriptString: %@ - JavaScript error: %@");
  OUTLINED_FUNCTION_2();
}

void __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "can't get selection rect from NoteWKWebView, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mimeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Could not set file wrapper with mime type %@ for attachment %@ – %@", (uint8_t *)&v9, 0x20u);

}

@end
