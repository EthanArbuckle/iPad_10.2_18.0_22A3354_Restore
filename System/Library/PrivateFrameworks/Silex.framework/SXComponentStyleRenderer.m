@implementation SXComponentStyleRenderer

- (SXComponentStyleRenderer)initWithComponentStyle:(id)a3 viewport:(id)a4 imageFillViewFactory:(id)a5 videoFillViewFactory:(id)a6 gradientViewFactory:(id)a7 repeatableImageFillViewFactory:(id)a8
{
  id v15;
  id v16;
  id v17;
  SXComponentStyleRenderer *v18;
  SXComponentStyleRenderer *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SXComponentStyleRenderer;
  v18 = -[SXComponentStyleRenderer init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_componentStyle, a3);
    objc_storeStrong((id *)&v19->_viewport, a4);
    objc_storeStrong((id *)&v19->_videoFillViewFactory, a6);
    objc_storeStrong((id *)&v19->_imageFillViewFactory, a5);
    objc_storeStrong((id *)&v19->_gradientFactory, a7);
    objc_storeStrong((id *)&v19->_repeatableImageFillViewFactory, a8);
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v20;

  -[SXComponentStyleRenderer gradientFillView](self, "gradientFillView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[SXComponentStyleRenderer imageFillView](self, "imageFillView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperlayer");

  -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperlayer");

  -[SXComponentStyleRenderer topBorderLayer](self, "topBorderLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperlayer");

  -[SXComponentStyleRenderer rightBorderLayer](self, "rightBorderLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperlayer");

  -[SXComponentStyleRenderer bottomBorderLayer](self, "bottomBorderLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperlayer");

  -[SXComponentStyleRenderer leftBorderLayer](self, "leftBorderLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperlayer");

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", 1.0);

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  v17 = *MEMORY[0x24BDE58E0];
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "backgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer applyCornerRadius:cornerMask:curve:onView:](self, "applyCornerRadius:cornerMask:curve:onView:", 11, v17, v19, 0.0);

  v20.receiver = self;
  v20.super_class = (Class)SXComponentStyleRenderer;
  -[SXComponentStyleRenderer dealloc](&v20, sel_dealloc);
}

- (void)prepareForComponentView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_storeWeak((id *)&self->_componentView, a3);
  -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shadow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shadow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentStyleRenderer prepareShadow:](self, "prepareShadow:", v7);

  }
  -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fill");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fill");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentStyleRenderer prepareFill:](self, "prepareFill:", v11);

  }
  -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "border");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultStrokeStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "border");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentStyleRenderer prepareBorder:](self, "prepareBorder:", v15);

  }
}

- (void)applyComponentStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v15, "mask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v15, "mask");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyMask:](self, "applyMask:", v4);

    }
    objc_msgSend(v15, "border");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultStrokeStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v15, "border");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyBorder:](self, "applyBorder:", v7);

    }
    objc_msgSend(v15, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v15, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyBackgroundColor:](self, "applyBackgroundColor:", v9);

    }
    objc_msgSend(v15, "opacity");
    if (v10 != 1.79769313e308)
    {
      objc_msgSend(v15, "opacity");
      -[SXComponentStyleRenderer applyOpacity:](self, "applyOpacity:");
    }
    objc_msgSend(v15, "fill");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v15, "fill");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyFill:](self, "applyFill:", v12);

    }
    objc_msgSend(v15, "shadow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v15, "shadow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyShadow:](self, "applyShadow:", v14);

    }
  }

}

