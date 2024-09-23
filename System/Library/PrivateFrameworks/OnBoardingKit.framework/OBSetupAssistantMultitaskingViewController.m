@implementation OBSetupAssistantMultitaskingViewController

- (OBSetupAssistantMultitaskingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  OBSetupAssistantMultitaskingViewController *v13;
  OBSetupAssistantMultitaskingHeaderView *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBSetupAssistantMultitaskingViewController;
  v13 = -[OBWelcomeController initWithTitle:detailText:symbolName:contentLayout:](&v17, sel_initWithTitle_detailText_symbolName_contentLayout_, v10, v11, v12, a6);
  if (v13)
  {
    v14 = -[OBHeaderView initWithTitle:detailText:symbolName:]([OBSetupAssistantMultitaskingHeaderView alloc], "initWithTitle:detailText:symbolName:", v10, v11, v12);
    -[OBWelcomeController setHeaderView:](v13, "setHeaderView:", v14);

    -[OBWelcomeController headerView](v13, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  return v13;
}

- (OBSetupAssistantMultitaskingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  OBSetupAssistantMultitaskingViewController *v13;
  OBSetupAssistantMultitaskingHeaderView *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBSetupAssistantMultitaskingViewController;
  v13 = -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v17, sel_initWithTitle_detailText_icon_contentLayout_, v10, v11, v12, a6);
  if (v13)
  {
    v14 = -[OBHeaderView initWithTitle:detailText:icon:]([OBSetupAssistantMultitaskingHeaderView alloc], "initWithTitle:detailText:icon:", v10, v11, v12);
    -[OBWelcomeController setHeaderView:](v13, "setHeaderView:", v14);

    -[OBWelcomeController headerView](v13, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  return v13;
}

- (OBSetupAssistantMultitaskingViewController)init
{

  return 0;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantMultitaskingViewController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[OBWelcomeController setTemplateType:](self, "setTemplateType:", 2);
}

- (void)setupBulletedListIfNeeded
{
  void *v3;
  OBSetupAssistantMultitaskingBulletedList *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  -[OBWelcomeController bulletedList](self, "bulletedList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(OBSetupAssistantMultitaskingBulletedList);
    -[OBWelcomeController setBulletedList:](self, "setBulletedList:", v4);

    -[OBWelcomeController bulletedList](self, "bulletedList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBWelcomeController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[OBSetupAssistantMultitaskingViewController contentViewsTopPaddingFromBottomOfHeader](self, "contentViewsTopPaddingFromBottomOfHeader");
    v9 = v8;
    -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 0);

    -[OBWelcomeController contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController headerView](self, "headerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController setContentViewTopOffsetConstraint:](self, "setContentViewTopOffsetConstraint:", v15);

    -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[OBWelcomeController contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeadingConstraint:", v21);

    -[OBWelcomeController contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTrailingConstraint:", v27);

    v39 = (void *)MEMORY[0x1E0CB3718];
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingConstraint");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v43;
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingConstraint");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v41;
    -[OBWelcomeController contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v32;
    -[OBWelcomeController contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v38);

  }
}

- (void)addMultitaskingBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[OBSetupAssistantMultitaskingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[OBSetupAssistantMultitaskingViewController setupBulletedListIfNeeded](self, "setupBulletedListIfNeeded");
  -[OBWelcomeController bulletedList](self, "bulletedList");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addItemWithTitle:description:symbolName:", v10, v9, v8);

}

- (double)_headerTopOffset
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 2)
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMiniPad");

    v7 = 0.0;
    if ((v6 & 1) == 0)
    {
      -[OBSetupAssistantMultitaskingViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v7 = v9 * 0.045;

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)OBSetupAssistantMultitaskingViewController;
    -[OBWelcomeController _headerTopOffset](&v12, sel__headerTopOffset);
    return v10;
  }
  return v7;
}

- (double)contentViewsTopPaddingFromBottomOfHeader
{
  void *v3;
  uint64_t v4;
  double result;
  objc_super v6;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "templateType");

  result = 22.0;
  if (v4 != 6)
  {
    v6.receiver = self;
    v6.super_class = (Class)OBSetupAssistantMultitaskingViewController;
    -[OBWelcomeController contentViewsTopPaddingFromBottomOfHeader](&v6, sel_contentViewsTopPaddingFromBottomOfHeader, 22.0);
  }
  return result;
}

@end
