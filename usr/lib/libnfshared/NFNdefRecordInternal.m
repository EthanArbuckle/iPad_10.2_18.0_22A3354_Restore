@implementation NFNdefRecordInternal

+ (BOOL)parseRecordUsingScanner:(_NFDataScanner *)a3 header:(char *)a4 type:(id *)a5 identifier:(id *)a6 payload:(id *)a7
{
  void **Data;
  unint64_t var1;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  void **v25;
  void **v26;
  void **v27;

  LOBYTE(Data) = 0;
  if (!a4)
    return (char)Data;
  if (!a5)
    return (char)Data;
  if (!a6)
    return (char)Data;
  if (!a7)
    return (char)Data;
  LOBYTE(Data) = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a4 = 0;
  var1 = a3->var1;
  if (var1 + 1 > *((_QWORD *)a3->var0 + 1))
    return (char)Data;
  v13 = *(_QWORD *)a3->var0;
  a3->var1 = var1 + 1;
  v14 = *(_BYTE *)(v13 + var1);
  *a4 = v14;
  v15 = a3->var1;
  v16 = v15 + 1;
  v17 = *((_QWORD *)a3->var0 + 1);
  if (v15 + 1 > v17)
    goto LABEL_15;
  v18 = *(_QWORD *)a3->var0;
  a3->var1 = v16;
  v19 = *(unsigned __int8 *)(v18 + v15);
  if ((v14 & 0x10) == 0)
  {
    if (v15 + 5 <= v17)
    {
      v20 = 0;
      v21 = 0;
      v22 = v18 + v16;
      do
      {
        a3->var1 = v15 + v20 + 2;
        v21 = *(unsigned __int8 *)(v22 + v20++) | (v21 << 8);
      }
      while (v20 != 4);
      v23 = v15 + 5;
      if ((v14 & 8) != 0)
        goto LABEL_12;
LABEL_18:
      v24 = 0;
      goto LABEL_19;
    }
LABEL_15:
    LOBYTE(Data) = 0;
    return (char)Data;
  }
  v23 = v15 + 2;
  if (v23 > v17)
    goto LABEL_15;
  a3->var1 = v23;
  v21 = *(unsigned __int8 *)(v18 + v16);
  if ((v14 & 8) == 0)
    goto LABEL_18;
LABEL_12:
  if (v23 + 1 > v17)
    goto LABEL_15;
  a3->var1 = v23 + 1;
  v24 = *(unsigned __int8 *)(v18 + v23);
LABEL_19:
  if ((_DWORD)v19)
  {
    Data = NFDataScannerReadData(a3, v19);
    if (!Data)
      return (char)Data;
    v25 = Data;
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *Data, Data[1]);
    NFDataRelease(v25);
  }
  if (v24)
  {
    Data = NFDataScannerReadData(a3, v24);
    if (!Data)
      return (char)Data;
    v26 = Data;
    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *Data, Data[1]);
    NFDataRelease(v26);
  }
  if (v21)
  {
    Data = NFDataScannerReadData(a3, v21);
    if (!Data)
      return (char)Data;
    v27 = Data;
    *a7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *Data, Data[1]);
    NFDataRelease(v27);
  }
  LOBYTE(Data) = 1;
  return (char)Data;
}

+ (id)recordsFromBytes:(const void *)a3 length:(unsigned int)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  NFNdefRecordInternal *v16;
  NFNdefRecordInternal *v17;
  id v19;
  id v20;
  id v21;
  unsigned __int8 v22;

  v6 = (void *)objc_opt_new();
  v7 = NFDataCreateWithBytesNoCopy((uint64_t)a3, a4, 0);
  v8 = NFDataScannerCreateWithData((uint64_t)v7);
  v9 = v8;
  if (v8)
  {
    v10 = *v8;
    if (*v8)
    {
      do
      {
        v11 = *(_QWORD *)(v10 + 8);
        if (!v11 || v9[1] >= v11)
          break;
        v22 = 0;
        v20 = 0;
        v21 = 0;
        v19 = 0;
        v12 = +[NFNdefRecordInternal parseRecordUsingScanner:header:type:identifier:payload:](NFNdefRecordInternal, "parseRecordUsingScanner:header:type:identifier:payload:", v9, &v22, &v21, &v20, &v19);
        v13 = v21;
        v14 = v20;
        v15 = v19;
        if (v12)
        {
          v16 = [NFNdefRecordInternal alloc];
          v17 = -[NFNdefRecordInternal initWithHeader:type:identifier:payload:](v16, "initWithHeader:type:identifier:payload:", v22, v13, v14, v15);
          objc_msgSend(v6, "addObject:", v17);

        }
        v10 = *v9;
      }
      while (*v9);
    }
  }
  NFDataScannerRelease((uint64_t)v9);
  NFDataRelease(v7);
  return v6;
}

