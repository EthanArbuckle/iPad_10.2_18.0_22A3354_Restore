@implementation SHListeningAutoShadowLayer

- (void)setup
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  -[SHListeningAutoShadowLayer setContentsScale:](self, "setContentsScale:");
  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHListeningAutoShadowLayer setAutoShadowBackgroundLayer:](self, "setAutoShadowBackgroundLayer:", v3);

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  v5 = v4;
  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentsScale:", v5);

  -[SHPaletteLayer palette](self, "palette");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "listeningButtonBackgroundTransparentColor");
  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMasksToBounds:", 1);

  v11 = objc_alloc_init(MEMORY[0x24BDE5758]);
  -[SHListeningAutoShadowLayer setAutoShadowOuterLayer:](self, "setAutoShadowOuterLayer:", v11);

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  v13 = v12;
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsScale:", v13);

  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFillColor:", 0);

  -[SHPaletteLayer palette](self, "palette");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "listeningButtonBackgroundTransparentColor");
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStrokeColor:", v17);

  -[SHPaletteLayer palette](self, "palette");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shadowColor");
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setShadowColor:", v20);

  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShadowRadius:", 3.0);

  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 0.5;
  objc_msgSend(v23, "setShadowOpacity:", v24);

  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShadowOffset:", 0.0, 0.0);

  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBorderWidth:", 1.0);

  -[SHPaletteLayer palette](self, "palette");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "clearColor");
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBorderColor:", v28);

  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLineWidth:", 3.0);

  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningAutoShadowLayer addSublayer:](self, "addSublayer:", v31);

  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSublayer:", v32);

}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  CGPath *Mutable;
  void *v36;
  void *v37;
  objc_super v38;
  CGRect v39;

  v38.receiver = self;
  v38.super_class = (Class)SHListeningAutoShadowLayer;
  -[SHListeningAutoShadowLayer layoutSublayers](&v38, sel_layoutSublayers);
  -[SHListeningAutoShadowLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13 * 0.5;
  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v14);

  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  -[SHPaletteLayer palette](self, "palette");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "listeningButtonBackgroundTransparentColor");
  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v27);

  -[SHPaletteLayer palette](self, "palette");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "listeningButtonBackgroundTransparentColor");
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setStrokeColor:", v30);

  -[SHPaletteLayer palette](self, "palette");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "shadowColor");
  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setShadowColor:", v33);

  Mutable = CGPathCreateMutable();
  -[SHListeningAutoShadowLayer autoShadowBackgroundLayer](self, "autoShadowBackgroundLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  CGPathAddEllipseInRect(Mutable, 0, v39);

  -[SHListeningAutoShadowLayer autoShadowOuterLayer](self, "autoShadowOuterLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPath:", Mutable);

  CGPathRelease(Mutable);
}

- (CALayer)autoShadowBackgroundLayer
{
  return self->_autoShadowBackgroundLayer;
}

- (void)setAutoShadowBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_autoShadowBackgroundLayer, a3);
}

- (CAShapeLayer)autoShadowOuterLayer
{
  return self->_autoShadowOuterLayer;
}

- (void)setAutoShadowOuterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_autoShadowOuterLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoShadowOuterLayer, 0);
  objc_storeStrong((id *)&self->_autoShadowBackgroundLayer, 0);
}

@end
