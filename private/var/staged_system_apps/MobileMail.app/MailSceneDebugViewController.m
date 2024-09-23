@implementation MailSceneDebugViewController

+ (id)title
{
  return CFSTR("Mail UISceneSessions");
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailSceneDebugViewController;
  -[MailSceneDebugViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneDebugViewController view](self, "view"));
  v4 = objc_alloc((Class)UITextView);
  objc_msgSend(v3, "frame");
  v5 = objc_msgSend(v4, "initWithFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setEditable:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  -[MailSceneDebugViewController setTextView:](self, "setTextView:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MailSceneDebugViewController;
  -[MailSceneDebugViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailSceneDebugViewController title](MailSceneDebugViewController, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneDebugViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 13, self, "_loadDebugInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneDebugViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MailSceneDebugViewController;
  -[MailSceneDebugViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[MailSceneDebugViewController _loadDebugInfo](self, "_loadDebugInfo");
}

- (void)selectAll:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneDebugViewController textView](self, "textView"));
  objc_msgSend(v4, "selectAll:", v5);

}

- (void)_loadDebugInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneDebugViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mf_debugDescription"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Current Scene Session:\n%@\n"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "openSessions"));

  objc_msgSend(v3, "appendFormat:", CFSTR("All Scene Sessions (%lu):\n"), objc_msgSend(v10, "count"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14), "mf_debugDescription"));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneDebugViewController textView](self, "textView"));
  objc_msgSend(v16, "setText:", v3);

}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
