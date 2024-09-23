@implementation PXSnapStripView

- (PXSnapStripView)initWithFrame:(CGRect)a3
{
  PXSnapStripView *v3;
  PXSnapStripView *v4;
  NSArray *indicatorInfos;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSnapStripView;
  v3 = -[PXSnapStripView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    indicatorInfos = v3->_indicatorInfos;
    v3->_indicatorInfos = (NSArray *)MEMORY[0x1E0C9AA60];

    -[PXSnapStripView setOpaque:](v4, "setOpaque:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSnapStripView;
  -[PXSnapStripView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXSnapStripView _updateSnapStripImage](self, "_updateSnapStripImage");
}

- (void)setIndicatorInfos:(id)a3
{
  -[PXSnapStripView setIndicatorInfos:animated:](self, "setIndicatorInfos:animated:", a3, 1);
}

- (void)setIndicatorInfos:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *v7;
  BOOL v8;
  NSArray *v9;
  NSArray *indicatorInfos;
  NSArray *v11;

  v4 = a4;
  v6 = (NSArray *)a3;
  v7 = v6;
  if (self->_indicatorInfos != v6)
  {
    v11 = v6;
    v8 = -[NSArray isEqualToArray:](v6, "isEqualToArray:");
    v7 = v11;
    if (!v8)
    {
      v9 = (NSArray *)-[NSArray copy](v11, "copy");
      indicatorInfos = self->_indicatorInfos;
      self->_indicatorInfos = v9;

      -[PXSnapStripView _updateStripView:](self, "_updateStripView:", v4);
      v7 = v11;
    }
  }

}

- (void)_updateStripView:(BOOL)a3
{
  _BOOL4 v4;
  id v5;
  UIImageView *v6;
  UIImageView *stripImageView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void (**v21)(_QWORD);
  void (**v22)(void *, uint64_t);
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[5];
  id v26;

  if (self->_stripImageView)
  {
    -[PXSnapStripView _updateSnapStripImage](self, "_updateSnapStripImage", a3);
  }
  else
  {
    v4 = a3;
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PXSnapStripView bounds](self, "bounds");
    v6 = (UIImageView *)objc_msgSend(v5, "initWithFrame:");
    stripImageView = self->_stripImageView;
    self->_stripImageView = v6;

    -[UIImageView setAlpha:](self->_stripImageView, "setAlpha:", 0.0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_stripImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXSnapStripView addSubview:](self, "addSubview:", self->_stripImageView);
    -[UIImageView leftAnchor](self->_stripImageView, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSnapStripView leftAnchor](self, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[UIImageView topAnchor](self->_stripImageView, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSnapStripView topAnchor](self, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UIImageView rightAnchor](self->_stripImageView, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSnapStripView rightAnchor](self, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UIImageView bottomAnchor](self->_stripImageView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSnapStripView bottomAnchor](self, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[PXSnapStripView _updateSnapStripImage](self, "_updateSnapStripImage");
    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__PXSnapStripView__updateStripView___block_invoke;
    aBlock[3] = &unk_1E5148D08;
    aBlock[4] = self;
    v26 = 0;
    v21 = (void (**)(_QWORD))_Block_copy(aBlock);
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __36__PXSnapStripView__updateStripView___block_invoke_2;
    v23[3] = &unk_1E5147360;
    v24 = 0;
    v22 = (void (**)(void *, uint64_t))_Block_copy(v23);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v21, v22);
    }
    else
    {
      v21[2](v21);
      v22[2](v22, 1);
    }

  }
}

- (void)_updateSnapStripImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  int v11;
  CGColorSpace *DeviceRGB;
  CGContext *v13;
  void *v14;
  double Height;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CGColor *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  CGImage *Image;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGAffineTransform v44;
  uint8_t buf[16];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47 = *MEMORY[0x1E0C80C00];
  -[PXSnapStripView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = vcvtpd_s64_f64(v4 * v9);
  v11 = vcvtpd_s64_f64(v6 * v9);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v13 = CGBitmapContextCreate(0, v10, v11, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v13)
  {
    v48.size.width = (double)v10;
    v48.origin.x = 0.0;
    v48.origin.y = 0.0;
    v48.size.height = (double)v11;
    CGContextClearRect(v13, v48);
    CGContextTranslateCTM(v13, 0.0, (double)v11);
    CGContextScaleCTM(v13, v9, -v9);
    CGContextGetCTM(&v44, v13);
    CGContextSetBaseCTM();
    -[PXSnapStripView indicatorInfos](self, "indicatorInfos");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSnapStripView bounds](self, "bounds");
    Height = CGRectGetHeight(v49);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = v14;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = Height + -6.0;
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v22, "offset", (_QWORD)v40);
          v24 = v23;
          objc_msgSend(v22, "color");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXSnapStripView traitCollection](self, "traitCollection");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "resolvedColorWithTraitCollection:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_retainAutorelease(v27);
          v29 = (CGColor *)objc_msgSend(v28, "CGColor");
          v30 = objc_msgSend(v22, "style");
          if (v30)
          {
            if (v30 == 2)
            {
              -[PXSnapStripView cubeGlyph](self, "cubeGlyph");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "size");
              v33 = v32;
              v35 = v34;
              v36 = v24 + v32 * -0.5;
              UIGraphicsPushContext(v13);
              objc_msgSend(v31, "imageWithTintColor:", v28);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v37, "drawInRect:", v36, 0.0, v33, v35);
              UIGraphicsPopContext();

            }
            else if (v30 == 1)
            {
              CGContextSetStrokeColorWithColor(v13, v29);
              v50.size.width = 2.0;
              v50.size.height = 6.0;
              v50.origin.x = v24 + -1.0;
              v50.origin.y = v19;
              CGContextStrokeEllipseInRect(v13, v50);
            }
          }
          else
          {
            CGContextSetFillColorWithColor(v13, v29);
            v51.size.width = 6.0;
            v51.size.height = 6.0;
            v51.origin.x = v24 + -3.0;
            v51.origin.y = v19;
            CGContextFillEllipseInRect(v13, v51);
          }

        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v18);
    }

    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(Image);
    -[UIImageView setImage:](self->_stripImageView, "setImage:", v39);

  }
  else
  {
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "PXSnapStripView _updateSnapStripImage: could not allocate context", buf, 2u);
    }
  }

}

- (id)cubeGlyph
{
  if (cubeGlyph_onceToken != -1)
    dispatch_once(&cubeGlyph_onceToken, &__block_literal_global_119558);
  return (id)cubeGlyph_glyph;
}

- (NSArray)indicatorInfos
{
  return self->_indicatorInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorInfos, 0);
  objc_storeStrong((id *)&self->_stripImageView, 0);
}

void __28__PXSnapStripView_cubeGlyph__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 10.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configurationWithHierarchicalColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "configurationByApplyingConfiguration:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("f.cursive.circle.fill"), v8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)cubeGlyph_glyph;
  cubeGlyph_glyph = v4;

  objc_msgSend((id)cubeGlyph_glyph, "imageWithRenderingMode:", 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)cubeGlyph_glyph;
  cubeGlyph_glyph = v6;

}

uint64_t __36__PXSnapStripView__updateStripView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __36__PXSnapStripView__updateStripView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

@end