- (void)prepareFill:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  _OWORD v74[3];

  v4 = a3;
  -[SXComponentStyleRenderer viewForFill:](self, "viewForFill:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v74[0] = *MEMORY[0x24BDBD8B8];
  v74[1] = v6;
  v74[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v5, "setTransform:", v74);
  -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fill");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = v4;
    -[SXComponentStyleRenderer componentView](self, "componentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unitConverter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v10, "width");
    objc_msgSend(v12, "convertValueToPoints:", v13, v14);
    v16 = v15;
    v17 = objc_msgSend(v10, "height");
    v19 = v18;

    objc_msgSend(v12, "convertValueToPoints:", v17, v19);
    v21 = v20;
    -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPatternSize:", v16, v21);

  }
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "backgroundView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "borderInsets");
  v35 = v34;
  v37 = v36;
  v39 = v30 - (v36 + v38);
  v41 = v32 - (v34 + v40);

  v72 = v41;
  v73 = v39;
  if (objc_msgSend(v4, "attachment") == 1)
  {
    -[SXComponentStyleRenderer viewport](self, "viewport");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bounds");
    v39 = v43;
    v41 = v44;

  }
  v45 = v26 + v37;
  v46 = v28 + v35;
  objc_msgSend(v5, "fillFrameWithBoundingSize:", v39, v41);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  if (objc_msgSend(v4, "attachment") != 1)
    goto LABEL_12;
  -[SXComponentStyleRenderer viewport](self, "viewport");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "convertPointToViewportCoordinateSpace:fromView:", v56, v45, v46);
  v58 = v57;
  v71 = v59;

  v48 = v48 - v58;
  v60 = objc_msgSend(v4, "verticalAlignment");
  if (v60 == 2)
  {
    v50 = v41 - v71 - v54;
LABEL_12:
    v61 = v73;
    goto LABEL_13;
  }
  v61 = v73;
  if (v60 == 1)
  {
    v50 = (v41 - v54) * 0.5 - v71;
  }
  else if (!v60)
  {
    v50 = -v71;
  }
LABEL_13:
  objc_msgSend(v5, "setFrame:", v45, v46, v61, v72);
  objc_msgSend(v5, "setContentFrame:", v48, v50, v52, v54);
  objc_msgSend(v5, "setOriginalFrame:", v48, v50, v52, v54);
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFillView:", v5);

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "backgroundView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "insertSubview:belowSubview:", v5, v66);

  -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "fill");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "attachment") == 1)
  {
    v69 = -[SXComponentStyleRenderer didRegisterForDynamicBounds](self, "didRegisterForDynamicBounds");

    if (!v69)
    {
      -[SXComponentStyleRenderer viewport](self, "viewport");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addViewportChangeListener:forOptions:", self, 2);

      -[SXComponentStyleRenderer setDidRegisterForDynamicBounds:](self, "setDidRegisterForDynamicBounds:", 1);
    }
  }
  else
  {

  }
}

