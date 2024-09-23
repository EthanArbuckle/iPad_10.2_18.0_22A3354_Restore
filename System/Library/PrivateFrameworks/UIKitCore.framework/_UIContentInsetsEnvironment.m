@implementation _UIContentInsetsEnvironment

- (NSDirectionalEdgeInsets)layoutMarginsInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_layoutMarginsInsets.top;
  leading = self->_layoutMarginsInsets.leading;
  bottom = self->_layoutMarginsInsets.bottom;
  trailing = self->_layoutMarginsInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalEdgeInsets)safeAreaInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_safeAreaInsets.top;
  leading = self->_safeAreaInsets.leading;
  bottom = self->_safeAreaInsets.bottom;
  trailing = self->_safeAreaInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalEdgeInsets)effectiveInsets
{
  const NSDirectionalEdgeInsets *v2;
  CGFloat *p_leading;
  CGFloat *p_trailing;
  CGFloat *p_bottom;
  int64_t insetReference;
  NSDirectionalEdgeInsets *p_readableContentInsets;
  CGFloat *v8;
  CGFloat *v9;
  CGFloat *v10;
  NSDirectionalEdgeInsets *p_layoutMarginsInsets;
  CGFloat *v12;
  CGFloat *v13;
  CGFloat *v14;
  NSDirectionalEdgeInsets *p_safeAreaInsets;
  CGFloat *v16;
  CGFloat *v17;
  CGFloat *v18;
  double top;
  double v20;
  double v21;
  double v22;
  NSDirectionalEdgeInsets result;

  v2 = &NSDirectionalEdgeInsetsZero;
  p_leading = &NSDirectionalEdgeInsetsZero.leading;
  p_trailing = &NSDirectionalEdgeInsetsZero.trailing;
  p_bottom = &NSDirectionalEdgeInsetsZero.bottom;
  insetReference = self->_insetReference;
  p_readableContentInsets = &self->_readableContentInsets;
  v8 = &self->_readableContentInsets.leading;
  v9 = &self->_readableContentInsets.bottom;
  v10 = &self->_readableContentInsets.trailing;
  p_layoutMarginsInsets = &self->_layoutMarginsInsets;
  v12 = &self->_layoutMarginsInsets.leading;
  v13 = &self->_layoutMarginsInsets.bottom;
  v14 = &self->_layoutMarginsInsets.trailing;
  p_safeAreaInsets = &self->_safeAreaInsets;
  v16 = &self->_safeAreaInsets.leading;
  v17 = &self->_safeAreaInsets.bottom;
  v18 = &self->_safeAreaInsets.trailing;
  if (insetReference == 2)
  {
    p_bottom = v17;
    p_trailing = v18;
    p_leading = v16;
    v2 = p_safeAreaInsets;
  }
  if (insetReference == 3)
  {
    p_bottom = v13;
    p_trailing = v14;
    p_leading = v12;
    v2 = p_layoutMarginsInsets;
  }
  if (insetReference == 4)
  {
    p_bottom = v9;
    p_trailing = v10;
    p_leading = v8;
    v2 = p_readableContentInsets;
  }
  top = v2->top;
  v20 = *p_leading;
  v21 = *p_trailing;
  v22 = *p_bottom;
  result.trailing = v21;
  result.bottom = v22;
  result.leading = v20;
  result.top = top;
  return result;
}

+ (id)nullEnvironment
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___UIContentInsetsEnvironment_nullEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7CF30 != -1)
    dispatch_once(&qword_1ECD7CF30, block);
  return (id)qword_1ECD7CF38;
}

+ (id)insetEnvironmentFromParentEnvironment:(id)a3 insetReference:(int64_t)a4
{
  int64_t v4;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v33;
  double v34;
  double v35;
  double v36;

  v4 = a4;
  if (!a4)
  {
    v7 = objc_msgSend(a3, "insetReference");
    if (v7 <= 1)
      v4 = 1;
    else
      v4 = v7;
  }
  objc_msgSend(a3, "safeAreaInsets");
  v35 = v9;
  v36 = v8;
  v33 = v11;
  v34 = v10;
  objc_msgSend(a3, "layoutMarginsInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(a3, "readableContentInsets");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(a3, "scrollAccessoryInsets");
  return (id)objc_msgSend(a1, "insetEnvironmentForInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", v4, v36, v35, v34, v33, v13, v15, v17, v19, v21, v23, v25, v27, v28, v29, v30, v31);
}

+ (id)insetEnvironmentForInsetReference:(double)a3 safeAreaInsets:(double)a4 layoutMarginsInsets:(double)a5 readableContentInsets:(double)a6 scrollAccessoryInsets:(double)a7
{
  return (id)objc_msgSend([a1 alloc], "initWithInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", a11, a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19, a20, a21, a22);
}

- (double)initWithInsetReference:(double)a3 safeAreaInsets:(double)a4 layoutMarginsInsets:(double)a5 readableContentInsets:(double)a6 scrollAccessoryInsets:(double)a7
{
  double *result;
  objc_super v34;

  v34.receiver = a1;
  v34.super_class = (Class)_UIContentInsetsEnvironment;
  result = (double *)objc_msgSendSuper2(&v34, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a11;
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((_QWORD *)result + 10) = a17;
    *((_QWORD *)result + 11) = a18;
    *((_QWORD *)result + 12) = a19;
    *((_QWORD *)result + 13) = a20;
    *((_QWORD *)result + 14) = a21;
    *((_QWORD *)result + 15) = a22;
    *((_QWORD *)result + 16) = a23;
    *((_QWORD *)result + 17) = a24;
  }
  return result;
}

- (NSDirectionalEdgeInsets)scrollAccessoryInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_scrollAccessoryInsets.top;
  leading = self->_scrollAccessoryInsets.leading;
  bottom = self->_scrollAccessoryInsets.bottom;
  trailing = self->_scrollAccessoryInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalEdgeInsets)readableContentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_readableContentInsets.top;
  leading = self->_readableContentInsets.leading;
  bottom = self->_readableContentInsets.bottom;
  trailing = self->_readableContentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (id)layoutContainerForContainerSize:(CGSize)a3 layoutAxis:(unint64_t)a4
{
  double height;
  double width;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  height = a3.height;
  width = a3.width;
  v8 = -[_UIContentInsetsEnvironment insetReference](self, "insetReference");
  v12 = _UIDirectionalEdgesForContentInsetEnvironment(self, v8, a4, v9, v10, v11);
  return -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], self, width, height, v12, v13, v14, v15);
}

