@implementation TPSViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSViewController;
  -[TPSViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultBackgroundColor](TPSAppearance, "defaultBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (TPSViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TPSViewController *v4;
  TPSViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSViewController;
  v4 = -[TPSViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[TPSViewController commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  NSUUID *v3;
  NSUUID *networkMonitorToken;
  void *v5;
  NSUUID *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_opt_new(NSUUID);
  networkMonitorToken = self->_networkMonitorToken;
  self->_networkMonitorToken = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor"));
  v6 = self->_networkMonitorToken;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000217A8;
  v7[3] = &unk_1000A29D8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "addObserverForKey:using:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)removeInlineMessageLabel
{
  UILabel *messageLabel;
  NSString *messageLabelTitle;
  NSString *messageLabelDetailText;

  -[UILabel removeFromSuperview](self->_messageLabel, "removeFromSuperview");
  messageLabel = self->_messageLabel;
  self->_messageLabel = 0;

  messageLabelTitle = self->_messageLabelTitle;
  self->_messageLabelTitle = 0;

  messageLabelDetailText = self->_messageLabelDetailText;
  self->_messageLabelDetailText = 0;

}

- (void)setLoading:(BOOL)a3
{
  TPSLoadingView *loadingView;
  void *v5;
  TPSLoadingView *v6;
  TPSLoadingView *v7;
  void *v8;
  void *v9;
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
  TPSLoadingView *v20;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    loadingView = self->_loadingView;
    if (a3)
    {
      if (!loadingView)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController view](self, "view"));
        v6 = (TPSLoadingView *)objc_alloc_init((Class)TPSLoadingView);
        v7 = self->_loadingView;
        self->_loadingView = v6;

        -[TPSLoadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v5, "addSubview:", self->_loadingView);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView topAnchor](self->_loadingView, "topAnchor"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
        objc_msgSend(v10, "setActive:", 1);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView bottomAnchor](self->_loadingView, "bottomAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
        objc_msgSend(v13, "setActive:", 1);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView leadingAnchor](self->_loadingView, "leadingAnchor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
        objc_msgSend(v16, "setActive:", 1);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSLoadingView trailingAnchor](self->_loadingView, "trailingAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
        objc_msgSend(v19, "setActive:", 1);

      }
      -[TPSViewController removeInlineMessageLabel](self, "removeInlineMessageLabel");
    }
    else
    {
      -[TPSLoadingView removeFromSuperview](loadingView, "removeFromSuperview");
      v20 = self->_loadingView;
      self->_loadingView = 0;

    }
  }
}

- (TPSViewController)init
{
  TPSViewController *v2;
  TPSViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSViewController;
  v2 = -[TPSViewController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[TPSViewController commonInit](v2, "commonInit");
  return v3;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController networkMonitorToken](self, "networkMonitorToken"));
  objc_msgSend(v4, "removeObserverForKey:", v5);

  v6.receiver = self;
  v6.super_class = (Class)TPSViewController;
  -[TPSViewController dealloc](&v6, "dealloc");
}

- (TPSViewController)initWithCoder:(id)a3
{
  TPSViewController *v3;
  TPSViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSViewController;
  v3 = -[TPSViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[TPSViewController commonInit](v3, "commonInit");
  return v4;
}

- (TPSKVOManager)KVOManager
{
  TPSKVOManager *KVOManager;
  TPSKVOManager *v4;
  TPSKVOManager *v5;

  KVOManager = self->_KVOManager;
  if (!KVOManager)
  {
    v4 = (TPSKVOManager *)objc_msgSend(objc_alloc((Class)TPSKVOManager), "initWithObserver:", self);
    v5 = self->_KVOManager;
    self->_KVOManager = v4;

    KVOManager = self->_KVOManager;
  }
  return KVOManager;
}

- (void)contentSizeCategoryDidChange
{
  if (*(_OWORD *)&self->_messageLabelTitle != 0)
    -[TPSViewController showInlineLabelWithTitle:message:](self, "showInlineLabelWithTitle:message:");
}

- (void)showInlineMessageForError:(id)a3
{
  if (+[TPSNetworkPathMonitor isNetworkError:](TPSNetworkPathMonitor, "isNetworkError:", a3))-[TPSViewController showInlineNoConnectionMessage](self, "showInlineNoConnectionMessage");
  else
    -[TPSViewController showInlineGenericErrorMessage](self, "showInlineGenericErrorMessage");
}

- (void)showInlineGenericErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController defaultErrorTitleText](self, "defaultErrorTitleText"));
  v4 = v3;
  if (v3)
  {
    v8 = v3;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOAD_ERROR_UNKNOWN_TITLE"), &stru_1000A5680, 0));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOAD_ERROR_MESSAGE"), &stru_1000A5680, 0));

  -[TPSViewController showInlineLabelWithTitle:message:](self, "showInlineLabelWithTitle:message:", v8, v7);
}

