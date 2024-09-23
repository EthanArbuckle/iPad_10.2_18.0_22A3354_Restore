@implementation PUPickerPrivacyBadge

- (PUPickerPrivacyBadge)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  PUPickerPrivacyBadge *v9;
  PUPickerPrivacyBadge *v10;
  PUPickerBadgeIconView *v11;
  PUPickerBadgeIconView *iconView;
  void *v13;
  id v14;
  uint64_t v15;
  UILabel *label;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[11];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v50[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49.receiver = self;
  v49.super_class = (Class)PUPickerPrivacyBadge;
  v9 = -[PUPickerPrivacyBadge initWithEffect:](&v49, sel_initWithEffect_, v8);
  v10 = v9;
  if (v9)
  {
    -[PUPickerPrivacyBadge setFrame:](v9, "setFrame:", x, y, width, height);
    -[PUPickerPrivacyBadge _setCornerRadius:](v10, "_setCornerRadius:", 6.0);
    v11 = -[PUPickerBadgeIconView initWithFrame:]([PUPickerBadgeIconView alloc], "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
    v48 = v8;
    iconView = v10->_iconView;
    v10->_iconView = v11;

    -[PUPickerBadgeIconView setTranslatesAutoresizingMaskIntoConstraints:](v10->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPickerPrivacyBadge contentView](v10, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v10->_iconView);

    v14 = objc_alloc(MEMORY[0x1E0DC3990]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v10->_label;
    v10->_label = (UILabel *)v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_label, "setFont:", v17);

    PULocalizedString(CFSTR("PICKER_PRIVACY_INDICATOR"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_label, "setText:", v18);

    -[PUPickerPrivacyBadge contentView](v10, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v10->_label);

    v37 = (void *)MEMORY[0x1E0CB3718];
    -[PUPickerBadgeIconView widthAnchor](v10->_iconView, "widthAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToConstant:", 20.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v46;
    -[PUPickerBadgeIconView heightAnchor](v10->_iconView, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 20.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v44;
    -[PUPickerBadgeIconView leadingAnchor](v10->_iconView, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrivacyBadge leadingAnchor](v10, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 2.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v41;
    -[PUPickerBadgeIconView topAnchor](v10->_iconView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrivacyBadge topAnchor](v10, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 2.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v38;
    -[PUPickerPrivacyBadge bottomAnchor](v10, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerBadgeIconView bottomAnchor](v10->_iconView, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 2.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v34;
    -[UILabel leadingAnchor](v10->_label, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerBadgeIconView trailingAnchor](v10->_iconView, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 3.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v31;
    -[UILabel topAnchor](v10->_label, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrivacyBadge topAnchor](v10, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v21;
    -[UILabel bottomAnchor](v10->_label, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrivacyBadge bottomAnchor](v10, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v24;
    -[PUPickerPrivacyBadge trailingAnchor](v10, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v10->_label, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 6.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[8] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v28);

    v8 = v48;
  }

  return v10;
}

- (CGRect)imageFrame
{
  PUPickerBadgeIconView *iconView;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  iconView = self->_iconView;
  -[PUPickerBadgeIconView bounds](iconView, "bounds");
  -[PUPickerBadgeIconView convertRect:toView:](iconView, "convertRect:toView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)labelFrame
{
  UILabel *label;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  label = self->_label;
  -[UILabel bounds](label, "bounds");
  -[UILabel convertRect:toView:](label, "convertRect:toView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (UIFont)labelFont
{
  return -[UILabel font](self->_label, "font");
}

- (NSString)labelText
{
  return -[UILabel text](self->_label, "text");
}

- (void)flipToPrivacyIconAndDismissAfterDelay:(double)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v6 = a4;
  -[PUPickerBadgeIconView flipToPrivacyIconAfterDelay:](self->_iconView, "flipToPrivacyIconAfterDelay:", a3);
  v7 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PUPickerPrivacyBadge_flipToPrivacyIconAndDismissAfterDelay_completion___block_invoke;
  v16[3] = &unk_1E58ABD10;
  v16[4] = self;
  v9 = (void *)objc_msgSend(v7, "initWithDuration:controlPoint1:controlPoint2:animations:", v16, 0.167, 0.33, 0.0, 0.8, 0.7);
  objc_msgSend(v9, "startAnimationAfterDelay:", a3 + 1.75);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __73__PUPickerPrivacyBadge_flipToPrivacyIconAndDismissAfterDelay_completion___block_invoke_2;
  v15[3] = &unk_1E58ABD10;
  v15[4] = self;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:controlPoint1:controlPoint2:animations:", v15, 0.167, 0.33, 0.0, 0.67, 1.0);
  objc_msgSend(v10, "startAnimationAfterDelay:", a3 + 1.75);
  v11 = dispatch_time(0, (uint64_t)(a3 + 4000000000.0));
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __73__PUPickerPrivacyBadge_flipToPrivacyIconAndDismissAfterDelay_completion___block_invoke_3;
  block[3] = &unk_1E58ABAC8;
  v14 = v6;
  v12 = v6;
  dispatch_after(v11, MEMORY[0x1E0C80D38], block);

}

- (PUPickerBadgeIconView)iconView
{
  return self->_iconView;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

uint64_t __73__PUPickerPrivacyBadge_flipToPrivacyIconAndDismissAfterDelay_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.75, 0.75);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __73__PUPickerPrivacyBadge_flipToPrivacyIconAndDismissAfterDelay_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __73__PUPickerPrivacyBadge_flipToPrivacyIconAndDismissAfterDelay_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
