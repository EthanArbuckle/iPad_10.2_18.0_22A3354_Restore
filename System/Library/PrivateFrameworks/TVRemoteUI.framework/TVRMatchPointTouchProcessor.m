@implementation TVRMatchPointTouchProcessor

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;

  v5 = a3;
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "haptic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInteractionBegan");

  objc_msgSend(v5, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  v14 = -[TVRMatchPointTouchProcessor _pressTypeForLocationInTouchpadView:](self, "_pressTypeForLocationInTouchpadView:", v11, v13);
  self->_highlightedButtonType = v14;
  -[_TVRMatchPointArtworkView highlightForButtonType:enabled:](self->_artworkView, "highlightForButtonType:enabled:", v14, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;

  -[TVRTouchProcessor touchpadView](self, "touchpadView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "haptic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInteractionEnded");

  -[_TVRMatchPointArtworkView highlightForButtonType:enabled:](self->_artworkView, "highlightForButtonType:enabled:", self->_highlightedButtonType, 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;

  -[TVRTouchProcessor touchpadView](self, "touchpadView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "haptic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInteractionCancelled");

  -[_TVRMatchPointArtworkView highlightForButtonType:enabled:](self->_artworkView, "highlightForButtonType:enabled:", self->_highlightedButtonType, 0);
}

- (void)setTouchpadView:(id)a3
{
  id v4;
  void *v5;
  UITapGestureRecognizer *tapGesture;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  if (self->_tapGesture)
  {
    -[TVRTouchProcessor touchpadView](self, "touchpadView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", self->_tapGesture);

  }
  -[_TVRMatchPointArtworkView removeFromSuperview](self->_artworkView, "removeFromSuperview");
  v11.receiver = self;
  v11.super_class = (Class)TVRMatchPointTouchProcessor;
  -[TVRTouchProcessor setTouchpadView:](&v11, sel_setTouchpadView_, v4);
  tapGesture = self->_tapGesture;
  if (!tapGesture)
  {
    v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleTap_);
    v8 = self->_tapGesture;
    self->_tapGesture = v7;

    tapGesture = self->_tapGesture;
  }
  objc_msgSend(v4, "addGestureRecognizer:", tapGesture);
  +[TVRButtonHaptic hapticForView:](TVRButtonHaptic, "hapticForView:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHaptic:", v9);

  -[TVRMatchPointTouchProcessor _artworkView](self, "_artworkView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(v4, "addSubview:", v10);

}

- (id)_artworkView
{
  _TVRMatchPointArtworkView *artworkView;
  _TVRMatchPointArtworkView *v4;
  _TVRMatchPointArtworkView *v5;
  _TVRMatchPointArtworkView *v6;

  artworkView = self->_artworkView;
  if (!artworkView)
  {
    v4 = [_TVRMatchPointArtworkView alloc];
    v5 = -[_TVRMatchPointArtworkView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_artworkView;
    self->_artworkView = v5;

    -[_TVRMatchPointArtworkView setAutoresizingMask:](self->_artworkView, "setAutoresizingMask:", 18);
    artworkView = self->_artworkView;
  }
  return artworkView;
}

- (void)_handleTap:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "state") == 3)
  {
    -[TVRTouchProcessor touchpadView](self, "touchpadView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    v9 = -[TVRMatchPointTouchProcessor _pressTypeForLocationInTouchpadView:](self, "_pressTypeForLocationInTouchpadView:", v6, v8);
    if (v9 != 9999)
      -[TVRMatchPointTouchProcessor _sendButtonPressToDelegate:](self, "_sendButtonPressToDelegate:", v9);
  }

}

- (int64_t)_pressTypeForLocationInTouchpadView:(CGPoint)a3
{
  double y;
  double x;
  _TVRMatchPointArtworkView *artworkView;
  void *v7;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  BOOL v22;
  int64_t v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  artworkView = self->_artworkView;
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", self->_artworkView, x, y);
  LOBYTE(artworkView) = -[_TVRMatchPointArtworkView touchLocationIsConsideredCenter:](artworkView, "touchLocationIsConsideredCenter:");

  if ((artworkView & 1) != 0)
    return 1;
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  v18 = CGRectGetHeight(v24) - x;
  v19 = y >= x;
  if (y < x && y < v18)
    return 12;
  if (y < v18)
    v19 = 1;
  if (!v19)
    return 15;
  v20 = y < x;
  if (y < v18)
    v20 = 1;
  v21 = !v20;
  if (y < x)
    v21 = 1;
  v22 = !v20;
  v23 = 13;
  if (!v22)
    v23 = 9999;
  if (v21 | (y >= v18))
    return v23;
  else
    return 14;
}

- (void)_sendButtonPressToDelegate:(int64_t)a3
{
  -[TVRTouchProcessor sendPressBegan:](self, "sendPressBegan:");
  -[TVRTouchProcessor sendPressEnded:](self, "sendPressEnded:", a3);
}

- (_TVRMatchPointArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (int64_t)highlightedButtonType
{
  return self->_highlightedButtonType;
}

- (void)setHighlightedButtonType:(int64_t)a3
{
  self->_highlightedButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