+ (id)recordsWithTNF:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6 chunkSize:(unint64_t)a7 outError:(unsigned int *)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  unint64_t v35;
  unint64_t v36;
  unsigned int v37;
  unint64_t v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_opt_new();
  if ((unint64_t)objc_msgSend(v14, "length") > 0xFF
    || (v17 = objc_msgSend(v13, "length"), v12 > 7)
    || v17 >= 0x100)
  {
    if (a8)
    {
      v23 = 0;
      v24 = 10;
LABEL_20:
      *a8 = v24;
      goto LABEL_37;
    }
LABEL_36:
    v23 = 0;
    goto LABEL_37;
  }
  if (objc_msgSend(v15, "length") < a7)
  {
LABEL_10:
    v20 = (void *)objc_opt_new();
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v20, "setShortRecord:", (unint64_t)objc_msgSend(v15, "length") < 0x100);
      objc_msgSend(v21, "setTypeNameFormat:", v12);
      objc_msgSend(v21, "setType:", v13);
      if (objc_msgSend(v14, "length"))
        v22 = v14;
      else
        v22 = 0;
      objc_msgSend(v21, "setIdentifier:", v22);
      objc_msgSend(v21, "setPayload:", v15);
      objc_msgSend(v16, "addObject:", v21);

      goto LABEL_15;
    }
LABEL_34:
    if (a8)
    {
      v23 = 0;
      v24 = 34;
      goto LABEL_20;
    }
    goto LABEL_36;
  }
  v37 = v12;
  v18 = objc_msgSend(v15, "length") / a7;
  if (objc_msgSend(v15, "length") % a7)
    v19 = v18 + 1;
  else
    v19 = v18;
  v38 = v19;
  if (v19)
  {
    v12 = v37;
    if (v19 == 1)
      goto LABEL_10;
    v25 = 0;
    v26 = 0;
    v36 = v19 - 1;
    v35 = (v19 - 1) * a7;
    while (1)
    {
      v27 = (void *)objc_opt_new();
      if (!v27)
        goto LABEL_34;
      v28 = v27;
      if (!v26)
        break;
      if (v36 != v26)
      {
        objc_msgSend(v27, "setTypeNameFormat:", 6);
        v30 = v25;
LABEL_31:
        v31 = a7;
        goto LABEL_32;
      }
      objc_msgSend(v27, "setChunked:", 1);
      objc_msgSend(v28, "setTypeNameFormat:", 6);
      v29 = objc_msgSend(v15, "length");
      v30 = v35;
      v31 = v29 - v35;
LABEL_32:
      objc_msgSend(v15, "subdataWithRange:", v30, v31, v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPayload:", v33);

      objc_msgSend(v16, "addObject:", v28);
      ++v26;
      v25 += a7;
      if (v38 == v26)
        goto LABEL_15;
    }
    objc_msgSend(v27, "setChunked:", 1);
    objc_msgSend(v28, "setTypeNameFormat:", v37);
    objc_msgSend(v28, "setType:", v13);
    if (objc_msgSend(v14, "length"))
      v32 = v14;
    else
      v32 = 0;
    objc_msgSend(v28, "setIdentifier:", v32, v35);
    v30 = 0;
    goto LABEL_31;
  }
LABEL_15:
  if (a8)
    *a8 = 0;
  v23 = v16;
LABEL_37:

  return v23;
}

- (NFNdefRecordInternal)init
{
  NFNdefRecordInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFNdefRecordInternal;
  result = -[NFNdefRecordInternal init](&v3, sel_init);
  if (result)
    result->_firstOctet = 0;
  return result;
}

- (NFNdefRecordInternal)initWithNDEFRecord:(id)a3
{
  id v4;
  NFNdefRecordInternal *v5;
  uint64_t v6;
  NSData *identifier;
  uint64_t v8;
  NSData *type;
  uint64_t v10;
  NSData *payload;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecordInternal;
  v5 = -[NFNdefRecordInternal init](&v13, sel_init);
  if (v5)
  {
    v5->_firstOctet = objc_msgSend(v4, "header");
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v6;

    objc_msgSend(v4, "type");
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSData *)v8;

    objc_msgSend(v4, "payload");
    v10 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;

  }
  return v5;
}

