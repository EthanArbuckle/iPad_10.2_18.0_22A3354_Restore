@implementation CRRegisterLatest

- (CRRegisterLatest)initWithContents:(id)a3 document:(id)a4
{
  id v6;
  id v7;
  CRTimestamp *v8;
  void *v9;
  CRTimestamp *v10;
  CRRegisterLatest *v11;

  v6 = a3;
  v7 = a4;
  v8 = [CRTimestamp alloc];
  +[CRReplica unserialisedIdentifier](CRReplica, "unserialisedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRTimestamp initWithReplica:andCounter:](v8, "initWithReplica:andCounter:", v9, 0);

  v11 = -[CRRegisterLatest initWithContents:timestamp:document:](self, "initWithContents:timestamp:document:", v6, v10, v7);
  return v11;
}

- (CRRegisterLatest)initWithContents:(id)a3 timestamp:(id)a4 document:(id)a5
{
  id v9;
  id v10;
  CRRegisterLatest *v11;
  CRRegisterLatest *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRRegisterLatest;
  v11 = -[CRRegister initWithDocument:](&v14, sel_initWithDocument_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timestamp, a4);
    objc_storeStrong((id *)&v12->_contents, a3);
  }

  return v12;
}

- (void)encodeWithCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::RegisterLatest *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 1)
  {
    v6 = *(CRDT::RegisterLatest **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 1;
    v6 = (CRDT::RegisterLatest *)operator new();
    CRDT::RegisterLatest::RegisterLatest(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[CRRegisterLatest encodeIntoProtobufRegisterLatest:coder:](self, "encodeIntoProtobufRegisterLatest:coder:", v6, v7);

}

- (CRRegisterLatest)initWithCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CRRegisterLatest *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 1)
  {
    v6 = -[CRRegisterLatest initWithProtobufRegisterLatest:decoder:](self, "initWithProtobufRegisterLatest:decoder:", *(_QWORD *)(v5 + 40), v4);
  }
  else
  {
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRRegisterLatest initWithContents:document:](self, "initWithContents:document:", 0, v7);

  }
  return v6;
}

