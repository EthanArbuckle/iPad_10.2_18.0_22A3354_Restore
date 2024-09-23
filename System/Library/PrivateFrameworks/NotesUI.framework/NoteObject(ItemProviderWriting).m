@implementation NoteObject(ItemProviderWriting)

+ (id)writableTypeIdentifiersForItemProvider
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = *MEMORY[0x1E0D629B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)writableTypeIdentifiersForItemProvider
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isPlainText"))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = *MEMORY[0x1E0D629B8];
    v6[0] = v1;
    v6[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "arrayByAddingObject:", *MEMORY[0x1E0D629B8]);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting
{
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0D629B8]))
    return 3;
  else
    return 0;
}

- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D629B8]))
  {
    v8 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NoteObject(ItemProviderWriting) loadDataWithTypeIdentifier:forItemProviderCompletionHandler:].cold.1(v8);

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    block[3] = &unk_1E5C20C00;
    v12 = v6;
    v13 = a1;
    v14 = v7;
    dispatch_async(v9, block);

  }
  return 0;
}

- (uint64_t)itemProviderType
{
  return 2;
}

- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__78;
  v18 = __Block_byref_object_dispose__78;
  v19 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__NoteObject_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v13[3] = &unk_1E5C1D9D0;
  v13[4] = a1;
  v13[5] = &v14;
  objc_msgSend(v8, "performBlockAndWait:", v13);

  objc_msgSend(MEMORY[0x1E0D63BB8], "attributedStringFromHTMLString:readerDelegate:", v15[5], a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = (id)objc_msgSend(v9, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
  else
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);

  _Block_object_dispose(&v14, 8);
  return 0;
}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()ItemProviderWriting
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "_preferredRepresentationForItemProviderWritableTypeIdentifier:");
}

- (id)fileWrapperForURL:()ItemProviderWriting
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D63B78], "contentIDStringFromCIDURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__78;
  v18 = __Block_byref_object_dispose__78;
  v19 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NoteObject_ItemProviderWriting__fileWrapperForURL___block_invoke;
  v10[3] = &unk_1E5C1DC18;
  v11 = v5;
  v12 = a1;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v7 = v15[5];
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3650]);
    a1 = (void *)objc_msgSend(v8, "initWithURL:options:error:", v15[5], 0, 0);
  }

  _Block_object_dispose(&v14, 8);
  if (!v7)
LABEL_5:
    a1 = 0;

  return a1;
}

- (void)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Data should never be requested for the item provider UTI", v1, 2u);
}

@end
