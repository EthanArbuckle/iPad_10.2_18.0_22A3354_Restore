@implementation SSTonePurchase

- (SSTonePurchase)initWithItem:(id)a3 offer:(id)a4
{
  id v6;
  SSTonePurchase *v7;
  void *v8;
  uint64_t v9;
  NSArray *allowedToneStyles;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  v7 = -[SSPurchase initWithItem:offer:](&v12, sel_initWithItem_offer_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "allowedToneStyles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    allowedToneStyles = v7->_allowedToneStyles;
    v7->_allowedToneStyles = (NSArray *)v9;

  }
  return v7;
}

- (NSArray)allowedToneStyles
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSTonePurchase_allowedToneStyles__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __35__SSTonePurchase_allowedToneStyles__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

- (NSNumber)assigneeIdentifier
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSTonePurchase_assigneeIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __36__SSTonePurchase_assigneeIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 272));
}

- (NSString)assigneeContactIdentifier
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSTonePurchase_assigneeContactIdentifier__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __43__SSTonePurchase_assigneeContactIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 280));
}

- (NSString)assigneeToneStyle
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSTonePurchase_assigneeToneStyle__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __35__SSTonePurchase_assigneeToneStyle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAllowedToneStyles:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SSTonePurchase_setAllowedToneStyles___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __39__SSTonePurchase_setAllowedToneStyles___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 264) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 264);
    *(_QWORD *)(v5 + 264) = v4;

  }
}

- (void)setAssigneeIdentifier:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SSTonePurchase_setAssigneeIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __40__SSTonePurchase_setAssigneeIdentifier___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 40);
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 272);
  if (*v2 != v1)
    objc_storeStrong(v2, v1);
}

- (void)setAssigneeContactIdentifier:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SSTonePurchase_setAssigneeContactIdentifier___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __47__SSTonePurchase_setAssigneeContactIdentifier___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 40);
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 280);
  if (*v2 != v1)
    objc_storeStrong(v2, v1);
}

- (void)setAssigneeToneStyle:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SSTonePurchase_setAssigneeToneStyle___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __39__SSTonePurchase_setAssigneeToneStyle___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 40);
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 288);
  if (*v2 != v1)
    objc_storeStrong(v2, v1);
}

- (void)setShouldMakeDefaultRingtone:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSTonePurchase_setShouldMakeDefaultRingtone___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSTonePurchase_setShouldMakeDefaultRingtone___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 296) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setShouldMakeDefaultTextTone:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSTonePurchase_setShouldMakeDefaultTextTone___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSTonePurchase_setShouldMakeDefaultTextTone___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 297) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)shouldMakeDefaultRingtone
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSTonePurchase_shouldMakeDefaultRingtone__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSTonePurchase_shouldMakeDefaultRingtone__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 296);
  return result;
}

- (BOOL)shouldMakeDefaultTextTone
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSTonePurchase_shouldMakeDefaultTextTone__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSTonePurchase_shouldMakeDefaultTextTone__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 297);
  return result;
}

- (void)_addEntriesToDatabaseEncoding:(id)a3
{
  id v4;
  void *v5;
  NSArray *allowedToneStyles;
  NSNumber *assigneeIdentifier;
  NSString *assigneeContactIdentifier;
  NSString *assigneeToneStyle;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  allowedToneStyles = self->_allowedToneStyles;
  if (allowedToneStyles)
    objc_msgSend(v4, "setObject:forKey:", allowedToneStyles, CFSTR("00"));
  assigneeIdentifier = self->_assigneeIdentifier;
  if (assigneeIdentifier)
    objc_msgSend(v5, "setObject:forKey:", assigneeIdentifier, CFSTR("01"));
  assigneeContactIdentifier = self->_assigneeContactIdentifier;
  if (assigneeContactIdentifier)
    objc_msgSend(v5, "setObject:forKey:", assigneeContactIdentifier, CFSTR("06"));
  assigneeToneStyle = self->_assigneeToneStyle;
  if (assigneeToneStyle)
    objc_msgSend(v5, "setObject:forKey:", assigneeToneStyle, CFSTR("02"));
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("03"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldMakeDefaultRingtone);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("04"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldMakeDefaultTextTone);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("05"));

  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  -[SSPurchase _addEntriesToDatabaseEncoding:](&v12, sel__addEntriesToDatabaseEncoding_, v5);

}

