@implementation PLUUIDString

- (PLUUIDString)init
{
  return -[PLUUIDString initWithUUID:](self, "initWithUUID:", 0);
}

- (PLUUIDString)initWithUUIDData:(id)a3
{
  id v4;
  PLUUIDString *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "length") == 16)
  {
    v7.receiver = self;
    v7.super_class = (Class)PLUUIDString;
    v5 = -[PLUUIDString init](&v7, sel_init);
    if (v5)
    {
      uuid_copy(v5->_uuid, (const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v4), "bytes"));
      uuid_unparse(v5->_uuid, v5->_uuidString);
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (PLUUIDString)initWithCFUUID:(__CFUUID *)a3
{
  PLUUIDString *v4;
  PLUUIDString *v5;
  CFUUIDBytes v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLUUIDString;
  v4 = -[PLUUIDString init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v7 = CFUUIDGetUUIDBytes(a3);
      uuid_copy(v5->_uuid, &v7.byte0);
    }
    else
    {
      MEMORY[0x19AEC350C](v4->_uuid);
    }
    uuid_unparse(v5->_uuid, v5->_uuidString);
  }
  return v5;
}

- (PLUUIDString)initWithCFUUIDBytes:(id)a3
{
  $DCF20CAD073027CB89FDEFA7A9A33809 v4;

  v4 = a3;
  return -[PLUUIDString initWithUUID:](self, "initWithUUID:", &v4);
}

- (PLUUIDString)initWithUUID:(unsigned __int8)a3[16]
{
  PLUUIDString *v4;
  PLUUIDString *v5;
  unsigned __int8 *uuid;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLUUIDString;
  v4 = -[PLUUIDString init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    uuid = v4->_uuid;
    if (a3)
      uuid_copy(uuid, a3);
    else
      MEMORY[0x19AEC350C](uuid);
    uuid_unparse(v5->_uuid, v5->_uuidString);
  }
  return v5;
}

- (id)UUIDData
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_uuid, 16);
}

- ($DCF20CAD073027CB89FDEFA7A9A33809)UUIDBytes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  $DCF20CAD073027CB89FDEFA7A9A33809 result;

  v4 = 0;
  v5 = 0;
  uuid_copy((unsigned __int8 *)&v4, self->_uuid);
  v2 = v4;
  v3 = v5;
  result.var8 = v3;
  result.var9 = BYTE1(v3);
  result.var10 = BYTE2(v3);
  result.var11 = BYTE3(v3);
  result.var12 = BYTE4(v3);
  result.var13 = BYTE5(v3);
  result.var14 = BYTE6(v3);
  result.var15 = HIBYTE(v3);
  result.var0 = v2;
  result.var1 = BYTE1(v2);
  result.var2 = BYTE2(v2);
  result.var3 = BYTE3(v2);
  result.var4 = BYTE4(v2);
  result.var5 = BYTE5(v2);
  result.var6 = BYTE6(v2);
  result.var7 = HIBYTE(v2);
  return result;
}

- (unint64_t)length
{
  return 36;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return self->_uuidString[a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  char *v4;
  unsigned __int16 v5;

  if (a4.length)
  {
    v4 = &self->_uuidString[a4.location];
    do
    {
      v5 = *v4++;
      *a3++ = v5;
      --a4.length;
    }
    while (a4.length);
  }
}

- (BOOL)isEqualToString:(id)a3
{
  unsigned __int8 *v4;
  uint64_t v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = (unsigned __int8 *)a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = uuid_compare(self->_uuid, v4 + 8) == 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLUUIDString;
    v6 = -[PLUUIDString isEqualToString:](&v8, sel_isEqualToString_, v4);
  }

  return v6;
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  unsigned __int8 *v11;
  id v12;
  uint64_t v13;
  int64_t v14;
  int v15;
  objc_super v17;

  length = a5.length;
  location = a5.location;
  v11 = (unsigned __int8 *)a3;
  v12 = a6;
  v13 = objc_opt_class();
  if (v13 == objc_opt_class())
  {
    v15 = uuid_compare(self->_uuid, v11 + 8);
    if (v15 < 0)
      v14 = -1;
    else
      v14 = v15 != 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PLUUIDString;
    v14 = -[PLUUIDString compare:options:range:locale:](&v17, sel_compare_options_range_locale_, v11, a4, location, length, v12);
  }

  return v14;
}

- (const)UTF8String
{
  return self->_uuidString;
}

+ (id)UUIDString
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:", 0);
}

+ (unint64_t)UUIDStringLength
{
  return 36;
}

+ (BOOL)parseUUIDString:(id)a3 uuidBuffer:(char *)a4
{
  const char *v5;
  const char *v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint8_t uu[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4);
  if (v5)
  {
    v6 = v5;
    memset(uu, 0, 16);
    v7 = uuid_parse(v5, uu);
    v8 = v7 == 0;
    if (v7)
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315138;
        v13 = v6;
        _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "uuid_parse failed for assetUUIDCharString: %s", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      *(_OWORD *)a4 = *(_OWORD *)uu;
    }
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uu = 0;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "assetUUIDCharString is nil", uu, 2u);
    }

    return 0;
  }
  return v8;
}

@end