- (CRRegisterLatest)initWithProtobufRegisterLatest:(const void *)a3 decoder:(id)a4
{
  CRDT::RegisterLatest *v6;
  CRDT::RegisterLatest *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CRTimestamp *v12;
  void *v13;
  void *v14;
  CRTimestamp *v15;
  CRTimestamp *v16;
  CRTimestamp *v17;
  uint64_t v18;
  void *v19;
  CRRegisterLatest *v20;

  v6 = (CRDT::RegisterLatest *)a4;
  v7 = v6;
  v8 = *((_DWORD *)a3 + 8);
  if ((v8 & 2) != 0)
  {
    v10 = *((_QWORD *)a3 + 6);
    if (!v10)
      v10 = *(_QWORD *)(CRDT::RegisterLatest::default_instance(v6) + 48);
    -[CRDT::RegisterLatest decodeObjectForProtobufObjectID:](v7, "decodeObjectForProtobufObjectID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v8 = *((_DWORD *)a3 + 8);
    v9 = (void *)v11;
  }
  else
  {
    v9 = 0;
  }
  if ((v8 & 1) != 0)
  {
    v16 = [CRTimestamp alloc];
    v17 = v16;
    v18 = *((_QWORD *)a3 + 5);
    if (!v18)
      v18 = *(_QWORD *)(CRDT::RegisterLatest::default_instance((CRDT::RegisterLatest *)v16) + 40);
    v15 = -[CRTimestamp initWithProtobufTimestamp:decoder:](v17, "initWithProtobufTimestamp:decoder:", v18, v7);
  }
  else
  {
    v12 = [CRTimestamp alloc];
    -[CRDT::RegisterLatest document](v7, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replica");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CRTimestamp initWithReplica:andCounter:](v12, "initWithReplica:andCounter:", v14, 0);

  }
  -[CRDT::RegisterLatest document](v7, "document");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CRRegisterLatest initWithContents:timestamp:document:](self, "initWithContents:timestamp:document:", v9, v15, v19);

  return v20;
}

- (void)encodeIntoProtobufRegisterLatest:(void *)a3 coder:(id)a4
{
  void *v6;
  CRDT::Timestamp *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  CRDT::ObjectID *v12;
  id v13;

  v13 = a4;
  -[CRRegisterLatest timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a3 + 8) |= 1u;
  v7 = (CRDT::Timestamp *)*((_QWORD *)a3 + 5);
  if (!v7)
  {
    v7 = (CRDT::Timestamp *)operator new();
    CRDT::Timestamp::Timestamp(v7);
    *((_QWORD *)a3 + 5) = v7;
  }
  objc_msgSend(v6, "encodeIntoProtobufTimestamp:coder:", v7, v13);

  -[CRRegisterLatest contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CRRegisterLatest contents](self, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EF0FA208);

    if (v10)
    {
      -[CRRegisterLatest contents](self, "contents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)a3 + 8) |= 2u;
      v12 = (CRDT::ObjectID *)*((_QWORD *)a3 + 6);
      if (!v12)
      {
        v12 = (CRDT::ObjectID *)operator new();
        CRDT::ObjectID::ObjectID(v12);
        *((_QWORD *)a3 + 6) = v12;
      }
      objc_msgSend(v13, "encodeObject:forObjectID:", v11, v12);

    }
  }

}

- (id)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  CRTimestamp *v12;
  void *v13;
  CRTimestamp *v14;
  void *v15;
  CRDataType *v16;

  v16 = (CRDataType *)a3;
  if (self->_contents != v16)
  {
    objc_storeStrong((id *)&self->_contents, a3);
    -[CRRegisterLatest timestamp](self, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replica");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRReplica unserialisedIdentifier](CRReplica, "unserialisedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      -[CRRegister document](self, "document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "replicaClock");

      -[CRRegisterLatest timestamp](self, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "counter");

      if (v9 > v11)
        v11 = v9;
      v12 = [CRTimestamp alloc];
      +[CRReplica unserialisedIdentifier](CRReplica, "unserialisedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CRTimestamp initWithReplica:andCounter:](v12, "initWithReplica:andCounter:", v13, v11 + 1);
      -[CRRegisterLatest setTimestamp:](self, "setTimestamp:", v14);

    }
    -[CRRegister document](self, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDocumentFor:", v16);

  }
}

- (void)_setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (BOOL)isEqualContents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRRegisterLatest contents](self, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[CRRegisterLatest timestamp](self, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)realizeLocalChangesIn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CRTimestamp *v10;
  void *v11;
  CRTimestamp *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  -[CRRegisterLatest timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replica");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRReplica unserialisedIdentifier](CRReplica, "unserialisedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[CRRegisterLatest timestamp](self, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "counter"))
    {
      -[CRRegisterLatest timestamp](self, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "counter");

    }
    else
    {
      v9 = objc_msgSend(v15, "replicaClock") + 1;
    }

    v10 = [CRTimestamp alloc];
    objc_msgSend(v15, "replica");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CRTimestamp initWithReplica:andCounter:](v10, "initWithReplica:andCounter:", v11, v9);
    -[CRRegisterLatest setTimestamp:](self, "setTimestamp:", v12);

    v13 = objc_msgSend(v15, "unserializedReplicaClock");
    if (v9 <= v13)
      v14 = v13;
    else
      v14 = v9;
    objc_msgSend(v15, "setUnserializedReplicaClock:", v14);
  }

}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid CRRegisterLatest merge, classes must be equal for merge."), 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v4);
    }
    -[CRRegisterLatest mergeWithRegisterLatest:](self, "mergeWithRegisterLatest:", v5);
  }

}

- (void)mergeWithRegisterLatest:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CRRegisterLatest timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1)
  {
    objc_msgSend(v9, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRegisterLatest setContents:](self, "setContents:", v7);

    objc_msgSend(v9, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRegisterLatest setTimestamp:](self, "setTimestamp:", v8);

  }
}

- (void)setDocument:(id)a3
{
  id v4;
  void *v5;
  CRDataType *v6;
  CRDataType *contents;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRRegisterLatest;
  -[CRRegister setDocument:](&v8, sel_setDocument_, v4);
  -[CRRegisterLatest contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObject:", v5);
  v6 = (CRDataType *)objc_claimAutoreleasedReturnValue();
  contents = self->_contents;
  self->_contents = v6;

}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CRRegisterLatest *v13;
  void *v14;
  void *v15;
  CRRegisterLatest *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[CRRegisterLatest timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replica");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestampForReplica:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRegisterLatest timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  if (!v12)
  {
    -[CRRegisterLatest contents](self, "contents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deltaSince:in:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [CRRegisterLatest alloc];
      -[CRRegisterLatest timestamp](self, "timestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CRRegisterLatest initWithContents:timestamp:document:](v16, "initWithContents:timestamp:document:", v15, v17, v7);

      goto LABEL_7;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  if (v12 != -1)
    goto LABEL_6;
  v13 = self;
LABEL_7:

  return v13;
}

- (void)walkGraph:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[CRRegisterLatest contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRegisterLatest timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRRegisterLatest contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CRTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
