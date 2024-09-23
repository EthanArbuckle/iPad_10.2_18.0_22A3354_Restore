@implementation WFVariableCell

- (WFVariableCell)initWithFrame:(CGRect)a3
{
  WFVariableCell *v3;
  void *v4;
  WFVariableCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFVariableCell;
  v3 = -[WFVariableCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    WFLocalizedString(CFSTR("Double tap to insert"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariableCell setAccessibilityHint:](v3, "setAccessibilityHint:", v4);

    v5 = v3;
  }

  return v3;
}

- (void)updateVariableImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  int v19;
  unint64_t v20;
  WFVariablePillView *pillView;
  WFVariablePillView *v22;
  double v23;
  WFVariablePillView *v24;
  void *v25;
  WFVariablePillView *v26;
  id v27;

  -[WFVariableCell variable](self, "variable");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "propertyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v27, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v27, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v27, "isAvailable");
  v9 = -[WFVariableCell isHighlighted](self, "isHighlighted");
  -[WFVariableCell currentTitle](self, "currentTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {

  }
  else
  {
    v14 = v12;
    v15 = v11;
    if (!v11)
      goto LABEL_20;
    v14 = v12;
    v15 = v11;
    if (!v12)
      goto LABEL_20;
    v16 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v16)
      goto LABEL_22;
  }
  -[WFVariableCell currentIcon](self, "currentIcon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v18 = v17;
  v15 = v18;
  if (v14 == v18)
  {

    goto LABEL_16;
  }
  if (v14 && v18)
  {
    v19 = objc_msgSend(v14, "isEqual:", v18);

    if (!v19)
      goto LABEL_21;
LABEL_16:
    if ((_DWORD)v8 == -[WFVariableCell currentAvailable](self, "currentAvailable"))
    {
      v20 = -[WFVariableCell currentControlState](self, "currentControlState");

      if (v20 == v9)
        goto LABEL_26;
      goto LABEL_23;
    }
    goto LABEL_21;
  }

LABEL_20:
LABEL_21:

LABEL_22:
LABEL_23:
  pillView = self->_pillView;
  if (pillView)
    -[WFVariablePillView removeFromSuperview](pillView, "removeFromSuperview");
  v22 = [WFVariablePillView alloc];
  -[WFVariableCell bounds](self, "bounds");
  v24 = -[WFVariablePillView initWithName:icon:font:available:height:controlState:](v22, "initWithName:icon:font:available:height:controlState:", v11, v7, 0, v8, v9, v23);
  -[WFVariablePillView setUserInteractionEnabled:](v24, "setUserInteractionEnabled:", 0);
  -[WFVariableCell bounds](self, "bounds");
  -[WFVariablePillView setFrame:](v24, "setFrame:");
  -[WFVariablePillView setAutoresizingMask:](v24, "setAutoresizingMask:", 18);
  -[WFVariableCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v24);

  v26 = self->_pillView;
  self->_pillView = v24;

  -[WFVariableCell setCurrentTitle:](self, "setCurrentTitle:", v11);
  -[WFVariableCell setCurrentIcon:](self, "setCurrentIcon:", v7);
  -[WFVariableCell setCurrentAvailable:](self, "setCurrentAvailable:", v8);
  -[WFVariableCell setCurrentControlState:](self, "setCurrentControlState:", v9);
LABEL_26:

}

- (void)setVariable:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_variable, a3);
  v5 = a3;
  -[WFVariableCell updateVariableImage](self, "updateVariableImage");
  objc_msgSend(v5, "nameIncludingPropertyName");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WFVariableCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v6);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFVariableCell;
  -[WFVariableCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[WFVariableCell updateVariableImage](self, "updateVariableImage");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (WFVariable)variable
{
  return self->_variable;
}

- (WFVariablePillView)pillView
{
  return self->_pillView;
}

- (NSString)currentTitle
{
  return self->_currentTitle;
}

- (void)setCurrentTitle:(id)a3
{
  objc_storeStrong((id *)&self->_currentTitle, a3);
}

- (WFIcon)currentIcon
{
  return self->_currentIcon;
}

- (void)setCurrentIcon:(id)a3
{
  objc_storeStrong((id *)&self->_currentIcon, a3);
}

- (BOOL)currentAvailable
{
  return self->_currentAvailable;
}

- (void)setCurrentAvailable:(BOOL)a3
{
  self->_currentAvailable = a3;
}

- (unint64_t)currentControlState
{
  return self->_currentControlState;
}

- (void)setCurrentControlState:(unint64_t)a3
{
  self->_currentControlState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIcon, 0);
  objc_storeStrong((id *)&self->_currentTitle, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

+ (double)widthWithVariable:(id)a3 height:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v5 = a3;
  objc_msgSend(v5, "propertyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "name");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v5, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFVariablePillView widthForVariableViewWithName:icon:font:height:](WFVariablePillView, "widthForVariableViewWithName:icon:font:height:", v9, v10, 0, a4);
  v12 = v11;

  return v12;
}

@end
