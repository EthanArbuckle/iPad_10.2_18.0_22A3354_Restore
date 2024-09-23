@implementation SBFloatingDockIconListView

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFloatingDockIconListView;
  v5 = a3;
  -[SBIconListView configureIconView:forIcon:](&v6, sel_configureIconView_forIcon_, v5, a4);
  objc_msgSend(v5, "setIconContentScalingEnabled:", 1, v6.receiver, v6.super_class);
  objc_msgSend(v5, "setStartsDragMoreQuickly:", 1);

}

@end
