@implementation HandoffRestorationAction

- (HandoffRestorationAction)init
{
  HandoffRestorationAction *v2;
  HandoffRestorationAction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HandoffRestorationAction;
  v2 = -[RestorationAction init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[RestorationAction setSource:](v2, "setSource:", 0);
    -[RestorationAction setFidelity:](v3, "setFidelity:", 268435407);
  }
  return v3;
}

@end
