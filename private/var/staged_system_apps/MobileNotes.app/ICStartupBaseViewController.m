@implementation ICStartupBaseViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICStartupBaseViewController;
  -[ICStartupBaseViewController viewDidLoad](&v3, "viewDidLoad");
  -[ICStartupBaseViewController choicesUpdated](self, "choicesUpdated");
}

- (void)choicesUpdated
{
  -[ICStartupBaseViewController updateChoiceButtons](self, "updateChoiceButtons");
}

- (void)hideChoices
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v2, "setHidden:", 1);

}

- (unint64_t)numChoices
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController choiceLabels](self, "choiceLabels"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)updateChoiceButtons
{
  unint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICStartupBaseViewController *v9;
  const char *v10;
  void *v11;
  id v12;

  v3 = -[ICStartupBaseViewController numChoices](self, "numChoices");
  if (!-[ICStartupBaseViewController didSetupChoices](self, "didSetupChoices") && v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController choiceLabels](self, "choiceLabels"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));

      if (i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[OBTrayButton buttonWithType:](OBTrayButton, "buttonWithType:", 1));
        v8 = v7;
        v9 = self;
        v10 = "secondaryButtonPressed:";
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
        v8 = v7;
        v9 = self;
        v10 = "primaryButtonPressed:";
      }
      objc_msgSend(v7, "addTarget:action:forControlEvents:", v9, v10, 64);
      objc_msgSend(v8, "setTitle:forState:", v6, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController buttonTray](self, "buttonTray"));
      objc_msgSend(v11, "addButton:", v8);

    }
    -[ICStartupBaseViewController setDidSetupChoices:](self, "setDidSetupChoices:", 1);
    goto LABEL_10;
  }
  if (v3)
  {
LABEL_10:
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v12, "setHidden:", 0);

    return;
  }
  -[ICStartupBaseViewController hideChoices](self, "hideChoices");
}

- (ICStartupNavigationController)startupNavigationController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(ICStartupNavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController navigationController](self, "navigationController"));
  v5 = ICCheckedDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (ICStartupNavigationController *)v6;
}

- (void)primaryButtonPressed:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;

  if (-[ICStartupBaseViewController numChoices](self, "numChoices", a3) < 2)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController"));
    v5 = objc_msgSend(v4, "shouldSwapChoices");

    v6 = v5;
  }
  -[ICStartupBaseViewController choiceSelected:](self, "choiceSelected:", v6);
}

- (void)secondaryButtonPressed:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController", a3));
  v5 = objc_msgSend(v4, "shouldSwapChoices") ^ 1;

  -[ICStartupBaseViewController choiceSelected:](self, "choiceSelected:", v5);
}

- (BOOL)didSetupChoices
{
  return self->_didSetupChoices;
}

- (void)setDidSetupChoices:(BOOL)a3
{
  self->_didSetupChoices = a3;
}

@end
