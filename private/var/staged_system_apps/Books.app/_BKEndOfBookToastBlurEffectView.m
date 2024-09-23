@implementation _BKEndOfBookToastBlurEffectView

- (_BKEndOfBookToastBlurEffectView)init
{
  return -[_BKEndOfBookToastBlurEffectView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (_BKEndOfBookToastBlurEffectView)initWithFrame:(CGRect)a3
{
  _BKEndOfBookToastBlurEffectView *v3;
  _BKEndOfBookToastBlurEffectView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v11.receiver = self;
  v11.super_class = (Class)_BKEndOfBookToastBlurEffectView;
  v3 = -[_BKEndOfBookToastBlurEffectView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_BKEndOfBookToastBlurEffectView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[_BKEndOfBookToastBlurEffectView setOpaque:](v4, "setOpaque:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookToastBlurEffectView backdropLayer](v4, "backdropLayer"));
    objc_msgSend(v5, "setEnabled:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorSaturate));
    objc_msgSend(v6, "setValue:forKey:", &off_10092F6F8, CFSTR("inputAmount"));
    objc_msgSend(v6, "setName:", CFSTR("colorSaturate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterGaussianBlur));
    objc_msgSend(v7, "setValue:forKey:", &off_10092EEC8, CFSTR("inputRadius"));
    objc_msgSend(v7, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("inputHardEdges"));
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    v12[0] = v6;
    v12[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookToastBlurEffectView layer](v4, "layer"));
    objc_msgSend(v9, "setFilters:", v8);

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(CABackdropLayer);
}

@end
