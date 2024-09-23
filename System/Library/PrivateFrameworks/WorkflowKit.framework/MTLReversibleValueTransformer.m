@implementation MTLReversibleValueTransformer

- (MTLReversibleValueTransformer)initWithForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v7;
  id v8;
  MTLReversibleValueTransformer *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLValueTransformer.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reverseBlock != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)MTLReversibleValueTransformer;
  v9 = -[MTLValueTransformer initWithForwardBlock:reverseBlock:](&v12, sel_initWithForwardBlock_reverseBlock_, v7, v8);

  return v9;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v8;
  char v9;

  v9 = 1;
  v4 = a3;
  -[MTLValueTransformer reverseBlock](self, "reverseBlock");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = 0;
  ((void (**)(_QWORD, id, char *, uint64_t *))v5)[2](v5, v4, &v9, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reverseTransformedValue:(id)a3 success:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  id v13;
  BOOL v14;

  v14 = 1;
  v8 = a3;
  -[MTLValueTransformer reverseBlock](self, "reverseBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v13 = 0;
  ((void (**)(_QWORD, id, BOOL *, id *))v9)[2](v9, v8, &v14, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (a4)
    *a4 = v14;
  if (a5)
    *a5 = objc_retainAutorelease(v11);

  return v10;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end
