@implementation PXMemoriesDebugFeature

- (PXMemoriesDebugFeature)initWithLocalizedTitle:(id)a3 type:(unint64_t)a4
{
  id v7;
  PXMemoriesDebugFeature *v8;
  PXMemoriesDebugFeature *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *featureLocalizedTitle;
  uint64_t v17;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXMemoriesDebugFeature;
  v8 = -[PXMemoriesDebugFeature init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    objc_storeStrong((id *)&v8->_localizedTitle, a3);
    v10 = objc_msgSend(v7, "length");
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PXMemoriesDebugFeature localizedTypeStringValue](v9, "localizedTypeStringValue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v10)
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v12, v7);
    else
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v12, v17);
    v14 = objc_claimAutoreleasedReturnValue();

    featureLocalizedTitle = v9->_featureLocalizedTitle;
    v9->_featureLocalizedTitle = (NSString *)v14;

  }
  return v9;
}

- (int64_t)featureKind
{
  return 1;
}

- (int64_t)featureGroupIndex
{
  return 0;
}

- (UIColor)featureTintColor
{
  UIColor *featureTintColor;
  UIColor *v4;
  UIColor *v5;

  featureTintColor = self->_featureTintColor;
  if (!featureTintColor)
  {
    objc_msgSend((id)objc_opt_class(), "_tintColorForFeatureType:", self->_type);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_featureTintColor;
    self->_featureTintColor = v4;

    featureTintColor = self->_featureTintColor;
  }
  return featureTintColor;
}

- (NSString)localizedTypeStringValue
{
  unint64_t type;

  type = self->_type;
  if (type > 5)
    return (NSString *)&stru_1E5149688;
  else
    return &off_1E5140DD8[type]->isa;
}

- (NSString)featureLocalizedTitle
{
  return self->_featureLocalizedTitle;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_featureTintColor, 0);
  objc_storeStrong((id *)&self->_featureLocalizedTitle, 0);
}

+ (id)_tintColorForFeatureType:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.591;
      v6 = 0.409;
      v4 = 1.0;
      goto LABEL_8;
    case 1uLL:
      v3 = (void *)MEMORY[0x1E0DC3658];
      v4 = 0.44;
      v5 = 0.683;
      v6 = 0.519;
      goto LABEL_8;
    case 2uLL:
      v3 = (void *)MEMORY[0x1E0DC3658];
      v4 = 0.56;
      v5 = 0.699;
      v6 = 0.771;
      goto LABEL_8;
    case 3uLL:
    case 4uLL:
      v3 = (void *)MEMORY[0x1E0DC3658];
      v4 = 0.685;
      v5 = 0.481;
      v6 = 1.0;
      goto LABEL_8;
    case 5uLL:
      v3 = (void *)MEMORY[0x1E0DC3658];
      v4 = 0.725;
      v5 = 0.737;
      v6 = 0.238;
LABEL_8:
      objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v5, v6, 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v7;
}

@end
