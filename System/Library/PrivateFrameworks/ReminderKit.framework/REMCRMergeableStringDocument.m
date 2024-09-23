@implementation REMCRMergeableStringDocument

- (id)hashtagAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[REMCRMergeableStringDocument mergeableString](self, "mergeableString");
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
  -[REMCRMergeableStringDocument mergeableString](self, "mergeableString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rem_enumerateHashtagInRange:options:usingBlock:", location, length, a4, v9);

}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TTMergeableAttributedString *v9;
  TTMergeableStringVersionedDocument *v10;
  REMCRMergeableStringDocument *v11;

  v6 = a4;
  v7 = a3;
  +[REMReplicaIDHelper replicaUUIDForCreation](REMReplicaIDHelper, "replicaUUIDForCreation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TTMergeableString initWithReplicaID:]([TTMergeableAttributedString alloc], "initWithReplicaID:", v8);
  -[TTMergeableAttributedString insertString:atIndex:](v9, "insertString:atIndex:", v6, 0);

  v10 = -[TTMergeableStringVersionedDocument initWithMergeableString:]([TTMergeableStringVersionedDocument alloc], "initWithMergeableString:", v9);
  v11 = -[REMCRMergeableStringDocument initWithReplicaIDSource:document:](self, "initWithReplicaIDSource:document:", v7, v10);

  return v11;
}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 attributedString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TTMergeableAttributedString *v9;
  TTMergeableStringVersionedDocument *v10;
  REMCRMergeableStringDocument *v11;

  v6 = a4;
  v7 = a3;
  +[REMReplicaIDHelper replicaUUIDForCreation](REMReplicaIDHelper, "replicaUUIDForCreation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TTMergeableString initWithReplicaID:]([TTMergeableAttributedString alloc], "initWithReplicaID:", v8);
  -[TTMergeableString insertAttributedString:atIndex:](v9, "insertAttributedString:atIndex:", v6, 0);

  v10 = -[TTMergeableStringVersionedDocument initWithMergeableString:]([TTMergeableStringVersionedDocument alloc], "initWithMergeableString:", v9);
  v11 = -[REMCRMergeableStringDocument initWithReplicaIDSource:document:](self, "initWithReplicaIDSource:document:", v7, v10);

  return v11;
}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 serializedData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  TTMergeableStringVersionedDocument *v9;
  void *v10;
  TTMergeableStringVersionedDocument *v11;
  REMCRMergeableStringDocument *v12;

  v7 = a4;
  v8 = a3;
  v9 = [TTMergeableStringVersionedDocument alloc];
  +[REMReplicaIDHelper nonEditingReplicaUUID](REMReplicaIDHelper, "nonEditingReplicaUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TTMergeableStringVersionedDocument initWithData:andReplicaID:](v9, "initWithData:andReplicaID:", v7, v10);

  v12 = -[REMCRMergeableStringDocument initWithReplicaIDSource:document:](self, "initWithReplicaIDSource:document:", v8, v11);
  return v12;
}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 document:(id)a4
{
  id v7;
  id v8;
  REMCRMergeableStringDocument *v9;
  REMCRMergeableStringDocument *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMCRMergeableStringDocument;
  v9 = -[REMCRMergeableStringDocument init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replicaIDSource, a3);
    objc_storeStrong((id *)&v10->_document, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMCRMergeableStringDocument document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialize");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("document"));
  -[REMCRMergeableStringDocument replicaIDSource](self, "replicaIDSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("replicaIDSource"));

}

- (REMCRMergeableStringDocument)initWithCoder:(id)a3
{
  id v4;
  REMCRMergeableStringDocument *v5;
  uint64_t v6;
  REMReplicaIDSource *replicaIDSource;
  REMCRMergeableStringDocument *v8;
  TTMergeableStringVersionedDocument *v9;
  void *v10;
  uint64_t v11;
  TTMergeableStringVersionedDocument *document;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMCRMergeableStringDocument;
  v5 = -[REMCRMergeableStringDocument init](&v14, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replicaIDSource"));
  v6 = objc_claimAutoreleasedReturnValue();
  replicaIDSource = v5->_replicaIDSource;
  v5->_replicaIDSource = (REMReplicaIDSource *)v6;

  if (!v5->_replicaIDSource)
  {
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("document"));
  v8 = (REMCRMergeableStringDocument *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [TTMergeableStringVersionedDocument alloc];
    +[REMReplicaIDHelper nonEditingReplicaUUID](REMReplicaIDHelper, "nonEditingReplicaUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TTMergeableStringVersionedDocument initWithData:andReplicaID:](v9, "initWithData:andReplicaID:", v8, v10);
    document = v5->_document;
    v5->_document = (TTMergeableStringVersionedDocument *)v11;

LABEL_5:
    v8 = v5;
  }
LABEL_7:

  return v8;
}

- (TTMergeableAttributedString)mergeableString
{
  void *v2;
  void *v3;

  -[REMCRMergeableStringDocument document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTMergeableAttributedString *)v3;
}

- (NSAttributedString)attributedString
{
  void *v2;
  void *v3;
  void *v4;

  -[REMCRMergeableStringDocument document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (NSString)string
{
  void *v2;
  void *v3;

  -[REMCRMergeableStringDocument attributedString](self, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)mutableDocument
{
  REMMutableCRMergeableStringDocument *v3;
  void *v4;
  void *v5;
  REMMutableCRMergeableStringDocument *v6;

  v3 = [REMMutableCRMergeableStringDocument alloc];
  -[REMCRMergeableStringDocument replicaIDSource](self, "replicaIDSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCRMergeableStringDocument document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMMutableCRMergeableStringDocument initWithReplicaIDSource:immutableDocumentToEdit:](v3, "initWithReplicaIDSource:immutableDocumentToEdit:", v4, v5);

  return v6;
}

- (id)serializedData
{
  void *v2;
  void *v3;

  -[REMCRMergeableStringDocument document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  REMCRMergeableStringDocument *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (REMCRMergeableStringDocument *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMCRMergeableStringDocument document](self, "document");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCRMergeableStringDocument document](v4, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "rem_isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)mergedWithDocument:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  REMCRMergeableStringDocument *v19;
  void *v20;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[REMCRMergeableStringDocument replicaIDSource](self, "replicaIDSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crdtID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replicaIDSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "crdtID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[REMCRMergeableStringDocument mergedWithDocument:error:].cold.1(v22);

  }
  -[REMCRMergeableStringDocument document](self, "document");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReplicaIDHelper nonEditingReplicaUUID](REMReplicaIDHelper, "nonEditingReplicaUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rem_copyWithReplicaIDForNewEdits:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "document");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "mergeWithStringVersionedDocument:", v15);

  if (v16 == 1)
  {
    a4 = self;
  }
  else if (v16)
  {
    v19 = [REMCRMergeableStringDocument alloc];
    -[REMCRMergeableStringDocument replicaIDSource](self, "replicaIDSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = -[REMCRMergeableStringDocument initWithReplicaIDSource:document:](v19, "initWithReplicaIDSource:document:", v20, v14);

  }
  else if (a4)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = *MEMORY[0x1E0CB2D68];
    v24[0] = CFSTR("Failed to merge documents.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("REMCRMergeableStringDocument"), -1, v18);

    a4 = 0;
  }

  return a4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);
}

+ (id)documentFromSerializedData:(id)a3 replicaIDSource:(id)a4 forKey:(id)a5 ofObjectID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (a3)
  {
    v11 = a4;
    v12 = a3;
    v17 = 0;
    a3 = -[REMCRMergeableStringDocument initWithReplicaIDSource:serializedData:error:]([REMCRMergeableStringDocument alloc], "initWithReplicaIDSource:serializedData:error:", v11, v12, &v17);

    v13 = v17;
    if (!a3)
    {
      +[REMLog crdt](REMLog, "crdt");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v10;
        v20 = 2112;
        v21 = v9;
        v22 = 2112;
        v23 = v16;
        _os_log_error_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_ERROR, "Failed to deserialize mergeable string document {objectID: %@, key: %@}: %@", buf, 0x20u);

      }
    }

  }
  return a3;
}

- (void)mergedWithDocument:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (![self.replicaIDSource.crdtID isEqualToString:anotherDocument.replicaIDSource.crdtID]) -- Documents with different CRDT IDs cannot be merged.", v1, 2u);
}

@end
