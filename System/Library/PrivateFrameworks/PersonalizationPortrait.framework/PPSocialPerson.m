@implementation PPSocialPerson

- (PPSocialPerson)initWithHandle:(id)a3 displayName:(id)a4
{
  id v7;
  id v8;
  PPSocialPerson *v9;
  PPSocialPerson *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSocialPerson;
  v9 = -[PPSocialPerson init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSocialPerson handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialPerson displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPSocialPerson ha:'%@' dn:'%@'>"), v4, v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("ha"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("dn"));

}

- (PPSocialPerson)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  PPSocialPerson *v14;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  pp_social_highlights_log_handle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("ha"), v5, 1, CFSTR("PPErrorDomain"), 23, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  v10 = objc_opt_class();
  pp_social_highlights_log_handle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("dn"), v5, 1, CFSTR("PPErrorDomain"), 23, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    self = -[PPSocialPerson initWithHandle:displayName:](self, "initWithHandle:displayName:", v8, v12);
    v14 = self;
  }

  return v14;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
