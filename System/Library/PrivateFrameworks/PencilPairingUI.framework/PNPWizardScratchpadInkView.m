@implementation PNPWizardScratchpadInkView

+ (double)preferredHeight
{
  return 68.0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;

  -[PNPWizardScratchpadInkView bounds](self, "bounds");
  -[UIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");

  -[PNPWizardScratchpadInkView bounds](self, "bounds");
  -[PNPWizardScratchpadInkView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v12 = v5;
  UIRectCenteredXInRectScale();
  v7 = v6;
  v9 = v8;

  if (-[PNPWizardScratchpadInkView selected](self, "selected", v12))
    v10 = 68.0;
  else
    v10 = 50.0;
  if (-[PNPWizardScratchpadInkView pressed](self, "pressed"))
    v10 = v10 + -6.0;
  -[PNPWizardScratchpadInkView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v7, v11 - v10, v9, v10);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIImageView image](self->_imageView, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[PNPWizardScratchpadInkView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
  -[PNPWizardScratchpadInkView setNeedsLayout](self, "setNeedsLayout");
}

- (PNPWizardScratchpadInkView)initWithIndex:(int64_t)a3
{
  PNPWizardScratchpadInkView *v4;
  UIImageView *v5;
  UIImageView *imageView;
  UIImageView *v7;
  void *v8;
  uint64_t v9;
  PKInk *ink;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PNPWizardScratchpadInkView;
  v4 = -[PNPWizardScratchpadInkView init](&v12, sel_init);
  v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
  imageView = v4->_imageView;
  v4->_imageView = v5;

  v7 = v4->_imageView;
  objc_msgSend((id)__PNPWizardScratchpadInkViewInkImages, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v7, "setImage:", v8);

  -[PNPWizardScratchpadInkView addSubview:](v4, "addSubview:", v4->_imageView);
  objc_msgSend((id)__PNPWizardScratchpadInkViewInks, "objectAtIndex:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  ink = v4->_ink;
  v4->_ink = (PKInk *)v9;

  return v4;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[10];

  v39[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__PNPWizardScratchpadInkViewInkImages;
  __PNPWizardScratchpadInkViewInkImages = v2;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)__PNPWizardScratchpadInkViewInks;
  __PNPWizardScratchpadInkViewInks = v4;

  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v6;
  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v7;
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v8;
  objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v9;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v10;
  objc_msgSend(MEMORY[0x24BDF6950], "systemPurpleColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v11;
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v12;
  objc_msgSend(MEMORY[0x24BDF6950], "systemPinkColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x24BDE3440];
  v32[0] = *MEMORY[0x24BDE3438];
  v32[1] = v15;
  v33 = *MEMORY[0x24BDE3428];
  v34 = v32[0];
  v35 = v33;
  v36 = v32[0];
  v16 = *MEMORY[0x24BDE3430];
  v37 = v32[0];
  v38 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(&unk_24F4F63A0, "objectAtIndex:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDF6AC8];
    PencilPairingUIBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageNamed:inBundle:compatibleWithTraitCollection:", v19, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)__PNPWizardScratchpadInkViewInkImages, "addObject:", v24);
    objc_msgSend(MEMORY[0x24BDE33B0], "inkWithIdentifier:color:", v21, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__PNPWizardScratchpadInkViewInks, "addObject:", v25);
    v26 = *(double *)&__PNPWizardScratchpadInkViewInkHeight;
    objc_msgSend(v24, "size");
    if (v26 >= v27)
      *(double *)&v28 = v27;
    else
      *(double *)&v28 = v26;
    __PNPWizardScratchpadInkViewInkHeight = v28;
    v29 = *(double *)&__PNPWizardScratchpadInkViewInkSelectedHeight;
    objc_msgSend(v24, "size");
    if (v29 >= v30)
      *(double *)&v31 = v29;
    else
      *(double *)&v31 = v30;
    __PNPWizardScratchpadInkViewInkSelectedHeight = v31;

  }
}

- (PKInk)ink
{
  return self->_ink;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
