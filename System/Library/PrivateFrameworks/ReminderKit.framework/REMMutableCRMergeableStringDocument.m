@implementation REMMutableCRMergeableStringDocument

- (id)hashtagAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[REMMutableCRMergeableStringDocument mergeableString](self, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rem_hashtagAtIndex:effectiveRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)enumerateHashtagInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  id v11;

  length = a3.length;
  location = a3.location;
  v9 = a5;
  -[REMMutableCRMergeableStringDocument mergeableString](self, "mergeableString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rem_enumerateHashtagInRange:options:usingBlock:", location, length, a4, v9);

}

- (void)addHashtag:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  unint64_t v9;
  TTREMHashtag *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  REMMutableCRMergeableStringDocument *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  TTREMHashtag *v22;
  __int16 v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[2];
  NSRange v27;

  length = a4.length;
  location = a4.location;
  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    +[REMLog crdt](REMLog, "crdt");
    v10 = (TTREMHashtag *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
      -[REMMutableCRMergeableStringDocument(Hashtags) addHashtag:range:].cold.1(self, location, length, &v10->super);
    goto LABEL_12;
  }
  -[REMMutableCRMergeableStringDocument mergeableString](self, "mergeableString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (location >= v9)
    location = v9;
  if (location + length > v9)
    length = v9 - location;
  if (length)
  {
    v10 = objc_alloc_init(TTREMHashtag);
    objc_msgSend(v7, "objectIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTREMHashtag setObjectIdentifier:](v10, "setObjectIdentifier:", v11);

    -[REMMutableCRMergeableStringDocument mergeableString](self, "mergeableString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("_TTREMHashtag");
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributes:range:", v13, location, length);

    +[REMLog crdt](REMLog, "crdt");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[REMMutableCRMergeableStringDocument replicaIDSource](self, "replicaIDSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27.location = location;
      v27.length = length;
      NSStringFromRange(v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218754;
      v18 = self;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_INFO, "Added TTREMHashtag to this REMMutableCRMergeableStringDocument {self: %p, replicaID: %@, value: %@, range: %@}", (uint8_t *)&v17, 0x2Au);

    }
LABEL_12:

  }
}

- (void)removeHashtagInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  REMMutableCRMergeableStringDocument *v11;

  length = a3.length;
  location = a3.location;
  -[REMMutableCRMergeableStringDocument mergeableString](self, "mergeableString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "length");
  if (location >= v6)
    location = v6;
  if (location + length > v6)
    length = v6 - location;
  if (length)
  {
    objc_msgSend(v8, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__REMMutableCRMergeableStringDocument_Hashtags__removeHashtagInRange___block_invoke;
    v9[3] = &unk_1E67F90C0;
    v10 = v8;
    v11 = self;
    objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v9);

  }
}

void __70__REMMutableCRMergeableStringDocument_Hashtags__removeHashtagInRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  NSRange v26;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_TTREMHashtag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_TTREMHashtag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("_TTREMHashtag"));
    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v11, "setAttributes:range:", v12, a3, a4);

    +[REMLog crdt](REMLog, "crdt");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 40);
      objc_msgSend(v14, "replicaIDSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26.location = a3;
      v26.length = a4;
      NSStringFromRange(v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218754;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_INFO, "Removed TTREMHashtag from this REMMutableCRMergeableStringDocument {self: %p, replicaID: %@, value: %@, range: %@}", (uint8_t *)&v17, 0x2Au);

    }
  }

}

- (REMMutableCRMergeableStringDocument)initWithReplicaIDSource:(id)a3
{
  id v5;
  REMMutableCRMergeableStringDocument *v6;
  REMMutableCRMergeableStringDocument *v7;
  void *v8;
  TTMergeableAttributedString *v9;
  TTMergeableStringVersionedDocument *v10;
  TTMergeableStringVersionedDocument *document;
  TTMergeableStringVersionedDocument *v12;
  REMReplicaIDHelper *replicaIDHelper;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REMMutableCRMergeableStringDocument;
  v6 = -[REMMutableCRMergeableStringDocument init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replicaIDSource, a3);
    +[REMReplicaIDHelper replicaUUIDForCreation](REMReplicaIDHelper, "replicaUUIDForCreation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TTMergeableString initWithReplicaID:]([TTMergeableAttributedString alloc], "initWithReplicaID:", v8);
    v10 = -[TTMergeableStringVersionedDocument initWithMergeableString:]([TTMergeableStringVersionedDocument alloc], "initWithMergeableString:", v9);
    document = v7->_document;
    v7->_document = v10;
    v12 = v10;

    replicaIDHelper = v7->_replicaIDHelper;
    v7->_replicaIDHelper = 0;

  }
  return v7;
}

