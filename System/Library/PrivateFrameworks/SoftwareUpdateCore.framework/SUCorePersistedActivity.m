@implementation SUCorePersistedActivity

- (id)init:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  SUCorePersistedActivity *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUCorePersistedActivity;
  v9 = -[SUCorePersistedActivity init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePersistedActivity *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (SUCorePersistedActivity *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)MEMORY[0x1E0DA8920];
      -[SUCorePersistedActivity activityName](v4, "activityName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "stringIsEqual:to:", v6, self->_activityName);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (SUCorePersistedActivity)initWithCoder:(id)a3
{
  id v4;
  SUCorePersistedActivity *v5;
  uint64_t v6;
  NSString *activityName;
  uint64_t v8;
  SUCoreActivityOptions *activityOptions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCorePersistedActivity;
  v5 = -[SUCorePersistedActivity init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityName"));
    v6 = objc_claimAutoreleasedReturnValue();
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityOptions"));
    v8 = objc_claimAutoreleasedReturnValue();
    activityOptions = v5->_activityOptions;
    v5->_activityOptions = (SUCoreActivityOptions *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *activityName;
  id v5;

  activityName = self->_activityName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activityName, CFSTR("activityName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityOptions, CFSTR("activityOptions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Name: %@ Options: {%@}"), self->_activityName, self->_activityOptions);
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
  objc_storeStrong((id *)&self->_activityName, a3);
}

- (SUCoreActivityOptions)activityOptions
{
  return self->_activityOptions;
}

- (void)setActivityOptions:(id)a3
{
  objc_storeStrong((id *)&self->_activityOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityOptions, 0);
  objc_storeStrong((id *)&self->_activityName, 0);
}

@end
