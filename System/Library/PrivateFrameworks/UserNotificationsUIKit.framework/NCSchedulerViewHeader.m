@implementation NCSchedulerViewHeader

- (NCSchedulerViewHeader)initWithFrame:(CGRect)a3
{
  NCSchedulerViewHeader *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NCSchedulerViewHeader;
  v3 = -[NCSchedulerViewHeader initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    v7 = v3->_label;
    objc_msgSend((id)objc_opt_class(), "_text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v8);

    v9 = v3->_label;
    objc_msgSend((id)objc_opt_class(), "_font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    v11 = v3->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[NCSchedulerViewHeader addSubview:](v3, "addSubview:", v3->_label);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UILabel centerYAnchor](v3->_label, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewHeader centerYAnchor](v3, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewHeader leadingAnchor](v3, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 12.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v19);

    -[NCSchedulerViewHeader trailingAnchor](v3, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 12.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("NCSchedulerViewHeader");
}

+ (double)preferredHeightForWidth:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double result;
  uint64_t v11;
  _QWORD v12[2];
  CGRect v13;

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!preferredHeightForWidth____drawingContext)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    v6 = (void *)preferredHeightForWidth____drawingContext;
    preferredHeightForWidth____drawingContext = (uint64_t)v5;

    objc_msgSend((id)preferredHeightForWidth____drawingContext, "setWantsNumberOfLineFragments:", 1);
  }
  objc_msgSend((id)objc_opt_class(), "_text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1138];
  objc_msgSend(a1, "_font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v9, preferredHeightForWidth____drawingContext, fmax(a3 + -24.0, 0.0), 0.0);
  CGRectGetHeight(v13);

  _NCMainScreenScale();
  UICeilToScale();
  if (result < 30.0)
    return 30.0;
  return result;
}

+ (id)_font
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (id)_text
{
  void *v2;
  void *v3;
  void *v4;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_ITEM_HEADER"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
