@implementation PUWallpaperSettlingEffectDebugView

- (PUWallpaperSettlingEffectDebugView)initWithSegmentationItem:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PUWallpaperSettlingEffectDebugView *v10;
  PUWallpaperSettlingEffectDebugView *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UILabel *label;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIButton *button;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PUWallpaperSettlingEffectDebugView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[PUWallpaperSettlingEffectDebugView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_segmentationItem, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperSettlingEffectDebugView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[PUWallpaperSettlingEffectDebugView setAlpha:](v11, "setAlpha:", 0.9);
    -[PUWallpaperSettlingEffectDebugView layer](v11, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 15.0);

    -[PUWallpaperSettlingEffectDebugView layer](v11, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    label = v11->_label;
    v11->_label = (UILabel *)v15;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11->_label, "setFont:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11->_label, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](v11->_label, "setNumberOfLines:", 0);
    -[PUWallpaperSettlingEffectDebugView generateText](v11, "generateText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v11->_label, "setAttributedText:", v19);

    -[PUWallpaperSettlingEffectDebugView addSubview:](v11, "addSubview:", v11->_label);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v20 = objc_claimAutoreleasedReturnValue();
    button = v11->_button;
    v11->_button = (UIButton *)v20;

    -[UIButton setTitle:forState:](v11->_button, "setTitle:forState:", CFSTR("File Radar"), 0);
    -[UIButton addTarget:action:forControlEvents:](v11->_button, "addTarget:action:forControlEvents:", v11, sel_fileRadarButtonTapped, 64);
    -[UIButton titleLabel](v11->_button, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v23);

    -[PUWallpaperSettlingEffectDebugView addSubview:](v11, "addSubview:", v11->_button);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v11, sel_viewTapped);
    -[PUWallpaperSettlingEffectDebugView addGestureRecognizer:](v11, "addGestureRecognizer:", v24);

  }
  return v11;
}

- (id)generateText
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperSettlingEffectDebugView segmentationItem](self, "segmentationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v4 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v4, "setAlignment:", 1);
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v45[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1178];
  v46[0] = v6;
  v46[1] = v4;
  v31 = v4;
  v33 = *MEMORY[0x1E0DC1138];
  v8 = *MEMORY[0x1E0DC1138];
  v34 = v7;
  v45[1] = v7;
  v45[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1430]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "initWithString:attributes:", CFSTR("TAP TO DISMISS\n\n"), v10);

  v35 = v3;
  v30 = (void *)v11;
  objc_msgSend(v3, "appendAttributedString:", v11);
  v12 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v12, "setLineBreakMode:", 0);
  if (objc_msgSend(v2, "settlingEffectFailedAnyGating"))
  {
    v43[0] = v33;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1420]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v34;
    v44[0] = v13;
    v44[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v13) = objc_msgSend(v2, "isSettlingEffectAvailable");
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    if ((_DWORD)v13)
      v16 = CFSTR("In production, this asset would have failed settling effect generation. Please File a Radar if you think this is a good settling effect result.\n\n");
    else
      v16 = CFSTR("This asset failed settling effect generation. Please File a Radar if you think the settling effect should be available.\n\n");
    v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v14);
    objc_msgSend(v3, "appendAttributedString:", v17);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v2, "settlingEffectGatingDiagnostics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    v21 = *MEMORY[0x1E0DC1440];
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v24 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v33;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v34;
        v41[0] = v26;
        v41[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v24, "initWithString:attributes:", v25, v27);

        objc_msgSend(v35, "appendAttributedString:", v28);
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v19);
  }

  return v35;
}

- (void)fileRadarButtonTapped
{
  void *v3;
  void (**v4)(void);

  -[PUWallpaperSettlingEffectDebugView onFileRadar](self, "onFileRadar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUWallpaperSettlingEffectDebugView onFileRadar](self, "onFileRadar");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  double v13;
  void *v14;
  double Width;
  double v16;
  double Height;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v20.receiver = self;
  v20.super_class = (Class)PUWallpaperSettlingEffectDebugView;
  -[PUWallpaperSettlingEffectDebugView layoutSubviews](&v20, sel_layoutSubviews);
  -[PUWallpaperSettlingEffectDebugView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUWallpaperSettlingEffectDebugView label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v12 = CGRectGetWidth(v21) + -40.0;
  objc_msgSend(v11, "sizeThatFits:", v12, 0.0);
  objc_msgSend(v11, "setFrame:", 20.0, 20.0, v12, v13);
  -[PUWallpaperSettlingEffectDebugView button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  Width = CGRectGetWidth(v22);
  objc_msgSend(v14, "frame");
  v16 = (Width - CGRectGetWidth(v23)) * 0.5;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  Height = CGRectGetHeight(v24);
  objc_msgSend(v14, "frame");
  v18 = Height - CGRectGetHeight(v25) + -10.0;
  objc_msgSend(v14, "frame");
  v19 = CGRectGetWidth(v26);
  objc_msgSend(v14, "frame");
  objc_msgSend(v14, "setFrame:", v16, v18, v19, CGRectGetHeight(v27));

}

- (id)onFileRadar
{
  return self->_onFileRadar;
}

- (void)setOnFileRadar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setSegmentationItem:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationItem, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong(&self->_onFileRadar, 0);
}

@end
