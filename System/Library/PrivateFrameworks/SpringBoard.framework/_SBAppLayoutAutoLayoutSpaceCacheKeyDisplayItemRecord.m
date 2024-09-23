@implementation _SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord

+ (id)itemRecordForLayoutAttributes:(id)a3 size:(CGSize)a4 containerBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  void *v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRecordForLayoutAttributes:size:containerBounds:", v12, v10, v9, x, y, width, height);

  return v13;
}

- (id)_initWithRecordForLayoutAttributes:(id)a3 size:(CGSize)a4 containerBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  id v12;
  _SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *v13;
  _SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *v14;
  CGFloat v15;
  CGFloat v16;
  objc_super v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord;
  v13 = -[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_size.width = v10;
    v13->_size.height = v9;
    objc_msgSend(v12, "centerInBounds:", x, y, width, height);
    v14->_center.x = v15;
    v14->_center.y = v16;
    v14->_sizingPolicy = objc_msgSend(v12, "sizingPolicy");
    v14->_occlusionState = objc_msgSend(v12, "occlusionState");
    v14->_contentOrientation = objc_msgSend(v12, "contentOrientation");
    v14->_hash = -1;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  _SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *v4;
  _SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v4 = (_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_size.width == v5->_size.width && self->_size.height == v5->_size.height;
      v8 = v6
        && (self->_center.x == v5->_center.x ? (v7 = self->_center.y == v5->_center.y) : (v7 = 0),
            v7 && self->_sizingPolicy == v5->_sizingPolicy && self->_occlusionState == v5->_occlusionState)
        && self->_contentOrientation == v5->_contentOrientation;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t result;
  id v4;
  unint64_t v5;
  unint64_t v6;

  result = self->_hash;
  if (result == -1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D01788]);
    -[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord _appendToHashBuilder:](self, "_appendToHashBuilder:", v4);
    v5 = objc_msgSend(v4, "hash");
    v6 = -2;
    if (v5 < 0xFFFFFFFFFFFFFFFELL)
      v6 = v5;
    self->_hash = v6;

    return self->_hash;
  }
  return result;
}

- (void)_appendToHashBuilder:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = (id)objc_msgSend(v9, "appendCGSize:", self->_size.width, self->_size.height);
  v5 = (id)objc_msgSend(v9, "appendCGPoint:", self->_center.x, self->_center.y);
  v6 = (id)objc_msgSend(v9, "appendInteger:", self->_sizingPolicy);
  v7 = (id)objc_msgSend(v9, "appendInteger:", self->_occlusionState);
  v8 = (id)objc_msgSend(v9, "appendInteger:", self->_contentOrientation);

}

- (void)_appendToDescriptionBuilder:(id)a3
{
  double width;
  double height;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  width = self->_size.width;
  height = self->_size.height;
  v6 = a3;
  v7 = (id)objc_msgSend(v6, "appendSize:withName:", CFSTR("size"), width, height);
  v8 = (id)objc_msgSend(v6, "appendPoint:withName:", CFSTR("center"), self->_center.x, self->_center.y);
  NSStringFromDisplayItemSizingPolicy(self->_sizingPolicy);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v9, CFSTR("sizingPolicy"));

  SBDisplayItemLayoutAttributesOcclusionStateDescription(self->_occlusionState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v10, CFSTR("occlusionState"));

  BSInterfaceOrientationDescription();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v11, CFSTR("contentOrientation"));

}

- (id)description
{
  return -[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94___SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
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

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)sizingPolicy
{
  return self->_sizingPolicy;
}

- (int64_t)occlusionState
{
  return self->_occlusionState;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

@end
