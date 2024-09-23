@implementation UITextPasteItem

- (UITextPasteItem)initWithTextPasteCoordinator:(id)a3
{
  id v5;
  UITextPasteItem *v6;
  UITextPasteItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextPasteItem;
  v6 = -[UITextPasteItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coordinator, a3);

  return v7;
}

- (void)setStringResult:(id)a3
{
  UITextPasteCoordinator *coordinator;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  coordinator = self->_coordinator;
  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a3;
  v7 = [v5 alloc];
  -[UITextPasteItem defaultAttributes](self, "defaultAttributes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "initWithString:attributes:", v6, v9);

  -[UITextPasteCoordinator setResult:forItem:](coordinator, "setResult:forItem:", v8, self);
}

- (void)setAttributedStringResult:(id)a3
{
  -[UITextPasteCoordinator setResult:forItem:](self->_coordinator, "setResult:forItem:", a3, self);
}

- (void)setAttachmentResult:(id)a3
{
  UITextPasteCoordinator *coordinator;
  id v5;

  coordinator = self->_coordinator;
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextPasteCoordinator setResult:forItem:](coordinator, "setResult:forItem:", v5, self);

}

- (void)setNoResult
{
  -[UITextPasteCoordinator setResult:forItem:](self->_coordinator, "setResult:forItem:", 0, self);
}

- (void)setDefaultResult
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__UITextPasteItem_setDefaultResult__block_invoke;
  aBlock[3] = &unk_1E16E60B8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  -[UITextPasteItem localObject](self, "localObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || ((*((uint64_t (**)(void *, UITextPasteItem *, void *))v4 + 2))(v4, self, v5) & 1) == 0)
  {
    -[UITextPasteItem supportedPasteConfigurationClasses](self, "supportedPasteConfigurationClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (-[UITextPasteItem itemProvider](self, "itemProvider"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "_highestFidelityClassForLoading:", v6),
          v7,
          v8))
    {
      -[UITextPasteItem itemProvider](self, "itemProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextPasteItem documentOptions](self, "documentOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __35__UITextPasteItem_setDefaultResult__block_invoke_2;
      v12[3] = &unk_1E16E60E0;
      v12[4] = self;
      v13 = v4;
      v11 = (id)objc_msgSend(v9, "_loadObjectOfClass:userInfo:completionHandler:", v8, v10, v12);

    }
    else
    {
      -[UITextPasteItem setNoResult](self, "setNoResult");
    }

  }
}

uint64_t __35__UITextPasteItem_setDefaultResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStringResult:", v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "setStringResult:", v6);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v5, "forcesDefaultAttributes"))
      {
        v14[0] = *MEMORY[0x1E0CA8158];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v5, "defaultAttributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attributedStringFromAttributedString:preservingAttributes:addingAttributes:", v6, v8, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v11;
      }
      objc_msgSend(v5, "setAttributedStringResult:", v6);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_11;
    }
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setImage:", v6);
    objc_msgSend(v5, "setAttachmentResult:", v7);
  }

LABEL_10:
  v12 = 1;
LABEL_11:

  return v12;
}

void __35__UITextPasteItem_setDefaultResult__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v6 || ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setNoResult");

}

- (id)attributedStringFromAttributedString:(id)a3 preservingAttributes:(id)a4 addingAttributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  id obj;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21 = a5;
  v9 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v7, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

  v12 = objc_msgSend(v11, "length");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v17);
        v23[0] = v16;
        v23[1] = 3221225472;
        v23[2] = __94__UITextPasteItem_attributedStringFromAttributedString_preservingAttributes_addingAttributes___block_invoke;
        v23[3] = &unk_1E16E6108;
        v24 = v11;
        v25 = v18;
        objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v12, 0, v23);

        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "addAttributes:range:", v21, 0, v12);
  v19 = (void *)objc_msgSend(v11, "copy");

  return v19;
}

uint64_t __94__UITextPasteItem_attributedStringFromAttributedString_preservingAttributes_addingAttributes___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *(_QWORD *)(result + 40), a2, a3, a4);
  return result;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (id)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)a3
{
  objc_storeStrong(&self->_localObject, a3);
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (void)setDefaultAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAttributes, a3);
}

- (UITextPasteCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSArray)supportedPasteConfigurationClasses
{
  return self->_supportedPasteConfigurationClasses;
}

- (void)setSupportedPasteConfigurationClasses:(id)a3
{
  objc_storeStrong((id *)&self->_supportedPasteConfigurationClasses, a3);
}

- (BOOL)forcesDefaultAttributes
{
  return self->_forcesDefaultAttributes;
}

- (void)setForcesDefaultAttributes:(BOOL)a3
{
  self->_forcesDefaultAttributes = a3;
}

- (NSDictionary)documentOptions
{
  return self->_documentOptions;
}

- (void)setDocumentOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentOptions, 0);
  objc_storeStrong((id *)&self->_supportedPasteConfigurationClasses, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
  objc_storeStrong(&self->_localObject, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
