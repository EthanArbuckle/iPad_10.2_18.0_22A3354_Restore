@implementation _UICollectionPreferredSize

+ (double)preferredSizeForOriginalSize:(double)a3 fittingSize:(uint64_t)a4 layoutSize:(void *)a5
{
  void *v8;
  int v9;
  void *v10;

  objc_opt_self();
  objc_msgSend(a5, "widthDimension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEstimated");

  if (!v9)
    a3 = a1;
  objc_msgSend(a5, "heightDimension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isEstimated");

  return a3;
}

- (double)fittingSize
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (id)initWithOriginalSize:(void *)a3 fittingSize:(double)a4 layoutSize:(double)a5 additionalData:(double)a6
{
  id *v13;
  id *v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)_UICollectionPreferredSize;
  v13 = (id *)objc_msgSendSuper2(&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    *((double *)v13 + 1) = a4;
    *((double *)v13 + 2) = a5;
    *((double *)v13 + 3) = a6;
    *((double *)v13 + 4) = a7;
    objc_storeStrong(v13 + 5, a2);
    objc_storeStrong(v14 + 7, a3);
    *((_BYTE *)v14 + 48) = 0;
  }
  return v14;
}

- (double)preferredSizeForOriginalSize:(double)a3 layoutSize:(double)a4
{
  if (a1)
    return +[_UICollectionPreferredSize preferredSizeForOriginalSize:fittingSize:layoutSize:](a3, a4, *(double *)(a1 + 24), (uint64_t)_UICollectionPreferredSize, a2);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_layoutSize, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_originalSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_fittingSize);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self->_preferredSizeDirty)
    v9 = CFSTR("; DIRTY");
  else
    v9 = &stru_1E16EDF20;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - %p: original=%@; fitting=%@%@>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
