@implementation OptInOut

- (OptInOut)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OptInOut;
  return -[OptInOut init](&v3, "init");
}

- (id)data
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  if (-[TLSMessageClass encodeBool:buffer:](self, "encodeBool:buffer:", -[OptInOut optIn](self, "optIn"), v3)
    && -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[OptInOut timestampMs](self, "timestampMs"), v3))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _BYTE *v15;
  _BYTE *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v22;
  unsigned __int8 v23;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = (char *)objc_msgSend(v8, "length") + (_QWORD)v9;
  v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  v23 = 0;
  v13 = objc_msgSend(v12, "parseBool:end:result:", v7, v10, &v23);
  if (!v13)
  {
    if (a4)
    {
      v18 = kTransparencyErrorDecode;
      v19 = CFSTR("failed to parse optIn BOOLean from OptInOut");
      v20 = -274;
LABEL_8:
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v18, v20, v19));
      goto LABEL_10;
    }
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v14 = v13;
  objc_msgSend(v12, "setOptIn:", v23);
  v22 = 0;
  v15 = objc_msgSend(v12, "parseUint64:end:result:", v14, v10, &v22);
  if (!v15)
  {
    if (a4)
    {
      v18 = kTransparencyErrorDecode;
      v19 = CFSTR("failed to parse timestampMs from OptInOut");
      v20 = -275;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v16 = v15;
  objc_msgSend(v12, "setTimestampMs:", v22);
  objc_msgSend(v12, "setParsedLength:", v16 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v8), "bytes"));
  v17 = v12;
LABEL_10:

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
  OptInOut *v5;
  uint64_t v6;
  OptInOut *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (OptInOut *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(OptInOut, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOut data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOut data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (IdsMutation)idsMutation
{
  return (IdsMutation *)objc_loadWeakRetained((id *)&self->_idsMutation);
}

- (void)setIdsMutation:(id)a3
{
  objc_storeWeak((id *)&self->_idsMutation, a3);
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (unint64_t)timestampMs
{
  return self->_timestampMs;
}

- (void)setTimestampMs:(unint64_t)a3
{
  self->_timestampMs = a3;
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
  objc_destroyWeak((id *)&self->_idsMutation);
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];

  v10[0] = CFSTR("optIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[OptInOut optIn](self, "optIn")));
  v11[0] = v3;
  v10[1] = CFSTR("timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[OptInOut timestampMs](self, "timestampMs") / 0x3E8)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_dateToString"));
  v11[1] = v5;
  v10[2] = CFSTR("timestampReadable");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[OptInOut timestampMs](self, "timestampMs") / 0x3E8)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_toISO_8601_UTCString"));
  v11[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));

  return v8;
}

@end
