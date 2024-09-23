@implementation OBSetupAssistantBulletedListController

- (OBSetupAssistantBulletedListController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBSetupAssistantBulletedListController;
  return -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v6, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, 2);
}

- (void)addBulletedListItemWithDescription:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[OBSetupAssistantBulletedListController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[OBWelcomeController setupBulletedListIfNeeded](self, "setupBulletedListIfNeeded");
  -[OBWelcomeController bulletedList](self, "bulletedList");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItemWithDescription:image:", v7, v6);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantBulletedListController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[OBWelcomeController setTemplateType:](self, "setTemplateType:", 2);
}

@end