- (void)prepareBorder:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;

  v57 = a3;
  objc_msgSend(v57, "defaultStrokeStyle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[SXShapeLayer layer](SXShapeLayer, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer setBorderLayer:](self, "setBorderLayer:", v7);

      -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

      -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMasksToBounds:", 1);

    }
  }
  objc_msgSend(v57, "top");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[SXComponentStyleRenderer topBorderLayer](self, "topBorderLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      +[SXShapeLayer layer](SXShapeLayer, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer setTopBorderLayer:](self, "setTopBorderLayer:", v14);

      -[SXComponentStyleRenderer topBorderLayer](self, "topBorderLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

      -[SXComponentStyleRenderer topBorderLayer](self, "topBorderLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMasksToBounds:", 1);

    }
  }
  objc_msgSend(v57, "right");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SXComponentStyleRenderer rightBorderLayer](self, "rightBorderLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      +[SXShapeLayer layer](SXShapeLayer, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer setRightBorderLayer:](self, "setRightBorderLayer:", v21);

      -[SXComponentStyleRenderer rightBorderLayer](self, "rightBorderLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v22, "setFillColor:", objc_msgSend(v23, "CGColor"));

      -[SXComponentStyleRenderer rightBorderLayer](self, "rightBorderLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setMasksToBounds:", 1);

    }
  }
  objc_msgSend(v57, "bottom");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[SXComponentStyleRenderer bottomBorderLayer](self, "bottomBorderLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      +[SXShapeLayer layer](SXShapeLayer, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer setBottomBorderLayer:](self, "setBottomBorderLayer:", v28);

      -[SXComponentStyleRenderer bottomBorderLayer](self, "bottomBorderLayer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v29, "setFillColor:", objc_msgSend(v30, "CGColor"));

      -[SXComponentStyleRenderer bottomBorderLayer](self, "bottomBorderLayer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setMasksToBounds:", 1);

    }
  }
  objc_msgSend(v57, "left");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[SXComponentStyleRenderer leftBorderLayer](self, "leftBorderLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      +[SXShapeLayer layer](SXShapeLayer, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer setLeftBorderLayer:](self, "setLeftBorderLayer:", v35);

      -[SXComponentStyleRenderer leftBorderLayer](self, "leftBorderLayer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v36, "setFillColor:", objc_msgSend(v37, "CGColor"));

      -[SXComponentStyleRenderer leftBorderLayer](self, "leftBorderLayer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setMasksToBounds:", 1);

    }
  }
  -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "backgroundView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  objc_msgSend(v39, "setFrame:");

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "backgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "insertSublayer:above:", v45, v48);

  -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer topBorderLayer](self, "topBorderLayer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSublayer:", v50);

  -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer rightBorderLayer](self, "rightBorderLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSublayer:", v52);

  -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer bottomBorderLayer](self, "bottomBorderLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addSublayer:", v54);

  -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer leftBorderLayer](self, "leftBorderLayer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addSublayer:", v56);

}

- (void)prepareShadow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[SXLayer layer](SXLayer, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentStyleRenderer setShadowLayer:](self, "setShadowLayer:", v5);

  }
  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v6, "setFrame:");

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertSublayer:below:", v10, v13);

}

- (void)applyBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)applyFill:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SXComponentStyleRenderer viewForFill:](self, "viewForFill:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "load");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SXComponentStyleRenderer componentView](self, "componentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "visibilityState");

    if (v7 == 1)
    {
      -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "play");

    }
  }

}

