@implementation SXComponentTypeDescribing

+ (id)descriptionWithType:(id)a3 role:(int)a4
{
  id v5;
  _QWORD *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = (void *)v6[2];
  v6[2] = v5;

  *((_DWORD *)v6 + 2) = a4;
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SXComponentTypeDescribing role](self, "role");
  -[SXComponentTypeDescribing type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[SXComponentTypeDescribing role](self, "role");
  if (v5 == objc_msgSend(v4, "role"))
  {
    -[SXComponentTypeDescribing type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  -[SXComponentTypeDescribing type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionWithType:role:", v5, -[SXComponentTypeDescribing role](self, "role"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)type
{
  return self->_type;
}

- (int)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
