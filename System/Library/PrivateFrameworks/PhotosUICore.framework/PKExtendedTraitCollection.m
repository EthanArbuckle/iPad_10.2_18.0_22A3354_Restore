@implementation PKExtendedTraitCollection

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PKExtendedTraitCollection userInterfaceIdiom](self, "userInterfaceIdiom");
  v5 = -[PKExtendedTraitCollection layoutSizeClass](self, "layoutSizeClass");
  v6 = -[PKExtendedTraitCollection layoutSizeSubclass](self, "layoutSizeSubclass");
  -[PKExtendedTraitCollection displayScale](self, "displayScale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("userInterfaceIdiom %ld layoutSizeClass %ld layoutSizeSubclass %ld displayScale %f userInterfaceStyle %ld"), v4, v5, v6, v7, -[PKExtendedTraitCollection userInterfaceStyle](self, "userInterfaceStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[PKExtendedTraitCollection traitCollectionForMapKit](self, "traitCollectionForMapKit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR(" traitCollectionForMapKit: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v12);

  return v9;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (void)setLayoutSizeClass:(int64_t)a3
{
  self->_layoutSizeClass = a3;
}

- (int64_t)layoutSizeSubclass
{
  return self->_layoutSizeSubclass;
}

- (void)setLayoutSizeSubclass:(int64_t)a3
{
  self->_layoutSizeSubclass = a3;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (UITraitCollection)traitCollectionForMapKit
{
  return self->_traitCollectionForMapKit;
}

- (void)setTraitCollectionForMapKit:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollectionForMapKit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollectionForMapKit, 0);
}

@end
