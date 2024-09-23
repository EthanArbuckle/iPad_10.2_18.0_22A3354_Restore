@implementation _SBDisplaysWithSizePredicate

- (_SBDisplaysWithSizePredicate)initWithDiagonal:(unint64_t)a3 pixelSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  _SBDisplaysWithSizePredicate *result;
  void *v11;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  if (a4.width == *MEMORY[0x1E0C9D820] && a4.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGSizeEqualToSize(pixelSize, CGSizeZero)"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_SBDisplaysWithSizePredicate;
  result = -[SBDisplayModePredicate _init](&v12, sel__init);
  if (result)
  {
    result->_diagonal = a3;
    result->_nativePixelSize.width = width;
    result->_nativePixelSize.height = height;
  }
  return result;
}

- (_SBDisplaysWithSizePredicate)initWithDisplay:(id)a3 useNativeSize:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  id v14;
  unint64_t v15;
  void *v16;
  _SBDisplaysWithSizePredicate *v17;
  void *v19;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration"));

  }
  objc_msgSend(v7, "CADisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "immutableCopy");

  objc_msgSend(v9, "physicalSize");
  v11 = v10;
  v13 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0CD2738]);
  if (v4)
  {
    objc_msgSend(v9, "nativeSize");
    objc_msgSend(v14, "setResolution:");
  }
  v15 = vcvtad_u64_f64(hypot(v11, v13));
  objc_msgSend(v9, "preferredModeWithCriteria:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_SBDisplaysWithSizePredicate initWithDiagonal:pixelSize:](self, "initWithDiagonal:pixelSize:", v15, (double)(unint64_t)objc_msgSend(v16, "width"), (double)(unint64_t)objc_msgSend(v16, "height"));

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = v8
    && self->_diagonal == v8[1]
    && self->_nativePixelSize.height == *((double *)v8 + 3)
    && self->_nativePixelSize.width == *((double *)v8 + 2);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_diagonal);
  v5 = (id)objc_msgSend(v3, "appendCGSize:", self->_nativePixelSize.width, self->_nativePixelSize.height);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)matchesDisplay:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  long double v12;
  long double v13;
  char v14;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration != nil"));

  }
  objc_msgSend(v5, "CADisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "CADisplay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "immutableCopy");

    v10 = objc_alloc_init(MEMORY[0x1E0CD2738]);
    objc_msgSend(v9, "preferredModeWithCriteria:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "width");
    objc_msgSend(v11, "height");
    if (BSFloatEqualToFloat() && BSFloatEqualToFloat())
    {
      objc_msgSend(v9, "physicalSize");
      hypot(v12, v13);
      v14 = BSFloatEqualToFloat();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)fromDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  void *v26;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^\\(\\.%@ \\[(\\d+)\\] \\[(\\d+)\\s+(\\d+)\\]\\)$"), CFSTR("matchingDisplays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "rangeAtIndex:", 1);
    objc_msgSend(v4, "substringWithRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "rangeAtIndex:", 2);
    objc_msgSend(v4, "substringWithRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "rangeAtIndex:", 3);
    objc_msgSend(v4, "substringWithRange:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v11)
      v19 = v14 == 0;
    else
      v19 = 1;
    v20 = v19 || v17 == 0;
    if (v20
      || ((v21 = (double)objc_msgSend(v14, "integerValue"),
           v22 = (double)objc_msgSend(v18, "integerValue"),
           v24 = *(double *)(MEMORY[0x1E0C9D820] + 8),
           *MEMORY[0x1E0C9D820] == v21)
        ? (v25 = v24 == v22)
        : (v25 = 0),
          v25))
    {
      v26 = 0;
    }
    else
    {
      v23 = *MEMORY[0x1E0C9D820];
      v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDiagonal:pixelSize:", objc_msgSend(v11, "integerValue", v23, v24), v21, v22);
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)defaultsKeyRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(.%@ [%lu] [%lu %lu])"), CFSTR("matchingDisplays"), self->_diagonal, (unint64_t)self->_nativePixelSize.width, (unint64_t)self->_nativePixelSize.height);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t diagonal;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  diagonal = self->_diagonal;
  BSNSStringFromCGSize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> [diagonal: %lu] [pixelSize: %@]"), v4, self, diagonal, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
