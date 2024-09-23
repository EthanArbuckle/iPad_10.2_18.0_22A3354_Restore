@implementation WFTriggerOptionSelectionView

- (WFTriggerOptionSelectionView)init
{
  WFTriggerOptionSelectionView *v2;
  UIImageView *v3;
  UIImageView *imageView;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  double v9;
  double v10;
  WFCircularGlyphView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  WFCircularGlyphView *selectedView;
  WFCircularGlyphView *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  WFCircularGlyphView *unselectedView;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  WFTriggerOptionSelectionView *v34;
  void *v36;
  void *v37;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_super v79;
  _QWORD v80[20];

  v80[18] = *MEMORY[0x24BDAC8D0];
  v79.receiver = self;
  v79.super_class = (Class)WFTriggerOptionSelectionView;
  v2 = -[WFTriggerOptionSelectionView init](&v79, sel_init);
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v2->_imageView;
    v2->_imageView = v3;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v2->_imageView, "setContentMode:", 4);
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = v2->_label;
    v2->_label = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE220], *MEMORY[0x24BEBB600]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_label, "setFont:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v8);

    -[UILabel setNumberOfLines:](v2->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    +[WFTriggerOptionSelectionView scaledValueForValue:](WFTriggerOptionSelectionView, "scaledValueForValue:", 35.0);
    v10 = v9;
    v11 = [WFCircularGlyphView alloc];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFCircularGlyphView initWithName:glyphColor:backgroundColor:](v11, "initWithName:glyphColor:backgroundColor:", CFSTR("checkmark.circle.fill"), v12, v13);
    selectedView = v2->_selectedView;
    v2->_selectedView = (WFCircularGlyphView *)v14;

    -[WFCircularGlyphView setImagePointSize:](v2->_selectedView, "setImagePointSize:", v10);
    v16 = [WFCircularGlyphView alloc];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemMidGrayColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFCircularGlyphView initWithName:glyphColor:backgroundColor:](v16, "initWithName:glyphColor:backgroundColor:", CFSTR("circle"), v17, v18);
    unselectedView = v2->_unselectedView;
    v2->_unselectedView = (WFCircularGlyphView *)v19;

    -[WFCircularGlyphView setImagePointSize:](v2->_unselectedView, "setImagePointSize:", v10);
    -[WFCircularGlyphView setTranslatesAutoresizingMaskIntoConstraints:](v2->_selectedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFCircularGlyphView setAlpha:](v2->_selectedView, "setAlpha:", 0.0);
    -[WFCircularGlyphView setTranslatesAutoresizingMaskIntoConstraints:](v2->_unselectedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFCircularGlyphView frame](v2->_selectedView, "frame");
    v22 = v21;
    v24 = v23;
    -[WFTriggerOptionSelectionView addSubview:](v2, "addSubview:", v2->_imageView);
    -[WFTriggerOptionSelectionView addSubview:](v2, "addSubview:", v2->_label);
    -[WFTriggerOptionSelectionView addSubview:](v2, "addSubview:", v2->_selectedView);
    -[WFTriggerOptionSelectionView addSubview:](v2, "addSubview:", v2->_unselectedView);
    v59 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView topAnchor](v2->_imageView, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView topAnchor](v2, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, 18.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v76;
    -[UIImageView heightAnchor](v2->_imageView, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToConstant:", 60.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v74;
    -[UIImageView widthAnchor](v2->_imageView, "widthAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", 60.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v72;
    -[UIImageView centerXAnchor](v2->_imageView, "centerXAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView centerXAnchor](v2, "centerXAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v69;
    -[UILabel topAnchor](v2->_label, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v2->_imageView, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 20.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v80[4] = v66;
    -[UILabel centerXAnchor](v2->_label, "centerXAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView centerXAnchor](v2, "centerXAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v80[5] = v63;
    -[UILabel leadingAnchor](v2->_label, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView leadingAnchor](v2, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v80[6] = v60;
    -[UILabel trailingAnchor](v2->_label, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView trailingAnchor](v2, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v80[7] = v56;
    -[WFCircularGlyphView topAnchor](v2->_selectedView, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v2->_label, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 12.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v80[8] = v53;
    -[WFCircularGlyphView centerXAnchor](v2->_selectedView, "centerXAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView centerXAnchor](v2, "centerXAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v80[9] = v50;
    -[WFCircularGlyphView bottomAnchor](v2->_selectedView, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView bottomAnchor](v2, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -20.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v80[10] = v47;
    -[WFCircularGlyphView widthAnchor](v2->_selectedView, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToConstant:", v22);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v80[11] = v45;
    -[WFCircularGlyphView heightAnchor](v2->_selectedView, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToConstant:", v24);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v80[12] = v43;
    -[WFCircularGlyphView topAnchor](v2->_unselectedView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularGlyphView topAnchor](v2->_selectedView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v80[13] = v40;
    -[WFCircularGlyphView centerXAnchor](v2->_unselectedView, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularGlyphView centerXAnchor](v2->_selectedView, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v80[14] = v37;
    -[WFCircularGlyphView bottomAnchor](v2->_unselectedView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularGlyphView bottomAnchor](v2->_selectedView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v80[15] = v26;
    -[WFCircularGlyphView widthAnchor](v2->_unselectedView, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularGlyphView widthAnchor](v2->_selectedView, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:multiplier:", v28, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v80[16] = v29;
    -[WFCircularGlyphView heightAnchor](v2->_unselectedView, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCircularGlyphView heightAnchor](v2->_selectedView, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:multiplier:", v31, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v80[17] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v33);

    v34 = v2;
  }

  return v2;
}

- (void)setSelectedStateImageTintColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_selectedStateImageTintColor, a3);
  if (-[WFTriggerOptionSelectionView selected](self, "selected"))
  {
    -[WFTriggerOptionSelectionView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v6);

  }
}

- (void)setDefaultImageTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_defaultImageTintColor, a3);
  v5 = a3;
  -[WFTriggerOptionSelectionView imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (void)setDefaultImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_defaultImage, a3);
  v5 = a3;
  -[WFTriggerOptionSelectionView imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  CGAffineTransform v18;
  BOOL v19;
  CGAffineTransform v20;

  v3 = a3;
  memset(&v20, 0, sizeof(v20));
  if (a3)
  {
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v20.c = v5;
    *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v20, 0.01, 0.01);
  }
  v17[1] = 3221225472;
  v18 = v20;
  v17[0] = MEMORY[0x24BDAC760];
  v17[2] = __44__WFTriggerOptionSelectionView_setSelected___block_invoke;
  v17[3] = &unk_24E6030F0;
  v17[4] = self;
  v19 = v3;
  objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingDefaultTimingWithOptions:animations:completion:", 2054, v17, 0);
  if (v3
    && (-[WFTriggerOptionSelectionView selectedImage](self, "selectedImage"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[WFTriggerOptionSelectionView selectedImage](self, "selectedImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerOptionSelectionView imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

  }
  else
  {
    -[WFTriggerOptionSelectionView selectedImage](self, "selectedImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WFTriggerOptionSelectionView defaultImage](self, "defaultImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerOptionSelectionView imageView](self, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v10);

    }
    if (!v3)
      goto LABEL_12;
  }
  -[WFTriggerOptionSelectionView selectedStateImageTintColor](self, "selectedStateImageTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFTriggerOptionSelectionView selectedStateImageTintColor](self, "selectedStateImageTintColor");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_12:
  -[WFTriggerOptionSelectionView selectedStateImageTintColor](self, "selectedStateImageTintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    return;
  -[WFTriggerOptionSelectionView defaultImageTintColor](self, "defaultImageTintColor");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v15 = (void *)v13;
  -[WFTriggerOptionSelectionView imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v15);

}

- (BOOL)selected
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;

  -[WFTriggerOptionSelectionView selectedView](self, "selectedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  if (v4 == 1.0)
  {
    -[WFTriggerOptionSelectionView unselectedView](self, "unselectedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alpha");
    v7 = v6 == 0.0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  if (-[WFTriggerOptionSelectionView highlighted](self, "highlighted") != a3)
  {
    self->_highlighted = a3;
    -[WFTriggerOptionSelectionView updateAlpha](self, "updateAlpha");
  }
}

- (void)updateAlpha
{
  void *v3;
  _QWORD v4[5];

  if (-[WFTriggerOptionSelectionView highlighted](self, "highlighted"))
  {
    -[WFTriggerOptionSelectionView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllAnimations");

    -[WFTriggerOptionSelectionView setAlpha:](self, "setAlpha:", 0.5056);
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __43__WFTriggerOptionSelectionView_updateAlpha__block_invoke;
    v4[3] = &unk_24E604D88;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v4, 0, 0.1);
  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)label
{
  return self->_label;
}

- (UIColor)selectedStateImageTintColor
{
  return self->_selectedStateImageTintColor;
}

- (UIColor)defaultImageTintColor
{
  return self->_defaultImageTintColor;
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedImage, a3);
}

- (UIImage)defaultImage
{
  return self->_defaultImage;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (WFCircularGlyphView)selectedView
{
  return self->_selectedView;
}

- (WFCircularGlyphView)unselectedView
{
  return self->_unselectedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedView, 0);
  objc_storeStrong((id *)&self->_selectedView, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_defaultImageTintColor, 0);
  objc_storeStrong((id *)&self->_selectedStateImageTintColor, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

uint64_t __43__WFTriggerOptionSelectionView_updateAlpha__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __44__WFTriggerOptionSelectionView_setSelected___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  unint64_t v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  _OWORD v9[3];

  objc_msgSend(*(id *)(a1 + 32), "selectedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v9[0] = *(_OWORD *)(a1 + 40);
  v9[1] = v3;
  v9[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v9);

  LOBYTE(v4) = *(_BYTE *)(a1 + 88);
  v5 = (double)v4;
  objc_msgSend(*(id *)(a1 + 32), "selectedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  if (*(_BYTE *)(a1 + 88))
    v7 = 0.0;
  else
    v7 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "unselectedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

+ (double)scaledValueForValue:(double)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = objc_alloc(MEMORY[0x24BEBD5F0]);
  v5 = (void *)objc_msgSend(v4, "initForTextStyle:", *MEMORY[0x24BEBE220]);
  objc_msgSend(v5, "scaledValueForValue:", a3);
  v7 = fmax(fmin(v6, 50.0), 24.0);

  return v7;
}

@end
