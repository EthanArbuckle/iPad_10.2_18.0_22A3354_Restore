@implementation UICollectionViewCompositionalLayoutConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundarySupplementaryItems, 0);
}

- (UICollectionViewScrollDirection)scrollDirection
{
  return self->_scrollDirection;
}

+ (id)defaultConfiguration
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithScrollDirection:interSectionSpacing:boundarySupplememtaryItems:contentInsetsReference:", 0, MEMORY[0x1E0C9AA60], 2, 0.0);
}

- (unint64_t)differencesFromConfiguration:(id)a3
{
  UICollectionViewScrollDirection v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  UIContentInsetsReference v15;
  void *v18;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewCompositionalLayout.m"), 2239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[UICollectionViewCompositionalLayoutConfiguration scrollDirection](self, "scrollDirection");
  v6 = v5 != objc_msgSend(a3, "scrollDirection");
  -[UICollectionViewCompositionalLayoutConfiguration interSectionSpacing](self, "interSectionSpacing");
  v8 = v7;
  objc_msgSend(a3, "interSectionSpacing");
  if (vabdd_f64(v8, v9) <= 0.001)
    v10 = 2 * v6;
  else
    v10 = (2 * v6) | 4;
  -[UICollectionViewCompositionalLayoutConfiguration boundarySupplementaryItems](self, "boundarySupplementaryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "boundarySupplementaryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToArray:", v12);

  if (v13)
    v14 = v10;
  else
    v14 = v10 | 8;
  v15 = -[UICollectionViewCompositionalLayoutConfiguration contentInsetsReference](self, "contentInsetsReference");
  if (v15 == objc_msgSend(a3, "contentInsetsReference"))
    return v14;
  else
    return v14 | 0x10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  UICollectionViewScrollDirection v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[UICollectionViewCompositionalLayoutConfiguration scrollDirection](self, "scrollDirection");
  -[UICollectionViewCompositionalLayoutConfiguration interSectionSpacing](self, "interSectionSpacing");
  v7 = v6;
  -[UICollectionViewCompositionalLayoutConfiguration boundarySupplementaryItems](self, "boundarySupplementaryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithScrollDirection:interSectionSpacing:boundarySupplememtaryItems:contentInsetsReference:", v5, v8, -[UICollectionViewCompositionalLayoutConfiguration contentInsetsReference](self, "contentInsetsReference"), v7);

  return v9;
}

- (CGFloat)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (NSArray)boundarySupplementaryItems
{
  return self->_boundarySupplementaryItems;
}

- (UICollectionViewCompositionalLayoutConfiguration)initWithScrollDirection:(int64_t)a3 interSectionSpacing:(double)a4 boundarySupplememtaryItems:(id)a5 contentInsetsReference:(int64_t)a6
{
  UICollectionViewCompositionalLayoutConfiguration *v10;
  UICollectionViewCompositionalLayoutConfiguration *v11;
  uint64_t v12;
  NSArray *boundarySupplementaryItems;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayoutConfiguration;
  v10 = -[UICollectionViewCompositionalLayoutConfiguration init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_contentInsetsReference = a6;
    v10->_scrollDirection = a3;
    v10->_interSectionSpacing = a4;
    if (a5)
    {
      v12 = objc_msgSend(a5, "copy");
      boundarySupplementaryItems = v11->_boundarySupplementaryItems;
      v11->_boundarySupplementaryItems = (NSArray *)v12;
    }
    else
    {
      boundarySupplementaryItems = v10->_boundarySupplementaryItems;
      v10->_boundarySupplementaryItems = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return v11;
}

- (UIContentInsetsReference)contentInsetsReference
{
  return self->_contentInsetsReference;
}

- (void)setBoundarySupplementaryItems:(NSArray *)boundarySupplementaryItems
{
  objc_setProperty_nonatomic_copy(self, a2, boundarySupplementaryItems, 24);
}

- (void)setContentInsetsReference:(UIContentInsetsReference)contentInsetsReference
{
  self->_contentInsetsReference = contentInsetsReference;
}

- (UICollectionViewCompositionalLayoutConfiguration)init
{
  return -[UICollectionViewCompositionalLayoutConfiguration initWithScrollDirection:interSectionSpacing:boundarySupplememtaryItems:contentInsetsReference:](self, "initWithScrollDirection:interSectionSpacing:boundarySupplememtaryItems:contentInsetsReference:", 0, MEMORY[0x1E0C9AA60], 2, 0.0);
}

- (void)setInterSectionSpacing:(CGFloat)interSectionSpacing
{
  self->_interSectionSpacing = interSectionSpacing;
}

- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
  self->_scrollDirection = scrollDirection;
}

@end
