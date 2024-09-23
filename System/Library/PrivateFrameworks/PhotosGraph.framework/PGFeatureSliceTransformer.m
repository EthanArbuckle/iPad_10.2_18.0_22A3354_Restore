@implementation PGFeatureSliceTransformer

- (PGFeatureSliceTransformer)init
{
  return (PGFeatureSliceTransformer *)-[PGFeatureSliceTransformer initFromIndex:toIndex:](self, "initFromIndex:toIndex:", 0, 0x7FFFFFFFLL);
}

- (id)initFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGFeatureSliceTransformer;
  result = -[PGFeatureSliceTransformer init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
  }
  return result;
}

- (id)floatVectorWithFloatVector:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = -[PGFeatureSliceTransformer fromIndex](self, "fromIndex");
  v8 = v7 & ~(v7 >> 63);
  v9 = objc_msgSend(v6, "count");
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = -[PGFeatureSliceTransformer toIndex](self, "toIndex");
  v12 = objc_msgSend(v6, "count");
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  v14 = v13 & ~(v13 >> 63);
  objc_msgSend(v6, "sliceFromStart:toEnd:", 0, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sliceFromStart:toEnd:", v10, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sliceFromStart:toEnd:", v14, objc_msgSend(v6, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGFeatureSliceTransformer applyTransformationToFloatVector:error:](self, "applyTransformationToFloatVector:error:", v16, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v15, "vectorByAppendingVector:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "vectorByAppendingVector:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (int64_t)fromIndex
{
  return self->_fromIndex;
}

- (int64_t)toIndex
{
  return self->_toIndex;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

+ (id)name
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
