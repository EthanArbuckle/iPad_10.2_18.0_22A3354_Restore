@implementation FloatingControlsOverlayDelegateProxy

+ (id)protocols
{
  if (qword_1014D25A8 != -1)
    dispatch_once(&qword_1014D25A8, &stru_1011B75A0);
  return (id)qword_1014D25A0;
}

- (FloatingControlsOverlayDelegateProxy)initWithChromeViewController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  FloatingControlsOverlayDelegateProxy *v7;
  objc_super v9;

  v4 = a3;
  v6 = objc_opt_class(IOSBasedChromeViewController, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)FloatingControlsOverlayDelegateProxy;
    self = -[ChromeDelegateProxy initWithChromeViewController:](&v9, "initWithChromeViewController:", v4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._chromeViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  if ((objc_opt_respondsToSelector(v6, a3) & 1) != 0)
  {
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
