@implementation NFNdefMessageInternal

- (NFNdefMessageInternal)init
{
  NFNdefMessageInternal *v2;
  uint64_t v3;
  NSMutableArray *records;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFNdefMessageInternal;
  v2 = -[NFNdefMessageInternal init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    records = v2->_records;
    v2->_records = (NSMutableArray *)v3;

  }
  return v2;
}

- (NFNdefMessageInternal)initWithBytes:(const void *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  NFNdefMessageInternal *v6;
  uint64_t v7;
  NSMutableArray *records;
  void *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)NFNdefMessageInternal;
  v6 = -[NFNdefMessageInternal init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    records = v6->_records;
    v6->_records = (NSMutableArray *)v7;

    +[NFNdefRecordInternal recordsFromBytes:length:](NFNdefRecordInternal, "recordsFromBytes:length:", a3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[NSMutableArray addObjectsFromArray:](v6->_records, "addObjectsFromArray:", v9);

  }
  return v6;
}

- (NFNdefMessageInternal)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return -[NFNdefMessageInternal initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

- (NFNdefMessageInternal)initWithNDEFMessage:(id)a3
{
  id v4;
  NFNdefMessageInternal *v5;
  uint64_t v6;
  NSMutableArray *records;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NFNdefRecordInternal *v13;
  NFNdefRecordInternal *v14;
  NFNdefMessageInternal *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFNdefMessageInternal;
  v5 = -[NFNdefMessageInternal init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    records = v5->_records;
    v5->_records = (NSMutableArray *)v6;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "records", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = -[NFNdefRecordInternal initWithNDEFRecord:]([NFNdefRecordInternal alloc], "initWithNDEFRecord:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
          if (!v13)
          {

            v15 = 0;
            goto LABEL_13;
          }
          v14 = v13;
          -[NSMutableArray addObject:](v5->_records, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  v15 = v5;
LABEL_13:

  return v15;
}

- (NSArray)records
{
  return (NSArray *)self->_records;
}

+ (id)dataFromNDEFMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "records");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setMessageBegin:", v7 == 0);
      objc_msgSend(v3, "records");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMessageEnd:", v7 == objc_msgSend(v10, "count") - 1);

      objc_msgSend(v9, "asData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v11);

      ++v7;
      objc_msgSend(v3, "records");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v7 < v13);
  }

  return v4;
}

+ (id)decodeFromNDEFMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  unint64_t v27;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v3, "records");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "chunked"))
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setHeader:", objc_msgSend(v10, "header"));
        objc_msgSend(v11, "setChunked:", 0);
        objc_msgSend(v11, "setMessageEnd:", 1);
        objc_msgSend(v11, "setTypeNameFormat:", objc_msgSend(v10, "typeNameFormat"));
        objc_msgSend(v10, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setType:", v12);

        objc_msgSend(v10, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setIdentifier:", v13);

        v14 = objc_alloc(MEMORY[0x1E0C99DF0]);
        objc_msgSend(v10, "payload");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithData:", v15);

        v17 = v8 + 1;
        while (1)
        {
          v18 = v17;
          objc_msgSend(v3, "records");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v20 <= v18)
            break;
          objc_msgSend(v3, "records");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndex:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "payload");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appendData:", v23);

          v24 = objc_msgSend(v22, "chunked");
          v17 = v18 + 1;
          v10 = v22;
          if ((v24 & 1) == 0)
            goto LABEL_12;
        }
        v22 = v10;
LABEL_12:
        objc_msgSend(v11, "setPayload:", v16);
        objc_msgSend(v11, "decode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "length"))
          objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v25);

        v8 = v18;
      }
      else
      {
        objc_msgSend(v10, "decode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v11);
        v22 = v10;
      }

      v7 = ++v8;
      objc_msgSend(v3, "records");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

    }
    while (v27 > v8);
  }

  return v4;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)NFNdefMessageInternal;
  -[NFNdefMessageInternal description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { records %@ }"), v4, self->_records);

  return (NSString *)v5;
}

- (id)decode
{
  return +[NFNdefMessageInternal decodeFromNDEFMessage:](NFNdefMessageInternal, "decodeFromNDEFMessage:", self);
}

- (id)asData
{
  return +[NFNdefMessageInternal dataFromNDEFMessage:](NFNdefMessageInternal, "dataFromNDEFMessage:", self);
}

- (void)addRecord:(id)a3
{
  -[NSMutableArray addObject:](self->_records, "addObject:", a3);
}

- (void)addRecordArray:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_records, "addObjectsFromArray:", a3);
}

- (NFNdefMessageInternal)initWithCoder:(id)a3
{
  id v4;
  NFNdefMessageInternal *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *records;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFNdefMessageInternal;
  v5 = -[NFNdefMessageInternal init](&v10, sel_init);
  if (v5)
  {
    +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("records"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v6);
    records = v5->_records;
    v5->_records = (NSMutableArray *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_records, CFSTR("records"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
}

@end