- (REMMutableCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 immutableDocumentToEdit:(id)a4
{
  id v7;
  id v8;
  REMMutableCRMergeableStringDocument *v9;
  REMMutableCRMergeableStringDocument *v10;
  REMReplicaIDHelper *v11;
  REMReplicaIDHelper *replicaIDHelper;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMMutableCRMergeableStringDocument;
  v9 = -[REMMutableCRMergeableStringDocument init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replicaIDSource, a3);
    objc_storeStrong((id *)&v10->_document, a4);
    v11 = -[REMReplicaIDHelper initWithReplicaIDSource:owner:replicaClockProvider:]([REMReplicaIDHelper alloc], "initWithReplicaIDSource:owner:replicaClockProvider:", v7, v10, v8);
    replicaIDHelper = v10->_replicaIDHelper;
    v10->_replicaIDHelper = v11;

  }
  return v10;
}

- (TTMergeableAttributedString)mergeableString
{
  void *v3;
  void *v4;
  void *v5;

  -[REMMutableCRMergeableStringDocument replicaIDHelper](self, "replicaIDHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willEdit");

  -[REMMutableCRMergeableStringDocument document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTMergeableAttributedString *)v5;
}

- (id)immutableDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  REMCRMergeableStringDocument *v7;
  void *v8;
  REMCRMergeableStringDocument *v9;

  -[REMMutableCRMergeableStringDocument document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReplicaIDHelper nonEditingReplicaUUID](REMReplicaIDHelper, "nonEditingReplicaUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rem_copyWithReplicaIDForNewEdits:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMMutableCRMergeableStringDocument replicaIDHelper](self, "replicaIDHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didCopy");

  v7 = [REMCRMergeableStringDocument alloc];
  -[REMMutableCRMergeableStringDocument replicaIDSource](self, "replicaIDSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMCRMergeableStringDocument initWithReplicaIDSource:document:](v7, "initWithReplicaIDSource:document:", v8, v5);

  return v9;
}

- (void)setReplicaManagerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_replicaManagerProvider, a3);
}

- (id)wipeAndReplaceWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[REMMutableCRMergeableStringDocument mergeableString](self, "mergeableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "insertAttributedString:atIndex:", v4, 0);

  objc_msgSend(v5, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  objc_msgSend(v5, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__REMMutableCRMergeableStringDocument_wipeAndReplaceWithString___block_invoke;
  v13[3] = &unk_1E67FA538;
  v14 = v5;
  v10 = v5;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v13);

  -[REMMutableCRMergeableStringDocument immutableDocument](self, "immutableDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __64__REMMutableCRMergeableStringDocument_wipeAndReplaceWithString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

- (void)_test_insertString:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[REMMutableCRMergeableStringDocument mergeableString](self, "mergeableString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertString:atIndex:", v6, a4);

}

- (void)replicaIDHelperDidAcquireReplicaUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "replicaUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[REMMutableCRMergeableStringDocument document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rem_copyWithReplicaIDForNewEdits:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMutableCRMergeableStringDocument setDocument:](self, "setDocument:", v5);

  -[REMMutableCRMergeableStringDocument document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMutableCRMergeableStringDocument replicaIDHelper](self, "replicaIDHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReplicaClockProvider:", v6);

}

- (REMReplicaManagerProviding)replicaManagerProvider
{
  return self->_replicaManagerProvider;
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
  objc_storeStrong((id *)&self->_replicaIDSource, a3);
}

- (TTMergeableStringVersionedDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (REMReplicaIDHelper)replicaIDHelper
{
  return self->_replicaIDHelper;
}

- (void)setReplicaIDHelper:(id)a3
{
  objc_storeStrong((id *)&self->_replicaIDHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaIDHelper, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);
  objc_storeStrong((id *)&self->_replicaManagerProvider, 0);
}

@end
