@implementation VMUMutableClassInfo

- (void)setDisplayName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setDisplayName:](&v3, sel__setDisplayName_, a3);
}

- (void)setBinaryPath:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setBinaryPath:sanitize:](&v3, sel__setBinaryPath_sanitize_, a3, 1);
}

- (void)setSuperclassInfo:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setSuperclassInfo:](&v3, sel__setSuperclassInfo_, a3);
}

- (void)setIsCoreMediaFigObject:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setIsCoreMediaFigObject:](&v3, sel__setIsCoreMediaFigObject_, a3);
}

- (void)setDefaultScanType:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setDefaultScanType:](&v3, sel__setDefaultScanType_, *(_QWORD *)&a3);
}

- (void)setInstanceSize:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setInstanceSize:](&v3, sel__setInstanceSize_, *(_QWORD *)&a3);
}

- (void)setIsRootClass:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setIsRootClass:](&v3, sel__setIsRootClass_, a3);
}

- (void)setInfoType:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _setInfoType:](&v3, sel__setInfoType_, *(_QWORD *)&a3);
}

- (void)mutateTypeFieldsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__VMUMutableClassInfo_mutateTypeFieldsWithBlock___block_invoke;
  v6[3] = &unk_1E4E02210;
  v7 = v4;
  v5 = v4;
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v6);

}

uint64_t __49__VMUMutableClassInfo_mutateTypeFieldsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__VMUMutableClassInfo_mutateTypeFieldsRecursivelyWithBlock___block_invoke;
  v6[3] = &unk_1E4E02210;
  v7 = v4;
  v5 = v4;
  -[VMUClassInfo enumerateTypeFieldsWithBlock:](self, "enumerateTypeFieldsWithBlock:", v6);

}

void __60__VMUMutableClassInfo_mutateTypeFieldsRecursivelyWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v3, "mutateTypeFieldsRecursivelyWithBlock:parentOffset:", *(_QWORD *)(a1 + 32), objc_msgSend(v3, "offset"));

}

- (void)addVariant:(id)a3 forField:(id)a4 withEvaluator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__VMUMutableClassInfo_addVariant_forField_withEvaluator___block_invoke;
  v15[3] = &unk_1E4E02238;
  v10 = v9;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v12 = a5;
  v13 = (void *)MEMORY[0x1A85A995C](v15);
  v14.receiver = self;
  v14.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _addVariantAction:withEvaluator:](&v14, sel__addVariantAction_withEvaluator_, v13, v12);

}

void __57__VMUMutableClassInfo_addVariant_forField_withEvaluator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v7[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replaceField:withFields:", v4, v5);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addFields:", v5);
  }

}

- (void)addVariantRecursively:(id)a3 forField:(id)a4 atOffset:(unsigned int)a5 withEvaluator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id v19;
  unsigned int v20;

  v10 = a3;
  v11 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__VMUMutableClassInfo_addVariantRecursively_forField_atOffset_withEvaluator___block_invoke;
  v17[3] = &unk_1E4E02260;
  v12 = v11;
  v18 = v12;
  v20 = a5;
  v13 = v10;
  v19 = v13;
  v14 = a6;
  v15 = (void *)MEMORY[0x1A85A995C](v17);
  v16.receiver = self;
  v16.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _addVariantAction:withEvaluator:](&v16, sel__addVariantAction_withEvaluator_, v15, v14);

}

void __77__VMUMutableClassInfo_addVariantRecursively_forField_atOffset_withEvaluator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v3, "_replaceFieldRecursively:atOffset:withField:", v5, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addFields:", v6);

  }
}

- (void)addComplexAction:(id)a3 withEvaluator:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _addComplexAction:withEvaluator:](&v4, sel__addComplexAction_withEvaluator_, a3, a4);
}

- (void)setVariantScanType:(unsigned int)a3 withEvaluator:(id)a4
{
  id v5;
  void *v6;
  objc_super v7;
  _QWORD v8[4];
  unsigned int v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__VMUMutableClassInfo_setVariantScanType_withEvaluator___block_invoke;
  v8[3] = &__block_descriptor_36_e29_v16__0__VMUMutableClassInfo_8l;
  v9 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1A85A995C](v8);
  v7.receiver = self;
  v7.super_class = (Class)VMUMutableClassInfo;
  -[VMUClassInfo _addVariantAction:withEvaluator:](&v7, sel__addVariantAction_withEvaluator_, v6, v5);

}

uint64_t __56__VMUMutableClassInfo_setVariantScanType_withEvaluator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDefaultScanType:", *(unsigned int *)(a1 + 32));
}

@end
