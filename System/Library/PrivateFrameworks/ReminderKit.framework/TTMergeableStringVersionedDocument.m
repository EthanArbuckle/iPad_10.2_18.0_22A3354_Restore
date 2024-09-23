@implementation TTMergeableStringVersionedDocument

- (id)clockElementListForReplicaUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  TTVectorTimestampElement *v17;
  BOOL v18;
  REMClockElementList *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateIdsForLocalChanges");

  -[TTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "timestamps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "timestamps");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v21 = v7;
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "clockElementForUUID:", v4);
        v17 = (TTVectorTimestampElement *)objc_claimAutoreleasedReturnValue();
        v18 = v17 != 0;
        if (!v17)
          v17 = objc_alloc_init(TTVectorTimestampElement);
        v14 |= v18;
        objc_msgSend(v10, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);

    if ((v14 & 1) != 0)
      v19 = -[REMClockElementList initWithTTVectorTimestampElements:]([REMClockElementList alloc], "initWithTTVectorTimestampElements:", v10);
    else
      v19 = 0;
    v7 = v21;
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (id)rem_copyWithReplicaIDForNewEdits:(id)a3
{
  id v4;
  void *v5;
  TTMergeableStringVersionedDocument *v6;

  v4 = a3;
  -[TTVersionedDocument serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TTMergeableStringVersionedDocument initWithData:andReplicaID:]([TTMergeableStringVersionedDocument alloc], "initWithData:andReplicaID:", v5, v4);

  return v6;
}

- (BOOL)rem_isEqual:(id)a3
{
  TTMergeableStringVersionedDocument *v4;
  TTMergeableStringVersionedDocument *v5;
  TTMergeableStringVersionedDocument *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (TTMergeableStringVersionedDocument *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTMergeableStringVersionedDocument mergeableString](v6, "mergeableString");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[TTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TTMergeableStringVersionedDocument mergeableString](v6, "mergeableString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (TTMergeableStringVersionedDocument)initWithData:(id)a3 andReplicaID:(id)a4
{
  id v6;
  id v7;
  TTMergeableStringVersionedDocument *v8;
  TTMergeableAttributedString *v9;
  TTMergeableAttributedString *mergeableString;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTMergeableStringVersionedDocument;
  v8 = -[TTMergeableStringVersionedDocument init](&v12, sel_init);
  if (v8)
  {
    v9 = -[TTMergeableString initWithReplicaID:]([TTMergeableAttributedString alloc], "initWithReplicaID:", v7);
    mergeableString = v8->_mergeableString;
    v8->_mergeableString = v9;

    -[TTVersionedDocument loadData:](v8, "loadData:", v6);
  }

  return v8;
}

- (TTMergeableStringVersionedDocument)initWithMergeableString:(id)a3
{
  id v5;
  TTMergeableStringVersionedDocument *v6;
  TTMergeableStringVersionedDocument *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTMergeableStringVersionedDocument;
  v6 = -[TTMergeableStringVersionedDocument init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mergeableString, a3);
    -[TTVersionedDocument loadData:](v7, "loadData:", 0);
  }

  return v7;
}

- (TTMergeableStringVersionedDocument)initWithArchive:(const void *)a3 andReplicaID:(id)a4
{
  id v6;
  TTMergeableStringVersionedDocument *v7;
  TTMergeableAttributedString *v8;
  TTMergeableAttributedString *mergeableString;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TTMergeableStringVersionedDocument;
  v7 = -[TTMergeableStringVersionedDocument init](&v11, sel_init);
  if (v7)
  {
    v8 = -[TTMergeableString initWithReplicaID:]([TTMergeableAttributedString alloc], "initWithReplicaID:", v6);
    mergeableString = v7->_mergeableString;
    v7->_mergeableString = v8;

    -[TTVersionedDocument loadArchive:](v7, "loadArchive:", a3);
  }

  return v7;
}

- (unint64_t)mergeWithStringVersionedDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v4 = a3;
  -[TTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "mergeWithString:", v6);

  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)TTMergeableStringVersionedDocument;
    -[TTVersionedDocument mergeWithVersionedDocument:](&v9, sel_mergeWithVersionedDocument_, v4);
  }

  return v7;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  TTMergeableAttributedString *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = -[TTMergeableString initWithData:andReplicaID:]([TTMergeableAttributedString alloc], "initWithData:andReplicaID:", v7, 0);
  if (v5)
  {
    -[TTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeWithString:", v5);

  }
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  void *v4;
  void *v5;

  *a3 = +[TTMergeableStringVersionedDocument serializationVersion](TTMergeableStringVersionedDocument, "serializationVersion");
  -[TTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TTMergeableAttributedString)mergeableString
{
  return self->_mergeableString;
}

- (void)setMergeableString:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableString, 0);
}

@end
