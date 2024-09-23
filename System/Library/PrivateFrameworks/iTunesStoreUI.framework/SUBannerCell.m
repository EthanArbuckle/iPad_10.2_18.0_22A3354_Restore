@implementation SUBannerCell

- (SUBannerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUBannerCell *v4;
  SUBannerCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUBannerCell;
  v4 = -[SUTableCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[SUTableCellContentView removeFromSuperview](v4->super._configurationView, "removeFromSuperview");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if ((SUBannerCell *)-[SUCellConfiguration view](-[SUTableCell configuration](self, "configuration"), "view") == self)
    -[SUCellConfiguration setView:](-[SUTableCell configuration](self, "configuration"), "setView:", 0);
  -[UIButton removeTarget:action:forControlEvents:](self->_leftButton, "removeTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
  -[UIButton removeFromSuperview](self->_leftButton, "removeFromSuperview");

  self->_leftButton = 0;
  -[UIButton removeTarget:action:forControlEvents:](self->_rightButton, "removeTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
  -[UIButton removeFromSuperview](self->_rightButton, "removeFromSuperview");

  self->_rightButton = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUBannerCell;
  -[SUTableCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  SUCellConfiguration *v3;
  SUCellConfiguration *v4;
  double v5;
  double v6;
  UIButton *leftButton;
  UIButton *rightButton;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUBannerCell;
  -[SUTableCell layoutSubviews](&v9, sel_layoutSubviews);
  v3 = -[SUTableCell configuration](self, "configuration");
  if (v3)
  {
    v4 = v3;
    objc_msgSend((id)-[SUBannerCell contentView](self, "contentView"), "bounds");
    -[SUCellConfiguration setLayoutSize:](v4, "setLayoutSize:", v5, v6);
    if (!-[UIButton backgroundImageForState:](self->_leftButton, "backgroundImageForState:", 0)
      || !-[UIButton backgroundImageForState:](self->_rightButton, "backgroundImageForState:", 0))
    {
      -[SUCellConfiguration reloadImages](v4, "reloadImages");
    }
    -[SUCellConfiguration reloadLayoutInformation](v4, "reloadLayoutInformation");
    -[UIButton setBackgroundImage:forState:](self->_leftButton, "setBackgroundImage:forState:", -[SUCellConfiguration imageAtIndex:withModifiers:](v4, "imageAtIndex:withModifiers:", 0, 0), 0);
    leftButton = self->_leftButton;
    -[SUCellConfiguration frameForImageAtIndex:](v4, "frameForImageAtIndex:", 0);
    -[UIButton setFrame:](leftButton, "setFrame:");
    -[UIButton setBackgroundImage:forState:](self->_rightButton, "setBackgroundImage:forState:", -[SUCellConfiguration imageAtIndex:withModifiers:](v4, "imageAtIndex:withModifiers:", 1, 0), 0);
    rightButton = self->_rightButton;
    -[SUCellConfiguration frameForImageAtIndex:](v4, "frameForImageAtIndex:", 1);
    -[UIButton setFrame:](rightButton, "setFrame:");
  }
}

- (void)setConfiguration:(id)a3
{
  SUCellConfiguration *v6;
  objc_super v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUBannerCell.m"), 69, CFSTR("Configuration for banner cell must be banner configuration"));
  v6 = -[SUTableCell configuration](self, "configuration");
  if ((SUBannerCell *)-[SUCellConfiguration view](v6, "view") == self)
    -[SUCellConfiguration setView:](v6, "setView:", 0);
  v7.receiver = self;
  v7.super_class = (Class)SUBannerCell;
  -[SUTableCell setConfiguration:](&v7, sel_setConfiguration_, a3);
  objc_msgSend(a3, "setView:", self);
  -[SUBannerCell _reloadButtons](self, "_reloadButtons");
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUBannerCell;
  -[SUTableCell setHighlighted:animated:](&v4, sel_setHighlighted_animated_, 0, 0);
}

- (void)_buttonAction:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;

  v4 = self->_leftButton != a3;
  v5 = -[SUBannerCell nextResponder](self, "nextResponder");
  if (v5)
  {
    v6 = (void *)v5;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6 = (void *)objc_msgSend(v6, "nextResponder");
      if (!v6)
        return;
    }
    objc_msgSend(v6, "bannerCell:tappedButtonAtIndex:", self, v4);
  }
}

- (id)_newButton
{
  return objc_alloc_init(MEMORY[0x24BDF6880]);
}

- (void)_reloadButtons
{
  void *v3;
  UIButton *leftButton;
  UIButton *v5;
  UIButton *rightButton;
  UIButton *v7;

  if (-[SUTableCell configuration](self, "configuration"))
  {
    v3 = (void *)-[SUBannerCell contentView](self, "contentView");
    leftButton = self->_leftButton;
    if (!leftButton)
    {
      v5 = -[SUBannerCell _newButton](self, "_newButton");
      self->_leftButton = v5;
      -[UIButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
      objc_msgSend(v3, "addSubview:", self->_leftButton);
      leftButton = self->_leftButton;
    }
    -[UIButton setBackgroundImage:forState:](leftButton, "setBackgroundImage:forState:", 0, 0);
    rightButton = self->_rightButton;
    if (!rightButton)
    {
      v7 = -[SUBannerCell _newButton](self, "_newButton");
      self->_rightButton = v7;
      -[UIButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
      objc_msgSend(v3, "addSubview:", self->_rightButton);
      rightButton = self->_rightButton;
    }
    -[UIButton setBackgroundImage:forState:](rightButton, "setBackgroundImage:forState:", 0, 0);
  }
  else
  {
    -[UIButton removeTarget:action:forControlEvents:](self->_leftButton, "removeTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
    -[UIButton removeFromSuperview](self->_leftButton, "removeFromSuperview");

    self->_leftButton = 0;
    -[UIButton removeTarget:action:forControlEvents:](self->_rightButton, "removeTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
    -[UIButton removeFromSuperview](self->_rightButton, "removeFromSuperview");

    self->_rightButton = 0;
  }
  -[SUBannerCell setNeedsLayout](self, "setNeedsLayout");
}

@end
