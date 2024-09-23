@implementation MTApplication_iOS

- (id)nextResponder
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTApplication_iOS delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "internalAppDelegate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandController"));
  return v4;
}

- (id)delegate
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTApplication_iOS;
  v2 = -[MTApplication delegate](&v4, "delegate");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

@end
