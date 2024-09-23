@implementation SearchUIGradientMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SearchUIGradientMaskView)init
{
  SearchUIGradientMaskView *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SearchUIGradientMaskView;
  v2 = -[SearchUIGradientMaskView init](&v17, sel_init);
  if (v2)
  {
    if ((objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18[0] = objc_msgSend(v3, "CGColor");
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18[1] = objc_msgSend(v4, "CGColor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIGradientMaskView layer](v2, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setColors:", v5);

      -[SearchUIGradientMaskView layer](v2, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStartPoint:", 0.9, 0.5);

      -[SearchUIGradientMaskView layer](v2, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 1.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19[0] = objc_msgSend(v11, "CGColor");
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19[1] = objc_msgSend(v12, "CGColor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIGradientMaskView layer](v2, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setColors:", v13);

      -[SearchUIGradientMaskView layer](v2, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setStartPoint:", 0.0, 0.5);

      -[SearchUIGradientMaskView layer](v2, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0.1;
    }
    objc_msgSend(v8, "setEndPoint:", v10, 0.5);

  }
  return v2;
}

@end
