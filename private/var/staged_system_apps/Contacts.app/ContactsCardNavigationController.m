@implementation ContactsCardNavigationController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ContactsCardNavigationController;
  -[ContactsCardNavigationController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIColorRepository contactStyleDefaultBackgroundColor](CNUIColorRepository, "contactStyleDefaultBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsCardNavigationController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (ContactsCardNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  ContactsCardNavigationController *v4;
  ContactsCardNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ContactsCardNavigationController;
  v4 = -[ContactsCardNavigationController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[ContactsCardNavigationController setRestorationIdentifier:](v4, "setRestorationIdentifier:", CFSTR("ContactsCardNavigationController"));
  return v5;
}

@end
