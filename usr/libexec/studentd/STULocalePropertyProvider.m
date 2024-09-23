@implementation STULocalePropertyProvider

- (void)dealloc
{
  objc_super v3;

  -[STULocalePropertyProvider endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STULocalePropertyProvider;
  -[STULocalePropertyProvider dealloc](&v3, "dealloc");
}

- (id)key
{
  return CRKDeviceUserLocaleIdentifierKey;
}

- (void)beginUpdating
{
  void *v3;

  if (!-[STULocalePropertyProvider isObserving](self, "isObserving"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "updateLocale:", NSCurrentLocaleDidChangeNotification, 0);

    -[STULocalePropertyProvider updateLocale:](self, "updateLocale:", 0);
    -[STULocalePropertyProvider setObserving:](self, "setObserving:", 1);
  }
}

- (void)endUpdating
{
  void *v3;

  if (-[STULocalePropertyProvider isObserving](self, "isObserving"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self);

    -[STULocalePropertyProvider setObserving:](self, "setObserving:", 0);
  }
}

- (void)updateLocale:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localeIdentifier"));
  -[STUDevicePropertyProvider setValue:](self, "setValue:", v4);

}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

@end
