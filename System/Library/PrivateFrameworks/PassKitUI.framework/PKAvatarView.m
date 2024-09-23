@implementation PKAvatarView

- (PKAvatarView)init
{
  PKAvatarView *v2;
  CNAvatarViewController *v3;
  CNAvatarViewController *avatarViewController;
  void *v5;
  UILabel *v6;
  UILabel *contactNameLabel;
  UILabel *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAvatarView;
  v2 = -[PKAvatarView init](&v11, sel_init);
  if (v2)
  {
    v3 = (CNAvatarViewController *)objc_alloc_init(MEMORY[0x1E0C97470]);
    avatarViewController = v2->_avatarViewController;
    v2->_avatarViewController = v3;

    -[CNAvatarViewController view](v2->_avatarViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAvatarView addSubview:](v2, "addSubview:", v5);

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    contactNameLabel = v2->_contactNameLabel;
    v2->_contactNameLabel = v6;

    v8 = v2->_contactNameLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48F8], *MEMORY[0x1E0DC1448]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[UILabel setHidden:](v2->_contactNameLabel, "setHidden:", 1);
    -[PKAvatarView addSubview:](v2, "addSubview:", v2->_contactNameLabel);
    v2->_diameter = 35.0;
  }
  return v2;
}

- (void)setContact:(id)a3
{
  id v5;
  CNAvatarViewController *avatarViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  avatarViewController = self->_avatarViewController;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarViewController setContacts:](avatarViewController, "setContacts:", v7);

  -[CNAvatarViewController view](self->_avatarViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[CNAvatarViewController view](self->_avatarViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAvatarView bringSubviewToFront:](self, "bringSubviewToFront:", v9);

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[UILabel setText:](self->_contactNameLabel, "setText:", v10);

}

- (void)setPlaceholderName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  CNAvatarViewController *avatarViewController;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C97360];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setGivenName:", v5);

  avatarViewController = self->_avatarViewController;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarViewController setContacts:](avatarViewController, "setContacts:", v8);

  -[CNAvatarViewController view](self->_avatarViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  -[CNAvatarViewController view](self->_avatarViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAvatarView bringSubviewToFront:](self, "bringSubviewToFront:", v10);

}

- (void)setPlaceholderImage:(id)a3
{
  id v4;
  UIImageView *placeholderImageView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  id v9;

  v4 = a3;
  placeholderImageView = self->_placeholderImageView;
  v9 = v4;
  if (!placeholderImageView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v7 = self->_placeholderImageView;
    self->_placeholderImageView = v6;

    -[UIImageView setContentMode:](self->_placeholderImageView, "setContentMode:", 1);
    -[PKAvatarView addSubview:](self, "addSubview:", self->_placeholderImageView);
    v4 = v9;
    placeholderImageView = self->_placeholderImageView;
  }
  -[UIImageView setImage:](placeholderImageView, "setImage:", v4);
  -[PKAvatarView bringSubviewToFront:](self, "bringSubviewToFront:", self->_placeholderImageView);
  -[CNAvatarViewController view](self->_avatarViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

}

- (void)setShowsName:(BOOL)a3
{
  if (self->_showsName != a3)
  {
    self->_showsName = a3;
    -[UILabel setHidden:](self->_contactNameLabel, "setHidden:", !a3);
    -[PKAvatarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKAvatarView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAvatarView;
  -[PKAvatarView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKAvatarView bounds](self, "bounds");
  -[PKAvatarView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplate:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRectEdge v10;
  CGSize v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  UILabel *contactNameLabel;
  double v27;
  double v28;
  CGRect v29;
  CGRect remainder;
  CGSize result;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKAvatarView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v10 = CGRectMaxXEdge;
  else
    v10 = CGRectMinXEdge;
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v29.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v29.size = v11;
  -[CNAvatarViewController view](self->_avatarViewController, "view", *(_OWORD *)&v29.origin);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");

  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  CGRectDivide(v32, &v29, &remainder, self->_diameter, v10);
  PKRectCenteredIntegralRect();
  v16 = v15;
  v18 = v17;
  if (!a4)
  {
    v19 = v13;
    v20 = v14;
    -[CNAvatarViewController view](self->_avatarViewController, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v19, v20, v16, v18);

    -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:", v19, v20, v16, v18);
  }
  v22 = v16 + 0.0;
  if (self->_showsName)
  {
    CGRectDivide(remainder, &v29, &remainder, 8.0, v10);
    v22 = v22 + v29.size.width;
    if (self->_showsName)
    {
      -[UILabel sizeThatFits:](self->_contactNameLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
      v24 = v23;
      CGRectDivide(remainder, &v29, &remainder, v25, v10);
      if (!a4)
      {
        contactNameLabel = self->_contactNameLabel;
        PKRectCenteredIntegralRect();
        -[UILabel setFrame:](contactNameLabel, "setFrame:");
      }
      v22 = v22 + v29.size.width;
      v18 = fmax(v18, v24);
    }
  }
  v27 = v22;
  v28 = v18;
  result.height = v28;
  result.width = v27;
  return result;
}

- (id)descriptorForRequiredKeys
{
  return (id)-[CNAvatarViewController descriptorForRequiredKeys](self->_avatarViewController, "descriptorForRequiredKeys");
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)placeholderName
{
  return self->_placeholderName;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (BOOL)showsName
{
  return self->_showsName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_placeholderName, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

@end
