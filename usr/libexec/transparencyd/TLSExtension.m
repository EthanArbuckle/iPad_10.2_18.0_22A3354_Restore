@implementation TLSExtension

- (id)data
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  if (-[TLSMessageClass encodeByte:buffer:](self, "encodeByte:buffer:", -[TLSExtension extensionType](self, "extensionType"), v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TLSExtension extensionData](self, "extensionData"));
    v5 = -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", v4, 0, 0xFFFFLL, v3);

    v6 = 0;
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v3));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  char *v8;
  TLSExtension *v9;
  char *v10;
  id v11;
  id v13;
  unsigned __int8 v14;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v8 = (char *)objc_msgSend(v6, "length") + (_QWORD)v7;
  v9 = objc_alloc_init(TLSExtension);
  v14 = 0;
  v10 = -[TLSMessageClass parseByte:end:result:](v9, "parseByte:end:result:", v5, v8, &v14);
  if (v10)
  {
    -[TLSExtension setExtensionType:](v9, "setExtensionType:", v14);
    v13 = 0;
    v10 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:](v9, "parseByteArray:end:minLength:maxLength:result:", v10, v8, 0, 0xFFFFLL, &v13);
    v11 = v13;
    if (v10)
    {
      -[TLSExtension setExtensionData:](v9, "setExtensionData:", v11);
      -[TLSExtension setParsedLength:](v9, "setParsedLength:", v10 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v6), "bytes"));
      v10 = v9;
    }

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  TLSExtension *v5;
  uint64_t v6;
  TLSExtension *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (TLSExtension *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(TLSExtension, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TLSExtension data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TLSExtension data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unsigned)extensionType
{
  return self->_extensionType;
}

- (void)setExtensionType:(unsigned __int8)a3
{
  self->_extensionType = a3;
}

- (NSData)extensionData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExtensionData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionData, 0);
}

@end
