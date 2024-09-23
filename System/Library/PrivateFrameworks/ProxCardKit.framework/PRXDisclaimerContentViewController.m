@implementation PRXDisclaimerContentViewController

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXDisclaimerContentViewController;
  -[PRXCardContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRXDisclaimerContentViewController _updateDisclaimerLabel](self, "_updateDisclaimerLabel");
  -[PRXDisclaimerContentViewController _updateMoreInfoButton](self, "_updateMoreInfoButton");
}

- (void)setDisclaimer:(id)a3
{
  NSString *v4;
  NSString *disclaimer;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  disclaimer = self->_disclaimer;
  if (disclaimer != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](disclaimer, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_disclaimer;
      self->_disclaimer = v7;

      -[PRXDisclaimerContentViewController _updateDisclaimerLabel](self, "_updateDisclaimerLabel");
      v4 = v9;
    }
  }

}

- (void)_updateDisclaimerLabel
{
  NSString *disclaimer;
  void *v3;
  id v4;

  disclaimer = self->_disclaimer;
  -[PRXCardContentViewController contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disclaimerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", disclaimer);

}

- (void)setMoreInfoAction:(id)a3
{
  PRXAction *v5;
  PRXAction *v6;

  v5 = (PRXAction *)a3;
  if (self->_moreInfoAction != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_moreInfoAction, a3);
    -[PRXDisclaimerContentViewController _updateMoreInfoButton](self, "_updateMoreInfoButton");
    v5 = v6;
  }

}

- (void)_updateMoreInfoButton
{
  void *v3;
  void *v4;
  id v5;

  if (self->_moreInfoAction)
  {
    +[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PRXAction title](self->_moreInfoAction, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v3, 0);

    objc_msgSend(v5, "addTarget:action:forControlEvents:", self->_moreInfoAction, sel__callHandler, 0x2000);
    -[PRXCardContentViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMoreInfoButton:", v5);

  }
  else
  {
    -[PRXCardContentViewController contentView](self, "contentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMoreInfoButton:", 0);
  }

}

- (NSString)disclaimer
{
  return self->_disclaimer;
}

- (PRXAction)moreInfoAction
{
  return self->_moreInfoAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreInfoAction, 0);
  objc_storeStrong((id *)&self->_disclaimer, 0);
}

@end