- (NFNdefRecordInternal)initWithHeader:(unsigned __int8)a3 type:(id)a4 identifier:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  NFNdefRecordInternal *v13;
  NFNdefRecordInternal *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NFNdefRecordInternal;
  v13 = -[NFNdefRecordInternal init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_firstOctet = a3;
    -[NFNdefRecordInternal setIdentifier:](v13, "setIdentifier:", v11);
    -[NFNdefRecordInternal setType:](v14, "setType:", v10);
    -[NFNdefRecordInternal setPayload:](v14, "setPayload:", v12);
  }

  return v14;
}

- (unsigned)header
{
  return self->_firstOctet;
}

- (void)setHeader:(unsigned __int8)a3
{
  self->_firstOctet = a3;
}

- (BOOL)messageBegin
{
  return self->_firstOctet >> 7;
}

- (void)setMessageBegin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  self->_firstOctet = v3 & 0x80 | self->_firstOctet & 0x7F;
}

- (BOOL)messageEnd
{
  return (self->_firstOctet >> 6) & 1;
}

- (void)setMessageEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xBF | v3;
}

- (BOOL)chunked
{
  return (self->_firstOctet >> 5) & 1;
}

- (void)setChunked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xDF | v3;
}

- (BOOL)shortRecord
{
  return (self->_firstOctet >> 4) & 1;
}

- (void)setShortRecord:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xEF | v3;
}

- (unsigned)typeNameFormat
{
  return self->_firstOctet & 7;
}

- (void)setTypeNameFormat:(unsigned __int8)a3
{
  self->_firstOctet = self->_firstOctet & 0xF8 | a3 & 7;
}

- (NSData)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (BOOL)_idLengthPresent
{
  return (self->_firstOctet >> 3) & 1;
}

- (void)_setIdLengthPresent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xF7 | v3;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  NSData *v4;
  NSData *identifier;
  NSData *v6;

  v6 = (NSData *)a3;
  if (v6)
  {
    -[NFNdefRecordInternal _setIdLengthPresent:](self, "_setIdLengthPresent:", 1);
    v4 = v6;
  }
  else
  {
    -[NFNdefRecordInternal _setIdLengthPresent:](self, "_setIdLengthPresent:", 0);
  }
  identifier = self->_identifier;
  self->_identifier = v6;

}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  id v5;
  NSUInteger v6;

  objc_storeStrong((id *)&self->_payload, a3);
  v5 = a3;
  v6 = -[NSData length](self->_payload, "length");

  -[NFNdefRecordInternal setShortRecord:](self, "setShortRecord:", v6 < 0x100);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  _BOOL8 v24;
  _BOOL8 v25;
  _BOOL8 v26;
  id v27;
  void *v28;
  objc_super v29;

  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  v29.receiver = self;
  v29.super_class = (Class)NFNdefRecordInternal;
  -[NFNdefRecordInternal description](&v29, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[NFNdefRecordInternal messageBegin](self, "messageBegin");
  v25 = -[NFNdefRecordInternal messageEnd](self, "messageEnd");
  v24 = -[NFNdefRecordInternal chunked](self, "chunked");
  v23 = -[NFNdefRecordInternal shortRecord](self, "shortRecord");
  -[NFNdefRecordInternal identifier](self, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v28, "length");
  v20 = -[NFNdefRecordInternal typeNameFormat](self, "typeNameFormat");
  -[NFNdefRecordInternal type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NFNdefRecordInternal type](self, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
  }
  else
  {
    v19 = 0;
  }
  -[NFNdefRecordInternal type](self, "type");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[NFNdefRecordInternal type](self, "type");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  -[NFNdefRecordInternal identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NFNdefRecordInternal identifier](self, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  -[NFNdefRecordInternal payload](self, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NFNdefRecordInternal payload](self, "payload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v17, "length");
  }
  else
  {
    v11 = 0;
  }
  -[NFNdefRecordInternal payload](self, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NFNdefRecordInternal payload](self, "payload");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v15 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("%@ { MB=%d ME=%d CF=%d SR=%d IL=%d TNF=%d Type Length=%d Type=%@ ID=%@ Payload Length=%d Payload=%@ }"), v3, v26, v25, v24, v23, v21, v20, v19, v6, v9, v11, v13);

  if (v10)
  if (v4)

  return (NSString *)v15;
}

- (id)asData
{
  return +[NFNdefRecordInternal dataFromRecord:](NFNdefRecordInternal, "dataFromRecord:", self);
}

- (id)decode
{
  return +[NFNdefRecordInternal decodeFromRecord:](NFNdefRecordInternal, "decodeFromRecord:", self);
}

