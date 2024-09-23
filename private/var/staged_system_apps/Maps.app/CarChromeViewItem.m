@implementation CarChromeViewItem

+ (id)itemWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v4);

  return v5;
}

- (CarChromeViewItem)initWithContext:(id)a3
{
  id v4;
  CarChromeViewItem *v5;
  CarChromeViewItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarChromeViewItem;
  v5 = -[CarChromeViewItem init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_context, v4);

  return v6;
}

- (CarChromeContext)context
{
  return (CarChromeContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (int64_t)hardwareBackButtonBehavior
{
  return self->_hardwareBackButtonBehavior;
}

- (void)setHardwareBackButtonBehavior:(int64_t)a3
{
  self->_hardwareBackButtonBehavior = a3;
}

- (int64_t)autohideBehavior
{
  return self->_autohideBehavior;
}

- (void)setAutohideBehavior:(int64_t)a3
{
  self->_autohideBehavior = a3;
}

- (BOOL)isAutohidingContentHidden
{
  return self->_autohidingContentIsHidden;
}

- (void)setAutohidingContentIsHidden:(BOOL)a3
{
  self->_autohidingContentIsHidden = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
}

@end
