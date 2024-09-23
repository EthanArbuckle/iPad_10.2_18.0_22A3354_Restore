@implementation SBHScrollableConfiguringIconViewInteraction

- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3
{
  return objc_msgSend(a3, "isShowingConfigurationCard");
}

- (void)handleTargetIconViewClipped:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHScrollableConfiguringIconViewInteraction;
  v3 = a3;
  -[SBHScrollableIconViewInteraction handleTargetIconViewClipped:](&v4, sel_handleTargetIconViewClipped_, v3);
  objc_msgSend(v3, "dismissConfigurationCardImmediately", v4.receiver, v4.super_class);

}

@end
