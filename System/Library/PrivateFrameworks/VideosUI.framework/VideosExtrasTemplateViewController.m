@implementation VideosExtrasTemplateViewController

- (VideosExtrasTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  VideosExtrasTemplateViewController *v12;
  VideosExtrasTemplateViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VideosExtrasTemplateViewController;
  v12 = -[VideosExtrasElementViewController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a4);
    objc_storeStrong((id *)&v13->_document, a3);
    -[IKAppDocument setDelegate:](v13->_document, "setDelegate:", v13);
    objc_storeWeak((id *)&v13->_context, v11);
    -[IKAppDocument onLoad](v13->_document, "onLoad");
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[IKAppDocument onUnload](self->_document, "onUnload");
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasTemplateViewController;
  -[VideosExtrasElementViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)showsPlaceholder
{
  return 1;
}

- (void)_showPlaceholder
{
  void *v2;
  id v3;

  -[VideosExtrasTemplateViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[VideosExtrasTemplateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  if (-[VideosExtrasTemplateViewController showsPlaceholder](self, "showsPlaceholder"))
    -[VideosExtrasTemplateViewController _showPlaceholder](self, "_showPlaceholder");
  -[VideosExtrasTemplateViewController documentDidUpdate:](self, "documentDidUpdate:", self->_document);

}

- (void)_startBackgroundAudio
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "applicationState");

  if (v4 != 2)
  {
    -[VideosExtrasTemplateViewController document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "templateElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "performSelector:withObject:", sel_background, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[VideosExtrasTemplateViewController context](self, "context");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "audio");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v7, "audio");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "extrasRequestsMediaPlayback:isBackground:", v11, 1);

        }
      }

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[VideosExtrasTemplateViewController _startBackgroundAudio](self, "_startBackgroundAudio");
  -[VideosExtrasTemplateViewController document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onAppear");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[VideosExtrasTemplateViewController document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onDisappear");

}

- (void)documentDidUpdate:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSDictionary *options;
  id WeakRetained;
  void *displayedTemplate;
  void *v10;
  IKViewElement *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "templateElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VideosExtrasTemplateViewController shouldUpdateByReplacingViewControllerWithTemplate:](self, "shouldUpdateByReplacingViewControllerWithTemplate:", v4);

  if (!v5)
  {
    objc_msgSend(v12, "templateElement");
    v11 = (IKViewElement *)objc_claimAutoreleasedReturnValue();
    displayedTemplate = self->_displayedTemplate;
    self->_displayedTemplate = v11;
    goto LABEL_5;
  }
  v6 = (void *)objc_opt_class();
  options = self->_options;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v6, "templateViewControllerWithDocument:options:context:", v12, options, WeakRetained);
  displayedTemplate = (void *)objc_claimAutoreleasedReturnValue();

  if (displayedTemplate)
  {
    -[VideosExtrasTemplateViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_VideosExtras_replaceViewController:withViewController:animated:", self, displayedTemplate, 0);

LABEL_5:
  }

}

- (void)documentDidFail:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v7, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v11);
  v12 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:", CFSTR("CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__VideosExtrasTemplateViewController_documentDidFail_withError___block_invoke;
  v19 = &unk_1E9F9A7A8;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15, v16, v17, v18, v19);

  -[VideosExtrasTemplateViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __64__VideosExtrasTemplateViewController_documentDidFail_withError___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)shouldUpdateByReplacingViewControllerWithTemplate:(id)a3
{
  IKViewElement *displayedTemplate;
  BOOL v4;

  displayedTemplate = self->_displayedTemplate;
  if (displayedTemplate)
    v4 = displayedTemplate == a3;
  else
    v4 = 1;
  return !v4;
}

- (void)configureBackgroundWithElements:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VideosExtrasTemplateViewController;
  -[VideosExtrasElementViewController configureBackgroundWithElements:](&v20, sel_configureBackgroundWithElements_, v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "audio", (_QWORD)v16);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            WeakRetained = objc_loadWeakRetained((id *)&self->_context);
            objc_msgSend(v10, "audio");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "extrasRequestsMediaPlayback:isBackground:", v15, 1);

            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

+ (id)templateViewControllerWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (templateViewControllerWithDocument_options_context__onceToken != -1)
    dispatch_once(&templateViewControllerWithDocument_options_context__onceToken, &__block_literal_global_18);
  objc_msgSend(v8, "templateElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "templateElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
      objc_msgSend(v10, "extrasRequestsMediaPlayback:isBackground:", v14, 0);

    v15 = 0;
  }
  else
  {
    v16 = (void *)templateViewControllerWithDocument_options_context__templateMap;
    objc_msgSend(v8, "templateElement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)(id)objc_msgSend(v16, "objectForKey:", v19);

    if (v20)
      v21 = v20;
    else
      v21 = (objc_class *)a1;
    v15 = (void *)objc_msgSend([v21 alloc], "initWithDocument:options:context:", v8, v9, v10);
  }

  return v15;
}

void __89__VideosExtrasTemplateViewController_templateViewControllerWithDocument_options_context___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("IKGalleryTemplate");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("IKListTemplate");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("IKMainTemplate");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("IKShowcaseTemplate");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("IKSlideshowElement");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("IKStackTemplate");
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)templateViewControllerWithDocument_options_context__templateMap;
  templateViewControllerWithDocument_options_context__templateMap = v0;

}

- (IKAppDocument)document
{
  return self->_document;
}

- (VideosExtrasContext)context
{
  return (VideosExtrasContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_displayedTemplate, 0);
}

@end
