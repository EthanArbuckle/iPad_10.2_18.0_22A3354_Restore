@implementation ICTTTextStorageWithRange

- (ICTTTextStorageWithRange)initWithTextStorage:(id)a3 range:(_NSRange)a4 note:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  ICTTTextStorageWithRange *v12;
  ICTTTextStorageWithRange *v13;
  objc_super v15;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICTTTextStorageWithRange;
  v12 = -[ICTTTextStorageWithRange init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_note, a5);
    objc_storeStrong((id *)&v13->_textStorage, a3);
    v13->_range.location = location;
    v13->_range.length = length;
  }

  return v13;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D637F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__33;
  v12 = __Block_byref_object_dispose__33;
  v13 = 0;
  -[ICTTTextStorageWithRange note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ICTTTextStorageWithRange_writableTypeIdentifiersForItemProvider__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __66__ICTTTextStorageWithRange_writableTypeIdentifiersForItemProvider__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writableTypeIdentifiersForNoteContent");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0D637F0]))
    return 3;
  else
    return 0;
}

- (void)prepareTextStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[ICTTTextStorageWithRange note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextStorageWithRange setWorkerContext:](self, "setWorkerContext:", v6);

  -[ICTTTextStorageWithRange workerContext](self, "workerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__ICTTTextStorageWithRange_prepareTextStorage__block_invoke;
  v9[3] = &unk_1E5C1D9A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

void __46__ICTTTextStorageWithRange_prepareTextStorage__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0D63BB8];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setWorkerContextNote:", v5);

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "workerContextNote");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareForCopyingData");

    objc_msgSend(*(id *)(a1 + 32), "workerContextNote");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTextStorage:", v10);

  }
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = -[ICTTTextStorageWithRange range](self, "range");
  v10 = v9;
  -[ICTTTextStorageWithRange workerContext](self, "workerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.workerContext != ((void *)0)", "-[ICTTTextStorageWithRange loadDataWithTypeIdentifier:forItemProviderCompletionHandler:]", 1, 0, CFSTR("Seems like prepareTextStorage was never called"));
  -[ICTTTextStorageWithRange workerContext](self, "workerContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__ICTTTextStorageWithRange_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v16[3] = &unk_1E5C206B8;
  v16[4] = self;
  v17 = v6;
  v19 = v8;
  v20 = v10;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "performBlock:", v16);

  return 0;
}

void __88__ICTTTextStorageWithRange_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "workerContextNote");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v3, "copyDataForUTI:range:persistenceHelper:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5);

  }
  v6 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_prettyLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = 138413058;
    v12 = v8;
    v13 = 2048;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    v17 = 2048;
    v18 = objc_msgSend(v2, "length");
    _os_log_debug_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEBUG, "Load provider data for textStorage: %@, range: (%lu, %lu) => data length: %lu", (uint8_t *)&v11, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (unint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "_preferredRepresentationForItemProviderWritableTypeIdentifier:", a3);
}

- (id)_loadFileRepresentationOfTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = -[ICTTTextStorageWithRange range](self, "range");
  v10 = v9;
  -[ICTTTextStorageWithRange workerContext](self, "workerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.workerContext != ((void *)0)", "-[ICTTTextStorageWithRange _loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:]", 1, 0, CFSTR("Seems like prepareTextStorage was never called"));
  -[ICTTTextStorageWithRange workerContext](self, "workerContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v16[3] = &unk_1E5C206B8;
  v19 = v8;
  v20 = v10;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "performBlock:", v16);

  return 0;
}

void __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredAttributedStringForUTI:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (id)objc_msgSend(v4, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerContext, a3);
}

- (ICNote)workerContextNote
{
  return self->_workerContextNote;
}

- (void)setWorkerContextNote:(id)a3
{
  objc_storeStrong((id *)&self->_workerContextNote, a3);
}

- (ICTTTextStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_textStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_workerContextNote, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

void __101__ICTTTextStorageWithRange__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_prettyLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = 138412802;
  v9 = v5;
  v10 = 2048;
  v11 = v6;
  v12 = 2048;
  v13 = v7;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "Load file representation for textStorage: %@, range: (%lu, %lu)", (uint8_t *)&v8, 0x20u);

}

@end
