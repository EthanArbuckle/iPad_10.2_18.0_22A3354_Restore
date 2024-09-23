@implementation BSDescriptionBuilder(SBHWidgetUtilities)

- (void)sbh_appendDescriptionsForViewControllers:()SBHWidgetUtilities
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  SBHWidgetViewControllerDescriptionsForSysdiagnose(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__BSDescriptionBuilder_SBHWidgetUtilities__sbh_appendDescriptionsForViewControllers___block_invoke;
  v9[3] = &unk_1E8D889D8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "bs_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("widgetViewControllers"), 0);
  return a1;
}

@end
