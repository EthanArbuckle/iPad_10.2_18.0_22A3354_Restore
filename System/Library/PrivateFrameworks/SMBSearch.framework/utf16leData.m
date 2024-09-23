@implementation utf16leData

- (utf16leData)initWithStr:(id)a3
{
  id v4;
  utf16leData *v5;
  void *v6;
  objc_super v8;
  unsigned int v9;

  v4 = a3;
  v9 = 0;
  v8.receiver = self;
  v8.super_class = (Class)utf16leData;
  v5 = -[utf16leData init](&v8, sel_init);
  if (v5)
  {
    utf8_to_utf16le_data(v4, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)&v5->_datab, v6);
      v5->_charCount = v9;
      v5->_byteCount = objc_msgSend(v6, "length");
    }
    else
    {

      v5 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v5;
}

- (NSData)datab
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDatab:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)charCount
{
  return self->_charCount;
}

- (void)setCharCount:(unsigned int)a3
{
  self->_charCount = a3;
}

- (unsigned)byteCount
{
  return self->_byteCount;
}

- (void)setByteCount:(unsigned int)a3
{
  self->_byteCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datab, 0);
}

@end
