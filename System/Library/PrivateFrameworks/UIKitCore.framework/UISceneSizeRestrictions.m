@implementation UISceneSizeRestrictions

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("contentSize")) & 1) == 0
    && !objc_msgSend(v3, "isEqualToString:", CFSTR("windowOrigin"));

  return v4;
}

- (id)_initWithScene:(id)a3
{
  id v4;
  UISceneSizeRestrictions *v5;
  UISceneSizeRestrictions *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISceneSizeRestrictions;
  v5 = -[UISceneSizeRestrictions init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    *(_WORD *)&v6->_hasAutomaticMinimumSize = 257;
  }

  return v6;
}

- (void)setMinimumSize:(CGSize)minimumSize
{
  self->_hasAutomaticMinimumSize = 0;
  self->_minimumSize = minimumSize;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  self->_hasAutomaticMaximumSize = 0;
  self->_maximumSize = maximumSize;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)allowsFullScreen
{
  return self->_allowsFullScreen;
}

- (void)setAllowsFullScreen:(BOOL)allowsFullScreen
{
  self->_allowsFullScreen = allowsFullScreen;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