- (void)applyOpacity:(double)a3
{
  id v4;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)applyBorder:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  _BOOL8 v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  BOOL v57;
  void *v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double Width;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  _BOOL8 v71;
  double v72;
  double v73;
  double v74;
  double Height;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  _BOOL8 v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  _BOOL8 v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  CGFloat v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  CGFloat v126;
  double v127;
  double v128;
  double v129;
  double v130;
  uint64_t v131;
  double v132;
  double v133;
  double v134;
  double v135;
  id v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  v136 = a3;
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v132 = v7;
  v133 = v6;
  v134 = v8;
  v135 = v9;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cornerRadius");
  v14 = v13;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "maskedCorners");
  v131 = v18 & 0xF;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "backgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cornerCurve");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)*MEMORY[0x24BDE58E8];

  v24 = 0.0;
  if ((v18 & 1) != 0)
    v25 = v14;
  else
    v25 = 0.0;
  if ((v18 & 2) != 0)
    v26 = v14;
  else
    v26 = 0.0;
  if ((v18 & 8) != 0)
    v27 = v14;
  else
    v27 = 0.0;
  v125 = v27;
  if ((v18 & 4) != 0)
    v24 = v14;
  v128 = v24;
  v129 = v25;
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unitConverter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v136, "all");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "top");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "right");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "bottom");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "left");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v35 = objc_msgSend(v30, "width");
    objc_msgSend(v29, "convertValueToPoints:", v35, v36);
    if (v37 > 0.0)
    {
      v38 = v37;
      v39 = v22 == v23;
      v40 = v37 * 0.5;
      v118 = fmax(v14 - v37 * 0.5, 0.0);
      objc_msgSend(v136, "left");
      v121 = v23;
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
        v42 = -(v38 * 0.5);
      else
        v42 = v40;
      objc_msgSend(v136, "top");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        v44 = -(v38 * 0.5);
      else
        v44 = v40;
      objc_msgSend(v136, "right");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v26;
      if (v45)
        v47 = -(v38 * 0.5);
      else
        v47 = v40;
      objc_msgSend(v136, "bottom");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
        v49 = -(v38 * 0.5);
      else
        v49 = v40;
      v50 = v42 + v47;
      v26 = v46;
      objc_msgSend(MEMORY[0x24BDF6870], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v39, v133 + v42, v132 + v44, v134 - v50, v135 - (v44 + v49), v118);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer borderLayer](self, "borderLayer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyStrokeStyle:borderLayer:path:lineWidth:](self, "applyStrokeStyle:borderLayer:path:lineWidth:", v30, v52, v51, v38);

      v23 = v121;
    }
  }
  if (v31)
  {
    v53 = objc_msgSend(v31, "width");
    objc_msgSend(v29, "convertValueToPoints:", v53, v54);
    if (v55 > 0.0)
    {
      v56 = v55;
      v57 = v22 == v23;
      v122 = v22;
      v58 = v23;
      v59 = v57;
      v60 = v55 * 0.5;
      v113 = -(v55 * 0.5);
      v115 = fmax(v14 - v55 * 0.5, 0.0);
      v61 = v129;
      if (v129 < v26)
        v61 = v26;
      if (v56 >= v61)
        v62 = v56;
      else
        v62 = v61;
      v137.origin.x = v133;
      v137.origin.y = v132;
      v137.size.width = v134;
      v137.size.height = v135;
      Width = CGRectGetWidth(v137);
      -[SXComponentStyleRenderer topBorderLayer](self, "topBorderLayer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setFrame:", 0.0, 0.0, Width, v62);

      objc_msgSend(MEMORY[0x24BDF6870], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v59, v133 - v60, v132 + v60, v134 - (v113 - v60), v135 - (v60 - v60), v115);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer topBorderLayer](self, "topBorderLayer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyStrokeStyle:borderLayer:path:lineWidth:](self, "applyStrokeStyle:borderLayer:path:lineWidth:", v31, v66, v65, v56);

      v23 = v58;
      v22 = v122;
    }
  }
  if (v32)
  {
    v67 = objc_msgSend(v32, "width");
    objc_msgSend(v29, "convertValueToPoints:", v67, v68);
    if (v69 > 0.0)
    {
      v70 = v69;
      v71 = v22 == v23;
      v72 = v69 * 0.5;
      v116 = -(v69 * 0.5);
      v119 = fmax(v14 - v69 * 0.5, 0.0);
      v73 = v125;
      if (v26 >= v125)
        v73 = v26;
      if (v70 >= v73)
        v74 = v70;
      else
        v74 = v73;
      v138.origin.x = v133;
      v138.origin.y = v132;
      v138.size.width = v134;
      v138.size.height = v135;
      v114 = CGRectGetWidth(v138) - v74;
      v139.origin.x = v133;
      v139.origin.y = v132;
      v139.size.width = v134;
      v139.size.height = v135;
      Height = CGRectGetHeight(v139);
      -[SXComponentStyleRenderer rightBorderLayer](self, "rightBorderLayer");
      v123 = v34;
      v76 = v33;
      v77 = v31;
      v78 = v30;
      v79 = v22;
      v80 = v23;
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setFrame:", v114, 0.0, v74, Height);

      v140.origin.x = v133;
      v140.origin.y = v132;
      v140.size.width = v134;
      v140.size.height = v135;
      objc_msgSend(MEMORY[0x24BDF6870], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v71, v74 - CGRectGetWidth(v140) - v72, v132 - v72, v134 - (v72 - v72), v135 - (v116 - v72), v119);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer rightBorderLayer](self, "rightBorderLayer");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyStrokeStyle:borderLayer:path:lineWidth:](self, "applyStrokeStyle:borderLayer:path:lineWidth:", v32, v83, v82, v70);

      v23 = v80;
      v22 = v79;
      v30 = v78;
      v31 = v77;
      v33 = v76;
      v34 = v123;
    }
  }
  if (v33)
  {
    v84 = objc_msgSend(v33, "width");
    objc_msgSend(v29, "convertValueToPoints:", v84, v85);
    if (v86 > 0.0)
    {
      v87 = v86;
      v88 = v22 == v23;
      v89 = v86 * 0.5;
      v117 = -(v86 * 0.5);
      v120 = fmax(v14 - v86 * 0.5, 0.0);
      v90 = v128;
      if (v128 < v125)
        v90 = v125;
      if (v87 >= v90)
        v91 = v87;
      else
        v91 = v90;
      v141.origin.x = v133;
      v141.origin.y = v132;
      v141.size.width = v134;
      v141.size.height = v135;
      v126 = CGRectGetHeight(v141) - v91;
      v142.origin.x = v133;
      v142.origin.y = v132;
      v142.size.width = v134;
      v142.size.height = v135;
      v92 = CGRectGetWidth(v142);
      -[SXComponentStyleRenderer bottomBorderLayer](self, "bottomBorderLayer");
      v124 = v34;
      v93 = v32;
      v94 = v31;
      v95 = v30;
      v96 = v22;
      v97 = v23;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setFrame:", 0.0, v126, v92, v91);

      v143.origin.x = v133;
      v143.origin.y = v132;
      v143.size.width = v134;
      v143.size.height = v135;
      objc_msgSend(MEMORY[0x24BDF6870], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v88, v133 - v89, v91 - CGRectGetHeight(v143) - v89, v134 - (v117 - v89), v135 - (v89 - v89), v120);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer bottomBorderLayer](self, "bottomBorderLayer");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyStrokeStyle:borderLayer:path:lineWidth:](self, "applyStrokeStyle:borderLayer:path:lineWidth:", v33, v100, v99, v87);

      v23 = v97;
      v22 = v96;
      v30 = v95;
      v31 = v94;
      v32 = v93;
      v34 = v124;
    }
  }
  if (v34)
  {
    v101 = objc_msgSend(v34, "width");
    objc_msgSend(v29, "convertValueToPoints:", v101, v102);
    if (v103 > 0.0)
    {
      v104 = v103;
      v105 = v22 == v23;
      v106 = v103 * 0.5;
      v130 = fmax(v14 - v103 * 0.5, 0.0);
      v127 = -(v103 * 0.5);
      v107 = v129;
      if (v129 < v128)
        v107 = v128;
      if (v104 >= v107)
        v108 = v104;
      else
        v108 = v107;
      v144.origin.x = v133;
      v144.origin.y = v132;
      v144.size.width = v134;
      v144.size.height = v135;
      v109 = CGRectGetHeight(v144);
      -[SXComponentStyleRenderer leftBorderLayer](self, "leftBorderLayer");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "setFrame:", 0.0, 0.0, v108, v109);

      objc_msgSend(MEMORY[0x24BDF6870], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v131, v105, v133 + v106, v132 - v106, v134 - (v106 - v106), v135 - (v127 - v106), v130);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer leftBorderLayer](self, "leftBorderLayer");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyStrokeStyle:borderLayer:path:lineWidth:](self, "applyStrokeStyle:borderLayer:path:lineWidth:", v34, v112, v111, v104);

    }
  }

}

