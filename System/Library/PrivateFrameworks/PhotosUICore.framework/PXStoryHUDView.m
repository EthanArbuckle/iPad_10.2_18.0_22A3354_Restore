@implementation PXStoryHUDView

- (PXStoryHUDView)initWithFrame:(CGRect)a3
{
  PXStoryHUDView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *bodyLabel;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXStoryHUDView;
  v3 = -[PXStoryHUDView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setOpaque:](v3->_titleLabel, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[PXStoryHUDView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v6;

    -[UILabel setOpaque:](v3->_bodyLabel, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](v3->_bodyLabel, "setNumberOfLines:", 0);
    -[PXStoryHUDView addSubview:](v3, "addSubview:", v3->_bodyLabel);
    -[PXStoryHUDView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
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
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  double x;
  double y;
  double width;
  double height;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  _QWORD v67[4];
  _QWORD v68[4];
  _QWORD v69[6];
  CGRect v70;
  CGRect v71;

  v69[4] = *MEMORY[0x1E0C80C00];
  -[PXStoryHUDView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textRelativePosition");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "textInsets");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "borderWidth");
  v14 = v13;
  -[PXStoryHUDView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBorderWidth:", v14);
  v16 = objc_retainAutorelease(v12);
  objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));
  v64 = v15;
  objc_msgSend(v15, "setZPosition:", 10000.0);
  -[PXStoryHUDView bounds](self, "bounds");
  v71 = CGRectInset(v70, v9 + v14, v11 + v14);
  x = v71.origin.x;
  y = v71.origin.y;
  width = v71.size.width;
  height = v71.size.height;
  -[PXStoryHUDView titleLabel](self, "titleLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryHUDView bodyLabel](self, "bodyLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  v22 = v21;
  v23 = 2;
  if (v5 <= 0.75)
    v23 = 1;
  if (v5 >= 0.25)
    v24 = v23;
  else
    v24 = 0;
  objc_msgSend(v21, "setAlignment:", v24);
  objc_msgSend(v22, "setLineBreakMode:", 0);
  v25 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v3, "fontSize");
  objc_msgSend(v25, "monospacedSystemFontOfSize:weight:");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0DC1140];
  v68[0] = *MEMORY[0x1E0DC1140];
  v28 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v69[0] = v28;
  v29 = *MEMORY[0x1E0DC1100];
  v68[1] = *MEMORY[0x1E0DC1100];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0DC1138];
  v69[1] = v30;
  v69[2] = v26;
  v62 = (void *)v26;
  v32 = *MEMORY[0x1E0DC1178];
  v68[2] = v31;
  v68[3] = v32;
  v69[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 4);
  v33 = objc_claimAutoreleasedReturnValue();

  if (!v16)
  v34 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v3, "text");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = (const __CFString *)v35;
  else
    v37 = &stru_1E5149688;
  v61 = (void *)v33;
  v38 = (void *)objc_msgSend(v34, "initWithString:attributes:", v37, v33);
  objc_msgSend(v65, "setAttributedText:", v38);

  v39 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v3, "fontSize");
  objc_msgSend(v39, "monospacedSystemFontOfSize:weight:", v40 + 2.0, *MEMORY[0x1E0DC1418]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v27;
  v42 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67[0] = v42;
  v66[1] = v29;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v43;
  v67[2] = v41;
  v66[2] = v31;
  v66[3] = v32;
  v67[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  v45 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v3, "title");
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v46;
  if (v46)
    v48 = (const __CFString *)v46;
  else
    v48 = &stru_1E5149688;
  v49 = (void *)objc_msgSend(v45, "initWithString:attributes:", v48, v44);
  objc_msgSend(v63, "setAttributedText:", v49);

  objc_msgSend(v41, "lineHeight");
  objc_msgSend(v63, "setFrame:", x + v5 * (width - width), y + v7 * (height - v50), width, v50);
  PXEdgeInsetsMake();
  PXEdgeInsetsInsetRect();
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  objc_msgSend(v65, "sizeThatFits:", v55, v57);
  PXSizeCeilingToPixel();
  PXSizeMin();
  objc_msgSend(v65, "setFrame:", v52 + v5 * (v56 - v59), v54 + v7 * (v58 - v60), v59, v60);

}

- (void)setUserData:(id)a3
{
  PXStoryHUDViewConfiguration *v4;
  PXStoryHUDViewConfiguration *userData;

  v4 = (PXStoryHUDViewConfiguration *)objc_msgSend(a3, "copy");
  userData = self->_userData;
  self->_userData = v4;

  -[PXStoryHUDView setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  -[PXStoryHUDView setUserData:](self, "setUserData:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXStoryHUDViewConfiguration)userData
{
  return self->_userData;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
