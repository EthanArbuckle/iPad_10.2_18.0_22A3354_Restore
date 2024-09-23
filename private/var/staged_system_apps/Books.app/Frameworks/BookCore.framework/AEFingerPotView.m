@implementation AEFingerPotView

- (AEFingerPotView)initWithFrame:(CGRect)a3
{
  AEFingerPotView *v3;
  AEFingerPotView *v4;
  UIPointerInteraction *v5;
  UIPointerInteraction *pointerInteraction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AEFingerPotView;
  v3 = -[AEFingerPotView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AEFingerPotView setAdjustsImageWhenHighlighted:](v3, "setAdjustsImageWhenHighlighted:", 0);
    -[AEFingerPotView setShowsTouchWhenHighlighted:](v4, "setShowsTouchWhenHighlighted:", 0);
    v5 = (UIPointerInteraction *)objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", v4);
    pointerInteraction = v4->_pointerInteraction;
    v4->_pointerInteraction = v5;

    -[AEFingerPotView addInteraction:](v4, "addInteraction:", v4->_pointerInteraction);
  }
  return v4;
}

- (UIImage)menuImage
{
  return (UIImage *)-[AEFingerPotView backgroundImageForState:](self, "backgroundImageForState:", 0);
}

- (void)setMenuImage:(id)a3
{
  -[AEFingerPotView setBackgroundImage:forState:](self, "setBackgroundImage:forState:", a3, 0);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  if (-[AEFingerPotView isSelected](self, "isSelected") != a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)AEFingerPotView;
    -[AEFingerPotView setSelected:](&v16, "setSelected:", v3);
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView selectedOutline](self, "selectedOutline"));

      if (!v5)
      {
        v6 = objc_alloc((Class)UIImageView);
        v7 = IMCommonCoreBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("ib_text_pop_icon_highlight_swatch_selection"), v8));
        v10 = objc_msgSend(v6, "initWithImage:", v9);
        -[AEFingerPotView setSelectedOutline:](self, "setSelectedOutline:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView selectedOutline](self, "selectedOutline"));
        objc_msgSend(v11, "setContentMode:", 4);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView selectedOutline](self, "selectedOutline"));
        -[AEFingerPotView addSubview:](self, "addSubview:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
          -[AEFingerPotView bringSubviewToFront:](self, "bringSubviewToFront:", v14);

        }
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView selectedOutline](self, "selectedOutline"));
    objc_msgSend(v15, "setHidden:", v3 ^ 1);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  objc_super v17;

  v3 = a3;
  if (-[AEFingerPotView isHighlighted](self, "isHighlighted") != a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)AEFingerPotView;
    -[AEFingerPotView setHighlighted:](&v17, "setHighlighted:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));

    if (v5)
    {
      if (v3)
      {
LABEL_4:
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
        objc_msgSend(v6, "setAlpha:", 1.0);

        return;
      }
    }
    else
    {
      v7 = objc_alloc((Class)UIImageView);
      v8 = IMCommonCoreBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView traitCollection](self, "traitCollection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("FingerPot_Pressed"), v9, v10));
      v12 = objc_msgSend(v7, "initWithImage:", v11);
      -[AEFingerPotView setHighlight:](self, "setHighlight:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
      objc_msgSend(v13, "setOpaque:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
      objc_msgSend(v14, "setAlpha:", 0.0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
      -[AEFingerPotView addSubview:](self, "addSubview:", v15);

      if (v3)
        goto LABEL_4;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_11E75C;
    v16[3] = &unk_28B960;
    v16[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, 0.25);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
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
  double v15;
  void *v16;
  double MidX;
  double MidY;
  void *v19;
  void *v20;
  double x;
  double y;
  double width;
  double height;
  void *v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v26.receiver = self;
  v26.super_class = (Class)AEFingerPotView;
  -[AEFingerPotView layoutSubviews](&v26, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView imageForState:](self, "imageForState:", 1));

  -[AEFingerPotView bounds](self, "bounds");
  -[AEFingerPotView contentRectForBounds:](self, "contentRectForBounds:");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  if (v3)
  {
    -[AEFingerPotView imageRectForContentRect:](self, "imageRectForContentRect:", v4, v5, v6, v7);
    v8 = v12;
    v9 = v13;
    v10 = v14;
    v11 = v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView selectedOutline](self, "selectedOutline"));
  objc_msgSend(v16, "setFrame:", v8, v9, v10, v11);

  v27.origin.x = v8;
  v27.origin.y = v9;
  v27.size.width = v10;
  v27.size.height = v11;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = v8;
  v28.origin.y = v9;
  v28.size.width = v10;
  v28.size.height = v11;
  MidY = CGRectGetMidY(v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
  objc_msgSend(v19, "setCenter:", MidX, MidY);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
  objc_msgSend(v20, "frame");
  v30 = CGRectIntegral(v29);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView highlight](self, "highlight"));
  objc_msgSend(v25, "setFrame:", x, y, width, height);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;

  v5 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHighlightEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v5));
  -[AEFingerPotView bounds](self, "bounds");
  v8 = v7;
  v10 = v9 - 6.0;
  v12 = v11 + 0.0;
  v14 = v13 - (-6.0 - 6.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEFingerPotView superview](self, "superview"));
  -[AEFingerPotView convertRect:toView:](self, "convertRect:toView:", v15, v10, v12, v14, v8);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v17, v19, v21, v23));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v6, v24));

  return v25;
}

- (UIImageView)selectedOutline
{
  return self->_selectedOutline;
}

- (void)setSelectedOutline:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOutline, a3);
}

- (UIImageView)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
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
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_selectedOutline, 0);
}

@end
