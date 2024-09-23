@implementation PUFilmStripViewIndicatorInfo

- (PUFilmStripViewIndicatorInfo)initWithLocation:(double)a3 preferredColor:(id)a4
{
  id v7;
  PUFilmStripViewIndicatorInfo *v8;
  PUFilmStripViewIndicatorInfo *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUFilmStripViewIndicatorInfo;
  v8 = -[PUFilmStripViewIndicatorInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_normalizedLocation = a3;
    objc_storeStrong((id *)&v8->_preferredColor, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double normalizedLocation;
  double v6;
  UIColor *preferredColor;
  UIColor *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUFilmStripViewIndicatorInfo;
  if (-[PUFilmStripViewIndicatorInfo isEqual:](&v11, sel_isEqual_, v4)
    && (normalizedLocation = self->_normalizedLocation, objc_msgSend(v4, "normalizedLocation"), normalizedLocation == v6))
  {
    preferredColor = self->_preferredColor;
    objc_msgSend(v4, "preferredColor");
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    if (preferredColor == v8)
      v9 = 1;
    else
      v9 = -[UIColor isEqual:](preferredColor, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUFilmStripViewIndicatorInfo;
  v3 = -[PUFilmStripViewIndicatorInfo hash](&v6, sel_hash);
  v4 = (unint64_t)(self->_normalizedLocation * 1000.0);
  return (unint64_t)v3 + -[UIColor hash](self->_preferredColor, "hash") + v4;
}

- (double)normalizedLocation
{
  return self->_normalizedLocation;
}

- (UIColor)preferredColor
{
  return self->_preferredColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredColor, 0);
}

@end