- (BOOL)isURIRecord
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (-[NFNdefRecordInternal typeNameFormat](self, "typeNameFormat") == 1)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NFNdefRecordInternal type](self, "type");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "bytes");
    -[NFNdefRecordInternal type](self, "type");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithBytes:length:encoding:", v5, objc_msgSend((id)v6, "length"), 4);

    LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", CFSTR("U"));
    if ((v6 & 1) != 0)
      return 1;
  }
  else if (-[NFNdefRecordInternal typeNameFormat](self, "typeNameFormat") == 3)
  {
    return 1;
  }
  return 0;
}

- (NFNdefRecordInternal)initWithCoder:(id)a3
{
  id v4;
  NFNdefRecordInternal *v5;
  uint64_t v6;
  NSData *type;
  uint64_t v8;
  NSData *identifier;
  uint64_t v10;
  NSData *payload;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecordInternal;
  v5 = -[NFNdefRecordInternal init](&v13, sel_init);
  if (v5)
  {
    v5->_firstOctet = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("firstOctet"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v10 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *type;
  NSData *identifier;
  NSData *payload;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInt32:forKey:", self->_firstOctet, CFSTR("firstOctet"));
  type = self->_type;
  if (type)
    objc_msgSend(v8, "encodeObject:forKey:", type, CFSTR("type"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v8, "encodeObject:forKey:", identifier, CFSTR("id"));
  payload = self->_payload;
  v7 = v8;
  if (payload)
  {
    objc_msgSend(v8, "encodeObject:forKey:", payload, CFSTR("payload"));
    v7 = v8;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_decodeTextRecordLanguage:(id)a3
{
  id v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  void *v10;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  char *v21;
  void *specific;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v27;
  void *v28;
  objc_class *v29;
  int v30;
  void *v31;
  const char *v33;
  const char *Name;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v6 = (_BYTE *)objc_msgSend(v5, "bytes");
  v7 = *v6 & 0x1F;
  if ((*v6 & 0x1F) == 0)
  {
    v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v23)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v27 = 45;
        if (isMetaClass)
          v27 = 43;
        v23(4, "%c[%{public}s %{public}s]:%i Invalid language code length; dropping message",
          v27,
          ClassName,
          Name,
          431);
        v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v28 = dispatch_get_specific(v21);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v17 = (id)_NFSharedLogClient[(_QWORD)v28];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      v29 = object_getClass(a1);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      *(_DWORD *)buf = 67109890;
      v36 = v30;
      v37 = 2082;
      v38 = object_getClassName(a1);
      v39 = 2082;
      v40 = sel_getName(a2);
      v41 = 1024;
      v42 = 431;
      v20 = "%c[%{public}s %{public}s]:%i Invalid language code length; dropping message";
      goto LABEL_27;
    }
LABEL_31:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v8 = v6;
  if (objc_msgSend(v5, "length") >= (unint64_t)(v7 + 1))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v8 + 1, v7, 1);
    goto LABEL_30;
  }
  v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v10 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v10 >= 4)
    goto LABEL_31;
  v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v10);
  if (v11)
  {
    v12 = object_getClass(a1);
    v13 = class_isMetaClass(v12);
    v14 = object_getClassName(a1);
    v33 = sel_getName(a2);
    v15 = 45;
    if (v13)
      v15 = 43;
    v11(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v15, v14, v33, 436);
    v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v16 = dispatch_get_specific(v9);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v17 = (id)_NFSharedLogClient[(_QWORD)v16];
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    goto LABEL_28;
  v18 = object_getClass(a1);
  if (class_isMetaClass(v18))
    v19 = 43;
  else
    v19 = 45;
  *(_DWORD *)buf = 67109890;
  v36 = v19;
  v37 = 2082;
  v38 = object_getClassName(a1);
  v39 = 2082;
  v40 = sel_getName(a2);
  v41 = 1024;
  v42 = 436;
  v20 = "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message";
LABEL_27:
  _os_log_impl(&dword_1C34DB000, v17, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_28:

  v31 = 0;
LABEL_30:

  return v31;
}

+ (id)_decodeTextRecordText:(id)a3
{
  id v5;
  char *v6;
  char v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  unsigned __int8 *i;
  unsigned int v12;
  BOOL v13;
  int v14;
  BOOL v15;
  char *v16;
  void *v17;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *v19;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  char *v29;
  void *specific;
  void (*v31)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v35;
  void *v36;
  objc_class *v37;
  int v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  void *v44;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *v46;
  _BOOL4 v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  objc_class *v52;
  int v53;
  const char *v54;
  const char *v55;
  void *v56;
  const char *v58;
  const char *Name;
  const char *v60;
  const char *sel;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = *v6;
  v8 = (*v6 & 0x1F) + 1;
  if ((int)objc_msgSend(v5, "length") <= (int)v8)
  {
    v29 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v31 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v31)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v35 = 45;
        if (isMetaClass)
          v35 = 43;
        v31(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v35, ClassName, Name, 455);
        v29 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v36 = dispatch_get_specific(v29);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v10 = (id)_NFSharedLogClient[(_QWORD)v36];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v37 = object_getClass(a1);
        if (class_isMetaClass(v37))
          v38 = 43;
        else
          v38 = 45;
        *(_DWORD *)buf = 67109890;
        v63 = v38;
        v64 = 2082;
        v65 = object_getClassName(a1);
        v66 = 2082;
        v67 = sel_getName(a2);
        v68 = 1024;
        v69 = 455;
        _os_log_impl(&dword_1C34DB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message",
          buf,
          0x22u);
      }
      goto LABEL_54;
    }
LABEL_58:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  sel = a2;
  v9 = v7;
  v10 = objc_opt_new();
  if (objc_msgSend(v5, "length") > v8)
  {
    for (i = (unsigned __int8 *)&v6[v8]; i < (unsigned __int8 *)&v6[objc_msgSend(v5, "length")]; ++i)
    {
      if ((v9 & 0x80000000) == 0
        && (v12 = *i, v12 <= 0x1F)
        && ((v13 = v12 > 0xD, v14 = (1 << v12) & 0x2500, !v13) ? (v15 = v14 == 0) : (v15 = 1), v15))
      {
        v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v17 >= 4)
          goto LABEL_58;
        v18 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v17);
        if (v18)
        {
          v19 = object_getClass(a1);
          v20 = class_isMetaClass(v19);
          v21 = object_getClassName(a1);
          v58 = sel_getName(sel);
          v22 = 45;
          if (v20)
            v22 = 43;
          v18(4, "%c[%{public}s %{public}s]:%i Invalid character found, skipping", v22, v21, v58, 463);
          v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v23 = dispatch_get_specific(v16);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v24 = (id)_NFSharedLogClient[(_QWORD)v23];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = object_getClass(a1);
          if (class_isMetaClass(v25))
            v26 = 43;
          else
            v26 = 45;
          v27 = object_getClassName(a1);
          v28 = sel_getName(sel);
          *(_DWORD *)buf = 67109890;
          v63 = v26;
          v64 = 2082;
          v65 = v27;
          v66 = 2082;
          v67 = v28;
          v68 = 1024;
          v69 = 463;
          _os_log_impl(&dword_1C34DB000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid character found, skipping", buf, 0x22u);
        }

      }
      else
      {
        -[NSObject appendBytes:length:](v10, "appendBytes:length:", i, 1);
      }
    }
  }
  if (!-[NSObject length](v10, "length"))
  {
    v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v44 < 4)
    {
      v45 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v44);
      if (v45)
      {
        v46 = object_getClass(a1);
        v47 = class_isMetaClass(v46);
        v48 = object_getClassName(a1);
        v60 = sel_getName(sel);
        v49 = 45;
        if (v47)
          v49 = 43;
        v45(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v49, v48, v60, 470);
        v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v50 = dispatch_get_specific(v43);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v51 = (id)_NFSharedLogClient[(_QWORD)v50];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = object_getClass(a1);
        if (class_isMetaClass(v52))
          v53 = 43;
        else
          v53 = 45;
        v54 = object_getClassName(a1);
        v55 = sel_getName(sel);
        *(_DWORD *)buf = 67109890;
        v63 = v53;
        v64 = 2082;
        v65 = v54;
        v66 = 2082;
        v67 = v55;
        v68 = 1024;
        v69 = 470;
        _os_log_impl(&dword_1C34DB000, v51, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message",
          buf,
          0x22u);
      }

