@implementation SXLineComponentView

- (void)loadComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v10;

  v4 = a3;
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stroke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)SXLineComponentView;
  -[SXComponentView loadComponent:](&v10, sel_loadComponent_, v4);

  -[SXComponentView component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stroke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if ((v9 & 1) == 0)
    -[SXLineComponentView discardContents](self, "discardContents");

}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0;
  objc_super v5;

  var0 = a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)SXLineComponentView;
  -[SXComponentView presentComponentWithChanges:](&v5, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (var0)
    -[SXLineComponentView discardContents](self, "discardContents");
}

- (void)renderContents
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double Width;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double MaxX;
  void *v28;
  void *v29;
  int v30;
  SXSolidBorderView *v31;
  void *v32;
  void *v33;
  SXSolidBorderView *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v47.receiver = self;
  v47.super_class = (Class)SXLineComponentView;
  -[SXComponentView renderContents](&v47, sel_renderContents);
  -[SXComponentView component](self, "component");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stroke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  -[SXComponentView contentFrame](self, "contentFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SXComponentView componentLayout](self, "componentLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maximumContentWidth");
  v15 = v14;

  if (v15)
  {
    -[SXComponentView unitConverter](self, "unitConverter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView componentLayout](self, "componentLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "maximumContentWidth");
    objc_msgSend(v16, "convertValueToPoints:", v18, v19);
    v21 = v20;

    v48.origin.x = v6;
    v48.origin.y = v8;
    v48.size.width = v10;
    v48.size.height = v12;
    Width = CGRectGetWidth(v48);
    v10 = v21 >= Width ? Width : v21;
    -[SXComponentView contentFrame](self, "contentFrame");
    if (CGRectGetWidth(v49) > v21)
    {
      -[SXComponentView componentLayout](self, "componentLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "horizontalContentAlignment"))
      {
        -[SXComponentView componentLayout](self, "componentLayout");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "horizontalContentAlignment");

        if (v25 == 3)
        {
          -[SXComponentView contentFrame](self, "contentFrame");
          MaxX = CGRectGetMaxX(v52);
          v53.origin.x = v6;
          v53.origin.y = v8;
          v53.size.width = v10;
          v53.size.height = v12;
          v6 = MaxX - CGRectGetWidth(v53);
          goto LABEL_14;
        }
        if (v25 != 2)
          goto LABEL_14;
      }
      else
      {

      }
      -[SXComponentView contentFrame](self, "contentFrame");
      v26 = CGRectGetWidth(v50);
      v51.origin.x = v6;
      v51.origin.y = v8;
      v51.size.width = v10;
      v51.size.height = v12;
      v6 = (v26 - CGRectGetWidth(v51)) * 0.5;
    }
  }
LABEL_14:
  -[SXComponentView component](self, "component");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stroke");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "style");

  if (v30 == 1)
  {
    v31 = [SXSolidBorderView alloc];
    -[SXComponentView component](self, "component");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stroke");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SXSolidBorderView initWithStrokeStyle:](v31, "initWithStrokeStyle:", v33);
    -[SXLineComponentView setBorderView:](self, "setBorderView:", v34);

    -[SXLineComponentView borderView](self, "borderView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v6, v8, v10, v12);

    -[SXComponentView contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLineComponentView borderView](self, "borderView");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v37);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLineComponentView setStrokeLayer:](self, "setStrokeLayer:", v38);

    v36 = -[SXStrokeRenderer initWithComponentView:]((id *)[SXStrokeRenderer alloc], self);
    -[SXComponentView component](self, "component");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stroke");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXStrokeRenderer lineForStyle:andFrame:]((id *)v36, v40, v6, v8, v10, v12);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXLineComponentView strokeLayer](self, "strokeLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_retainAutorelease(v41);
    objc_msgSend(v42, "setContents:", objc_msgSend(v37, "CGImage"));

    -[SXLineComponentView strokeLayer](self, "strokeLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v6, v8, v10, v12);

    -[SXComponentView contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLineComponentView strokeLayer](self, "strokeLayer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSublayer:", v46);

  }
}

- (void)discardContents
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXLineComponentView;
  -[SXComponentView discardContents](&v5, sel_discardContents);
  -[SXLineComponentView strokeLayer](self, "strokeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[SXLineComponentView setStrokeLayer:](self, "setStrokeLayer:", 0);
  -[SXLineComponentView borderView](self, "borderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[SXLineComponentView setBorderView:](self, "setBorderView:", 0);
}

- (BOOL)userInteractable
{
  return 0;
}

- (CALayer)strokeLayer
{
  return self->_strokeLayer;
}

- (void)setStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_strokeLayer, a3);
}

- (SXSolidBorderView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_strokeLayer, 0);
}

@end
