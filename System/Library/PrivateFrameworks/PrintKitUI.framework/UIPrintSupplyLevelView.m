@implementation UIPrintSupplyLevelView

- (UIPrintSupplyLevelView)initWithFrame:(CGRect)a3 supplyInfo:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIPrintSupplyLevelView *v10;
  UIPrintSupplyLevelView *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_super v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)UIPrintSupplyLevelView;
  v10 = -[UIPrintSupplyLevelView initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[UIPrintSupplyLevelView setSupplyInfo:](v10, "setSupplyInfo:", v9);
    -[UIPrintSupplyLevelView setOpaque:](v11, "setOpaque:", 0);
    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithImage:", v13);
    -[UIPrintSupplyLevelView setLowSupplyImageView:](v11, "setLowSupplyImageView:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintSupplyLevelView lowSupplyImageView](v11, "lowSupplyImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v15);

    -[UIPrintSupplyLevelView lowSupplyImageView](v11, "lowSupplyImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = (height - v18) * 0.5;
    -[UIPrintSupplyLevelView lowSupplyImageView](v11, "lowSupplyImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    -[UIPrintSupplyLevelView lowSupplyImageView](v11, "lowSupplyImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    -[UIPrintSupplyLevelView lowSupplyImageView](v11, "lowSupplyImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", 0.0, v19, v22, v25);

    v27 = -[UIPrintSupplyLevelView supplyLevelShowWarning](v11, "supplyLevelShowWarning") ^ 1;
    -[UIPrintSupplyLevelView lowSupplyImageView](v11, "lowSupplyImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", v27);

    -[UIPrintSupplyLevelView lowSupplyImageView](v11, "lowSupplyImageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintSupplyLevelView addSubview:](v11, "addSubview:", v29);

  }
  return v11;
}

- (BOOL)supplyLevelShowWarning
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[UIPrintSupplyLevelView supplyInfo](self, "supplyInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supplyType");

  -[UIPrintSupplyLevelView supplyInfo](self, "supplyInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "level");
  -[UIPrintSupplyLevelView supplyInfo](self, "supplyInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 == 3)
    v9 = v6 <= (int)objc_msgSend(v7, "lowLevel");
  else
    v9 = v6 >= (int)objc_msgSend(v7, "highLevel");

  return v9;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  CGBlendMode BlendMode;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v42 = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  BlendMode = CGContextGetBlendMode();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  -[UIPrintSupplyLevelView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIPrintSupplyLevelView lowSupplyImageView](self, "lowSupplyImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15 + 8.0;

  v17 = v7 + v16;
  v18 = v11 - v16;
  v19 = (void *)MEMORY[0x1E0DC3508];
  v43.origin.x = v17;
  v43.origin.y = v9;
  v43.size.width = v18;
  v43.size.height = v13;
  v44 = CGRectInset(v43, 0.25, 0.25);
  objc_msgSend(v19, "bezierPathWithRoundedRect:cornerRadius:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height, 3.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addClip");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "set");

  objc_msgSend(v20, "fill");
  -[UIPrintSupplyLevelView supplyInfo](self, "supplyInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "level");

  if (v23 >= 1)
  {
    -[UIPrintSupplyLevelView supplyInfo](self, "supplyInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "colors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPrintSupplyLevelView supplyInfo](self, "supplyInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v18 * ((double)(int)objc_msgSend(v26, "level") / 100.0);

    if (objc_msgSend(v25, "count") == 1)
    {
      objc_msgSend(v25, "objectAtIndex:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "set");

      v45.origin.x = v17;
      v45.origin.y = v9;
      v45.size.width = v27;
      v45.size.height = v13;
      UIRectFill(v45);
    }
    else
    {
      v29 = objc_msgSend(v25, "count");
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v30 = v25;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v31)
      {
        v32 = v31;
        v33 = v13 / (double)v29;
        v34 = *(_QWORD *)v38;
        do
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v38 != v34)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v35), "set", (_QWORD)v37);
            v46.origin.x = v17;
            v46.origin.y = v9;
            v46.size.width = v27;
            v46.size.height = v33;
            UIRectFill(v46);
            v9 = v33 + v9;
            ++v35;
          }
          while (v32 != v35);
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v32);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor", (_QWORD)v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "set");

  objc_msgSend(v20, "setLineWidth:", 0.5);
  objc_msgSend(v20, "stroke");
  CGContextSetBlendMode(CurrentContext, BlendMode);

}

- (PKSupply)supplyInfo
{
  return self->_supplyInfo;
}

- (void)setSupplyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_supplyInfo, a3);
}

- (UIView)lowSupplyImageView
{
  return self->_lowSupplyImageView;
}

- (void)setLowSupplyImageView:(id)a3
{
  objc_storeStrong((id *)&self->_lowSupplyImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowSupplyImageView, 0);
  objc_storeStrong((id *)&self->_supplyInfo, 0);
}

@end
