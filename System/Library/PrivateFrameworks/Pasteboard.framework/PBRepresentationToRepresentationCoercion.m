@implementation PBRepresentationToRepresentationCoercion

- (PBRepresentationToRepresentationCoercion)initWithSourceType:(id)a3 destinationType:(id)a4 conversionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  PBRepresentationToRepresentationCoercion *v12;
  PBRepresentationToRepresentationCoercion *v13;
  uint64_t v14;
  id coercionBlock;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PBRepresentationToRepresentationCoercion;
  v12 = -[PBRepresentationToRepresentationCoercion init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceType, a3);
    objc_storeStrong((id *)&v13->_destinationType, a4);
    v14 = MEMORY[0x18D782EA4](v11);
    coercionBlock = v13->_coercionBlock;
    v13->_coercionBlock = (id)v14;

  }
  return v13;
}

- (BOOL)canCoerceToRepresentationOfType:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;

  v4 = (__CFString *)a3;
  -[PBRepresentationToRepresentationCoercion destinationType](self, "destinationType");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = UTTypeConformsTo(v5, v4);

  return v6 != 0;
}

- (void)coerceRepresentationData:(id)a3 representationURL:(id)a4 toRepresentationOfType:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  void *v14;
  __CFString *v15;
  int v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  __CFString *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v14 = (void *)-[NSString copy](self->_sourceType, "copy");
  -[PBRepresentationToRepresentationCoercion destinationType](self, "destinationType");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = UTTypeConformsTo(v15, v12);

  if (v16)
  {
    -[PBRepresentationToRepresentationCoercion coercionBlock](self, "coercionBlock");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[PBRepresentationToRepresentationCoercion destinationType](self, "destinationType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __126__PBRepresentationToRepresentationCoercion_coerceRepresentationData_representationURL_toRepresentationOfType_completionBlock___block_invoke;
    v21[3] = &unk_1E24321C0;
    v22 = v14;
    v23 = v12;
    v24 = v13;
    ((void (**)(_QWORD, void *, id, id, _QWORD *))v17)[2](v17, v18, v10, v11, v21);

  }
  else
  {
    -[PBRepresentationToRepresentationCoercion sourceType](self, "sourceType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError((uint64_t)v19, (uint64_t)v12, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v20);

  }
}

void __126__PBRepresentationToRepresentationCoercion_coerceRepresentationData_representationURL_toRepresentationOfType_completionBlock___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PBErrorDomain"));

    v9 = v6;
    if ((v8 & 1) == 0)
    {
      PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError(a1[4], a1[5], v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (NSString)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(id)a3
{
  objc_storeStrong((id *)&self->_sourceType, a3);
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(id)a3
{
  objc_storeStrong((id *)&self->_destinationType, a3);
}

- (id)coercionBlock
{
  return self->_coercionBlock;
}

- (void)setCoercionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_coercionBlock, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_sourceType, 0);
}

@end
