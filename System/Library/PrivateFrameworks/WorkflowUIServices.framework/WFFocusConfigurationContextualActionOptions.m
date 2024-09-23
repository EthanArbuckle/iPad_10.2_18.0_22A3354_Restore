@implementation WFFocusConfigurationContextualActionOptions

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6 mastheadTintColor:(id)a7
{
  id v14;
  id v15;
  id v16;
  WFFocusConfigurationContextualActionOptions *v17;
  WFFocusConfigurationContextualActionOptions *v18;
  WFFocusConfigurationContextualActionOptions *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFocusConfigurationOptions.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contextualAction"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFocusConfigurationOptions.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("footerButtons"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFFocusConfigurationContextualActionOptions;
  v17 = -[WFFocusConfigurationContextualActionOptions init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contextualAction, a3);
    objc_storeStrong((id *)&v18->_footerButtons, a4);
    v18->_showsEnablementButton = a5;
    v18->_enabled = a6;
    objc_storeStrong((id *)&v18->_mastheadTintColor, a7);
    v19 = v18;
  }

  return v18;
}

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6
{
  return -[WFFocusConfigurationContextualActionOptions initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:mastheadTintColor:](self, "initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:mastheadTintColor:", a3, a4, a5, a6, 0);
}

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4
{
  return -[WFFocusConfigurationContextualActionOptions initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:](self, "initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:", a3, a4, 0, 1);
}

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3
{
  return -[WFFocusConfigurationContextualActionOptions initWithContextualAction:footerButtons:](self, "initWithContextualAction:footerButtons:", a3, MEMORY[0x24BDBD1A8]);
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (NSArray)footerButtons
{
  return self->_footerButtons;
}

- (WFColor)mastheadTintColor
{
  return self->_mastheadTintColor;
}

- (BOOL)showsEnablementButton
{
  return self->_showsEnablementButton;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mastheadTintColor, 0);
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_contextualAction, 0);
}

@end
