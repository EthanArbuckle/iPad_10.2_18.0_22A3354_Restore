@implementation _UIAttributeTraitStorage

- (_UIAttributeTraitStorage)initWithObject:(id)a3 keyPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIAttributeTraitStorage;
  return -[_UITraitStorage initWithObject:keyPath:](&v5, sel_initWithObject_keyPath_, a3, a4);
}

- (void)addRecordWithTraitCollection:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIAttributeTraitStorageRecord *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[UITraitCollection _traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified]((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_2;
  _UIIsPrivateMainBundle();
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_traitsDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitStorage.m"), 310, CFSTR("Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@"), v12);

    goto LABEL_2;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    objc_msgSend(v9, "_traitsDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v16;
    _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
LABEL_10:

LABEL_11:
    goto LABEL_2;
  }
  v13 = addRecordWithTraitCollection_value____s_category;
  if (!addRecordWithTraitCollection_value____s_category)
  {
    v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v13, (unint64_t *)&addRecordWithTraitCollection_value____s_category);
  }
  v14 = *(NSObject **)(v13 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = v14;
    objc_msgSend(v9, "_traitsDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v16;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
    goto LABEL_10;
  }
LABEL_2:
  v10 = -[_UIAttributeTraitStorageRecord initWithTraitCollection:value:]([_UIAttributeTraitStorageRecord alloc], "initWithTraitCollection:value:", v8, v7);

  -[_UITraitStorage addRecord:](self, "addRecord:", v10);
}

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_UITraitStorage records](self, "records", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "traitCollection");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (!v4 || v11)
        {
          v13 = -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v4, v11);

          if (!v13)
            continue;
        }
        objc_msgSend(v10, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "_uikit_variesByTraitCollections"))
        {
          do
          {
            objc_msgSend(v14, "_uikit_valueForTraitCollection:", v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 == v14)
              break;
            v14 = v15;
          }
          while ((objc_msgSend(v15, "_uikit_variesByTraitCollections") & 1) != 0);
        }
        -[_UITraitStorage object](self, "object");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITraitStorage keyPath](self, "keyPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_uikit_applyValueFromTraitStorage:forKeyPath:", v14, v17);

        goto LABEL_16;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

}

@end
