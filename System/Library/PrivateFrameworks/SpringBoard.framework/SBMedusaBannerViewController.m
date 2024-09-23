@implementation SBMedusaBannerViewController

- (SBMedusaBannerViewController)initWithType:(int64_t)a3 orientation:(int64_t)a4 peekConfiguration:(int64_t)a5
{
  SBMedusaBannerViewController *v8;
  SBMedusaBannerViewController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMedusaBannerViewController;
  v8 = -[SBMedusaBannerViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v8->_orientation = a4;
    v8->_peekConfiguration = a5;
    -[SBMedusaBannerViewController loadViewIfNeeded](v8, "loadViewIfNeeded");
    -[PLPillView intrinsicContentSize](v9->_pillView, "intrinsicContentSize");
    -[SBMedusaBannerViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBMedusaBannerViewController;
  -[SBMedusaBannerViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SBMedusaBannerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMedusaBannerViewController _bannerView](self, "_bannerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);

}

- (id)_bannerView
{
  PLPillView *pillView;
  int64_t peekConfiguration;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PLPillView *v30;
  PLPillView *v31;
  PLPillView *v32;
  void *v33;
  PLPillView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  __CFString *v41;
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  pillView = self->_pillView;
  if (!pillView)
  {
    peekConfiguration = self->_peekConfiguration;
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v5 = 3;
    else
      v5 = 2;
    switch(self->_type)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_EDUCATION_TITLE_SPLIT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v7 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_EDUCATION_DESCRIPTION"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)(self->_orientation - 1) > 1)
        {
          v10 = CFSTR("rectangle.righthalf.inset.fill");
          v11 = CFSTR("rectangle.lefthalf.inset.fill");
        }
        else
        {
          v10 = CFSTR("rectangle.portrait.righthalf.inset.filled");
          v11 = CFSTR("rectangle.portrait.lefthalf.inset.filled");
        }
        if (peekConfiguration == v5)
          v10 = (__CFString *)v11;
        v13 = v10;
        v12 = (void *)v7;
        break;
      case 1:
        v14 = CFSTR("rectangle.rightthird.inset.fill");
        if (peekConfiguration == v5)
          v14 = CFSTR("rectangle.leftthird.inset.fill");
        v15 = CFSTR("rectangle.portrait.leftthird.inset.filled");
        if (peekConfiguration != v5)
          v15 = CFSTR("rectangle.portrait.rightthird.inset.filled");
        if ((unint64_t)(self->_orientation - 1) >= 2)
          v16 = (__CFString *)v14;
        else
          v16 = (__CFString *)v15;
        v13 = v16;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_EDUCATION_TITLE_SLIDE_OVER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v18 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v18;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_EDUCATION_DESCRIPTION"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_ERROR_TITLE_SPLIT_VIEW"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v21 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_ERROR_SUBTITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)v21;
        v13 = CFSTR("rectangle.split.2x1.slash");
        break;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_ERROR_TITLE_MULTIPLE_WINDOWS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MEDUSA_BANNER_ERROR_SUBTITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)v24;
        v13 = CFSTR("rectangle.on.rectangle.slash");
        break;
      default:
        v9 = 0;
        v12 = 0;
        v13 = 0;
        break;
    }
    v41 = (__CFString *)v13;
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 5, 15.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v13, v42);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageWithRenderingMode:", 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v40);
    v28 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v27, "bounds");
    v29 = (void *)objc_msgSend(v28, "initWithFrame:");
    v30 = (PLPillView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3E0]), "initWithLeadingAccessoryView:trailingAccessoryView:", v27, v29);
    v31 = self->_pillView;
    self->_pillView = v30;

    v32 = self->_pillView;
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillView setTintColor:](v32, "setTintColor:", v33);

    v34 = self->_pillView;
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithText:style:", v12, 1);
    v43[0] = v35;
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithText:style:", v9, 2);
    v43[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v37 = v12;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillView setCenterContentItems:](v34, "setCenterContentItems:", v38);

    pillView = self->_pillView;
  }
  return pillView;
}

- (NSString)requesterIdentifier
{
  return (NSString *)CFSTR("com.apple.SpringBoard.Medusa");
}

- (NSString)requestIdentifier
{
  return (NSString *)CFSTR("Medusa");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end
