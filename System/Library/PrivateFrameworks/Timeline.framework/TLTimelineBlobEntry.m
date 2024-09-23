@implementation TLTimelineBlobEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimelineBlobEntry)initWithBlob:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  TLTimelineBlobEntry *v8;
  uint64_t v9;
  NSData *blob;
  uint64_t v11;
  NSDate *tl_entryDate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLTimelineBlobEntry;
  v8 = -[TLTimelineBlobEntry init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    blob = v8->_blob;
    v8->_blob = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    tl_entryDate = v8->_tl_entryDate;
    v8->_tl_entryDate = (NSDate *)v11;

  }
  return v8;
}

- (TLTimelineBlobEntry)initWithCoder:(id)a3
{
  id v4;
  TLTimelineBlobEntry *v5;
  uint64_t v6;
  NSData *blob;
  uint64_t v8;
  NSDate *tl_entryDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TLTimelineBlobEntry;
  v5 = -[TLTimelineBlobEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blob"));
    v6 = objc_claimAutoreleasedReturnValue();
    blob = v5->_blob;
    v5->_blob = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v8 = objc_claimAutoreleasedReturnValue();
    tl_entryDate = v5->_tl_entryDate;
    v5->_tl_entryDate = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TLTimelineBlobEntry blob](self, "blob");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TLTimelineBlobEntry tl_entryDate](self, "tl_entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("blob"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

}

- (BOOL)tl_validate:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[TLTimelineBlobEntry blob](self, "blob");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimelineBlobEntry tl_entryDate](self, "tl_entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  if (v7)
  {
    v8 = &stru_24CE31080;
    if (v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(&stru_24CE31080, "stringByAppendingString:", CFSTR("Data is empty. "));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_3:
    -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("Date is nil. "));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v9;
  }
LABEL_4:
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (a3 && !v11)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v15 = CFSTR("description");
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("TLTimelineBlobEntryDomain"), 500, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TLTimelineBlobEntry blob](self, "blob");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TLTimelineBlobEntry tl_entryDate](self, "tl_entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "blob");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineBlobEntry blob](self, "blob");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "blob");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLTimelineBlobEntry blob](self, "blob");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    objc_msgSend(v4, "tl_entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLTimelineBlobEntry tl_entryDate](self, "tl_entryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v4, "tl_entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLTimelineBlobEntry tl_entryDate](self, "tl_entryDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

    }
    v10 = v9 & v15;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  TLTimelineBlobEntry *v6;

  -[TLTimelineBlobEntry blob](self, "blob", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimelineBlobEntry tl_entryDate](self, "tl_entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TLTimelineBlobEntry initWithBlob:atDate:]([TLTimelineBlobEntry alloc], "initWithBlob:atDate:", v4, v5);

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1500];
  -[TLTimelineBlobEntry tl_entryDate](self, "tl_entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1490];
  -[TLTimelineBlobEntry blob](self, "blob");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromByteCount:countStyle:", objc_msgSend(v10, "length"), 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@-%p: date: %@, size: %@, valid: %d>"), v5, self, v8, v11, -[TLTimelineBlobEntry tl_validate:](self, "tl_validate:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSDate)tl_entryDate
{
  return self->_tl_entryDate;
}

- (void)tl_setEntryDate:(id)a3
{
  objc_storeStrong((id *)&self->_tl_entryDate, a3);
}

- (NSData)blob
{
  return self->_blob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blob, 0);
  objc_storeStrong((id *)&self->_tl_entryDate, 0);
}

@end
