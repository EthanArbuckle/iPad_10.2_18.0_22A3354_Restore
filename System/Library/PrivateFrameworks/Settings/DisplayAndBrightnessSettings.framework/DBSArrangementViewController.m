@implementation DBSArrangementViewController

- (DBSArrangementViewController)init
{
  DBSArrangementViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DBSArrangementViewController;
  v2 = -[DBSArrangementViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_displayLayoutMonitorDidUpdateLayout_, DBSExternalDisplayManagerDisplayLayoutMonitorDidChange, 0);

  }
  return v2;
}

- (CGSize)nativeDisplaySize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeDisplaySize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)nativeDisplayName
{
  return DBS_LocalizedStringForConnectedDisplays(CFSTR("IPAD_DISPLAY_NAME"));
}

- (id)nativeDisplayImageWithWidth:(double)a3
{
  void *v4;
  void *v5;

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainDisplayImageWithWidth:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)externalDisplayName
{
  void *v2;
  void *v3;

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)externalDisplaySize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  CGSize result;

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalDisplaySize");
  v4 = v3;
  v6 = v5;

  v7 = v6 == 0.0;
  if (v4 == 0.0)
    v7 = 1;
  v8 = 4000.0;
  if (!v7)
    v8 = v4;
  v9 = 2400.0;
  if (!v7)
    v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setExternalDisplayInfo:(id)a3
{
  void *v5;
  SBSConnectedDisplayInfo *v6;

  v6 = (SBSConnectedDisplayInfo *)a3;
  if (self->_externalDisplayInfo != v6)
  {
    objc_storeStrong((id *)&self->_externalDisplayInfo, a3);
    -[DBSArrangementViewController updateComponentsWithConnectedDispalyInfo:](self, "updateComponentsWithConnectedDispalyInfo:", v6);
    -[DBSArrangementViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (void)setDisplayService:(id)a3
{
  SBSExternalDisplayService *v5;
  void *v6;
  SBSExternalDisplayService *v7;

  v5 = (SBSExternalDisplayService *)a3;
  if (self->_displayService != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_displayService, a3);
    -[DBSArrangementViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

    v5 = v7;
  }

}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  return self->_externalDisplayInfo;
}

- (void)updateComponentsWithConnectedDispalyInfo:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "arrangement");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMirrored");

  -[DBSArrangementViewController setWasMirrored:](self, "setWasMirrored:", v5);
  v6 = objc_msgSend(v10, "edge");
  if (v6 <= 3)
    -[DBSArrangementViewController setCurrentDisplayLocation:](self, "setCurrentDisplayLocation:", qword_227A5EDA0[v6]);
  -[DBSArrangementViewController layoutController](self, "layoutController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateCurrentDisplayLocation:", -[DBSArrangementViewController currentDisplayLocation](self, "currentDisplayLocation"));

  v8 = -[DBSArrangementViewController wasMirrored](self, "wasMirrored");
  -[DBSArrangementViewController mirroredSwitch](self, "mirroredSwitch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOn:", v8);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DBSArrangementLayoutViewController *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  DBSArrangementLayoutViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  id v39;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[3];

  v70[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  -[DBSArrangementViewController setView:](self, "setView:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPressed);
  v6 = objc_alloc(MEMORY[0x24BEBD410]);
  DBS_LocalizedStringForConnectedDisplays(CFSTR("SET_DISPLAY_ARRANGEMENT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, sel_setPressed);

  v68 = v8;
  objc_msgSend(v8, "setEnabled:", 0);
  -[DBSArrangementViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v69);

  -[DBSArrangementViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DBS_LocalizedStringForConnectedDisplays(CFSTR("DISPLAY_ARRANGEMENT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  -[DBSArrangementViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v8);

  v13 = [DBSArrangementLayoutViewController alloc];
  -[DBSArrangementViewController nativeDisplaySize](self, "nativeDisplaySize");
  v15 = v14;
  v17 = v16;
  -[DBSArrangementViewController nativeDisplayName](self, "nativeDisplayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementViewController externalDisplaySize](self, "externalDisplaySize");
  v20 = v19;
  v22 = v21;
  -[DBSArrangementViewController externalDisplayName](self, "externalDisplayName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[DBSArrangementLayoutViewController initWithNativeDisplaySize:nativeDisplayName:externalDisplaySize:externalDisplayName:currentNativeDisplayLocation:](v13, "initWithNativeDisplaySize:nativeDisplayName:externalDisplaySize:externalDisplayName:currentNativeDisplayLocation:", v18, v23, -[DBSArrangementViewController currentDisplayLocation](self, "currentDisplayLocation"), v15, v17, v20, v22);
  -[DBSArrangementViewController setLayoutController:](self, "setLayoutController:", v24);

  -[DBSArrangementViewController layoutController](self, "layoutController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDelegate:", self);

  -[DBSArrangementViewController layoutController](self, "layoutController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[DBSArrangementViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  objc_msgSend(v27, "setFrame:");

  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v29, "addSubview:", v27);
  objc_msgSend(v29, "setClipsToBounds:", 1);
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCornerRadius:", 7.0);

  -[DBSArrangementViewController setContainerView:](self, "setContainerView:", v29);
  -[DBSArrangementViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v29);

  v32 = (void *)objc_opt_new();
  DBS_LocalizedStringForConnectedDisplays(CFSTR("MIRROR_DISPLAYS"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v33);

  v34 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "labelFontSize");
  objc_msgSend(v34, "systemFontOfSize:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v35);

  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "addTarget:action:forControlEvents:", self, sel_mirroredToggled_, 4096);
  -[DBSArrangementViewController setMirroredSwitch:](self, "setMirroredSwitch:", v36);
  v37 = -[DBSArrangementViewController wasMirrored](self, "wasMirrored");
  -[DBSArrangementViewController mirroredSwitch](self, "mirroredSwitch");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setOn:", v37);

  v39 = objc_alloc(MEMORY[0x24BEBD978]);
  v70[0] = v32;
  v70[1] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v39, "initWithArrangedSubviews:", v40);

  objc_msgSend(v41, "setAlignment:", 3);
  objc_msgSend(v41, "setAxis:", 0);
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGroupedBackgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBackgroundColor:", v42);

  objc_msgSend(v41, "setLayoutMargins:", 2.0, 20.0, 2.0, 20.0);
  objc_msgSend(v41, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v29, "addSubview:", v41);
  v43 = (void *)objc_opt_new();
  DBS_LocalizedStringForConnectedDisplays(CFSTR("ARRANGE_DISPLAYS_FOOTER"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setText:", v44);

  v45 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "smallSystemFontSize");
  objc_msgSend(v45, "systemFontOfSize:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFont:", v46);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTextColor:", v47);

  objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v43, "setTextAlignment:", 1);
  -[DBSArrangementViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", v43);

  v49 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("containerView"), v29, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[containerView]-20-|"), 0, 0, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "activateConstraints:", v51);

  v52 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("containerView, instructions"), v29, v43, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-52-[containerView][instructions(38)]-6-|"), 0, 0, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v54);

  v55 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("layoutControllerView"), v27, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[layoutControllerView]|"), 0, 0, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "activateConstraints:", v57);

  v58 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("mirrorControls"), v41, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[mirrorControls]|"), 0, 0, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "activateConstraints:", v60);

  v61 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("instructions"), v43, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[instructions]|"), 0, 0, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "activateConstraints:", v63);

  v64 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("layoutControllerView, mirrorControls"), v27, v41, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[layoutControllerView]-2-[mirrorControls(44)]|"), 0, 0, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "activateConstraints:", v66);

  -[DBSArrangementViewController externalDisplayInfo](self, "externalDisplayInfo");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementViewController updateComponentsWithConnectedDispalyInfo:](self, "updateComponentsWithConnectedDispalyInfo:", v67);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, DBSExternalDisplayManagerDisplayLayoutMonitorDidChange, 0);

  v4.receiver = self;
  v4.super_class = (Class)DBSArrangementViewController;
  -[DBSArrangementViewController dealloc](&v4, sel_dealloc);
}

- (void)displayLayoutMonitorDidUpdateLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v18;
  if (v4)
  {
    objc_msgSend(v18, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    -[DBSArrangementViewController layoutController](self, "layoutController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "interfaceOrientation");
    objc_msgSend(v10, "bounds");
    v14 = v13;
    v16 = v15;

    objc_msgSend(v11, "updateOrientationTo:withNativeDisplaySize:", v12, v14, v16);
    -[DBSArrangementViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsLayout");

    v5 = v18;
  }

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 600.0;
  v3 = 450.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSArrangementViewController;
  -[DBSArrangementViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, a3, a4);
  -[DBSArrangementViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangementViewControllerDidDismiss:", self);

}

- (void)cancelPressed
{
  int v3;
  void *v4;
  int v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;

  v3 = -[DBSArrangementViewController wasMirrored](self, "wasMirrored");
  -[DBSArrangementViewController mirroredSwitch](self, "mirroredSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOn");

  if (v3 != v5)
  {
    -[DBSArrangementViewController displayService](self, "displayService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DBSArrangementViewController wasMirrored](self, "wasMirrored");
    -[DBSArrangementViewController externalDisplayInfo](self, "externalDisplayInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMirroringEnabled:forDisplay:", v7, v9);

  }
  -[DBSArrangementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)updateSetButtonEnablement
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[DBSArrangementViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementViewController mirroredSwitch](self, "mirroredSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOn");
  if (v5 == -[DBSArrangementViewController wasMirrored](self, "wasMirrored"))
  {
    -[DBSArrangementViewController layoutController](self, "layoutController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", objc_msgSend(v6, "nativeDisplayLocation") != -[DBSArrangementViewController currentDisplayLocation](self, "currentDisplayLocation"));

  }
  else
  {
    objc_msgSend(v3, "setEnabled:", 1);
  }

}

- (void)setPressed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[DBSArrangementViewController layoutController](self, "layoutController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nativeDisplayLocation");

  if ((unint64_t)(v4 - 1) >= 3)
    v5 = 3;
  else
    v5 = v4 - 1;
  v6 = objc_alloc(MEMORY[0x24BEB0AB0]);
  -[DBSArrangementViewController externalDisplayInfo](self, "externalDisplayInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementViewController externalDisplayInfo](self, "externalDisplayInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrangement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "offset");
  v14 = (id)objc_msgSend(v6, "initWithDisplayIdentifier:edge:offset:", v8, v5);

  -[DBSArrangementViewController displayService](self, "displayService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementViewController externalDisplayInfo](self, "externalDisplayInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayArrangement:forDisplay:", v14, v13);

  -[DBSArrangementViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mirroredToggled:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[DBSArrangementViewController displayService](self, "displayService", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementViewController mirroredSwitch](self, "mirroredSwitch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOn");
  -[DBSArrangementViewController externalDisplayInfo](self, "externalDisplayInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMirroringEnabled:forDisplay:", v6, v8);

  -[DBSArrangementViewController updateSetButtonEnablement](self, "updateSetButtonEnablement");
}

- (DBSArrangementViewControllerDelegate)delegate
{
  return (DBSArrangementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (DBSArrangementLayoutViewController)layoutController
{
  return self->_layoutController;
}

- (void)setLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_layoutController, a3);
}

- (UISwitch)mirroredSwitch
{
  return self->_mirroredSwitch;
}

- (void)setMirroredSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_mirroredSwitch, a3);
}

- (unint64_t)currentDisplayLocation
{
  return self->_currentDisplayLocation;
}

- (void)setCurrentDisplayLocation:(unint64_t)a3
{
  self->_currentDisplayLocation = a3;
}

- (BOOL)wasMirrored
{
  return self->_wasMirrored;
}

- (void)setWasMirrored:(BOOL)a3
{
  self->_wasMirrored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredSwitch, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_externalDisplayInfo, 0);
}

@end
