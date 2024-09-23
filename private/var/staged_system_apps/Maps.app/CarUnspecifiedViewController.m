@implementation CarUnspecifiedViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *tapGesture;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarUnspecifiedViewController;
  -[CarUnspecifiedViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor crsui_dashboardWidgetBackgroundColor](UIColor, "crsui_dashboardWidgetBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  LODWORD(v4) = objc_msgSend(v5, "isInternalInstall");

  if ((_DWORD)v4)
    -[CarUnspecifiedViewController _addDebugView](self, "_addDebugView");
  v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_tappedWidget:");
  tapGesture = self->_tapGesture;
  self->_tapGesture = v6;

  -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedViewController view](self, "view"));
  objc_msgSend(v8, "addGestureRecognizer:", self->_tapGesture);

}

- (void)_addDebugView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
  objc_msgSend(v8, "setFont:", v3);

  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v8, "setMinimumScaleFactor:", 0.600000024);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setTextAlignment:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v8, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_constraintsForCenteringInView:edgeInsets:", v6, 6.0, 6.0, 6.0, 6.0));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  objc_msgSend(v8, "setText:", CFSTR("Internal Only: Unspecified dashboard widget style. Please file a radar on PEP CarPlay System App | 1.0"));
}

- (void)_tappedWidget:(id)a3
{
  id v4;
  NSObject *v5;
  CarUnspecifiedViewController *v6;
  CarUnspecifiedViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint8_t buf[4];
  __CFString *v15;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarUnspecifiedViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] _tappedMapWidget", buf, 0xCu);

  }
  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:](MapsCarPlayServicesShim, "openMapsCarPlayApplicationWithCompletion:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
}

@end