LABEL_54:
      v56 = 0;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  v39 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = objc_retainAutorelease(v10);
  v40 = -[NSObject bytes](v10, "bytes");
  v41 = -[NSObject length](v10, "length");
  if (v9 < 0)
    v42 = 10;
  else
    v42 = 4;
  v56 = (void *)objc_msgSend(v39, "initWithBytes:length:encoding:", v40, v41, v42);
LABEL_57:

  return v56;
}

+ (id)_decodeTextRecord:(id)a3
{
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  char *v12;
  void *v13;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  int v21;
  char *v22;
  void *specific;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v34;
  const char *Name;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    +[NFNdefRecordInternal _decodeTextRecordLanguage:](NFNdefRecordInternal, "_decodeTextRecordLanguage:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = &stru_1E7D801F8;
    if (v6)
    {
      +[NFNdefRecordInternal _decodeTextRecordText:](NFNdefRecordInternal, "_decodeTextRecordText:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("'%@' : %@"), v6, v8);
        v10 = (void *)v9;
        if (v9)
          v11 = (__CFString *)v9;
        else
          v11 = &stru_1E7D801F8;
        v7 = v11;

LABEL_34:
        goto LABEL_35;
      }
      v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific < 4)
      {
        v24 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
        if (v24)
        {
          Class = object_getClass(a1);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(a1);
          Name = sel_getName(a2);
          v28 = 45;
          if (isMetaClass)
            v28 = 43;
          v24(4, "%c[%{public}s %{public}s]:%i Invalid payload encoding; dropping message",
            v28,
            ClassName,
            Name,
            496);
          v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v29 = dispatch_get_specific(v22);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v30 = (id)_NFSharedLogClient[(_QWORD)v29];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = object_getClass(a1);
          if (class_isMetaClass(v31))
            v32 = 43;
          else
            v32 = 45;
          *(_DWORD *)buf = 67109890;
          v37 = v32;
          v38 = 2082;
          v39 = object_getClassName(a1);
          v40 = 2082;
          v41 = sel_getName(a2);
          v42 = 1024;
          v43 = 496;
          _os_log_impl(&dword_1C34DB000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload encoding; dropping message",
            buf,
            0x22u);
        }

        v7 = &stru_1E7D801F8;
        goto LABEL_34;
      }
LABEL_36:
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
  }
  else
  {
    v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v13 >= 4)
      goto LABEL_36;
    v14 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v13);
    if (v14)
    {
      v15 = object_getClass(a1);
      v16 = class_isMetaClass(v15);
      v17 = object_getClassName(a1);
      v34 = sel_getName(a2);
      v18 = 45;
      if (v16)
        v18 = 43;
      v14(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v18, v17, v34, 485);
      v12 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v19 = dispatch_get_specific(v12);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v6 = (id)_NFSharedLogClient[(_QWORD)v19];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(a1);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67109890;
      v37 = v21;
      v38 = 2082;
      v39 = object_getClassName(a1);
      v40 = 2082;
      v41 = sel_getName(a2);
      v42 = 1024;
      v43 = 485;
      _os_log_impl(&dword_1C34DB000, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message",
        buf,
        0x22u);
    }
    v7 = &stru_1E7D801F8;
  }
