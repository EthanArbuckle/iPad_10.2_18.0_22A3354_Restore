@implementation SBDodgingModel

- (SBDodgingModel)initWithReferenceBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SBDodgingModel *v7;
  NSMutableArray *v8;
  NSMutableArray *identifiers;
  NSMutableDictionary *v10;
  NSMutableDictionary *centersForIdentifiers;
  NSMutableDictionary *v12;
  NSMutableDictionary *sizesForIdentifiers;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)SBDodgingModel;
  v7 = -[SBDodgingModel init](&v15, sel_init);
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    identifiers = v7->_identifiers;
    v7->_identifiers = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    centersForIdentifiers = v7->_centersForIdentifiers;
    v7->_centersForIdentifiers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sizesForIdentifiers = v7->_sizesForIdentifiers;
    v7->_sizesForIdentifiers = v12;

    v7->_referenceBounds.origin.x = x;
    v7->_referenceBounds.origin.y = y;
    v7->_referenceBounds.size.width = width;
    v7->_referenceBounds.size.height = height;
  }
  return v7;
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (CGPoint)centerForIdentifier:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[NSMutableDictionary objectForKey:](self->_centersForIdentifiers, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGPointValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)sizeForIdentifier:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[NSMutableDictionary objectForKey:](self->_sizesForIdentifiers, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)referenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceBounds.origin.x;
  y = self->_referenceBounds.origin.y;
  width = self->_referenceBounds.size.width;
  height = self->_referenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)modelByModifyingModelWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBDodgingModel mutableCopy](self, "mutableCopy");
  v4[2](v4, v5);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBMutableDodgingModel *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[SBDodgingModel initWithReferenceBounds:]([SBMutableDodgingModel alloc], "initWithReferenceBounds:", self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height);
  v5 = (void *)-[NSMutableArray mutableCopy](self->_identifiers, "mutableCopy");
  -[SBDodgingModel setIdentifiers:](v4, "setIdentifiers:", v5);

  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_centersForIdentifiers, "mutableCopy");
  -[SBDodgingModel setCentersForIdentifiers:](v4, "setCentersForIdentifiers:", v6);

  v7 = (void *)-[NSMutableDictionary mutableCopy](self->_sizesForIdentifiers, "mutableCopy");
  -[SBDodgingModel setSizesForIdentifiers:](v4, "setSizesForIdentifiers:", v7);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  NSStringFromCGRect(self->_referenceBounds);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_identifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[SBDodgingModel sizeForIdentifier:](self, "sizeForIdentifier:", v10);
        SBRectWithSize();
        -[SBDodgingModel centerForIdentifier:](self, "centerForIdentifier:", v10);
        UIRectCenteredAboutPoint();
        NSStringFromCGRect(v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n%@ frame:%@ inBounds:%@"), v10, v11, v4);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v15.receiver = self;
  v15.super_class = (Class)SBDodgingModel;
  -[SBDodgingModel description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%@"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSMutableDictionary)centersForIdentifiers
{
  return self->_centersForIdentifiers;
}

- (void)setCentersForIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_centersForIdentifiers, a3);
}

- (NSMutableDictionary)sizesForIdentifiers
{
  return self->_sizesForIdentifiers;
}

- (void)setSizesForIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sizesForIdentifiers, a3);
}

- (void)setReferenceBounds:(CGRect)a3
{
  self->_referenceBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizesForIdentifiers, 0);
  objc_storeStrong((id *)&self->_centersForIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
