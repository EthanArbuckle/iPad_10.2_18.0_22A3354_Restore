@implementation MFPreviewViewController

+ (OS_os_log)log
{
  if (qword_10003FBA0 != -1)
    dispatch_once(&qword_10003FBA0, &stru_100035148);
  return (OS_os_log *)(id)qword_10003FB98;
}

- (MFPreviewViewController)init
{
  MFPreviewViewController *v2;
  EMDaemonInterface *v3;
  EMDaemonInterface *daemonInterface;
  id v5;
  id v6;
  void *v7;
  MUIBrandIndicatorProvider *v8;
  MUIBrandIndicatorProvider *brandIndicatorProvider;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFPreviewViewController;
  v2 = -[MFPreviewViewController init](&v12, "init");
  if (v2)
  {
    v3 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    daemonInterface = v2->_daemonInterface;
    v2->_daemonInterface = v3;

    v5 = objc_alloc_init((Class)MUICachingSVGConverter);
    v6 = objc_alloc((Class)MUIBrandIndicatorProvider);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EMDaemonInterface messageRepository](v2->_daemonInterface, "messageRepository"));
    v8 = (MUIBrandIndicatorProvider *)objc_msgSend(v6, "initWithMessageRepository:svgConverter:", v7, v5);
    brandIndicatorProvider = v2->_brandIndicatorProvider;
    v2->_brandIndicatorProvider = v8;

    +[MFWKWebViewFactory setDaemonInterface:URLCacheWithMemoryCapacity:](MFWKWebViewFactory, "setDaemonInterface:URLCacheWithMemoryCapacity:", v2->_daemonInterface, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EMDaemonInterface vipManager](v2->_daemonInterface, "vipManager"));
    +[VIPManager setBackingManager:](VIPManager, "setBackingManager:", v10);

  }
  return v2;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  UIEdgeInsets *p_minMargins;
  double top;
  NSObject *v14;
  NSString *v15;
  void *v16;
  objc_super v22;
  uint8_t buf[24];

  v22.receiver = self;
  v22.super_class = (Class)MFPreviewViewController;
  -[MFPreviewViewController viewDidLoad](&v22, "viewDidLoad");
  -[MFPreviewViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFPreviewViewController view](self, "view"));
  -[MFPreviewViewController setIsRTL:](self, "setIsRTL:", objc_msgSend(v11, "mf_prefersRightToLeftInterfaceLayout"));

  MFEdgeInsetsFromDirectionalEdgeInsets(-[MFPreviewViewController isRTL](self, "isRTL"), v4, v6, v8, v10);
  -[MFPreviewViewController setMinMargins:](self, "setMinMargins:");
  p_minMargins = &self->_minMargins;
  top = p_minMargins->top;
  if (p_minMargins->top == 0.0
    || (top = p_minMargins->right, top == 0.0)
    || (top = p_minMargins->bottom, top == 0.0)
    || (top = p_minMargins->left, top == 0.0))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[MFPreviewViewController log](MFPreviewViewController, "log", top));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = NSStringFromUIEdgeInsets(*p_minMargins);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      sub_10001BA14(v16, buf, v14);
    }

    __asm { FMOV            V0.2D, #16.0 }
    *(_OWORD *)&p_minMargins->top = _Q0;
    *(_OWORD *)&p_minMargins->bottom = _Q0;
  }
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFPreviewViewController _messageForMessageIdentifier:](self, "_messageForMessageIdentifier:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100019D64;
  v17[3] = &unk_100035170;
  objc_copyWeak(&v19, &location);
  v11 = v8;
  v18 = v11;
  objc_msgSend(v9, "onScheduler:addSuccessBlock:", v10, v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A218;
  v14[3] = &unk_100035198;
  v12 = v11;
  v16 = v12;
  v14[4] = self;
  v13 = v7;
  v15 = v13;
  objc_msgSend(v9, "onScheduler:addFailureBlock:", v10, v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (id)_errorLabel
{
  double v3;
  CGFloat v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  id v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGRect v18;
  CGRect v19;

  -[MFPreviewViewController minMargins](self, "minMargins");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFPreviewViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v19 = CGRectInset(v18, v4, v4);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;

  v10 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", x, y, width, height);
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MESSAGE_CAUSED_PROBLEM"), &stru_1000351F8, CFSTR("Main")));
  objc_msgSend(v10, "setText:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v10, "setTextColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  objc_msgSend(v10, "setFont:", v15);

  objc_msgSend(v10, "setNumberOfLines:", 2);
  objc_msgSend(v10, "setTextAlignment:", 1);
  objc_msgSend(v10, "sizeToFit");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFPreviewViewController view](self, "view"));
  objc_msgSend(v16, "center");
  objc_msgSend(v10, "setCenter:");

  return v10;
}

- (id)_messageForMessageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFPreviewViewController daemonInterface](self, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageRepository"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageForSearchableItemIdentifier:", v4));
  return v7;
}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFPreviewViewController daemonInterface](self, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageRepository"));
  objc_msgSend(v6, "noteViewOfRemoteContentLinks:", v7);

}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (UIEdgeInsets)minMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minMargins.top;
  left = self->_minMargins.left;
  bottom = self->_minMargins.bottom;
  right = self->_minMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMinMargins:(UIEdgeInsets)a3
{
  self->_minMargins = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)displayErrorMessage
{
  return self->_displayErrorMessage;
}

- (void)setDisplayErrorMessage:(BOOL)a3
{
  self->_displayErrorMessage = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
}

@end