LABEL_35:

  return v7;
}

+ (id)_decodeURIRecord:(id)a3
{
  id v5;
  char *v6;
  void *specific;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  id v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned int v22;
  char *v23;
  void *v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  objc_class *v31;
  int v32;
  __CFString *v33;
  id v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  uint64_t v41;
  __CFString *v42;
  char *v43;
  void *v44;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *v46;
  _BOOL4 v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  objc_class *v51;
  int v52;
  char *v53;
  void *v54;
  void (*v55)(uint64_t, const char *, ...);
  objc_class *v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  int v63;
  const char *Name;
  const char *v66;
  const char *v67;
  const char *v68;
  uint8_t buf[4];
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "length") <= 1)
  {
    v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v8 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v8)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v12 = 45;
        if (isMetaClass)
          v12 = 43;
        v8(4, "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message", v12, ClassName, Name, 509);
        v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v13 = dispatch_get_specific(v6);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v14 = (id)_NFSharedLogClient[(_QWORD)v13];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = object_getClass(a1);
        if (class_isMetaClass(v15))
          v16 = 43;
        else
          v16 = 45;
        *(_DWORD *)buf = 67109890;
        v70 = v16;
        v71 = 2082;
        v72 = object_getClassName(a1);
        v73 = 2082;
        v74 = sel_getName(a2);
        v75 = 1024;
        v76 = 509;
        v17 = "%c[%{public}s %{public}s]:%i Invalid payload length; dropping message";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
