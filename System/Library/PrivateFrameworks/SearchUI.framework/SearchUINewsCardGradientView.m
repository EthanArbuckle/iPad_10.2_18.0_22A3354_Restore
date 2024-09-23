@implementation SearchUINewsCardGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SearchUINewsCardGradientView)init
{
  SearchUINewsCardGradientView *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SearchUINewsCardGradientView;
  v2 = -[SearchUINewsCardGradientView init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13[0] = objc_msgSend(v3, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13[1] = objc_msgSend(v5, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUINewsCardGradientView layer](v2, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColors:", v6);

    -[SearchUINewsCardGradientView layer](v2, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    objc_msgSend(v8, "setStartPoint:", 0.0, 0.5);

    if (!objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
      v9 = 1.0;
    -[SearchUINewsCardGradientView layer](v2, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEndPoint:", 0.0, v9);

  }
  return v2;
}

@end
