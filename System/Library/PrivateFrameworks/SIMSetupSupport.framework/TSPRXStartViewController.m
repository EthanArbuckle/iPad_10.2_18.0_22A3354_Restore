@implementation TSPRXStartViewController

- (TSPRXStartViewController)initWithBtDevice:(id)a3
{
  id v5;
  TSPRXStartViewController *v6;
  TSPRXStartViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPRXStartViewController;
  v6 = -[TSPRXStartViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_client, a3);

  return v7;
}

- (void)viewDidLoad
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *radioImageView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PRXAction *v17;
  PRXAction *action;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id location;
  objc_super v59;
  _QWORD v60[7];

  v60[5] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)TSPRXStartViewController;
  -[TSPRXStartViewController viewDidLoad](&v59, sel_viewDidLoad);
  v3 = +[TSUtilities isPad](TSUtilities, "isPad");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("TRANSFER_SIM");
  else
    v6 = CFSTR("PRXCARD_START_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXStartViewController setTitle:](self, "setTitle:", v7);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PRXCARD_START_SUBTITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXStartViewController setSubtitle:](self, "setSubtitle:", v9);

  -[TSPRXStartViewController setDismissalType:](self, "setDismissalType:", 3);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("antenna.radiowaves.left.and.right"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v55);
  radioImageView = self->_radioImageView;
  self->_radioImageView = v10;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_radioImageView, "setTintColor:", v12);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_radioImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TSPRXStartViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_radioImageView);

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __39__TSPRXStartViewController_viewDidLoad__block_invoke;
  v56[3] = &unk_24DEF2C30;
  objc_copyWeak(&v57, &location);
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v56);
  v17 = (PRXAction *)objc_claimAutoreleasedReturnValue();
  action = self->_action;
  self->_action = v17;

  v19 = (id)-[TSPRXStartViewController addAction:](self, "addAction:", self->_action);
  -[TSPRXStartViewController contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;

  objc_msgSend(v55, "size");
  v26 = v25;
  objc_msgSend(v55, "size");
  v28 = v24 * 0.3 / v27;
  if (v22 * 0.3 / v26 >= v28)
    v29 = v28;
  else
    v29 = v22 * 0.3 / v26;
  objc_msgSend(v55, "size");
  v31 = v30;
  objc_msgSend(v55, "size");
  v33 = v32;
  v44 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView topAnchor](self->_radioImageView, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXStartViewController contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "mainContentGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v50;
  -[UIImageView centerXAnchor](self->_radioImageView, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXStartViewController contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "mainContentGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v45;
  -[UIImageView centerYAnchor](self->_radioImageView, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPRXStartViewController contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "mainContentGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v38;
  -[UIImageView widthAnchor](self->_radioImageView, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", v29 * v31);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v40;
  -[UIImageView heightAnchor](self->_radioImageView, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", v29 * v33);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v43);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);

}

void __39__TSPRXStartViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startClientFlow");

}

- (void)_startClientFlow
{
  NSObject *v3;
  SSProximityDevice *client;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[PRXAction setEnabled:](self->_action, "setEnabled:", 0);
  -[TSPRXStartViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", &stru_24DEF4290);
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[TSPRXStartViewController _startClientFlow]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "activate client @%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  client = self->_client;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__TSPRXStartViewController__startClientFlow__block_invoke;
  v5[3] = &unk_24DEF3188;
  objc_copyWeak(&v6, (id *)buf);
  -[SSProximityDevice activate:](client, "activate:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __44__TSPRXStartViewController__startClientFlow__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__TSPRXStartViewController__startClientFlow__block_invoke_cold_1((uint64_t)v3, v4);

    v5 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v5);
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(v5);
    objc_msgSend(v7, "viewControllerDidComplete:", v8);

  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRXAction)action
{
  return (PRXAction *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (SSProximityDevice)client
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (UIImageView)radioImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setRadioImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioImageView, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__TSPRXStartViewController__startClientFlow__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSPRXStartViewController _startClientFlow]_block_invoke";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]activate bt client failed : %@ @%s", (uint8_t *)&v2, 0x16u);
}

@end