- (void)showInlineNoConnectionMessage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOAD_ERROR_NETWORK_TITLE"), &stru_1000A5680, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOAD_ERROR_MESSAGE"), &stru_1000A5680, 0));

  -[TPSViewController showInlineLabelWithTitle:message:](self, "showInlineLabelWithTitle:message:", v6, v5);
}

- (void)showInlineLabelWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  id v9;
  _UNKNOWN **v10;
  void *v11;
  id v12;
  const UIFontTextStyle *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  UILabel *messageLabel;
  UILabel *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_messageLabelTitle, a3);
  objc_storeStrong((id *)&self->_messageLabelDetailText, a4);
  -[TPSViewController setLoading:](self, "setLoading:", 0);
  v9 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", &stru_1000A5680);
  v10 = &_s7SwiftUI22UserInterfaceSizeClassOMn_ptr;
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    v13 = &UIFontTextStyleTitle1;
    if (!v12)
      v13 = &UIFontTextStyleTitle3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance preferredFontForTextStyle:](TPSAppearance, "preferredFontForTextStyle:", *v13));
    v15 = CFSTR("\n");
    if (!v8)
      v15 = &stru_1000A5680;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, v15));
    v17 = objc_alloc((Class)NSAttributedString);
    v48[0] = v14;
    v47[0] = NSFontAttributeName;
    v47[1] = NSForegroundColorAttributeName;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    v48[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
    v21 = objc_msgSend(v17, "initWithString:attributes:", v16, v20);

    v7 = v18;
    objc_msgSend(v9, "appendAttributedString:", v21);

    v10 = &_s7SwiftUI22UserInterfaceSizeClassOMn_ptr;
  }
  if (v8)
  {
    v45[0] = NSFontAttributeName;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[493], "bodyFont"));
    v45[1] = NSForegroundColorAttributeName;
    v46[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.57254902, 1.0));
    v46[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));

    v25 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v8, v24);
    objc_msgSend(v9, "appendAttributedString:", v25);

  }
  if (objc_msgSend(v9, "length"))
  {
    v26 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v26, "setParagraphSpacing:", 8.0);
    objc_msgSend(v26, "setLineBreakMode:", 0);
    objc_msgSend(v26, "setAlignment:", 1);
    objc_msgSend(v9, "addAttribute:value:range:", NSParagraphStyleAttributeName, v26, 0, objc_msgSend(v9, "length"));
    messageLabel = self->_messageLabel;
    if (!messageLabel)
    {
      v28 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v29 = self->_messageLabel;
      self->_messageLabel = v28;

      -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController view](self, "view"));
      objc_msgSend(v30, "addSubview:", self->_messageLabel);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController view](self, "view"));
      objc_msgSend(v31, "bringSubviewToFront:", self->_messageLabel);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_messageLabel, "leadingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController view](self, "view"));
      v34 = v7;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v35, 20.0));
      objc_msgSend(v36, "setActive:", 1);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_messageLabel, "trailingAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController view](self, "view"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, -20.0));
      objc_msgSend(v40, "setActive:", 1);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_messageLabel, "centerYAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TPSViewController view](self, "view"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "centerYAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
      objc_msgSend(v44, "setActive:", 1);

      v7 = v34;
      messageLabel = self->_messageLabel;
    }
    -[UILabel setAttributedText:](messageLabel, "setAttributedText:", v9);

  }
  else
  {
    -[TPSViewController removeInlineMessageLabel](self, "removeInlineMessageLabel");
  }

}

- (BOOL)loading
{
  return self->_loading;
}

- (NSString)defaultErrorTitleText
{
  return self->_defaultErrorTitleText;
}

- (void)setDefaultErrorTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_defaultErrorTitleText, a3);
}

- (void)setKVOManager:(id)a3
{
  objc_storeStrong((id *)&self->_KVOManager, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (NSUUID)networkMonitorToken
{
  return self->_networkMonitorToken;
}

- (void)setNetworkMonitorToken:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitorToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorToken, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_defaultErrorTitleText, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_messageLabelDetailText, 0);
  objc_storeStrong((id *)&self->_messageLabelTitle, 0);
}

@end