LABEL_67:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v18 = objc_retainAutorelease(v5);
  v19 = (unsigned __int8 *)objc_msgSend(v18, "bytes");
  v20 = v19 + 1;
  v21 = *v19;
  do
  {
    if (v20 >= &v19[objc_msgSend(v18, "length")])
    {
      v34 = objc_retainAutorelease(v18);
      v35 = objc_msgSend(v34, "bytes") + 1;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v35, objc_msgSend(v34, "length") - 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%02x"), v21);
      if (v36)
      {
        objc_msgSend(&unk_1E7D88B98, "objectForKeyedSubscript:", v36);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = objc_alloc(MEMORY[0x1E0CB3940]);
        v39 = objc_retainAutorelease(v14);
        v40 = (__CFString *)objc_msgSend(v38, "initWithBytes:length:encoding:", -[NSObject bytes](v39, "bytes"), -[NSObject length](v39, "length"), 4);
        if (-[__CFString length](v40, "length"))
        {
          if (v37)
          {
            v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v37, v40);

            v40 = (__CFString *)v41;
          }
          v42 = &stru_1E7D801F8;
          if (v40)
            v42 = v40;
          v33 = v42;
        }
        else
        {
          v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v54 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v54 >= 4)
            goto LABEL_67;
          v55 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v54);
          if (v55)
          {
            v56 = object_getClass(a1);
            v57 = class_isMetaClass(v56);
            v58 = object_getClassName(a1);
            v68 = sel_getName(a2);
            v59 = 45;
            if (v57)
              v59 = 43;
            v55(4, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message", v59, v58, v68, 577);
            v53 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v60 = dispatch_get_specific(v53);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v61 = (id)_NFSharedLogClient[(_QWORD)v60];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            v62 = object_getClass(a1);
            if (class_isMetaClass(v62))
              v63 = 43;
            else
              v63 = 45;
            *(_DWORD *)buf = 67109890;
            v70 = v63;
            v71 = 2082;
            v72 = object_getClassName(a1);
            v73 = 2082;
            v74 = sel_getName(a2);
            v75 = 1024;
            v76 = 577;
            _os_log_impl(&dword_1C34DB000, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message",
              buf,
              0x22u);
          }

          v33 = &stru_1E7D801F8;
        }

      }
      else
      {
        v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v44 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v44 >= 4)
          goto LABEL_67;
        v45 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v44);
        if (v45)
        {
          v46 = object_getClass(a1);
          v47 = class_isMetaClass(v46);
          v48 = object_getClassName(a1);
          v67 = sel_getName(a2);
          v49 = 45;
          if (v47)
            v49 = 43;
          v45(4, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message", v49, v48, v67, 568);
          v43 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v50 = dispatch_get_specific(v43);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v37 = (id)_NFSharedLogClient[(_QWORD)v50];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v51 = object_getClass(a1);
          if (class_isMetaClass(v51))
            v52 = 43;
          else
            v52 = 45;
          *(_DWORD *)buf = 67109890;
          v70 = v52;
          v71 = 2082;
          v72 = object_getClassName(a1);
          v73 = 2082;
          v74 = sel_getName(a2);
          v75 = 1024;
          v76 = 568;
          _os_log_impl(&dword_1C34DB000, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid URI; dropping message",
            buf,
            0x22u);
        }
        v33 = &stru_1E7D801F8;
      }

      goto LABEL_66;
    }
    v22 = *v20++;
  }
  while (v22 > 0x1F);
  v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v24 >= 4)
    goto LABEL_67;
  v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v24);
  if (v25)
  {
    v26 = object_getClass(a1);
    v27 = class_isMetaClass(v26);
    v28 = object_getClassName(a1);
    v66 = sel_getName(a2);
    v29 = 45;
    if (v27)
      v29 = 43;
    v25(4, "%c[%{public}s %{public}s]:%i Invalid payload character; dropping message", v29, v28, v66, 558);
    v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v30 = dispatch_get_specific(v23);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v14 = (id)_NFSharedLogClient[(_QWORD)v30];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v31 = object_getClass(a1);
    if (class_isMetaClass(v31))
      v32 = 43;
    else
      v32 = 45;
    *(_DWORD *)buf = 67109890;
    v70 = v32;
    v71 = 2082;
    v72 = object_getClassName(a1);
    v73 = 2082;
    v74 = sel_getName(a2);
    v75 = 1024;
    v76 = 558;
    v17 = "%c[%{public}s %{public}s]:%i Invalid payload character; dropping message";
LABEL_29:
    _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
  }
LABEL_30:
  v33 = &stru_1E7D801F8;
LABEL_66:

  return v33;
}

