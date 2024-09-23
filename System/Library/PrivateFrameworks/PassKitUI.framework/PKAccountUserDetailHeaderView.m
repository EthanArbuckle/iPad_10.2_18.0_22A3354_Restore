@implementation PKAccountUserDetailHeaderView

- (PKAccountUserDetailHeaderView)initWithFrame:(CGRect)a3
{
  PKAccountUserDetailHeaderView *v3;
  PKAvatarHeaderView *v4;
  PKAvatarHeaderView *avatarHeaderView;
  CNContactInlineActionsViewController *v6;
  CNContactInlineActionsViewController *actionsViewController;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKAccountUserDetailHeaderView;
  v3 = -[PKAccountUserDetailHeaderView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[PKAvatarHeaderView initWithContact:counterpartHandle:]([PKAvatarHeaderView alloc], "initWithContact:counterpartHandle:", 0, 0);
    avatarHeaderView = v3->_avatarHeaderView;
    v3->_avatarHeaderView = v4;

    -[PKAccountUserDetailHeaderView addSubview:](v3, "addSubview:", v3->_avatarHeaderView);
    v6 = (CNContactInlineActionsViewController *)objc_alloc_init(getCNContactInlineActionsViewControllerClass());
    actionsViewController = v3->_actionsViewController;
    v3->_actionsViewController = v6;

    -[CNContactInlineActionsViewController setDisplaysTitles:](v3->_actionsViewController, "setDisplaysTitles:", 1);
    -[CNContactInlineActionsViewController setDisplaysUnavailableActionTypes:](v3->_actionsViewController, "setDisplaysUnavailableActionTypes:", 1);
    -[CNContactInlineActionsViewController setViewStyle:](v3->_actionsViewController, "setViewStyle:", 7);
    -[CNContactInlineActionsViewController view](v3->_actionsViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
    -[PKAccountUserDetailHeaderView addSubview:](v3, "addSubview:", v8);
    -[PKAccountUserDetailHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = PKUserInterfaceIdiomSupportsLargeLayouts();
  v7 = 20.0;
  if (v6)
    v7 = 28.0;
  v8 = width + v7 * -2.0;
  -[PKAvatarHeaderView sizeThatFits:](self->_avatarHeaderView, "sizeThatFits:", v8, height);
  v10 = v9;
  -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, height);
  v13 = v12;

  v14 = v10 + v13 + 15.0;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGRect v15;
  CGRect remainder;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)PKAccountUserDetailHeaderView;
  -[PKAccountUserDetailHeaderView layoutSubviews](&v17, sel_layoutSubviews);
  -[PKAccountUserDetailHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  remainder.origin.x = v3;
  remainder.origin.y = v5;
  remainder.size.width = v7;
  remainder.size.height = v9;
  memset(&v15, 0, sizeof(v15));
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
    v11 = 28.0;
  else
    v11 = 20.0;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  CGRectDivide(v18, &v15, &remainder, v11, CGRectMinXEdge);
  CGRectDivide(remainder, &v15, &remainder, v11, CGRectMaxXEdge);
  -[PKAvatarHeaderView sizeThatFits:](self->_avatarHeaderView, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v15, &remainder, v12, CGRectMinYEdge);
  -[PKAvatarHeaderView setFrame:](self->_avatarHeaderView, "setFrame:", *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);
  CGRectDivide(remainder, &v15, &remainder, 15.0, CGRectMinYEdge);
  -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v15, &remainder, v14, CGRectMinYEdge);
  objc_msgSend(v13, "setFrame:", *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);

}

- (void)setContactForDisplay:(id)a3
{
  CNContact **p_contactForDisplay;
  id v6;

  p_contactForDisplay = &self->_contactForDisplay;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactForDisplay, a3);
    -[PKAvatarHeaderView setContact:](self->_avatarHeaderView, "setContact:", *p_contactForDisplay);
    -[PKAccountUserDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setContactForActions:(id)a3
{
  CNContact **p_contactForActions;
  id v6;

  p_contactForActions = &self->_contactForActions;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactForActions, a3);
    -[CNContactInlineActionsViewController setContact:](self->_actionsViewController, "setContact:", *p_contactForActions);
    -[PKAccountUserDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CNContact)contactForDisplay
{
  return self->_contactForDisplay;
}

- (CNContact)contactForActions
{
  return self->_contactForActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactForActions, 0);
  objc_storeStrong((id *)&self->_contactForDisplay, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_avatarHeaderView, 0);
}

@end
