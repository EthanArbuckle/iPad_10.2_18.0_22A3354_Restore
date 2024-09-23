@implementation MFMessageScreenshotConfiguration

- (MFMessageScreenshotConfiguration)init
{
  char *v2;
  MFMessageScreenshotConfiguration *v3;
  __int128 v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMessageScreenshotConfiguration;
  v2 = -[MFMessageScreenshotConfiguration init](&v7, "init");
  v3 = (MFMessageScreenshotConfiguration *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 257;
    *(CGSize *)(v2 + 24) = CGSizeZero;
    v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)(v2 + 40) = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)(v2 + 56) = v4;
    v5 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setShowBanners:", -[MFMessageScreenshotConfiguration showBanners](self, "showBanners"));
  objc_msgSend(v4, "setShowSourceMailbox:", -[MFMessageScreenshotConfiguration showSourceMailbox](self, "showSourceMailbox"));
  -[MFMessageScreenshotConfiguration size](self, "size");
  objc_msgSend(v4, "setSize:");
  -[MFMessageScreenshotConfiguration margins](self, "margins");
  objc_msgSend(v4, "setMargins:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotConfiguration traitCollection](self, "traitCollection"));
  objc_msgSend(v4, "setTraitCollection:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotConfiguration traitCollection](self, "traitCollection"));
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("kMFCodingKeyTraitCollection"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MFMessageScreenshotConfiguration showBanners](self, "showBanners")));
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("kMFCodingKeyShowBanners"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MFMessageScreenshotConfiguration showSourceMailbox](self, "showSourceMailbox")));
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("kMFCodingKeyShowSourceMailbox"));

  -[MFMessageScreenshotConfiguration size](self, "size");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:"));
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("kMFCodingKeySize"));

  -[MFMessageScreenshotConfiguration margins](self, "margins");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithUIEdgeInsets:](NSValue, "valueWithUIEdgeInsets:"));
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("kMFCodingKeyMargins"));

}

- (MFMessageScreenshotConfiguration)initWithCoder:(id)a3
{
  id v4;
  MFMessageScreenshotConfiguration *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  id v23;
  uint64_t v24;
  UITraitCollection *traitCollection;

  v4 = a3;
  v5 = -[MFMessageScreenshotConfiguration init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("kMFCodingKeyShowSourceMailbox"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "BOOLValue");
    else
      v9 = 1;
    v5->_showSourceMailbox = v9;
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("kMFCodingKeyShowBanners"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11)
      v12 = objc_msgSend(v11, "BOOLValue");
    else
      v12 = 1;
    v5->_showBanners = v12;
    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue), CFSTR("kMFCodingKeySize"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v14, "CGSizeValue");
    v5->_size.width = v15;
    v5->_size.height = v16;

    v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue), CFSTR("kMFCodingKeyMargins"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v18, "UIEdgeInsetsValue");
    v5->_margins.top = v19;
    v5->_margins.left = v20;
    v5->_margins.bottom = v21;
    v5->_margins.right = v22;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(UITraitCollection), CFSTR("kMFCodingKeyTraitCollection"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v24;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)showSourceMailbox
{
  return self->_showSourceMailbox;
}

- (void)setShowSourceMailbox:(BOOL)a3
{
  self->_showSourceMailbox = a3;
}

- (BOOL)showBanners
{
  return self->_showBanners;
}

- (void)setShowBanners:(BOOL)a3
{
  self->_showBanners = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
