@implementation UIImage(IC)

+ (id)ic_systemImageNamed:()IC scale:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DC3888];
  v7 = a3;
  objc_msgSend(v6, "configurationWithScale:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ic_systemImageNamed:()IC pointSize:weight:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0DC3888];
  v8 = a4;
  objc_msgSend(v7, "configurationWithPointSize:weight:", a5, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)ic_systemImageNamed:()IC pointSize:
{
  return objc_msgSend(a1, "ic_systemImageNamed:pointSize:weight:", a3, 4);
}

+ (uint64_t)ic_largeSystemImageNamed:()IC
{
  return objc_msgSend(a1, "ic_systemImageNamed:scale:", a3, 3);
}

+ (id)ic_applicationIconImageWithSize:()IC
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D3A820], "applicationIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "ic_scale");
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a1, a2, v5);
  v8 = (id)objc_msgSend(v4, "prepareImageForDescriptor:", v7);
  objc_msgSend(v4, "imageForDescriptor:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", objc_msgSend(v9, "CGImage"), 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)ic_smallSystemImageNamed:()IC
{
  return objc_msgSend(a1, "ic_systemImageNamed:scale:", a3, 1);
}

+ (id)ic_systemImageNamed:()IC textStyle:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DC3888];
  v7 = a3;
  objc_msgSend(v6, "configurationWithTextStyle:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ic_systemImageNamed:()IC textStyle:scale:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0DC3888];
  v9 = a3;
  objc_msgSend(v8, "configurationWithTextStyle:scale:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ic_systemImageNamed:()IC textStyle:scale:maxContentSizeCategory:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "symbolImageConfigurationWithTextStyle:scale:maxContentSizeCategory:", v11, a5, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)ic_systemImageNamed:()IC fromFont:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DC3888];
  v7 = a3;
  objc_msgSend(v6, "configurationWithFont:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ic_systemImageNamed:()IC fromFont:scale:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0DC3888];
  v9 = a3;
  objc_msgSend(v8, "configurationWithFont:scale:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNamed:withConfiguration:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ic_scaledHierarchicalSystemImageNamed:()IC scale:colors:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0DC3888];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "configurationWithScale:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "_configurationWithHierarchicalColors:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0DC3888];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "configurationWithScale:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "_configurationWithHierarchicalColors:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "configurationByApplyingConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:fontTextStyle:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = (void *)MEMORY[0x1E0DC1350];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "preferredFontForTextStyle:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "_configurationWithHierarchicalColors:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "configurationByApplyingConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationByApplyingConfiguration:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (uint64_t)ic_largeScaleHierarchicalSystemImageNamed:()IC colors:fontTextStyle:maxContentSizeCategory:
{
  return objc_msgSend(a1, "ic_hierarchicalSystemImageNamed:colors:fontTextStyle:scale:maxContentSizeCategory:", a3, a4, a5, 3, a6);
}

+ (id)ic_hierarchicalSystemImageNamed:()IC colors:fontTextStyle:scale:maxContentSizeCategory:
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = (void *)MEMORY[0x1E0DC3888];
  v12 = a7;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v11, "_configurationWithHierarchicalColors:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "symbolImageConfigurationWithTextStyle:scale:maxContentSizeCategory:", v13, a6, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "configurationByApplyingConfiguration:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)ic_hierarchicalNonSystemImageNamed:()IC colors:fontTextStyle:scale:maxContentSizeCategory:
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v11 = (void *)MEMORY[0x1E0DC3888];
  v12 = a7;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v11, "_configurationWithHierarchicalColors:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "symbolImageConfigurationWithTextStyle:scale:maxContentSizeCategory:", v13, a6, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "configurationByApplyingConfiguration:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageNamed:inBundle:withConfiguration:", v14, v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (uint64_t)ic_makeCircularImageWithColor:()IC diameter:
{
  return objc_msgSend(a1, "ic_makeCircularImageWithColor:diameter:borderColor:borderWidth:", a3, 0, a4, 0.0);
}

+ (id)ic_makeCircularImageWithColor:()IC diameter:borderColor:borderWidth:
{
  id v9;
  id v10;
  double y;
  double x;
  double width;
  double height;
  void *v15;
  void *v16;
  void *v17;
  CGSize v19;
  CGRect v20;
  CGRect v21;

  v9 = a6;
  v10 = a5;
  y = 0.0;
  v19.width = a1;
  v19.height = a1;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  if (v9 && a2 > 0.0)
  {
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = a1;
    v20.size.height = a1;
    v21 = CGRectInset(v20, a2, a2);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, a1, a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFill");
    objc_msgSend(v15, "fill");

    a1 = height;
  }
  else
  {
    width = a1;
    x = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill");

  objc_msgSend(v16, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

- (id)ic_imageWithFont:()IC
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_imageWithFont:()IC cappedToSize:
{
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(v6, "pointSize");
  if (v7 > a2)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a2);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ic_imageWithScale:()IC
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_imageWithFont:()IC scale:
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_imageWithTextStyle:()IC
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_imageWithTextStyle:()IC scale:
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageWithConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)symbolImageConfigurationWithTextStyle:()IC scale:maxContentSizeCategory:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0DC1350];
  v8 = a3;
  objc_msgSend(v7, "ic_preferredFontForTextStyle:maxContentSizeCategory:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 4, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "configurationByApplyingConfiguration:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
