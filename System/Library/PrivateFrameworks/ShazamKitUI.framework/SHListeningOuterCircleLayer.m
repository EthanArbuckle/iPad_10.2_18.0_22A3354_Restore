@implementation SHListeningOuterCircleLayer

- (void)setup
{
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  -[SHListeningOuterCircleLayer setContentsScale:](self, "setContentsScale:");
  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHListeningOuterCircleLayer setCircleContainerLayer:](self, "setCircleContainerLayer:", v3);

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  v5 = v4;
  -[SHListeningOuterCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentsScale:", v5);

  v7 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[SHListeningOuterCircleLayer setCircleLayer:](self, "setCircleLayer:", v7);

  +[SHPalette contentsScale](SHPalette, "contentsScale");
  v9 = v8;
  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsScale:", v9);

  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderWidth:", 4.0);

  -[SHPaletteLayer palette](self, "palette");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "listeningCircleColor");
  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderColor:", v13);

  -[SHListeningOuterCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHListeningOuterCircleLayer addSublayer:](self, "addSublayer:", v15);

  -[SHListeningOuterCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v16);

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
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SHListeningOuterCircleLayer;
  -[SHListeningOuterCircleLayer layoutSublayers](&v29, sel_layoutSublayers);
  -[SHListeningOuterCircleLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SHListeningOuterCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SHListeningOuterCircleLayer circleContainerLayer](self, "circleContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v23 * 0.5;
  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerRadius:", v24);

  -[SHPaletteLayer palette](self, "palette");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "listeningCircleColor");
  -[SHListeningOuterCircleLayer circleLayer](self, "circleLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBorderColor:", v27);

}

- (CALayer)circleContainerLayer
{
  return self->_circleContainerLayer;
}

- (void)setCircleContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleContainerLayer, a3);
}

- (CALayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_circleContainerLayer, 0);
}

@end
