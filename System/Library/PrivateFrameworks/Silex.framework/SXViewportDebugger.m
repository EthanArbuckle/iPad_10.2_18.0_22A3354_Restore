@implementation SXViewportDebugger

- (id)initWithViewport:(id *)a1
{
  id v4;
  id *v5;
  SXViewportDebuggerOverlayView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  void *v16;
  SXViewportDebuggerOverlayView *v17;
  id v18;
  objc_super v20;

  v4 = a2;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)SXViewportDebugger;
    v5 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      v6 = [SXViewportDebuggerOverlayView alloc];
      v7 = *MEMORY[0x24BDBF090];
      v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v11 = -[SXViewportDebuggerOverlayView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x24BDBF090], v8, v9, v10);
      v12 = a1[2];
      a1[2] = (id)v11;

      v13 = a1[2];
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v14);

      v15 = (id *)a1[2];
      objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXViewportDebuggerOverlayView setBorderColor:](v15, v16);

      v17 = -[SXViewportDebuggerOverlayView initWithFrame:]([SXViewportDebuggerOverlayView alloc], "initWithFrame:", v7, v8, v9, v10);
      v18 = a1[3];
      a1[3] = v17;

      objc_msgSend(a1[1], "addViewportChangeListener:forOptions:", a1, 14);
    }
  }

  return a1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SXViewportDebugger dynamicBoundsView](self, "dynamicBoundsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[SXViewportDebugger appearStateIndicator](self, "appearStateIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  v5.receiver = self;
  v5.super_class = (Class)SXViewportDebugger;
  -[SXViewportDebugger dealloc](&v5, sel_dealloc);
}

- (uint64_t)presentOnView:(uint64_t)result
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  if (result)
  {
    v2 = (void *)result;
    v3 = a2;
    objc_msgSend(v2, "dynamicBoundsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v4);

    objc_msgSend(v2, "appearStateIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v5);

    return objc_msgSend(v2, "update");
  }
  return result;
}

- (void)update
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CGFloat v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;

  -[SXViewportDebugger viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXViewportDebugger viewport](self, "viewport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dynamicBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SXViewportDebugger dynamicBoundsView](self, "dynamicBoundsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toView:", v14, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[SXViewportDebugger dynamicBoundsView](self, "dynamicBoundsView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[SXViewportDebugger appearStateIndicator](self, "appearStateIndicator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXViewportDebugger viewport](self, "viewport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXViewportDebugger colorForAppearState:](self, "colorForAppearState:", objc_msgSend(v25, "appearState"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v26);

  -[SXViewportDebugger appearStateIndicator](self, "appearStateIndicator");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[SXViewportDebugger viewport](self, "viewport");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v28 = CGRectGetHeight(v31) + -100.0;
  -[SXViewportDebugger viewport](self, "viewport");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  objc_msgSend(v30, "setFrame:", 10.0, v28, CGRectGetWidth(v32) + -20.0, 10.0);

}

- (id)colorForAppearState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDF6950], "redColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDF6950], "yellowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDF6950], "greenColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDF6950], "orangeColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXViewportDebuggerOverlayView)dynamicBoundsView
{
  return self->_dynamicBoundsView;
}

- (SXViewportDebuggerOverlayView)appearStateIndicator
{
  return self->_appearStateIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearStateIndicator, 0);
  objc_storeStrong((id *)&self->_dynamicBoundsView, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end