- (void)applyStrokeStyle:(id)a3 borderLayer:(id)a4 path:(id)a5 lineWidth:(double)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v10, "setLineWidth:", a6);
  v16 = objc_retainAutorelease(v15);
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v16, "CGColor"));
  v17 = objc_retainAutorelease(v11);
  v18 = objc_msgSend(v17, "CGPath");

  objc_msgSend(v10, "setPath:", v18);
  v19 = *MEMORY[0x24BDE5CF0];
  objc_msgSend(v10, "setLineCap:", *MEMORY[0x24BDE5CF0]);
  if (objc_msgSend(v9, "style") == 2)
  {
    v20 = a6 + a6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v21;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLineDashPattern:", v23);

LABEL_8:
    objc_msgSend(v10, "setLineCap:", v19);
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "style") == 3)
  {
    v26[0] = &unk_24D6FEF80;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6 + a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLineDashPattern:", v25);

    v19 = *MEMORY[0x24BDE5CE8];
    goto LABEL_8;
  }
LABEL_9:

}

- (void)applyMask:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = COERCE_DOUBLE(objc_msgSend(v25, "radius"));
    if (v4 > 0.0
      && ((objc_msgSend(v25, "topLeft", v4) & 1) != 0
       || (objc_msgSend(v25, "topRight") & 1) != 0
       || (objc_msgSend(v25, "bottomRight") & 1) != 0
       || objc_msgSend(v25, "bottomLeft")))
    {
      -[SXComponentStyleRenderer componentView](self, "componentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unitConverter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v25, "radius");
      objc_msgSend(v6, "convertValueToPoints:", v7, v8);
      v10 = v9;

      -[SXComponentStyleRenderer componentView](self, "componentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;

      -[SXComponentStyleRenderer componentView](self, "componentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      v18 = v17;

      if (v14 >= v18)
        v19 = v18;
      else
        v19 = v14;
      v20 = v19 * 0.5;
      if (v10 >= v20)
        v10 = v20;
      v21 = objc_msgSend(v25, "cornerMask");
      objc_msgSend(v25, "curve");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer componentView](self, "componentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "backgroundView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXComponentStyleRenderer applyCornerRadius:cornerMask:curve:onView:](self, "applyCornerRadius:cornerMask:curve:onView:", v21, v22, v24, v10);

    }
  }

}

