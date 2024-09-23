@implementation CNVCardDataStorage

+ (id)storageWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v4);

  return v5;
}

- (CNVCardDataStorage)initWithData:(id)a3
{
  id v5;
  CNVCardDataStorage *v6;
  CNVCardDataStorage *v7;
  CNVCardDataStorage *v8;

  v5 = a3;
  v6 = -[CNVCardDataStorage init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (void)appendString:(id)a3
{
  id v4;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
    -[CNVCardDataStorage appendString:usingEncoding:](self, "appendString:usingEncoding:", v4, 4);

}

- (void)appendString:(id)a3 usingEncoding:(unint64_t)a4
{
  NSMutableData *data;
  id v5;

  data = self->_data;
  objc_msgSend(a3, "dataUsingEncoding:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableData appendData:](data, "appendData:", v5);

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

  -[CNVCardDataStorage appendString:](self, "appendString:", v6);
}

- (void)appendData:(id)a3
{
  -[NSMutableData appendData:](self->_data, "appendData:", a3);
}

- (unint64_t)currentLength
{
  return -[NSMutableData length](self->_data, "length");
}

- (id)insertionMarker
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableData length](self->_data, "length"));
}

- (unint64_t)estimatedDataLength
{
  return -[NSMutableData length](self->_data, "length");
}

- (void)insertString:(id)a3 atMarker:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSMutableData *data;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    data = self->_data;
    v10 = objc_retainAutorelease(v7);
    -[NSMutableData replaceBytesInRange:withBytes:length:](data, "replaceBytesInRange:withBytes:length:", v8, 0, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
