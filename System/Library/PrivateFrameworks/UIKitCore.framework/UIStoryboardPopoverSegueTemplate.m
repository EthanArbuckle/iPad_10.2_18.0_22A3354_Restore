@implementation UIStoryboardPopoverSegueTemplate

- (UIStoryboardPopoverSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardPopoverSegueTemplate *v5;
  void *v6;
  uint64_t v7;
  NSArray *passthroughViews;
  uint64_t v9;
  UIBarButtonItem *anchorBarButtonItem;
  uint64_t v11;
  UIView *anchorView;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIStoryboardPopoverSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_permittedArrowDirections = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIPermittedArrowDirections"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIPassthroughViews"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    passthroughViews = v5->_passthroughViews;
    v5->_passthroughViews = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAnchorBarButtonItem"));
    v9 = objc_claimAutoreleasedReturnValue();
    anchorBarButtonItem = v5->_anchorBarButtonItem;
    v5->_anchorBarButtonItem = (UIBarButtonItem *)v9;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAnchorView"));
    v11 = objc_claimAutoreleasedReturnValue();
    anchorView = v5->_anchorView;
    v5->_anchorView = (UIView *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardPopoverSegueTemplate;
  v4 = a3;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_permittedArrowDirections, CFSTR("UIPermittedArrowDirections"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passthroughViews, CFSTR("UIPassthroughViews"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorBarButtonItem, CFSTR("UIAnchorBarButtonItem"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorView, CFSTR("UIAnchorView"));

}

- (id)segueWithDestinationViewController:(id)a3
{
  id v4;
  UIStoryboardPopoverSegue *v5;
  void *v6;
  void *v7;
  UIStoryboardPopoverSegue *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = [UIStoryboardPopoverSegue alloc];
  -[UIStoryboardSegueTemplate identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardSegueTemplate viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIStoryboardSegue initWithIdentifier:source:destination:](v5, "initWithIdentifier:source:destination:", v6, v7, v4);

  -[UIStoryboardPopoverSegueTemplate passthroughViews](self, "passthroughViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardPopoverSegue _setPassthroughViews:](v8, "_setPassthroughViews:", v9);

  -[UIStoryboardPopoverSegue _setPermittedArrowDirections:](v8, "_setPermittedArrowDirections:", -[UIStoryboardPopoverSegueTemplate permittedArrowDirections](self, "permittedArrowDirections"));
  -[UIStoryboardPopoverSegueTemplate anchorBarButtonItem](self, "anchorBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardPopoverSegue _setAnchorBarButtonItem:](v8, "_setAnchorBarButtonItem:", v10);

  -[UIStoryboardPopoverSegueTemplate anchorView](self, "anchorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIStoryboardPopoverSegueTemplate anchorView](self, "anchorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStoryboardPopoverSegue _setAnchorView:](v8, "_setAnchorView:", v12);

    -[UIStoryboardPopoverSegueTemplate anchorView](self, "anchorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    -[UIStoryboardPopoverSegue _setAnchorRect:](v8, "_setAnchorRect:");

  }
  return v8;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
  objc_storeStrong((id *)&self->_anchorView, a3);
}

- (UIBarButtonItem)anchorBarButtonItem
{
  return self->_anchorBarButtonItem;
}

- (void)setAnchorBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end
