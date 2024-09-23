@implementation TLPreviewTimelineError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLPreviewTimelineError)initWithErrorType:(int64_t)a3 errorDescription:(id)a4
{
  return -[TLPreviewTimelineError initWithErrorType:errorDescription:path:](self, "initWithErrorType:errorDescription:path:", a3, a4, 0);
}

- (TLPreviewTimelineError)initWithErrorType:(int64_t)a3 errorDescription:(id)a4 path:(id)a5
{
  id v8;
  id v9;
  TLPreviewTimelineError *v10;
  TLPreviewTimelineError *v11;
  uint64_t v12;
  NSString *errorDescription;
  uint64_t v14;
  NSString *path;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TLPreviewTimelineError;
  v10 = -[TLPreviewTimelineError init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_errorType = a3;
    v12 = objc_msgSend(v8, "copy");
    errorDescription = v11->_errorDescription;
    v11->_errorDescription = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    path = v11->_path;
    v11->_path = (NSString *)v14;

  }
  return v11;
}

- (TLPreviewTimelineError)initWithCoder:(id)a3
{
  id v4;
  TLPreviewTimelineError *v5;
  uint64_t v6;
  NSString *errorDescription;
  uint64_t v8;
  NSString *path;

  v4 = a3;
  v5 = -[TLPreviewTimelineError init](self, "init");
  if (v5)
  {
    v5->_errorType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("errorType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    errorDescription = v5->_errorDescription;
    v5->_errorDescription = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v8 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[TLPreviewTimelineError errorType](self, "errorType");
  -[TLPreviewTimelineError errorDescription](self, "errorDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TLPreviewTimelineError path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, CFSTR("errorType"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("errorDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("path"));

}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[TLPreviewTimelineError errorType](self, "errorType");
  -[TLPreviewTimelineError errorDescription](self, "errorDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[TLPreviewTimelineError path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "errorType");
    v6 = -[TLPreviewTimelineError errorType](self, "errorType");
    objc_msgSend(v4, "errorDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLPreviewTimelineError errorDescription](self, "errorDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v4, "errorDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLPreviewTimelineError errorDescription](self, "errorDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    objc_msgSend(v4, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLPreviewTimelineError path](self, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend(v4, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLPreviewTimelineError path](self, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

    }
    if (v5 == v6)
      v18 = v11;
    else
      v18 = 0;
    v12 = v18 & v17;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  TLPreviewTimelineError *v7;

  v4 = -[TLPreviewTimelineError errorType](self, "errorType", a3);
  -[TLPreviewTimelineError errorDescription](self, "errorDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLPreviewTimelineError path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TLPreviewTimelineError initWithErrorType:errorDescription:path:]([TLPreviewTimelineError alloc], "initWithErrorType:errorDescription:path:", v4, v5, v6);

  return v7;
}

- (int64_t)errorType
{
  return self->_errorType;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end
