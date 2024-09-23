@implementation SHListeningInnerCircleLayer

- (void)setup
{
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  -[SHListeningInnerCircleLayer setContentsScale:](self, "setContentsScale:");
  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHListeningInnerCircleLayer setCircleContainerLayer:](self, "setCircleContainerLayer:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDE5758]);
  -[SHListeningInnerCircleLayer setCircle:](self, "setCircle:", v4);

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  v6 = v5;
  -[SHListeningInnerCircleLayer circle](self, "circle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentsScale:", v6);

  -[SHListeningInnerCircleLayer circle](self, "circle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsDisplayOnBoundsChange:", 1);

  -[SHPaletteLayer palette](self, "palette");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "listeningCircleColor");
  -[SHListeningInnerCircleLayer circle](self, "circle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFillColor:", v10);

  -[SHListeningInnerCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningInnerCircleLayer addSublayer:](self, "addSublayer:", v12);

  -[SHListeningInnerCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningInnerCircleLayer circle](self, "circle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSublayer:", v13);

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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CGPath *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SHListeningInnerCircleLayer;
  -[SHListeningInnerCircleLayer layoutSublayers](&v29, sel_layoutSublayers);
  -[SHListeningInnerCircleLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SHListeningInnerCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SHListeningInnerCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SHListeningInnerCircleLayer circle](self, "circle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  -[SHListeningInnerCircleLayer circle](self, "circle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v23 = -[SHListeningInnerCircleLayer circlePathForRect:](self, "circlePathForRect:");

  -[SHListeningInnerCircleLayer circle](self, "circle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPath:", v23);

  -[SHPaletteLayer palette](self, "palette");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "listeningCircleColor");
  -[SHListeningInnerCircleLayer circle](self, "circle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFillColor:", v26);

  -[SHListeningInnerCircleLayer circle](self, "circle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNeedsDisplay");

}

- (CGPath)circlePathForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v9);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CALayer)circleContainerLayer
{
  return self->_circleContainerLayer;
}

- (void)setCircleContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleContainerLayer, a3);
}

- (CAShapeLayer)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
  objc_storeStrong((id *)&self->_circle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_circleContainerLayer, 0);
}

@end
