@implementation TRISizedCKRecordID

- (TRISizedCKRecordID)initWithRecordId:(id)a3 downloadSize:(unint64_t)a4
{
  id v8;
  TRISizedCKRecordID *v9;
  TRISizedCKRecordID *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2876, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRISizedCKRecordID;
  v9 = -[TRISizedCKRecordID init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordId, a3);
    v10->_downloadSize = a4;
  }

  return v10;
}

+ (id)recordIDWithRecordId:(id)a3 downloadSize:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRecordId:downloadSize:", v6, a4);

  return v7;
}

- (id)copyWithReplacementRecordId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRecordId:downloadSize:", v4, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRecordId:downloadSize:", self->_recordId, a3);
}

- (BOOL)isEqualToRecordID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  CKRecordID *recordId;
  void *v10;
  int v11;
  unint64_t downloadSize;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = self->_recordId != 0;
  objc_msgSend(v4, "recordId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8
    || (recordId = self->_recordId) != 0
    && (objc_msgSend(v5, "recordId"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[CKRecordID isEqual:](recordId, "isEqual:", v10),
        v10,
        !v11))
  {
LABEL_6:
    v13 = 0;
  }
  else
  {
    downloadSize = self->_downloadSize;
    v13 = downloadSize == objc_msgSend(v5, "downloadSize");
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRISizedCKRecordID *v4;
  TRISizedCKRecordID *v5;
  BOOL v6;

  v4 = (TRISizedCKRecordID *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRISizedCKRecordID isEqualToRecordID:](self, "isEqualToRecordID:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[CKRecordID hash](self->_recordId, "hash");
  return self->_downloadSize - v3 + 32 * v3;
}

- (id)description
{
  id v3;
  CKRecordID *recordId;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  recordId = self->_recordId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_downloadSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRISizedCKRecordID | recordId:%@ downloadSize:%@>"), recordId, v5);

  return v6;
}

- (CKRecordID)recordId
{
  return self->_recordId;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordId, 0);
}

@end
