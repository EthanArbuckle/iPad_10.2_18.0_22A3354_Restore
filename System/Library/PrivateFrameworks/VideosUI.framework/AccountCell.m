@implementation AccountCell

+ (int64_t)cellStyle
{
  return 3;
}

- (AccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AccountCell *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AccountCell;
  v5 = -[AccountCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithTintColor:renderingMode:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CFAED0]);
  objc_msgSend(v9, "profilePictureForPicture:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AccountCell setPlaceHolderImage:](v5, "setPlaceHolderImage:", v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel__profileImageDidChange_, CFSTR("VUIAuthenticationManagerProfileImageDidChangeNotification"), 0);

  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AccountCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v11, sel_refreshCellContentsWithSpecifier_, v4);
  -[AccountCell setAccessoryType:](self, "setAccessoryType:", 1, v11.receiver, v11.super_class);
  -[AccountCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80978]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[AccountCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80950]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  -[AccountCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80948]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTextColor:", v10);
  -[AccountCell _updateAccountImage](self, "_updateAccountImage");
  -[AccountCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AccountCell;
  -[PSTableCell layoutSubviews](&v4, sel_layoutSubviews);
  -[AccountCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, 56.0, 56.0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)AccountCell;
  -[AccountCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 72.0)
    v4 = 72.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateAccountImage
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];

  if (!+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
    goto LABEL_4;
  +[VUIAuthenticationManager userProfileImage](VUIAuthenticationManager, "userProfileImage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    +[VUIAuthenticationManager monogramAvatarForSize:scale:isRTL:](VUIAuthenticationManager, "monogramAvatarForSize:scale:isRTL:", -[AccountCell vuiIsRTL](self, "vuiIsRTL"), 56.0, 56.0, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v3 = (uint64_t)v7;
    if (!v7)
    {
LABEL_4:
      -[AccountCell placeHolderImage](self, "placeHolderImage", v7);
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  -[AccountCell imageView](self, "imageView", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__AccountCell__updateAccountImage__block_invoke;
  v9[3] = &unk_1E9F98DF0;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);

}

uint64_t __34__AccountCell__updateAccountImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
}

- (void)_profileImageDidChange:(id)a3
{
  _QWORD block[2];
  uint64_t (*v4)(uint64_t);
  void *v5;
  AccountCell *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __38__AccountCell__profileImageDidChange___block_invoke;
  v5 = &unk_1E9F98DF0;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __38__AccountCell__profileImageDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountImage");
}

- (UIImage)placeHolderImage
{
  return self->_placeHolderImage;
}

- (void)setPlaceHolderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeHolderImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHolderImage, 0);
}

@end
