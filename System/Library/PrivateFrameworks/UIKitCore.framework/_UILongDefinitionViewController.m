@implementation _UILongDefinitionViewController

- (_UILongDefinitionViewController)initWithDefinitionValue:(id)a3
{
  id v5;
  _UILongDefinitionViewController *v6;
  _UILongDefinitionViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UILongDefinitionViewController;
  v6 = -[UIViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_definitionValue, a3);
    -[_UIDefinitionValue term](v7->_definitionValue, "term");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v24.receiver = self;
  v24.super_class = (Class)_UILongDefinitionViewController;
  -[UIViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v4 = (void *)_MergedGlobals_5_5;
  v33 = _MergedGlobals_5_5;
  if (!_MergedGlobals_5_5)
  {
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __get_WKUserStyleSheetClass_block_invoke;
    v28 = &unk_1E16B14C0;
    v29 = &v30;
    __get_WKUserStyleSheetClass_block_invoke((uint64_t)&v25);
    v4 = (void *)v31[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v30, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithSource:forMainFrameOnly:", CFSTR(":root{color-scheme:light dark;} a{pointer-events:none !important;}"),
                 0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v7 = (void *)qword_1ECD7A908;
  v33 = qword_1ECD7A908;
  if (!qword_1ECD7A908)
  {
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __getWKUserContentControllerClass_block_invoke;
    v28 = &unk_1E16B14C0;
    v29 = &v30;
    __getWKUserContentControllerClass_block_invoke((uint64_t)&v25);
    v7 = (void *)v31[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v30, 8);
  v9 = objc_alloc_init(v8);
  objc_msgSend(v9, "_addUserStyleSheet:", v6);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v10 = (void *)qword_1ECD7A910;
  v33 = qword_1ECD7A910;
  if (!qword_1ECD7A910)
  {
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __getWKWebViewConfigurationClass_block_invoke;
    v28 = &unk_1E16B14C0;
    v29 = &v30;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v25);
    v10 = (void *)v31[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v30, 8);
  v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "setUserContentController:", v9);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v13 = (void *)qword_1ECD7A918;
  v33 = qword_1ECD7A918;
  if (!qword_1ECD7A918)
  {
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __getWKWebViewClass_block_invoke;
    v28 = &unk_1E16B14C0;
    v29 = &v30;
    __getWKWebViewClass_block_invoke((uint64_t)&v25);
    v13 = (void *)v31[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v30, 8);
  v15 = [v14 alloc];
  objc_msgSend(v3, "bounds");
  v16 = (void *)objc_msgSend(v15, "initWithFrame:configuration:", v12);
  objc_msgSend(v16, "setOpaque:", 0);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  objc_msgSend(v16, "setAllowsLinkPreview:", 0);
  objc_msgSend(v16, "setAutoresizingMask:", 18);
  v18 = (void *)MEMORY[0x1E0CB37A0];
  -[_UIDefinitionValue longDefinition](self->_definitionValue, "longDefinition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "rangeOfString:", CFSTR("</head>"));
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v20, "replaceCharactersInRange:withString:", v21, v22, CFSTR("<meta name='viewport' content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0'></head>"));
  v23 = (id)objc_msgSend(v16, "loadHTMLString:baseURL:", v20, 0);
  objc_msgSend(v3, "addSubview:", v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionValue, 0);
}

@end
