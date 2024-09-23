@implementation PRQuickActionControlView

- (PRQuickActionControlView)initWithControl:(id)a3 type:(unint64_t)a4
{
  id v6;
  PRQuickActionControlView *v7;
  uint64_t v8;
  CHUISControlInstance *controlInstance;
  uint64_t v10;
  CHUISControlIconView *iconView;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRQuickActionControlView;
  v7 = -[PRQuickActionControlView init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D102E8], "instanceWithControl:type:content:", v6, a4, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    controlInstance = v7->_controlInstance;
    v7->_controlInstance = (CHUISControlInstance *)v8;

    -[CHUISControlInstance activate](v7->_controlInstance, "activate");
    -[CHUISControlInstance iconView](v7->_controlInstance, "iconView");
    v10 = objc_claimAutoreleasedReturnValue();
    iconView = v7->_iconView;
    v7->_iconView = (CHUISControlIconView *)v10;

    -[CHUISControlIconView setOverrideUserInterfaceStyle:](v7->_iconView, "setOverrideUserInterfaceStyle:", 1);
    -[PRQuickActionControlView addSubview:](v7, "addSubview:", v7->_iconView);
    -[CHUISControlInstance setVisibility:](v7->_controlInstance, "setVisibility:", 2);
  }

  return v7;
}

- (void)layoutSubviews
{
  CHUISControlIconView *iconView;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRQuickActionControlView;
  -[PRQuickActionControlView layoutSubviews](&v6, sel_layoutSubviews);
  iconView = self->_iconView;
  -[PRQuickActionControlView bounds](self, "bounds");
  -[CHUISControlIconView setFrame:](iconView, "setFrame:");
  -[PRQuickActionControlView bounds](self, "bounds");
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v4 * 0.368, *MEMORY[0x1E0DC1448]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHUISControlIconView setFont:](self->_iconView, "setFont:", v5);

}

- (void)dealloc
{
  objc_super v3;

  -[CHUISControlInstance setVisibility:](self->_controlInstance, "setVisibility:", 0);
  -[CHUISControlInstance invalidate](self->_controlInstance, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRQuickActionControlView;
  -[PRQuickActionControlView dealloc](&v3, sel_dealloc);
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
    self->_selected = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_controlInstance, 0);
}

@end
