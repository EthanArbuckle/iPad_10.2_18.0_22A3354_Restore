@implementation _UIRefreshControlModernReplicatorView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIRefreshControlModernReplicatorView;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("instanceCount")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("instanceAlphaOffset")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("instanceColor"));
  }

  return v5;
}

@end
