@implementation REMCRMergeableOrderedSet

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 document:(id)a4
{
  return -[REMCRMergeableOrderedSet initWithReplicaIDSource:document:undos:](self, "initWithReplicaIDSource:document:undos:", a3, a4, MEMORY[0x1E0C9AA60]);
}

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 document:(id)a4 undos:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMCRMergeableOrderedSet *v12;
  REMCRMergeableOrderedSet *v13;
  uint64_t v14;
  NSMutableArray *undos;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REMCRMergeableOrderedSet;
  v12 = -[REMCRMergeableOrderedSet init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replicaIDSource, a3);
    objc_storeStrong((id *)&v13->_document, a4);
    v14 = objc_msgSend(v11, "copy");
    undos = v13->_undos;
    v13->_undos = (NSMutableArray *)v14;

  }
  return v13;
}

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 orderedSet:(id)a4
{
  id v6;
  id v7;
  CRTTCompatibleDocument *v8;
  void *v9;
  CRTTCompatibleDocument *v10;
  CRTombstoneOrderedSet *v11;
  CRTombstoneOrderedSet *v12;
  REMCRMergeableOrderedSet *v13;
  _QWORD v15[4];
  CRTombstoneOrderedSet *v16;

  v6 = a4;
  v7 = a3;
  v8 = [CRTTCompatibleDocument alloc];
  +[REMReplicaIDHelper replicaUUIDForCreation](REMReplicaIDHelper, "replicaUUIDForCreation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRDocument initWithReplica:](v8, "initWithReplica:", v9);

  v11 = -[CRTombstoneOrderedSet initWithDocument:]([CRTombstoneOrderedSet alloc], "initWithDocument:", v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__REMCRMergeableOrderedSet_initWithReplicaIDSource_orderedSet___block_invoke;
  v15[3] = &unk_1E67F8F60;
  v16 = v11;
  v12 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);

  -[CRDocument setRootObject:](v10, "setRootObject:", v12);
  -[CRTTCompatibleDocument realizeLocalChanges](v10, "realizeLocalChanges");
  v13 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:document:](self, "initWithReplicaIDSource:document:", v7, v10);

  return v13;
}

uint64_t __63__REMCRMergeableOrderedSet_initWithReplicaIDSource_orderedSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (REMCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 serializedData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  REMCRMergeableOrderedSet *v11;

  v7 = a4;
  v8 = a3;
  +[REMReplicaIDHelper nonEditingReplicaUUID](REMReplicaIDHelper, "nonEditingReplicaUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRDocument unarchiveFromData:replica:](CRTTCompatibleDocument, "unarchiveFromData:replica:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:document:](self, "initWithReplicaIDSource:document:", v8, v10);
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMCRMergeableOrderedSet document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p document: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSOrderedSet)orderedSet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCRMergeableOrderedSet document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__REMCRMergeableOrderedSet_orderedSet__block_invoke;
  v9[3] = &unk_1E67F8F60;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v7;
}

uint64_t __38__REMCRMergeableOrderedSet_orderedSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", a2, a3);
}

- (BOOL)isEqual:(id)a3
{
  REMCRMergeableOrderedSet *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (REMCRMergeableOrderedSet *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMCRMergeableOrderedSet orderedSet](self, "orderedSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCRMergeableOrderedSet orderedSet](v4, "orderedSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToOrderedSet:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)count
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[REMCRMergeableOrderedSet document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[REMCRMergeableOrderedSet document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)indexOfEqualObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[REMCRMergeableOrderedSet document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfEqualObject:", v4);

  return v7;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMCRMergeableOrderedSet document](self, "document");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (id)mutableOrderedSet
{
  REMMutableCRMergeableOrderedSet *v3;
  void *v4;
  void *v5;
  void *v6;
  REMMutableCRMergeableOrderedSet *v7;

  v3 = [REMMutableCRMergeableOrderedSet alloc];
  -[REMCRMergeableOrderedSet replicaIDSource](self, "replicaIDSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCRMergeableOrderedSet document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCRMergeableOrderedSet undos](self, "undos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMMutableCRMergeableOrderedSet initWithReplicaIDSource:immutableDocumentToEdit:undos:](v3, "initWithReplicaIDSource:immutableDocumentToEdit:undos:", v4, v5, v6);

  return v7;
}

- (id)serializedData
{
  void *v2;
  void *v3;

  -[REMCRMergeableOrderedSet document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "archivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mergedOrderedSetWithOrderedSet:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  REMCRMergeableOrderedSet *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[REMCRMergeableOrderedSet document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReplicaIDHelper nonEditingReplicaUUID](REMReplicaIDHelper, "nonEditingReplicaUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "copyForReplica:", v8);

  objc_msgSend(v6, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "mergeWithDocument:", v10);
  if (v11 == 1)
  {
    a4 = self;
  }
  else if (v11)
  {
    v14 = [REMCRMergeableOrderedSet alloc];
    -[REMCRMergeableOrderedSet replicaIDSource](self, "replicaIDSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMCRMergeableOrderedSet undos](self, "undos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:document:undos:](v14, "initWithReplicaIDSource:document:undos:", v15, v9, v16);

  }
  else if (a4)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D68];
    v19[0] = CFSTR("Failed to merge CR documents.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("REMCRMergeableOrderedSet"), -1, v13);

    a4 = 0;
  }

  return a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  REMCRMergeableOrderedSet *v9;
  void *v10;
  void *v11;
  void *v12;
  REMCRMergeableOrderedSet *v13;

  v4 = (void *)MEMORY[0x1B5E3DEC4](self, a2, a3);
  -[REMCRMergeableOrderedSet document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCRMergeableOrderedSet document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replica");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "copyForReplica:", v7);

  v9 = [REMCRMergeableOrderedSet alloc];
  -[REMCRMergeableOrderedSet replicaIDSource](self, "replicaIDSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[REMCRMergeableOrderedSet undos](self, "undos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:document:undos:](v9, "initWithReplicaIDSource:document:undos:", v11, v8, v12);

  objc_autoreleasePoolPop(v4);
  return v13;
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
  -[REMCRMergeableOrderedSet replicaIDSource](self, "replicaIDSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("replicaIDSource"));

  -[REMCRMergeableOrderedSet document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "archivedData");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("document"));
}

- (REMCRMergeableOrderedSet)initWithCoder:(id)a3
{
  id v4;
  REMCRMergeableOrderedSet *v5;
  REMCRMergeableOrderedSet *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMCRMergeableOrderedSet;
  v5 = -[REMCRMergeableOrderedSet init](&v10, sel_init);
  if (!v5)
  {
LABEL_5:
    v5 = v5;
    v6 = v5;
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replicaIDSource"));
  v6 = (REMCRMergeableOrderedSet *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("document"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      v6 = 0;
      goto LABEL_7;
    }
    v8 = (void *)v7;
    v5 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:serializedData:error:](v5, "initWithReplicaIDSource:serializedData:error:", v6, v7, 0);

    goto LABEL_5;
  }
LABEL_7:

  return v6;
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
  objc_storeStrong((id *)&self->_replicaIDSource, a3);
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (NSMutableArray)undos
{
  return self->_undos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undos, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);
}

@end
