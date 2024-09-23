@implementation CNVCardStringStorage

+ (id)storageWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

- (CNVCardStringStorage)initWithString:(id)a3
{
  id v5;
  CNVCardStringStorage *v6;
  CNVCardStringStorage *v7;
  CNVCardStringStorage *v8;

  v5 = a3;
  v6 = -[CNVCardStringStorage init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_string, a3);
    v8 = v7;
  }

  return v7;
}

- (void)appendString:(id)a3
{
  id v4;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
    -[NSMutableString appendString:](self->_string, "appendString:", v4);

}

- (void)appendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[CNVCardStringStorage appendString:](self, "appendString:", v6);
}

- (void)appendData:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithData:encoding:", v5, 4);

  -[CNVCardStringStorage appendString:](self, "appendString:", v6);
}

- (unint64_t)currentLength
{
  return -[NSMutableString length](self->_string, "length");
}

- (id)insertionMarker
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableString length](self->_string, "length"));
}

- (unint64_t)estimatedDataLength
{
  void *v2;
  unint64_t v3;

  -[NSMutableString dataUsingEncoding:](self->_string, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (void)insertString:(id)a3 atMarker:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
    -[NSMutableString insertString:atIndex:](self->_string, "insertString:atIndex:", v7, objc_msgSend(v6, "unsignedIntegerValue"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
