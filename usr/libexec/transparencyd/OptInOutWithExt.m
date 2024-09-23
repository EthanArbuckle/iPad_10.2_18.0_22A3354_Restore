@implementation OptInOutWithExt

- (OptInOutWithExt)initWithMutation:(id)a3
{
  id v4;
  OptInOutWithExt *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OptInOutWithExt;
  v5 = -[OptInOut init](&v8, "init");
  if (v5)
  {
    -[OptInOut setOptIn:](v5, "setOptIn:", objc_msgSend(v4, "optIn"));
    -[OptInOut setTimestampMs:](v5, "setTimestampMs:", objc_msgSend(v4, "timestampMs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extensions"));
    -[OptInOutWithExt setExtensions:](v5, "setExtensions:", v6);

  }
  return v5;
}

- (OptInOutWithExt)init
{
  OptInOutWithExt *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OptInOutWithExt;
  v2 = -[OptInOut init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[OptInOutWithExt setExtensions:](v2, "setExtensions:", v3);

  }
  return v2;
}

- (id)data
{
  OptInOutWithExt *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)OptInOutWithExt;
  v3 = -[OptInOut data](&v9, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutWithExt extensions](v2, "extensions"));
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
  _BYTE *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  objc_super v24;
  const __CFString *v25;
  void *v26;

  v6 = a3;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___OptInOutWithExt;
  v7 = objc_msgSendSuper2(&v24, "parseFromData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "bytes");
  v11 = (char *)objc_msgSend(v8, "parsedLength") + (_QWORD)v10;
  v12 = objc_retainAutorelease(v9);
  v23 = 0;
  v13 = objc_msgSend(v8, "parseExtensions:end:result:", v11, (char *)objc_msgSend(v12, "length") + (_QWORD)objc_msgSend(v12, "bytes"), &v23);
  v14 = v23;
  if (!v13)
  {
    v18 = kTransparencyErrorDecode;
    v25 = CFSTR("data");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
    v26 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:underlyingError:userinfo:description:", v18, -248, 0, v20, CFSTR("failed to parse extensions from OptInOut")));

    if (a4)
      *a4 = objc_retainAutorelease(v21);

    goto LABEL_7;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v14));
  objc_msgSend(v8, "setExtensions:", v15);

  v16 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
  objc_msgSend(v8, "setParsedLength:", v13 - v16);
  v17 = v8;
LABEL_8:

  return v17;
}

- (id)debugDescription
{
  const __CFString *v3;

  if (-[OptInOut optIn](self, "optIn"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\t\toptIn:%@\n\t\ttimestampMs:%llu\n}"), v3, -[OptInOut timestampMs](self, "timestampMs"));
}

- (id)description
{
  const __CFString *v3;

  if (-[OptInOut optIn](self, "optIn"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("optIn:%@; timestampMs:%llu"),
           v3,
           -[OptInOut timestampMs](self, "timestampMs"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  OptInOutWithExt *v5;
  uint64_t v6;
  OptInOutWithExt *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (OptInOutWithExt *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(OptInOutWithExt, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutWithExt data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutWithExt data](v7, "data"));

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
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end
