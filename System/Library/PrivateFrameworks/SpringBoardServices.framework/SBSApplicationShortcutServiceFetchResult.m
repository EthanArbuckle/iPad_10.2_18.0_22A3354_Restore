@implementation SBSApplicationShortcutServiceFetchResult

- (SBSApplicationShortcutServiceFetchResult)initWithStaticApplicationShortcutItems:(id)a3 dynamicApplicationShortcutItems:(id)a4 composedApplicationShortcutItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSApplicationShortcutServiceFetchResult *v11;
  uint64_t v12;
  NSArray *staticApplicationShortcutItems;
  uint64_t v14;
  NSArray *dynamicApplicationShortcutItems;
  uint64_t v16;
  NSArray *composedApplicationShortcutItems;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBSApplicationShortcutServiceFetchResult;
  v11 = -[SBSApplicationShortcutServiceFetchResult init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    staticApplicationShortcutItems = v11->_staticApplicationShortcutItems;
    v11->_staticApplicationShortcutItems = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    dynamicApplicationShortcutItems = v11->_dynamicApplicationShortcutItems;
    v11->_dynamicApplicationShortcutItems = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    composedApplicationShortcutItems = v11->_composedApplicationShortcutItems;
    v11->_composedApplicationShortcutItems = (NSArray *)v16;

  }
  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[SBSApplicationShortcutServiceFetchResult staticApplicationShortcutItems](self, "staticApplicationShortcutItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

    -[SBSApplicationShortcutServiceFetchResult dynamicApplicationShortcutItems](self, "dynamicApplicationShortcutItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

    -[SBSApplicationShortcutServiceFetchResult composedApplicationShortcutItems](self, "composedApplicationShortcutItems");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

  }
}

- (NSArray)composedApplicationShortcutItems
{
  return self->_composedApplicationShortcutItems;
}

- (NSArray)dynamicApplicationShortcutItems
{
  return self->_dynamicApplicationShortcutItems;
}

- (NSArray)staticApplicationShortcutItems
{
  return self->_staticApplicationShortcutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_dynamicApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_staticApplicationShortcutItems, 0);
}

- (SBSApplicationShortcutServiceFetchResult)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBSApplicationShortcutServiceFetchResult *v8;

  if (a3)
  {
    v4 = a3;
    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[SBSApplicationShortcutServiceFetchResult initWithStaticApplicationShortcutItems:dynamicApplicationShortcutItems:composedApplicationShortcutItems:](self, "initWithStaticApplicationShortcutItems:dynamicApplicationShortcutItems:composedApplicationShortcutItems:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SBSApplicationShortcutServiceFetchResult)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%s may only be called from SpringBoard.app."), "-[SBSApplicationShortcutServiceFetchResult init]");
  return -[SBSApplicationShortcutServiceFetchResult initWithStaticApplicationShortcutItems:dynamicApplicationShortcutItems:composedApplicationShortcutItems:](self, "initWithStaticApplicationShortcutItems:dynamicApplicationShortcutItems:composedApplicationShortcutItems:", 0, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  SBSApplicationShortcutServiceFetchResult *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SBSApplicationShortcutServiceFetchResult *v8;
  id v9;
  void *v10;
  SBSApplicationShortcutServiceFetchResult *v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[4];
  SBSApplicationShortcutServiceFetchResult *v18;
  _QWORD v19[4];
  SBSApplicationShortcutServiceFetchResult *v20;
  _QWORD v21[4];
  SBSApplicationShortcutServiceFetchResult *v22;

  v4 = (SBSApplicationShortcutServiceFetchResult *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSApplicationShortcutServiceFetchResult staticApplicationShortcutItems](self, "staticApplicationShortcutItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke;
    v21[3] = &unk_1E288D4D8;
    v8 = v4;
    v22 = v8;
    v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v21);

    -[SBSApplicationShortcutServiceFetchResult dynamicApplicationShortcutItems](self, "dynamicApplicationShortcutItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_2;
    v19[3] = &unk_1E288D4D8;
    v11 = v8;
    v20 = v11;
    v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v19);

    -[SBSApplicationShortcutServiceFetchResult composedApplicationShortcutItems](self, "composedApplicationShortcutItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_3;
    v17[3] = &unk_1E288D4D8;
    v18 = v11;
    v14 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v17);

    v15 = objc_msgSend(v5, "isEqual");
  }

  return v15;
}

uint64_t __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "staticApplicationShortcutItems");
}

uint64_t __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dynamicApplicationShortcutItems");
}

uint64_t __52__SBSApplicationShortcutServiceFetchResult_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "composedApplicationShortcutItems");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSApplicationShortcutServiceFetchResult staticApplicationShortcutItems](self, "staticApplicationShortcutItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[SBSApplicationShortcutServiceFetchResult dynamicApplicationShortcutItems](self, "dynamicApplicationShortcutItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[SBSApplicationShortcutServiceFetchResult composedApplicationShortcutItems](self, "composedApplicationShortcutItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

@end
