@implementation MTCollectionViewFlowLayoutAttributes

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTCollectionViewFlowLayoutAttributes;
  v3 = -[MTCollectionViewFlowLayoutAttributes hash](&v7, "hash");
  v4 = self->_floating - v3 + 32 * v3;
  v5 = self->_open - v4 + 32 * v4;
  return self->_showsSeperator - v5 + 32 * v5 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  v5 = objc_opt_class(MTCollectionViewFlowLayoutAttributes);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v24.receiver = self,
        v24.super_class = (Class)MTCollectionViewFlowLayoutAttributes,
        -[MTCollectionViewFlowLayoutAttributes isEqual:](&v24, "isEqual:", v4))
    && (v6 = objc_msgSend(v4, "isFloating"),
        v6 == -[MTCollectionViewFlowLayoutAttributes isFloating](self, "isFloating"))
    && (v7 = objc_msgSend(v4, "isPartiallyOffTheTop"),
        v7 == -[MTCollectionViewFlowLayoutAttributes isPartiallyOffTheTop](self, "isPartiallyOffTheTop"))
    && (v8 = objc_msgSend(v4, "isOpen"),
        v8 == -[MTCollectionViewFlowLayoutAttributes isOpen](self, "isOpen"))
    && (v9 = objc_msgSend(v4, "showsSeperator"),
        v9 == -[MTCollectionViewFlowLayoutAttributes showsSeperator](self, "showsSeperator")))
  {
    objc_msgSend(v4, "naturalRect");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[MTCollectionViewFlowLayoutAttributes naturalRect](self, "naturalRect");
    v26.origin.x = v20;
    v26.origin.y = v21;
    v26.size.width = v22;
    v26.size.height = v23;
    v25.origin.x = v13;
    v25.origin.y = v15;
    v25.size.width = v17;
    v25.size.height = v19;
    v10 = CGRectEqualToRect(v25, v26);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTCollectionViewFlowLayoutAttributes;
  v4 = -[MTCollectionViewFlowLayoutAttributes copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setFloating:", -[MTCollectionViewFlowLayoutAttributes isFloating](self, "isFloating"));
  objc_msgSend(v4, "setOpen:", -[MTCollectionViewFlowLayoutAttributes isOpen](self, "isOpen"));
  objc_msgSend(v4, "setShowsSeperator:", -[MTCollectionViewFlowLayoutAttributes showsSeperator](self, "showsSeperator"));
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTCollectionViewFlowLayoutAttributes;
  v3 = -[MTCollectionViewFlowLayoutAttributes description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" Floating %i, Open %i, Shows Seperator %i"), -[MTCollectionViewFlowLayoutAttributes isFloating](self, "isFloating"), -[MTCollectionViewFlowLayoutAttributes isOpen](self, "isOpen"), -[MTCollectionViewFlowLayoutAttributes showsSeperator](self, "showsSeperator")));

  return v5;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (BOOL)isPartiallyOffTheTop
{
  return self->_partiallyOffTheTop;
}

- (void)setPartiallyOffTheTop:(BOOL)a3
{
  self->_partiallyOffTheTop = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)showsSeperator
{
  return self->_showsSeperator;
}

- (void)setShowsSeperator:(BOOL)a3
{
  self->_showsSeperator = a3;
}

- (CGRect)naturalRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_naturalRect.origin.x;
  y = self->_naturalRect.origin.y;
  width = self->_naturalRect.size.width;
  height = self->_naturalRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNaturalRect:(CGRect)a3
{
  self->_naturalRect = a3;
}

@end
