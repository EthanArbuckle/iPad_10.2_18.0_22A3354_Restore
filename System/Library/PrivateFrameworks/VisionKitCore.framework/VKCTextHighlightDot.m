@implementation VKCTextHighlightDot

- (VKCTextHighlightDot)initWithColor:(id)a3
{
  id v5;
  VKCTextHighlightDot *v6;
  void *v7;
  id v8;
  CALayer *v9;
  CALayer *pulsingLayer;
  CALayer *v11;
  CALayer *circleLayer;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKCTextHighlightDot;
  v6 = -[VKCTextHighlightDot init](&v16, sel_init);
  if (v6)
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[VKCTextHighlightDot registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v7, sel__updateLayout);

    v9 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    pulsingLayer = v6->_pulsingLayer;
    v6->_pulsingLayer = v9;

    v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    circleLayer = v6->_circleLayer;
    v6->_circleLayer = v11;

    objc_storeStrong((id *)&v6->_highlightColor, a3);
    -[VKCTextHighlightDot layer](v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v6->_pulsingLayer);

    -[VKCTextHighlightDot layer](v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v6->_circleLayer);

  }
  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCTextHighlightDot;
  -[VKCTextHighlightDot layoutSubviews](&v3, sel_layoutSubviews);
  -[VKCTextHighlightDot _updateLayout](self, "_updateLayout");
}

