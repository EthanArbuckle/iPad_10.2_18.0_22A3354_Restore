@implementation VSTintedBackgroundButton

- (void)_updateBackgroundImages
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  -[VSTintedBackgroundButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTintedBackgroundButton bounds](self, "bounds");
  -[VSTintedBackgroundButton backgroundRectForBounds:](self, "backgroundRectForBounds:");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", v5, v7);
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke;
  v20[3] = &unk_24FE1B538;
  v10 = v3;
  v21 = v10;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v16, "imageWithActions:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTintedBackgroundButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v12, 0);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke_2;
  v17[3] = &unk_24FE1B538;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v16, "imageWithActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTintedBackgroundButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v15, 1);

}

uint64_t __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  return objc_msgSend(*(id *)(a1 + 40), "fill");
}

uint64_t __51__VSTintedBackgroundButton__updateBackgroundImages__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", 0.5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  return objc_msgSend(*(id *)(a1 + 40), "fill");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSTintedBackgroundButton;
  -[VSTintedBackgroundButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VSTintedBackgroundButton _updateBackgroundImages](self, "_updateBackgroundImages");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSTintedBackgroundButton;
  -[VSTintedBackgroundButton setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VSTintedBackgroundButton _updateBackgroundImages](self, "_updateBackgroundImages");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSTintedBackgroundButton;
  -[VSTintedBackgroundButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[VSTintedBackgroundButton _updateBackgroundImages](self, "_updateBackgroundImages");
}

@end
