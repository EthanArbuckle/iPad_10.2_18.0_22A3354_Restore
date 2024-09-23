@implementation IdsDeviceMutationWithExt

- (IdsDeviceMutationWithExt)init
{
  IdsDeviceMutationWithExt *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IdsDeviceMutationWithExt;
  v2 = -[IdsDeviceMutation init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[IdsDeviceMutationWithExt setExtensions:](v2, "setExtensions:", v3);

  }
  return v2;
}

- (id)data
{
  IdsDeviceMutationWithExt *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)IdsDeviceMutationWithExt;
  v3 = -[IdsDeviceMutation data](&v9, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutationWithExt extensions](v2, "extensions"));
  LODWORD(v2) = -[TLSMessageClass encodeExtensions:buffer:](v2, "encodeExtensions:buffer:", v6, v5);

  if ((_DWORD)v2)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char *v11;
  id v12;
  _BYTE *v13;
  id v14;
  void *v15;
  id v16;
  id v18;
  objc_super v19;

  v6 = a3;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___IdsDeviceMutationWithExt;
  v7 = objc_msgSendSuper2(&v19, "parseFromData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = objc_retainAutorelease(v6);
    v10 = objc_msgSend(v9, "bytes");
    v11 = (char *)objc_msgSend(v8, "parsedLength") + (_QWORD)v10;
    v12 = objc_retainAutorelease(v9);
    v18 = 0;
    v13 = objc_msgSend(v8, "parseExtensions:end:result:", v11, (char *)objc_msgSend(v12, "length") + (_QWORD)objc_msgSend(v12, "bytes"), &v18);
    v14 = v18;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v14));
      objc_msgSend(v8, "setExtensions:", v15);

      objc_msgSend(v8, "setParsedLength:", v13 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v12), "bytes"));
      v16 = v8;
    }
    else
    {
      v16 = 0;
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -248, CFSTR("failed to parse extensions from Mutation")));
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  IdsDeviceMutationWithExt *v5;
  uint64_t v6;
  IdsDeviceMutationWithExt *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (IdsDeviceMutationWithExt *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(IdsDeviceMutationWithExt, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutationWithExt data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutationWithExt data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end
