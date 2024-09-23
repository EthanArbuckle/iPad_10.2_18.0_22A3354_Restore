@implementation CRRegisterGreatest

- (void)encodeWithCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::RegisterLatest *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 2)
  {
    v6 = *(CRDT::RegisterLatest **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 2;
    v6 = (CRDT::RegisterLatest *)operator new();
    CRDT::RegisterLatest::RegisterLatest(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[CRRegisterLatest encodeIntoProtobufRegisterLatest:coder:](self, "encodeIntoProtobufRegisterLatest:coder:", v6, v7);

}

- (CRRegisterGreatest)initWithCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CRRegisterGreatest *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 2)
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

- (int64_t)compare:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 0;
  }
  else if (v5)
  {
    if (v6)
      v8 = objc_msgSend(v5, "compare:", v6);
    else
      v8 = 1;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (void)setContents:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  objc_super v7;

  v4 = a3;
  -[CRRegisterLatest contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRRegisterGreatest compare:with:](self, "compare:with:", v5, v4);

  if (v6 == -1)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRRegisterGreatest;
    -[CRRegisterLatest setContents:](&v7, sel_setContents_, v4);
  }

}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge, classes must be equal for merge."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  -[CRRegisterGreatest mergeWithRegisterGreatest:](self, "mergeWithRegisterGreatest:", v5);

}

- (void)mergeWithRegisterGreatest:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CRRegisterLatest contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRRegisterGreatest compare:with:](self, "compare:with:", v4, v5);

  if (v6 == -1)
  {
    objc_msgSend(v9, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRegisterLatest _setContents:](self, "_setContents:", v7);

    objc_msgSend(v9, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRegisterLatest setTimestamp:](self, "setTimestamp:", v8);

  }
}

@end
