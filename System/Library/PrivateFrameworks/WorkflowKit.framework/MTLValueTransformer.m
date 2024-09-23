@implementation MTLValueTransformer

- (MTLValueTransformer)initWithForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v7;
  id v8;
  MTLValueTransformer *v9;
  uint64_t v10;
  id forwardBlock;
  uint64_t v12;
  id reverseBlock;
  MTLValueTransformer *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLValueTransformer.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("forwardBlock != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)MTLValueTransformer;
  v9 = -[MTLValueTransformer init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    forwardBlock = v9->_forwardBlock;
    v9->_forwardBlock = (id)v10;

    v12 = objc_msgSend(v8, "copy");
    reverseBlock = v9->_reverseBlock;
    v9->_reverseBlock = (id)v12;

    v14 = v9;
  }

  return v9;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v8;
  char v9;

  v9 = 1;
  v4 = a3;
  -[MTLValueTransformer forwardBlock](self, "forwardBlock");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = 0;
  ((void (**)(_QWORD, id, char *, uint64_t *))v5)[2](v5, v4, &v9, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transformedValue:(id)a3 success:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  id v13;
  BOOL v14;

  v14 = 1;
  v8 = a3;
  -[MTLValueTransformer forwardBlock](self, "forwardBlock");
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

- (id)forwardBlock
{
  return self->_forwardBlock;
}

- (id)reverseBlock
{
  return self->_reverseBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reverseBlock, 0);
  objc_storeStrong(&self->_forwardBlock, 0);
}

+ (id)transformerUsingForwardBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithForwardBlock:reverseBlock:", v4, 0);

  return v5;
}

+ (id)transformerUsingReversibleBlock:(id)a3
{
  return (id)objc_msgSend(a1, "transformerUsingForwardBlock:reverseBlock:", a3, a3);
}

+ (id)transformerUsingForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v5;
  id v6;
  MTLReversibleValueTransformer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MTLReversibleValueTransformer initWithForwardBlock:reverseBlock:]([MTLReversibleValueTransformer alloc], "initWithForwardBlock:reverseBlock:", v6, v5);

  return v7;
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (id)transformerWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__MTLValueTransformer_Deprecated__transformerWithBlock___block_invoke;
  v8[3] = &unk_1E7AEA1C8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "transformerUsingForwardBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)reversibleTransformerWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MTLValueTransformer_Deprecated__reversibleTransformerWithBlock___block_invoke;
  v8[3] = &unk_1E7AEA1C8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "transformerUsingReversibleBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)reversibleTransformerWithForwardBlock:(id)a3 reverseBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v12 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke;
  v13[3] = &unk_1E7AEA1C8;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke_2;
  v11[3] = &unk_1E7AEA1C8;
  v7 = v12;
  v8 = v6;
  objc_msgSend(a1, "transformerUsingForwardBlock:reverseBlock:", v13, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__MTLValueTransformer_Deprecated__reversibleTransformerWithForwardBlock_reverseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__MTLValueTransformer_Deprecated__reversibleTransformerWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__MTLValueTransformer_Deprecated__transformerWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
