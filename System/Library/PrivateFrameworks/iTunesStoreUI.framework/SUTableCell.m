@implementation SUTableCell

- (SUTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUTableCell *v4;
  SUTableCell *v5;
  void *v6;
  SUTableCellContentView *v7;
  SUTableCellContentView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUTableCell;
  v4 = -[SUTableCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)-[SUTableCell contentView](v4, "contentView");
    v7 = [SUTableCellContentView alloc];
    objc_msgSend(v6, "bounds");
    v8 = -[SUTableCellContentView initWithFrame:](v7, "initWithFrame:");
    v5->_configurationView = v8;
    -[SUTableCellContentView setContentMode:](v8, "setContentMode:", 9);
    -[SUTableCellContentView setAutoresizingMask:](v5->_configurationView, "setAutoresizingMask:", 18);
    -[SUTableCellContentView setBackgroundColor:](v5->_configurationView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    objc_msgSend(v6, "addSubview:", v5->_configurationView);
    if (!initWithStyle_reuseIdentifier__sLayoutManager)
      initWithStyle_reuseIdentifier__sLayoutManager = objc_alloc_init(SUTableCellLayoutManager);
    -[SUTableCell setLayoutManager:](v5, "setLayoutManager:");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_bottomBorderColor = 0;
  self->_configurationView = 0;

  self->_itemOfferButton = 0;
  self->_topBorderColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableCell;
  -[SUTableCell dealloc](&v3, sel_dealloc);
}

- (id)copyPurchaseAnimationView
{
  SUCellConfiguration *v2;
  uint64_t v3;

  v2 = -[SUTableCell configuration](self, "configuration");
  v3 = -[SUCellConfiguration indexOfLabelForPurchaseAnimation](v2, "indexOfLabelForPurchaseAnimation");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return __CreateLabel(v2, v3, 0);
}

- (BOOL)_canDrawContent
{
  return self->_topBorderColor && self->_position.globalIndex || self->_bottomBorderColor != 0;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  UIColor *topBorderColor;
  double v9;
  __int128 v10;
  _OWORD v11[2];
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[SUTableCell bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  topBorderColor = self->_topBorderColor;
  if (topBorderColor && self->_position.globalIndex)
  {
    -[UIColor set](topBorderColor, "set");
    v12.origin.x = 0.0;
    v12.origin.y = 0.0;
    v12.size.height = 1.0;
    v12.size.width = v5;
    UIRectFill(v12);
  }
  if (self->_bottomBorderColor)
  {
    v9 = 1.0;
    if (self->_topBorderColor)
    {
      v10 = *(_OWORD *)&self->_position.globalIndex;
      v11[0] = *(_OWORD *)&self->_position.localIndex;
      v11[1] = v10;
      if (SUPositionIsLast((uint64_t)v11))
      {
        -[UIColor set](self->_topBorderColor, "set");
        v13.origin.y = v7 + -1.0;
        v13.origin.x = 0.0;
        v13.size.height = 1.0;
        v13.size.width = v5;
        UIRectFill(v13);
        v9 = 2.0;
      }
    }
    -[UIColor set](self->_bottomBorderColor, "set");
    v14.origin.y = v7 - v9;
    v14.origin.x = 0.0;
    v14.size.height = 1.0;
    v14.size.width = v5;
    UIRectFill(v14);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  SUItemOfferButton *v7;
  SUItemOfferButton *itemOfferButton;
  objc_super v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SUTableCell;
  v7 = -[SUTableCell hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  if (v7)
  {
    itemOfferButton = self->_itemOfferButton;
    if (v7 != itemOfferButton)
    {
      if (-[SUItemOfferButton isDescendantOfView:](itemOfferButton, "isDescendantOfView:", self))
      {
        -[SUItemOfferButton frame](self->_itemOfferButton, "frame");
        v13 = CGRectInset(v12, -30.0, -8.0);
        v11.x = x;
        v11.y = y;
        if (CGRectContainsPoint(v13, v11))
          return self->_itemOfferButton;
      }
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t editState;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v38.receiver = self;
  v38.super_class = (Class)SUTableCell;
  -[SUTableCell layoutSubviews](&v38, sel_layoutSubviews);
  v3 = (void *)-[SUTableCell accessoryView](self, "accessoryView");
  if ((SUTableCell *)objc_msgSend(v3, "superview") == self && (objc_msgSend(v3, "alpha"), v4 > 0.00000011920929))
  {
    objc_msgSend((id)-[SUTableCell layoutManager](self, "layoutManager"), "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", self, -[SUTableCell isEditing](self, "isEditing"), -[SUTableCell showingDeleteConfirmation](self, "showingDeleteConfirmation"));
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)-[SUTableCell contentView](self, "contentView");
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v39.origin.x = v6;
    v39.origin.y = v8;
    v39.size.width = v10;
    v39.size.height = v12;
    v20 = CGRectGetMinX(v39) + -5.0 - v15;
  }
  else
  {
    v13 = (void *)-[SUTableCell contentView](self, "contentView");
    objc_msgSend(v13, "frame");
    v15 = v21;
    v17 = v22;
    v19 = v23;
    v20 = v24 + -10.0;
  }
  objc_msgSend(v13, "setFrame:", v15, v17, v20, v19);
  objc_msgSend((id)-[SUTableCell contentView](self, "contentView"), "frame");
  v28 = v27;
  v30 = v29;
  editState = self->_editState;
  if (editState)
    v32 = v25 + 40.0;
  else
    v32 = v25;
  if (editState)
    v33 = v26 + -40.0;
  else
    v33 = v26;
  -[SUTableCellContentView frame](self->_configurationView, "frame");
  v41.origin.x = v34;
  v41.origin.y = v35;
  v41.size.width = v36;
  v41.size.height = v37;
  v40.origin.x = v32;
  v40.origin.y = v28;
  v40.size.width = v33;
  v40.size.height = v30;
  if (!CGRectEqualToRect(v40, v41))
  {
    -[SUTableCellContentView setFrame:](self->_configurationView, "setFrame:", v32, v28, v33, v30);
    -[SUTableCellContentView layoutSubviews](self->_configurationView, "layoutSubviews");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (a3)
    *(_QWORD *)&a3 = -[SUTableCell showingDeleteConfirmation](self, "showingDeleteConfirmation");
  -[SUTableCellContentView setDeleteConfirmationVisisble:](self->_configurationView, "setDeleteConfirmationVisisble:", a3);
  -[SUTableCellContentView setUsesSubviews:animated:](self->_configurationView, "setUsesSubviews:animated:", v5, v4);
  v7.receiver = self;
  v7.super_class = (Class)SUTableCell;
  -[SUTableCell setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[SUTableCell highlightsOnlyContentView](self, "highlightsOnlyContentView"))
  {
    -[SUTableCellContentView setHighlighted:](self->_configurationView, "setHighlighted:", v5);
  }
  else
  {
    v7 = v5 && (*((_BYTE *)self + 1040) & 1) == 0;
    v8.receiver = self;
    v8.super_class = (Class)SUTableCell;
    -[SUTableCell setHighlighted:animated:](&v8, sel_setHighlighted_animated_, v7, v4);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[SUTableCell highlightsOnlyContentView](self, "highlightsOnlyContentView"))
  {
    -[SUTableCellContentView setHighlighted:](self->_configurationView, "setHighlighted:", v5);
  }
  else
  {
    v7 = v5 && (*((_BYTE *)self + 1040) & 1) == 0;
    v8.receiver = self;
    v8.super_class = (Class)SUTableCell;
    -[SUTableCell setSelected:animated:](&v8, sel_setSelected_animated_, v7, v4);
  }
}

- (void)setShowingDeleteConfirmation:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUTableCellContentView setDeleteConfirmationVisisble:](self->_configurationView, "setDeleteConfirmationVisisble:");
  v5.receiver = self;
  v5.super_class = (Class)SUTableCell;
  -[SUTableCell setShowingDeleteConfirmation:](&v5, sel_setShowingDeleteConfirmation_, v3);
}

- (void)setEditState:(int64_t)a3
{
  if (self->_editState != a3)
  {
    self->_editState = a3;
    -[SUTableCell setEditing:animated:](self, "setEditing:animated:", a3 != 0, 0);
    -[SUTableCell setNeedsLayout](self, "setNeedsLayout");
    -[SUTableCell setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (int)clipCorners
{
  return -[SUTableCellContentView clipCorners](self->_configurationView, "clipCorners");
}

- (UIBezierPath)clippingPath
{
  return (UIBezierPath *)-[SUTableCellContentView _clipPath](self->_configurationView, "_clipPath");
}

- (SUCellConfiguration)configuration
{
  return -[SUTableCellContentView configuration](self->_configurationView, "configuration");
}

- (BOOL)drawAsDisabled
{
  return -[SUTableCellContentView drawAsDisabled](self->_configurationView, "drawAsDisabled");
}

- (BOOL)highlightsOnlyContentView
{
  return -[SUTableCellContentView highlightsOnlyContentView](self->_configurationView, "highlightsOnlyContentView");
}

- (SUItemOfferButton)itemOfferButton
{
  SUItemOfferButton *result;
  SUItemOfferButton *v4;

  result = self->_itemOfferButton;
  if (!result)
  {
    v4 = objc_alloc_init(SUItemOfferButton);
    self->_itemOfferButton = v4;
    -[SUItemOfferButton sizeToFit](v4, "sizeToFit");
    return self->_itemOfferButton;
  }
  return result;
}

- (void)setBottomBorderColor:(id)a3
{
  UIColor *bottomBorderColor;

  bottomBorderColor = self->_bottomBorderColor;
  if (bottomBorderColor != a3)
  {

    self->_bottomBorderColor = (UIColor *)a3;
    -[SUTableCell setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setClipCorners:(int)a3
{
  -[SUTableCellContentView setClipCorners:](self->_configurationView, "setClipCorners:", *(_QWORD *)&a3);
}

- (void)setConfiguration:(id)a3
{
  -[SUTableCellContentView setConfiguration:](self->_configurationView, "setConfiguration:", a3);
}

- (void)setDrawAsDisabled:(BOOL)a3
{
  -[SUTableCellContentView setDrawAsDisabled:](self->_configurationView, "setDrawAsDisabled:", a3);
}

- (void)setHighlightsOnlyContentView:(BOOL)a3
{
  -[SUTableCellContentView setHighlightsOnlyContentView:](self->_configurationView, "setHighlightsOnlyContentView:", a3);
}

- (void)setPosition:(id *)a3
{
  $277DA038E07E09C73EBFEAB3003DE8A9 *p_position;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[2];
  _OWORD v10[2];

  p_position = &self->_position;
  v6 = *(_OWORD *)&self->_position.globalIndex;
  v10[0] = *(_OWORD *)&self->_position.localIndex;
  v10[1] = v6;
  v7 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v7;
  if (!SUPositionEqualToPosition(v10, v9))
  {
    v8 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&p_position->localIndex = *(_OWORD *)&a3->var0;
    *(_OWORD *)&p_position->globalIndex = v8;
    -[SUTableCell setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShowHighlight:(BOOL)a3
{
  *((_BYTE *)self + 1040) = *((_BYTE *)self + 1040) & 0xFE | !a3;
}

- (void)setTopBorderColor:(id)a3
{
  UIColor *topBorderColor;

  topBorderColor = self->_topBorderColor;
  if (topBorderColor != a3)
  {

    self->_topBorderColor = (UIColor *)a3;
    -[SUTableCell setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setUsesSubviews:(BOOL)a3
{
  -[SUTableCellContentView setUsesSubviews:animated:](self->_configurationView, "setUsesSubviews:animated:", a3, 0);
}

- (BOOL)showHighlight
{
  return (*((_BYTE *)self + 1040) & 1) == 0;
}

- (BOOL)usesSubviews
{
  return -[SUTableCellContentView usesSubviews](self->_configurationView, "usesSubviews");
}

- (UIColor)bottomBorderColor
{
  return self->_bottomBorderColor;
}

- ($3CC19D079FD0B010EE84973AA846B91B)position
{
  __int128 v3;

  v3 = *(_OWORD *)&self[33].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[33].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (UIColor)topBorderColor
{
  return self->_topBorderColor;
}

- (int64_t)editState
{
  return self->_editState;
}

@end
