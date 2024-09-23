@implementation PKAvatarTableViewCell

- (PKAvatarTableViewCell)initWithContact:(id)a3 delegate:(id)a4 style:(int64_t)a5 reuseIdentifier:(id)a6
{
  id v9;
  PKAvatarTableViewCell *v10;
  CNAvatarView *v11;
  CNAvatarView *avatarView;
  void *v13;

  v9 = a3;
  v10 = -[PKAvatarTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", a5, a6);
  if (v10)
  {
    v11 = (CNAvatarView *)objc_alloc_init(getCNAvatarViewClass_3());
    avatarView = v10->_avatarView;
    v10->_avatarView = v11;

    -[PKAvatarTableViewCell contentView](v10, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v10->_avatarView);

    -[PKAvatarTableViewCell setContact:](v10, "setContact:", v9);
  }

  return v10;
}

- (void)layoutSubviews
{
  CGRectEdge v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CNAvatarView *avatarView;
  CGRect v16;
  CGRect remainder;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PKAvatarTableViewCell;
  -[PKAvatarTableViewCell layoutSubviews](&v18, sel_layoutSubviews);
  if (-[PKAvatarTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v3 = CGRectMaxXEdge;
  else
    v3 = CGRectMinXEdge;
  -[PKAvatarTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v19.origin.x = v6 + v13;
  v19.size.width = v10 - (v13 + v14);
  v19.size.height = v12 + -16.0;
  remainder.origin.x = v6 + v13;
  remainder.origin.y = v8 + 8.0;
  remainder.size.width = v19.size.width;
  remainder.size.height = v12 + -16.0;
  memset(&v16, 0, sizeof(v16));
  v19.origin.y = v8 + 8.0;
  CGRectDivide(v19, &v16, &remainder, 45.0, v3);
  avatarView = self->_avatarView;
  PKSizeAlignedInRect();
  -[CNAvatarView setFrame:](avatarView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)PKAvatarTableViewCell;
  -[PKAvatarTableViewCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 61.0)
    v4 = 61.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContact:(id)a3
{
  CNContact *v5;
  CNContact *v6;

  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    v6 = v5;
    -[CNAvatarView setContact:](self->_avatarView, "setContact:", v5);
    objc_storeStrong((id *)&self->_contact, a3);
    v5 = v6;
  }

}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
