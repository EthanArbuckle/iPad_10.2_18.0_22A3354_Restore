@implementation IMCalloutButton

- (IMCalloutButton)initWithFrame:(CGRect)a3
{
  IMCalloutButton *v3;
  IMCalloutButton *v4;
  UIPointerInteraction *v5;
  UIPointerInteraction *pointerInteraction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMCalloutButton;
  v3 = -[IMCalloutButton initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[IMCalloutButton setAdjustsImageWhenHighlighted:](v3, "setAdjustsImageWhenHighlighted:", 0);
    -[IMCalloutButton setShowsTouchWhenHighlighted:](v4, "setShowsTouchWhenHighlighted:", 0);
    v4->_position = -1;
    v4->_pointerInsets.top = 0.0;
    v4->_pointerInsets.left = -6.0;
    v4->_pointerInsets.bottom = 0.0;
    v4->_pointerInsets.right = -6.0;
    v5 = (UIPointerInteraction *)objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", v4);
    pointerInteraction = v4->_pointerInteraction;
    v4->_pointerInteraction = v5;

    -[IMCalloutButton addInteraction:](v4, "addInteraction:", v4->_pointerInteraction);
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)IMCalloutButton;
  -[IMCalloutButton setHighlighted:](&v6, "setHighlighted:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutButton bar](self, "bar"));
  objc_msgSend(v5, "setHighlighted:forControl:", v3, self);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = a5;
  v8 = v7;
  if (self->_pointerInteraction == a3)
  {
    -[IMCalloutButton bounds](self, "bounds");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v9 + self->_pointerInsets.left, v10 + self->_pointerInsets.top, v11 - (self->_pointerInsets.left + self->_pointerInsets.right), v12 - (self->_pointerInsets.top + self->_pointerInsets.bottom)));

  }
  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;

  v5 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHighlightEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v5));
  -[IMCalloutButton bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[IMCalloutButton pointerInsets](self, "pointerInsets");
  v16 = v8 + v15;
  v18 = v10 + v17;
  v20 = v12 - (v15 + v19);
  v22 = v14 - (v17 + v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[IMCalloutButton superview](self, "superview"));
  -[IMCalloutButton convertRect:toView:](self, "convertRect:toView:", v23, v16, v18, v20, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v25, v27, v29, v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v6, v32));

  return v33;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (IMCalloutBar)bar
{
  return (IMCalloutBar *)objc_loadWeakRetained((id *)&self->_bar);
}

- (void)setBar:(id)a3
{
  objc_storeWeak((id *)&self->_bar, a3);
}

- (UIEdgeInsets)pointerInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_pointerInsets.top;
  left = self->_pointerInsets.left;
  bottom = self->_pointerInsets.bottom;
  right = self->_pointerInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPointerInsets:(UIEdgeInsets)a3
{
  self->_pointerInsets = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_bar);
}

@end