- (void)_updateLayout
{
  double v3;
  double v4;
  float v5;
  void *v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKCTextHighlightDot updateIndicatorDotForState](self, "updateIndicatorDotForState");
  -[VKCTextHighlightDot opacityForCurrentQuadSize](self, "opacityForCurrentQuadSize");
  v4 = v3;
  -[UIView setVk_alpha:](self, "setVk_alpha:");
  -[VKCTextHighlightDot textHighlightLayer](self, "textHighlightLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0 - v4;
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setOpacity:", v7);

  -[VKCTextHighlightDot setHidden:](self, "setHidden:", v4 <= 0.0);
  -[VKCTextHighlightDot setPulsing:](self, "setPulsing:", 0);
  -[VKCTextHighlightDot setPulsing:](self, "setPulsing:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (double)opacityForCurrentQuadSize
{
  double v3;
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
  double v16;
  double v17;
  BOOL v18;
  double v19;

  -[UIView vk_windowLengthFromViewLength:](self, "vk_windowLengthFromViewLength:", 1.0);
  v4 = v3;
  -[VKCTextHighlightDot quadSideLength](self, "quadSideLength");
  v9 = VKMMultiplyQuadSideLengthScaler(v5, v6, v7, v8, v4);
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  if (v9 >= v10)
    v14 = v10;
  else
    v14 = v9;
  if (v13 >= v14)
    v15 = v13;
  else
    v15 = v14;
  v16 = VKMMininumQuadSideLength(v9, v10, v11, v12);
  v17 = 0.0;
  if (v15 <= 20.0)
  {
    v18 = v15 > 18.0 && v15 < 20.0;
    v17 = 1.0;
    if (v18)
      v17 = (20.0 - v15) * 0.5;
  }
  v19 = (6.0 - v16) * 0.5;
  if (v19 < v17)
    v19 = v17;
  if (v17 < 1.0 && v16 < 6.0)
    return v19;
  else
    return v17;
}

- (CGRect)rectForIndicatorDot
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKCTextHighlightDot _rectForViewSpace:](self, "_rectForViewSpace:", 0.0, 0.0, 16.0, 16.0);
  v4 = v3;
  -[VKCTextHighlightDot bounds](self, "bounds");
  v9 = VKMCenterOfRect(v5, v6, v7, v8);
  v11 = VKMRectWithCenterAndSize(v9, v10, v4);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateIndicatorDotForState
{
  double v3;
  double v4;
  id v5;
  id v6;
  double v7;
  id v8;

  -[VKCTextHighlightDot circleLayer](self, "circleLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCTextHighlightDot rectForIndicatorDot](self, "rectForIndicatorDot");
  v4 = v3;
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setCornerRadius:", v4 * 0.5);
  objc_msgSend(v8, "setBorderWidth:", 0.0);
  objc_msgSend(v8, "setContents:", 0);
  -[VKCTextHighlightDot highlightColor](self, "highlightColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  LODWORD(v7) = 1045220557;
  objc_msgSend(v8, "setShadowOpacity:", v7);
  objc_msgSend(v8, "setShadowRadius:", 8.0);
  objc_msgSend(v8, "setMasksToBounds:", 0);
  -[VKCTextHighlightDot setPulsing:](self, "setPulsing:", 1);

}

- (CGRect)_rectForViewSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCTextHighlightDot window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fixedCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextHighlightDot coordinateSpace](self, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)setPulsing:(BOOL)a3
{
  if (self->_pulsing != a3)
  {
    self->_pulsing = a3;
    -[VKCTextHighlightDot configureForPulsing:](self, "configureForPulsing:");
  }
}

- (void)configureForPulsing:(BOOL)a3
{
  double v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
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
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  double v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  _QWORD v60[5];

  v60[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[VKCTextHighlightDot pulsingLayer](self, "pulsingLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = VKMRectWithSize();
    v53 = v7;
    v54 = v6;
    v9 = v8;
    v52 = v10;
    -[VKCTextHighlightDot _rectForViewSpace:](self, "_rectForViewSpace:");
    v12 = v11;
    v55 = v11 * 0.0625;
    -[VKCTextHighlightDot layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v18 = VKMCenterOfRect(v14, v15, v16, v17);
    v20 = v19;

    v21 = VKMRectWithCenterAndSize(v18, v20, v12);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[VKCTextHighlightDot _rectForViewSpace:](self, "_rectForViewSpace:", VKMRectWithSize());
    v28 = v18;
    v30 = v29;
    v31 = VKMRectWithCenterAndSize(v28, v20, v29);
    v58 = v32;
    v59 = v31;
    v56 = v34;
    v57 = v33;
    objc_msgSend(v5, "setFrame:", v54, v9, v53, v52);
    objc_msgSend(v5, "setFrame:", v21, v23, v25, v27);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.91796875, 0.91796875, 0.91796875, 0.5);
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v35, "CGColor"));

    v36 = v12 * 0.5;
    objc_msgSend(v5, "setCornerRadius:", v36);
    objc_msgSend(v5, "setBorderWidth:", v55);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.78125, 0.78125, 0.78125, 0.5);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v37, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD2710], "animation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setKeyPath:", CFSTR("bounds"));
    objc_msgSend(v38, "setDuration:", 1.5);
    objc_msgSend(MEMORY[0x1E0CB3B18], "vk_valueWithRect:", v21, v23, v25, v27);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFromValue:", v39);

    objc_msgSend(MEMORY[0x1E0CB3B18], "vk_valueWithRect:", v59, v58, v57, v56);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setToValue:", v40);

    v41 = *MEMORY[0x1E0CD3048];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTimingFunction:", v42);

    v43 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v38, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v38, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD2710], "animation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setKeyPath:", CFSTR("cornerRadius"));
    objc_msgSend(v44, "setDuration:", 1.5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFromValue:", v45);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30 * 0.5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setToValue:", v46);

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v41);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTimingFunction:", v47);

    objc_msgSend(v44, "setFillMode:", v43);
    objc_msgSend(v44, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD2710], "animation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDuration:", 1.5);
    objc_msgSend(v48, "setKeyPath:", CFSTR("opacity"));
    objc_msgSend(v48, "setFromValue:", &unk_1E94951B8);
    objc_msgSend(v48, "setToValue:", &unk_1E94951C8);
    objc_msgSend(v48, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v48, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setDuration:", 1.8);
    LODWORD(v50) = 2139095040;
    objc_msgSend(v49, "setRepeatCount:", v50);
    objc_msgSend(v49, "setAutoreverses:", 1);
    v60[0] = v38;
    v60[1] = v44;
    v60[2] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setAnimations:", v51);

    -[CALayer addAnimation:forKey:](self->_pulsingLayer, "addAnimation:forKey:", v49, CFSTR("basic"));
  }
  else
  {
    LODWORD(v3) = 0;
    -[CALayer setOpacity:](self->_pulsingLayer, "setOpacity:", v3);
    -[CALayer removeAllAnimations](self->_pulsingLayer, "removeAllAnimations");
  }
}

- (VKQuadSideLength)quadSideLength
{
  double left;
  double right;
  double top;
  double bottom;
  VKQuadSideLength result;

  left = self->_quadSideLength.left;
  right = self->_quadSideLength.right;
  top = self->_quadSideLength.top;
  bottom = self->_quadSideLength.bottom;
  result.bottom = bottom;
  result.top = top;
  result.right = right;
  result.left = left;
  return result;
}

- (void)setQuadSideLength:(VKQuadSideLength)a3
{
  self->_quadSideLength = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (CALayer)textHighlightLayer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_textHighlightLayer);
}

- (void)setTextHighlightLayer:(id)a3
{
  objc_storeWeak((id *)&self->_textHighlightLayer, a3);
}

- (CALayer)pulsingLayer
{
  return self->_pulsingLayer;
}

- (void)setPulsingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pulsingLayer, a3);
}

- (CALayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_pulsingLayer, 0);
  objc_destroyWeak((id *)&self->_textHighlightLayer);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
