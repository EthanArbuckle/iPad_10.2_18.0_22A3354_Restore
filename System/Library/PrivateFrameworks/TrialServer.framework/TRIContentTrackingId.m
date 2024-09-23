@implementation TRIContentTrackingId

- (TRIContentTrackingId)initWithStr:(id)a3
{
  id v6;
  TRIContentTrackingId *v7;
  TRIContentTrackingId *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("str != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIContentTrackingId;
  v7 = -[TRIContentTrackingId init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_str, a3);

  return v8;
}

+ (id)contentIdWithStr:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStr:", v4);

  return v5;
}

- (id)copyWithReplacementStr:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStr:", v3);

  return v4;
}

- (BOOL)isEqualToContentId:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *str;
  void *v10;
  char v11;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (v6 = self->_str != 0,
        objc_msgSend(v4, "str"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    v11 = 0;
  }
  else
  {
    str = self->_str;
    if (str)
    {
      objc_msgSend(v5, "str");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSString isEqual:](str, "isEqual:", v10);

    }
    else
    {
      v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  TRIContentTrackingId *v4;
  TRIContentTrackingId *v5;
  BOOL v6;

  v4 = (TRIContentTrackingId *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIContentTrackingId isEqualToContentId:](self, "isEqualToContentId:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_str, "hash");
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIContentTrackingId | str:%@>"), self->_str);
}

- (NSString)str
{
  return self->_str;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_str, 0);
}

@end