- (void)applyShadow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL8 v52;
  void *v53;
  void *v54;
  id v55;
  id v56;

  v4 = a3;
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unitConverter");
  v56 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "radius");
  objc_msgSend(v56, "convertValueToPoints:", v6, v7);
  v9 = v8;
  objc_msgSend(v4, "offset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "x");
  objc_msgSend(v56, "convertValueToPoints:allowNegativeValues:", v11, v12, 1);
  v14 = v13;

  objc_msgSend(v4, "offset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "y");
  objc_msgSend(v56, "convertValueToPoints:allowNegativeValues:", v16, v17, 1);
  v19 = v18;

  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowRadius:", v9);

  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v21, "setShadowColor:", objc_msgSend(v22, "CGColor"));

  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "opacity");
  v25 = v24;

  *(float *)&v26 = v25;
  objc_msgSend(v23, "setShadowOpacity:", v26);

  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setShadowOffset:", v14, v19);

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "backgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "backgroundView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "maskedCorners") & 0xF;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "backgroundView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "cornerRadius");
  v47 = v46;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "backgroundView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "cornerCurve");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 == (void *)*MEMORY[0x24BDE58E8];

  objc_msgSend(MEMORY[0x24BDF6870], "sx_bezierPathWithRect:byRoundingCorners:cornerRadius:continuousCorners:", v42, v52, v32, v34, v36, v38, v47);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRenderer shadowLayer](self, "shadowLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_retainAutorelease(v53);
  objc_msgSend(v54, "setShadowPath:", objc_msgSend(v55, "CGPath"));

}

