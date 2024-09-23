@implementation QLAppearance

- (QLAppearance)initWithTopInset:(double)a3 bottomInset:(double)a4 presentationMode:(unint64_t)a5 peripheryInsets:(UIEdgeInsets)a6
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  QLAppearance *v13;
  QLAppearance *v14;
  QLAppearance *v15;
  objc_super v17;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v17.receiver = self;
  v17.super_class = (Class)QLAppearance;
  v13 = -[QLAppearance init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_topInset = a3;
    v13->_bottomInset = a4;
    v13->_presentationMode = a5;
    v13->_peripheryInsets.top = top;
    v13->_peripheryInsets.left = left;
    v13->_peripheryInsets.bottom = bottom;
    v13->_peripheryInsets.right = right;
    v15 = v13;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float topInset;
  double v5;
  double bottomInset;
  id v7;

  topInset = self->_topInset;
  v7 = a3;
  *(float *)&v5 = topInset;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("topInset"), v5);
  bottomInset = self->_bottomInset;
  *(float *)&bottomInset = bottomInset;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("bottomInset"), bottomInset);
  objc_msgSend(v7, "encodeInteger:forKey:", self->_presentationMode, CFSTR("presentationMode"));
  objc_msgSend(v7, "encodeUIEdgeInsets:forKey:", CFSTR("peripheryInsets"), self->_peripheryInsets.top, self->_peripheryInsets.left, self->_peripheryInsets.bottom, self->_peripheryInsets.right);

}

- (QLAppearance)initWithCoder:(id)a3
{
  id v4;
  QLAppearance *v5;
  float v6;
  float v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  QLAppearance *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLAppearance;
  v5 = -[QLAppearance init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("topInset"));
    v5->_topInset = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bottomInset"));
    v5->_bottomInset = v7;
    v5->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentationMode"));
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("peripheryInsets"));
    v5->_peripheryInsets.top = v8;
    v5->_peripheryInsets.left = v9;
    v5->_peripheryInsets.bottom = v10;
    v5->_peripheryInsets.right = v11;
    v12 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)QLAppearance;
  -[QLAppearance description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLAppearance topInset](self, "topInset");
  v6 = v5;
  -[QLAppearance bottomInset](self, "bottomInset");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - topInset: %f; bottomInset: %f; presentationMode: %lu"),
    v4,
    v6,
    v7,
    -[QLAppearance presentationMode](self, "presentationMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)topInset
{
  return self->_topInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (UIEdgeInsets)peripheryInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_peripheryInsets, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