+ (id)decodeFromRecord:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  char *v22;
  void *specific;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  char *v33;
  void *v34;
  void (*v35)(uint64_t, const char *, ...);
  objc_class *v36;
  _BOOL4 v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  objc_class *v41;
  int v42;
  const char *Name;
  const char *v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "typeNameFormat") == 1)
  {
    objc_msgSend(v5, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v5, "type");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "bytes");
      objc_msgSend(v5, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v8, "initWithBytes:length:encoding:", v10, objc_msgSend(v11, "length"), 4);

      if (objc_msgSend(v12, "isEqualToString:", CFSTR("T")))
      {
        objc_msgSend(v5, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFNdefRecordInternal _decodeTextRecord:](NFNdefRecordInternal, "_decodeTextRecord:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v21 = (__CFString *)v14;

        goto LABEL_39;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("U")))
      {
        objc_msgSend(v5, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFNdefRecordInternal _decodeURIRecord:](NFNdefRecordInternal, "_decodeURIRecord:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }

LABEL_38:
      v21 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v5);
      goto LABEL_39;
    }
    v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v24 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v24)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v28 = 45;
        if (isMetaClass)
          v28 = 43;
        v24(3, "%c[%{public}s %{public}s]:%i 0 record type length; unable to decode", v28, ClassName, Name, 592);
        v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v29 = dispatch_get_specific(v22);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v30 = (id)_NFSharedLogClient[(_QWORD)v29];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      v31 = object_getClass(a1);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      *(_DWORD *)buf = 67109890;
      v47 = v32;
      v48 = 2082;
      v49 = object_getClassName(a1);
      v50 = 2082;
      v51 = sel_getName(a2);
      v52 = 1024;
      v53 = 592;
LABEL_35:
      _os_log_impl(&dword_1C34DB000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i 0 record type length; unable to decode",
        buf,
        0x22u);
LABEL_36:

      v21 = &stru_1E7D801F8;
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  if (objc_msgSend(v5, "typeNameFormat") != 3)
    goto LABEL_38;
  objc_msgSend(v5, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
  {
    v33 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v34 < 4)
    {
      v35 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v34);
      if (v35)
      {
        v36 = object_getClass(a1);
        v37 = class_isMetaClass(v36);
        v38 = object_getClassName(a1);
        v45 = sel_getName(a2);
        v39 = 45;
        if (v37)
          v39 = 43;
        v35(3, "%c[%{public}s %{public}s]:%i 0 record type length; unable to decode", v39, v38, v45, 605);
        v33 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v40 = dispatch_get_specific(v33);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v30 = (id)_NFSharedLogClient[(_QWORD)v40];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      v41 = object_getClass(a1);
      if (class_isMetaClass(v41))
        v42 = 43;
      else
        v42 = 45;
      *(_DWORD *)buf = 67109890;
      v47 = v42;
      v48 = 2082;
      v49 = object_getClassName(a1);
      v50 = 2082;
      v51 = sel_getName(a2);
      v52 = 1024;
      v53 = 605;
      goto LABEL_35;
    }
LABEL_40:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "type");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend(v18, "bytes");
  objc_msgSend(v5, "type");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (__CFString *)objc_msgSend(v17, "initWithBytes:length:encoding:", v19, objc_msgSend(v20, "length"), 4);

LABEL_39:
  return v21;
}

+ (id)dataFromRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v37;
  char v38;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v38 = 0;
  v37 = objc_msgSend(v3, "header");
  objc_msgSend(v4, "appendBytes:length:", &v37, 1);
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if (!objc_msgSend(v3, "typeNameFormat"))
  {
    v38 = 0;
    objc_msgSend(v4, "appendBytes:length:", &v38, 1);
    v38 = 0;
    objc_msgSend(v4, "appendBytes:length:", &v38, 1);
    goto LABEL_26;
  }
  objc_msgSend(v3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v6, "length");

  objc_msgSend(v4, "appendBytes:length:", &v38, 1);
  if (objc_msgSend(v3, "shortRecord"))
  {
    v38 = 0;
    objc_msgSend(v3, "payload");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v3, "payload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        objc_msgSend(v3, "payload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v11, "length");

      }
    }
  }
  else
  {
    objc_msgSend(v3, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "payload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        objc_msgSend(v3, "payload");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v15, "length");

      }
      else
      {
        LODWORD(v12) = 0;
      }
    }
    v38 = BYTE3(v12);
    objc_msgSend(v4, "appendBytes:length:", &v38, 1);
    v38 = BYTE2(v12);
    objc_msgSend(v4, "appendBytes:length:", &v38, 1);
    v38 = BYTE1(v12);
    objc_msgSend(v4, "appendBytes:length:", &v38, 1);
    v38 = (char)v12;
  }
  objc_msgSend(v4, "appendBytes:length:", &v38, 1);
  objc_msgSend(v3, "identifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v3, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      objc_msgSend(v3, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v20, "length");

      objc_msgSend(v4, "appendBytes:length:", &v38, 1);
    }
  }
  objc_msgSend(v3, "type");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(v3, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v24)
    {
      objc_msgSend(v3, "type");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v25);

    }
  }
  objc_msgSend(v3, "identifier");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(v3, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29)
    {
      objc_msgSend(v3, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v30);

    }
  }
  objc_msgSend(v3, "payload");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v3, "payload");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    if (v34)
    {
      objc_msgSend(v3, "payload");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v35);

    }
  }
LABEL_26:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