- (int64_t)insetReference
{
  return self->_insetReference;
}

+ (id)insetEnvironmentForScrollView:(id)a3 insetReference:(int64_t)a4
{
  void *v5;

  objc_msgSend(a1, "insetEnvironmentForView:insetReference:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "_directionalAccessoryEdgeInsets");
  objc_msgSend(v5, "setScrollAccessoryInsets:");
  return v5;
}

- (void)setScrollAccessoryInsets:(NSDirectionalEdgeInsets)a3
{
  self->_scrollAccessoryInsets = a3;
}

+ (id)insetEnvironmentForView:(id)a3 insetReference:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend(a3, "safeAreaInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (a3)
  {
    v15 = objc_msgSend(a3, "effectiveUserInterfaceLayoutDirection");
    if (v15 == 1)
      v16 = v10;
    else
      v16 = v14;
    if (v15 == 1)
      v10 = v14;
    v14 = v16;
  }
  objc_msgSend(a3, "directionalLayoutMargins");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = -[UIView _directionalReadableContentInsets](a3);
  return (id)objc_msgSend(a1, "insetEnvironmentForInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", a4, v8, v10, v12, v14, v18, v20, v22, v24, *(_QWORD *)&v25, v26, v27, v28, 0, 0, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  double v55;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[_UIContentInsetsEnvironment insetReference](self, "insetReference"),
        v5 == objc_msgSend(v4, "insetReference")))
  {
    -[_UIContentInsetsEnvironment safeAreaInsets](self, "safeAreaInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "safeAreaInsets");
    v17 = 0;
    if (v9 == v18 && v7 == v14 && v13 == v16 && v11 == v15)
    {
      -[_UIContentInsetsEnvironment layoutMarginsInsets](self, "layoutMarginsInsets");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v4, "layoutMarginsInsets");
      v17 = 0;
      if (v22 == v30 && v20 == v27 && v26 == v29 && v24 == v28)
      {
        -[_UIContentInsetsEnvironment readableContentInsets](self, "readableContentInsets");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;
        objc_msgSend(v4, "readableContentInsets");
        v17 = 0;
        if (v34 == v42 && v32 == v39 && v38 == v41 && v36 == v40)
        {
          -[_UIContentInsetsEnvironment scrollAccessoryInsets](self, "scrollAccessoryInsets");
          v44 = v43;
          v46 = v45;
          v48 = v47;
          v50 = v49;
          objc_msgSend(v4, "scrollAccessoryInsets");
          v54 = v46 == v53;
          if (v44 != v55)
            v54 = 0;
          if (v50 != v52)
            v54 = 0;
          v17 = v48 == v51 && v54;
        }
      }
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)layoutContainerForInsetReference:(int64_t)a3 containerSize:(CGSize)a4 layoutAxis:(unint64_t)a5
{
  double v5;
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  double v12;

  height = a4.height;
  width = a4.width;
  v9 = _UIDirectionalEdgesForContentInsetEnvironment(self, a3, a5, a4.width, a4.height, v5);
  return -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], self, width, height, v9, v10, v11, v12);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t insetReference;
  __CFString *v7;
  void *v8;
  void *v9;
  NSDirectionalEdgeInsets v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  insetReference = self->_insetReference;
  if (insetReference >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown value: %ld)"), self->_insetReference);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E16B8E20[insetReference];
  }
  -[_UIContentInsetsEnvironment effectiveInsets](self, "effectiveInsets");
  NSStringFromDirectionalEdgeInsets(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: insetReference=%@; insets=%@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v31;
  double v32;
  double v33;
  double v34;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[_UIContentInsetsEnvironment insetReference](self, "insetReference");
  -[_UIContentInsetsEnvironment safeAreaInsets](self, "safeAreaInsets");
  v33 = v7;
  v34 = v6;
  v31 = v9;
  v32 = v8;
  -[_UIContentInsetsEnvironment layoutMarginsInsets](self, "layoutMarginsInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[_UIContentInsetsEnvironment readableContentInsets](self, "readableContentInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[_UIContentInsetsEnvironment scrollAccessoryInsets](self, "scrollAccessoryInsets");
  return (id)objc_msgSend(v4, "initWithInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", v5, v34, v33, v32, v31, v11, v13, v15, v17, v19, v21, v23, v25, v26, v27, v28, v29);
}

- (void)setInsetReference:(int64_t)a3
{
  self->_insetReference = a3;
}

- (void)setSafeAreaInsets:(NSDirectionalEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (void)setLayoutMarginsInsets:(NSDirectionalEdgeInsets)a3
{
  self->_layoutMarginsInsets = a3;
}

- (void)setReadableContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_readableContentInsets = a3;
}

@end
