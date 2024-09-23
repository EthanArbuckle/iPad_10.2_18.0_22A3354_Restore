@implementation PXApplicationVideoMuteController

- (PXApplicationVideoMuteController)init
{
  PXApplicationVideoMuteController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXApplicationVideoMuteController;
  v2 = -[PXVideoMuteController init](&v5, sel_init);
  if (v2)
  {
    +[PXApplicationState sharedState](PXApplicationState, "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerChangeObserver:context:", v2, ApplicationStateContext_129070);

  }
  return v2;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  uint64_t v7;

  if ((void *)ApplicationStateContext_129070 == a5)
  {
    +[PXApplicationState sharedState](PXApplicationState, "sharedState", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "visibilityState");

    if (v7 == 3)
      -[PXVideoMuteController applicationDidMoveToBackground](self, "applicationDidMoveToBackground");
  }
}

@end
