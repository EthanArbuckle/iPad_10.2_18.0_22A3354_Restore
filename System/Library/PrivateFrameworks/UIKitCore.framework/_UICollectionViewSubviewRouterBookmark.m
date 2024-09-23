@implementation _UICollectionViewSubviewRouterBookmark

+ (_UICollectionViewSubviewRouterBookmark)bookmarkForUncontrolledSubview
{
  _UICollectionViewSubviewRouterBookmark *v0;

  objc_opt_self();
  v0 = objc_alloc_init(_UICollectionViewSubviewRouterBookmark);
  if (v0)
  {
    v0->_count = 1;
    v0->_orderMode = -10000;
  }
  return v0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t count;
  int64_t orderMode;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t zIndex;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (!self)
  {
    count = 0;
    goto LABEL_8;
  }
  count = self->_count;
  orderMode = self->_orderMode;
  if ((orderMode & 0x8000000000000000) == 0)
  {
    if (orderMode == 1)
    {
      v7 = CFSTR("Above Container");
      goto LABEL_12;
    }
    if (orderMode)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _UICollectionViewSubviewOrderModeToString(_UICollectionViewSubviewOrderMode)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_UICollectionViewSubviewRouter.m"), 526, CFSTR("Unknown order mode: %ld"), orderMode);

      v7 = &stru_1E16EDF20;
      goto LABEL_12;
    }
LABEL_8:
    v7 = CFSTR("Container");
    goto LABEL_12;
  }
  if (orderMode != -10000)
  {
    if (orderMode == -1)
    {
      v7 = CFSTR("Below Container");
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v7 = CFSTR("Uncontrolled");
LABEL_12:
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; count = %ld; orderMode = %@;"), v4, self, count, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self)
  {
    zIndex = 0;
    goto LABEL_15;
  }
  if (self->_orderMode != -10000)
  {
    zIndex = self->_zIndex;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" zIndex = %ld"), zIndex);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  objc_msgSend(v10, "stringByAppendingString:", CFSTR(">"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