- (void)componentVisiblityStateDidChange:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[SXComponentStyleRenderer imageFillView](self, "imageFillView"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[SXComponentStyleRenderer gradientFillView](self, "gradientFillView"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      return;
  }
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "visibilityState");

  if (a3 == 1 || v7 != 1)
  {
    -[SXComponentStyleRenderer componentView](self, "componentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "visibilityState") == 2)
    {

    }
    else
    {
      -[SXComponentStyleRenderer componentView](self, "componentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "visibilityState");

      if (v12)
        return;
    }
    -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fill");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v23, "loop") & 1) == 0)
      {
        -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reset");

      }
      -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pause");

      goto LABEL_24;
    }
    -[SXComponentStyleRenderer imageFillView](self, "imageFillView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[SXComponentStyleRenderer imageFillView](self, "imageFillView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        return;
      -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v19;
    objc_msgSend(v19, "pause");
    goto LABEL_24;
  }
  -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v23 = v9;
    objc_msgSend(v9, "play");
LABEL_24:

    return;
  }
  -[SXComponentStyleRenderer imageFillView](self, "imageFillView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SXComponentStyleRenderer imageFillView](self, "imageFillView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = objc_msgSend(v10, "appearState");
  if (a4 == 2 && v6 != 2)
  {
    -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pause");
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v10, "appearState") == 2)
  {
    -[SXComponentStyleRenderer componentView](self, "componentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "visibilityState");

    if (v9 == 1)
    {
      -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "play");
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  void *v5;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fillView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[SXComponentStyleRenderer componentView](self, "componentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fillView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "convertPointToViewportCoordinateSpace:fromView:", v21, v18, v20);
  v23 = v22;

  -[SXComponentStyleRenderer componentStyle](self, "componentStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fill");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "verticalAlignment");

  switch(v26)
  {
    case 2:
      objc_msgSend(v31, "bounds");
      v10 = v27 - v23 - v14;
      break;
    case 1:
      objc_msgSend(v31, "bounds");
      v10 = (v28 - v14) * 0.5 - v23;
      break;
    case 0:
      v10 = -v23;
      break;
  }
  -[SXComponentStyleRenderer componentView](self, "componentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fillView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setContentFrame:", v8, v10, v12, v14);

}

- (void)applyCornerRadius:(double)a3 cornerMask:(unint64_t)a4 curve:(id)a5 onView:(id)a6
{
  _BOOL8 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v9 = a3 > 0.0;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v10, "setClipsToBounds:", v9);
  objc_msgSend(v10, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaskedCorners:", a4);

  objc_msgSend(v10, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", a3);

  objc_msgSend(v10, "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setCornerCurve:", v11);
}

- (id)viewForFill:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXComponentStyleRenderer videoPlayerViewForFill:](self, "videoPlayerViewForFill:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SXComponentStyleRenderer imageViewForFill:](self, "imageViewForFill:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SXComponentStyleRenderer gradientViewForFill:](self, "gradientViewForFill:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v6 = 0;
          goto LABEL_10;
        }
        -[SXComponentStyleRenderer repeatableImageFillViewForFill:](self, "repeatableImageFillViewForFill:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v6 = (void *)v5;
LABEL_10:

  return v6;
}

- (id)gradientViewForFill:(id)a3
{
  id v4;
  SXGradientFillView *v5;
  id v6;
  SXGradientFillView *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SXComponentStyleRenderer gradientFillView](self, "gradientFillView");
  v5 = (SXGradientFillView *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v7 = [SXGradientFillView alloc];
    -[SXComponentStyleRenderer gradientFactory](self, "gradientFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SXGradientFillView initWithGradientFill:gradientFactory:](v7, "initWithGradientFill:gradientFactory:", v6, v8);

    -[SXComponentStyleRenderer setGradientFillView:](self, "setGradientFillView:", v5);
LABEL_4:

  }
  -[SXComponentStyleRenderer gradientFillView](self, "gradientFillView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)imageViewForFill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SXComponentStyleRenderer imageFillView](self, "imageFillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SXComponentStyleRenderer imageFillViewFactory](self, "imageFillViewFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createImageFillViewForImageFill:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentStyleRenderer setImageFillView:](self, "setImageFillView:", v7);

  }
  -[SXComponentStyleRenderer imageFillView](self, "imageFillView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)videoPlayerViewForFill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SXComponentStyleRenderer videoFillViewFactory](self, "videoFillViewFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createVideoFillViewForVideoFill:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentStyleRenderer setVideoFillView:](self, "setVideoFillView:", v7);

    -[SXComponentStyleRenderer viewport](self, "viewport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addViewportChangeListener:forOptions:", self, 8);

  }
  -[SXComponentStyleRenderer videoFillView](self, "videoFillView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)repeatableImageFillViewForFill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SXComponentStyleRenderer repeatableImageFillViewFactory](self, "repeatableImageFillViewFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createRepeatableImageFillViewForRepeatableImageFill:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentStyleRenderer setRepeatableImageFillView:](self, "setRepeatableImageFillView:", v7);

  }
  -[SXComponentStyleRenderer repeatableImageFillView](self, "repeatableImageFillView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SXComponentStyle)componentStyle
{
  return self->_componentStyle;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXVideoFillViewFactory)videoFillViewFactory
{
  return self->_videoFillViewFactory;
}

- (SXImageFillViewFactory)imageFillViewFactory
{
  return self->_imageFillViewFactory;
}

- (SXGradientFactory)gradientFactory
{
  return self->_gradientFactory;
}

- (SXRepeatableImageFillViewFactory)repeatableImageFillViewFactory
{
  return self->_repeatableImageFillViewFactory;
}

- (SXComponentView)componentView
{
  return (SXComponentView *)objc_loadWeakRetained((id *)&self->_componentView);
}

- (SXGradientFillView)gradientFillView
{
  return self->_gradientFillView;
}

- (void)setGradientFillView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientFillView, a3);
}

