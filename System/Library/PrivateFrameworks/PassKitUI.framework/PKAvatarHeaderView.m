@implementation PKAvatarHeaderView

- (PKAvatarHeaderView)initWithContact:(id)a3 counterpartHandle:(id)a4
{
  id v7;
  id v8;
  PKAvatarHeaderView *v9;
  PKAvatarHeaderView *v10;
  CNAvatarView *v11;
  CNAvatarView *avatarView;
  UILabel *v13;
  UILabel *primaryLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  NSString *v18;
  void *v19;
  UILabel *v20;
  UILabel *secondaryLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  NSString **p_counterpartHandle;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKAvatarHeaderView;
  v9 = -[PKAvatarHeaderView init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    p_counterpartHandle = &v9->_counterpartHandle;
    objc_storeStrong((id *)&v9->_counterpartHandle, a4);
    objc_storeStrong((id *)&v10->_contact, a3);
    v11 = (CNAvatarView *)objc_alloc_init(getCNAvatarViewClass_1());
    avatarView = v10->_avatarView;
    v10->_avatarView = v11;

    -[PKAvatarHeaderView addSubview:](v10, "addSubview:", v10->_avatarView);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v10->_primaryLabel;
    v10->_primaryLabel = v13;

    v15 = v10->_primaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_primaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v10->_primaryLabel, "setNumberOfLines:", 1);
    v17 = v10->_primaryLabel;
    v18 = (NSString *)*MEMORY[0x1E0DC48F8];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v19);

    -[UILabel setAccessibilityIdentifier:](v10->_primaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKAvatarHeaderView addSubview:](v10, "addSubview:", v10->_primaryLabel);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = v10->_secondaryLabel;
    v10->_secondaryLabel = v20;

    -[UILabel setNumberOfLines:](v10->_secondaryLabel, "setNumberOfLines:", 1);
    v22 = v10->_secondaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    v24 = v10->_secondaryLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[UILabel setAccessibilityIdentifier:](v10->_secondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKAvatarHeaderView addSubview:](v10, "addSubview:", v10->_secondaryLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAvatarHeaderView setBackgroundColor:](v10, "setBackgroundColor:", v26);

    if (v10->_contact || *p_counterpartHandle)
      -[PKAvatarHeaderView configureForContact](v10, "configureForContact", p_counterpartHandle);
  }

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKAvatarHeaderView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 1.79769313e308);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAvatarHeaderView;
  -[PKAvatarHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKAvatarHeaderView bounds](self, "bounds");
  -[PKAvatarHeaderView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 1);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 applyLayout:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CNAvatarView *avatarView;
  CGFloat v11;
  UILabel *primaryLabel;
  double v13;
  CGFloat v14;
  UILabel *secondaryLabel;
  CGFloat v16;
  double MaxY;
  double v18;
  CGRect v19;
  CGRect remainder;
  CGSize result;
  CGRect v22;
  CGRect v23;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.origin.x = a3.origin.x + 14.0;
  v22.origin.y = a3.origin.y + 14.0;
  v22.size.width = a3.size.width + -28.0;
  v22.size.height = a3.size.height + -14.0;
  remainder = v22;
  memset(&v19, 0, sizeof(v19));
  CGRectDivide(v22, &v19, &remainder, 100.0, CGRectMinYEdge);
  if (v4)
  {
    avatarView = self->_avatarView;
    PKSizeAlignedInRect();
    -[CNAvatarView setFrame:](avatarView, "setFrame:");
  }
  CGRectDivide(remainder, &v19, &remainder, 14.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:](self->_primaryLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v19, &remainder, v11, CGRectMinYEdge);
  if (v4)
  {
    primaryLabel = self->_primaryLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](primaryLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v14 = v13;
  if (v13 > 0.0)
    CGRectDivide(remainder, &v19, &remainder, 3.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v19, &remainder, v14, CGRectMinYEdge);
  if (v4)
  {
    secondaryLabel = self->_secondaryLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](secondaryLabel, "setFrame:");
  }
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v16 = CGRectGetWidth(v23);
  MaxY = CGRectGetMaxY(v19);
  v18 = v16;
  result.height = MaxY;
  result.width = v18;
  return result;
}

- (void)configureForContact
{
  void *v3;
  id v4;
  UILabel *secondaryLabel;
  void *v6;
  UILabel *primaryLabel;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_contact)
  {
    v10[0] = self->_contact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v4, "setContactType:", 0);
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CNAvatarView setContacts:](self->_avatarView, "setContacts:", v3);
  secondaryLabel = self->_secondaryLabel;
  -[CNContact organizationName](self->_contact, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](secondaryLabel, "setText:", v6);

  primaryLabel = self->_primaryLabel;
  objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", self->_counterpartHandle, self->_contact);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](primaryLabel, "setText:", v8);

  -[PKAvatarHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContact:(id)a3
{
  CNContact *v5;
  CNContact *v6;

  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contact, a3);
    -[PKAvatarHeaderView configureForContact](self, "configureForContact");
    v5 = v6;
  }

}

- (void)setCounterpartHandle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_counterpartHandle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_counterpartHandle, a3);
    -[PKAvatarHeaderView configureForContact](self, "configureForContact");
    v5 = v6;
  }

}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)counterpartHandle
{
  return self->_counterpartHandle;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_counterpartHandle, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