- (void)_setValuesUsingDatabaseEncoding:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *allowedToneStyles;
  void *v8;
  NSNumber *v9;
  NSNumber *assigneeIdentifier;
  void *v11;
  NSString *v12;
  NSString *assigneeContactIdentifier;
  void *v14;
  NSString *v15;
  NSString *assigneeToneStyle;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("00"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    allowedToneStyles = self->_allowedToneStyles;
    self->_allowedToneStyles = v6;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("01"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (NSNumber *)objc_msgSend(v8, "copy");
    assigneeIdentifier = self->_assigneeIdentifier;
    self->_assigneeIdentifier = v9;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("06"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (NSString *)objc_msgSend(v11, "copy");
    assigneeContactIdentifier = self->_assigneeContactIdentifier;
    self->_assigneeContactIdentifier = v12;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("02"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (NSString *)objc_msgSend(v14, "copy");
    assigneeToneStyle = self->_assigneeToneStyle;
    self->_assigneeToneStyle = v15;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("04"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v17, "BOOLValue"))
    self->_shouldMakeDefaultRingtone = 1;
  objc_msgSend(v4, "objectForKey:", CFSTR("05"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v18, "BOOLValue"))
    self->_shouldMakeDefaultTextTone = 1;
  v19.receiver = self;
  v19.super_class = (Class)SSTonePurchase;
  -[SSPurchase _setValuesUsingDatabaseEncoding:](&v19, sel__setValuesUsingDatabaseEncoding_, v4);

}

- (SSTonePurchase)initWithCoder:(id)a3
{
  id v5;
  SSTonePurchase *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *allowedToneStyles;
  uint64_t v12;
  NSNumber *assigneeIdentifier;
  uint64_t v14;
  NSString *assigneeContactIdentifier;
  uint64_t v16;
  NSString *assigneeToneStyle;
  void *v19;
  objc_super v20;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSPurchase.m"), 1496, CFSTR("Only keyed coding is supported"));

  }
  v20.receiver = self;
  v20.super_class = (Class)SSTonePurchase;
  v6 = -[SSPurchase initWithCoder:](&v20, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("tonestyles"));
    v10 = objc_claimAutoreleasedReturnValue();
    allowedToneStyles = v6->_allowedToneStyles;
    v6->_allowedToneStyles = (NSArray *)v10;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assignee"));
    v12 = objc_claimAutoreleasedReturnValue();
    assigneeIdentifier = v6->_assigneeIdentifier;
    v6->_assigneeIdentifier = (NSNumber *)v12;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v14 = objc_claimAutoreleasedReturnValue();
    assigneeContactIdentifier = v6->_assigneeContactIdentifier;
    v6->_assigneeContactIdentifier = (NSString *)v14;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tonestyle"));
    v16 = objc_claimAutoreleasedReturnValue();
    assigneeToneStyle = v6->_assigneeToneStyle;
    v6->_assigneeToneStyle = (NSString *)v16;

    v6->_shouldMakeDefaultRingtone = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("makedefault"));
    v6->_shouldMakeDefaultTextTone = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("makedefaulttext"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  SSTonePurchase *v11;
  objc_super v12;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSPurchase.m"), 1509, CFSTR("Only keyed coding is supported"));

  }
  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  -[SSPurchase encodeWithCoder:](&v12, sel_encodeWithCoder_, v5);
  dispatchQueue = self->super._dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__SSTonePurchase_encodeWithCoder___block_invoke;
  v9[3] = &unk_1E47B8768;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_sync(dispatchQueue, v9);

}

uint64_t __34__SSTonePurchase_encodeWithCoder___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264), CFSTR("tonestyles"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), CFSTR("assignee"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280), CFSTR("contact"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288), CFSTR("tonestyle"));
  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 296), CFSTR("makedefault"));
  return objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 297), CFSTR("makedefaulttext"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SSTonePurchase *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SSTonePurchase;
  v4 = -[SSPurchase copyWithZone:](&v12, sel_copyWithZone_, a3);
  dispatchQueue = self->super._dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__SSTonePurchase_copyWithZone___block_invoke;
  v9[3] = &unk_1E47B8768;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync(dispatchQueue, v9);
  v7 = v6;

  return v7;
}

uint64_t __31__SSTonePurchase_copyWithZone___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAllowedToneStyles:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264));
  objc_msgSend(*(id *)(a1 + 32), "setAssigneeIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272));
  objc_msgSend(*(id *)(a1 + 32), "setAssigneeContactIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280));
  objc_msgSend(*(id *)(a1 + 32), "setAssigneeToneStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288));
  objc_msgSend(*(id *)(a1 + 32), "setShouldMakeDefaultRingtone:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 296));
  return objc_msgSend(*(id *)(a1 + 32), "setShouldMakeDefaultTextTone:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 297));
}

- (id)copyXPCEncoding
{
  id v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSTonePurchase *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSTonePurchase;
  v3 = -[SSPurchase copyXPCEncoding](&v11, sel_copyXPCEncoding);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__SSTonePurchase_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

void __33__SSTonePurchase_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "50", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "51", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "56", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "52", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "53", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 296));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "54", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 297));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "55", 1);
}

- (SSTonePurchase)initWithXPCEncoding:(id)a3
{
  id v4;
  SSTonePurchase *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *allowedToneStyles;
  uint64_t v9;
  uint64_t v10;
  NSNumber *assigneeIdentifier;
  uint64_t v12;
  uint64_t v13;
  NSString *assigneeContactIdentifier;
  uint64_t v15;
  uint64_t v16;
  NSString *assigneeToneStyle;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SSTonePurchase;
  v5 = -[SSPurchase initWithXPCEncoding:](&v19, sel_initWithXPCEncoding_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = SSXPCDictionaryCopyObjectWithClass(v4, "50", v6);
    allowedToneStyles = v5->_allowedToneStyles;
    v5->_allowedToneStyles = (NSArray *)v7;

    v9 = objc_opt_class();
    v10 = SSXPCDictionaryCopyObjectWithClass(v4, "51", v9);
    assigneeIdentifier = v5->_assigneeIdentifier;
    v5->_assigneeIdentifier = (NSNumber *)v10;

    v12 = objc_opt_class();
    v13 = SSXPCDictionaryCopyObjectWithClass(v4, "56", v12);
    assigneeContactIdentifier = v5->_assigneeContactIdentifier;
    v5->_assigneeContactIdentifier = (NSString *)v13;

    v15 = objc_opt_class();
    v16 = SSXPCDictionaryCopyObjectWithClass(v4, "52", v15);
    assigneeToneStyle = v5->_assigneeToneStyle;
    v5->_assigneeToneStyle = (NSString *)v16;

    v5->_shouldMakeDefaultRingtone = xpc_dictionary_get_BOOL(v4, "53");
    v5->_shouldMakeDefaultTextTone = xpc_dictionary_get_BOOL(v4, "54");
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assigneeToneStyle, 0);
  objc_storeStrong((id *)&self->_assigneeContactIdentifier, 0);
  objc_storeStrong((id *)&self->_assigneeIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedToneStyles, 0);
}

@end