- (SXImageFillView)imageFillView
{
  return self->_imageFillView;
}

- (void)setImageFillView:(id)a3
{
  objc_storeStrong((id *)&self->_imageFillView, a3);
}

- (SXVideoFillView)videoFillView
{
  return self->_videoFillView;
}

- (void)setVideoFillView:(id)a3
{
  objc_storeStrong((id *)&self->_videoFillView, a3);
}

- (SXRepeatableImageFillView)repeatableImageFillView
{
  return self->_repeatableImageFillView;
}

- (void)setRepeatableImageFillView:(id)a3
{
  objc_storeStrong((id *)&self->_repeatableImageFillView, a3);
}

- (BOOL)didRegisterForDynamicBounds
{
  return self->_didRegisterForDynamicBounds;
}

- (void)setDidRegisterForDynamicBounds:(BOOL)a3
{
  self->_didRegisterForDynamicBounds = a3;
}

- (SXLayer)shadowLayer
{
  return self->_shadowLayer;
}

- (void)setShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shadowLayer, a3);
}

- (SXShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_borderLayer, a3);
}

- (SXShapeLayer)topBorderLayer
{
  return self->_topBorderLayer;
}

- (void)setTopBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_topBorderLayer, a3);
}

- (SXShapeLayer)rightBorderLayer
{
  return self->_rightBorderLayer;
}

- (void)setRightBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rightBorderLayer, a3);
}

- (SXShapeLayer)bottomBorderLayer
{
  return self->_bottomBorderLayer;
}

- (void)setBottomBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBorderLayer, a3);
}

- (SXShapeLayer)leftBorderLayer
{
  return self->_leftBorderLayer;
}

- (void)setLeftBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_leftBorderLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftBorderLayer, 0);
  objc_storeStrong((id *)&self->_bottomBorderLayer, 0);
  objc_storeStrong((id *)&self->_rightBorderLayer, 0);
  objc_storeStrong((id *)&self->_topBorderLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_repeatableImageFillView, 0);
  objc_storeStrong((id *)&self->_videoFillView, 0);
  objc_storeStrong((id *)&self->_imageFillView, 0);
  objc_storeStrong((id *)&self->_gradientFillView, 0);
  objc_destroyWeak((id *)&self->_componentView);
  objc_storeStrong((id *)&self->_repeatableImageFillViewFactory, 0);
  objc_storeStrong((id *)&self->_gradientFactory, 0);
  objc_storeStrong((id *)&self->_imageFillViewFactory, 0);
  objc_storeStrong((id *)&self->_videoFillViewFactory, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_componentStyle, 0);
}

@end
