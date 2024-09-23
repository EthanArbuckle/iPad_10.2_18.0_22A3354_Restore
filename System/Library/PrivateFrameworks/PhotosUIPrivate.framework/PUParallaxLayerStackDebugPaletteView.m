@implementation PUParallaxLayerStackDebugPaletteView

- (PUParallaxLayerStackDebugPaletteView)initWithColorPalette:(id)a3
{
  PIParallaxColorPalette *v4;
  PUParallaxLayerStackDebugPaletteView *v5;
  PIParallaxColorPalette *palette;
  objc_super v8;

  v4 = (PIParallaxColorPalette *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PUParallaxLayerStackDebugPaletteView;
  v5 = -[PUParallaxLayerStackDebugPaletteView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  palette = v5->_palette;
  v5->_palette = v4;

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  double x;
  double y;
  double width;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PUParallaxLayerStackDebugPaletteView subviews](self, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v5);
  }

  -[PUParallaxLayerStackDebugPaletteView bounds](self, "bounds");
  v38 = CGRectInset(v37, 30.0, 30.0);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v38.origin.x, v38.origin.y, v38.size.width, 50.0);
  objc_msgSend(v11, "setText:", CFSTR("Primary Colors"));
  -[PUParallaxLayerStackDebugPaletteView addSubview:](self, "addSubview:", v11);
  v12 = y + 50.0 + 5.0;
  -[PUParallaxLayerStackDebugPaletteView palette](self, "palette");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackDebugPaletteView _layoutPalette:origin:cellsPerRow:cellWidth:callback:](self, "_layoutPalette:origin:cellsPerRow:cellWidth:callback:", v13, 12, &__block_literal_global_54225, x, v12, width / 12.0);

  -[PUParallaxLayerStackDebugPaletteView palette](self, "palette");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "secondaryColors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[PUParallaxLayerStackDebugPaletteView palette](self, "palette");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "primaryColors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") / 0xCuLL;

    -[PUParallaxLayerStackDebugPaletteView palette](self, "palette");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "primaryColors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = __ROR8__(0xAAAAAAAAAAAAAAABLL * objc_msgSend(v21, "count"), 2);

    if (v22 <= 0x1555555555555555)
      v23 = v19;
    else
      v23 = v19 + 1;
    v24 = width / 12.0 * (double)v23 + 10.0;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, v12 + v24, width, 50.0);
    objc_msgSend(v25, "setText:", CFSTR("Secondary Colors"));
    -[PUParallaxLayerStackDebugPaletteView addSubview:](self, "addSubview:", v25);
    v26 = v12 + v24 + 50.0 + 5.0;
    -[PUParallaxLayerStackDebugPaletteView palette](self, "palette");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugPaletteView _layoutPalette:origin:cellsPerRow:cellWidth:callback:](self, "_layoutPalette:origin:cellsPerRow:cellWidth:callback:", v27, 12, &__block_literal_global_74, x, v26, width / 12.0);

    v28 = v24 + v26;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, v28, width, 50.0);
    objc_msgSend(v29, "setText:", CFSTR("Blended Colors"));
    -[PUParallaxLayerStackDebugPaletteView addSubview:](self, "addSubview:", v29);
    -[PUParallaxLayerStackDebugPaletteView palette](self, "palette");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackDebugPaletteView _layoutPalette:origin:cellsPerRow:cellWidth:callback:](self, "_layoutPalette:origin:cellsPerRow:cellWidth:callback:", v30, 12, &__block_literal_global_77, x, v28 + 50.0 + 5.0, width / 12.0);

  }
}

- (void)_layoutPalette:(id)a3 origin:(CGPoint)a4 cellsPerRow:(int)a5 cellWidth:(double)a6 callback:(id)a7
{
  double y;
  double x;
  void (**v13)(id, void *, double, double, double, double);
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;

  y = a4.y;
  x = a4.x;
  v22 = a3;
  v13 = (void (**)(id, void *, double, double, double, double))a7;
  objc_msgSend(v22, "primaryColors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    v17 = a5;
    do
    {
      objc_msgSend(v22, "suggestionAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v18, x + (double)(v16 % v17) * a6, y + (double)(v16 / v17) * a6, a6 + -2.0, a6 + -2.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUParallaxLayerStackDebugPaletteView addSubview:](self, "addSubview:", v19);

      ++v16;
      objc_msgSend(v22, "primaryColors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v16 < v21);
  }

}

- (PIParallaxColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
}

id __54__PUParallaxLayerStackDebugPaletteView_layoutSubviews__block_invoke_3(double a1, double a2, double a3, double a4, uint64_t a5, void *a6)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0D7B4B8];
  v11 = a6;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFrame:", a1, a2, a3, a4);
  v13 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v11, "primaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v16 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v11, "secondaryColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "colorWithCGColor:", objc_msgSend(v17, "CGColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setColors:", v19);
  return v12;
}

id __54__PUParallaxLayerStackDebugPaletteView_layoutSubviews__block_invoke_2(double a1, double a2, double a3, double a4, uint64_t a5, void *a6)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x1E0DC3F10];
  v11 = a6;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFrame:", a1, a2, a3, a4);
  v13 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v11, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v15);

  return v12;
}

id __54__PUParallaxLayerStackDebugPaletteView_layoutSubviews__block_invoke(double a1, double a2, double a3, double a4, uint64_t a5, void *a6)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x1E0DC3F10];
  v11 = a6;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFrame:", a1, a2, a3, a4);
  v13 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v11, "primaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "colorWithCGColor:", objc_msgSend(v14, "CGColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v15);

  return v12;
}

@end
