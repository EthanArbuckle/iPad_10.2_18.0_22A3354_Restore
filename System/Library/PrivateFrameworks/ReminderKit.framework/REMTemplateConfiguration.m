@implementation REMTemplateConfiguration

- (REMTemplateConfiguration)initWithSourceListID:(id)a3 shouldSaveCompleted:(BOOL)a4
{
  id v7;
  REMTemplateConfiguration *v8;
  REMTemplateConfiguration *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMTemplateConfiguration;
  v8 = -[REMTemplateConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceListID, a3);
    v9->_shouldSaveCompleted = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  _BOOL4 v14;

  if (a3 != self)
  {
    v4 = a3;
    v5 = objc_opt_class();
    REMDynamicCast(v5, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMTemplateConfiguration sourceListID](self, "sourceListID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceListID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[REMTemplateConfiguration sourceListID](self, "sourceListID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceListID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
      {
        LOBYTE(v13) = 0;
LABEL_8:

        return v13;
      }
    }
    v14 = -[REMTemplateConfiguration shouldSaveCompleted](self, "shouldSaveCompleted");
    v13 = v14 ^ objc_msgSend(v6, "shouldSaveCompleted") ^ 1;
    goto LABEL_8;
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMTemplateConfiguration *v4;
  void *v5;
  REMTemplateConfiguration *v6;

  v4 = [REMTemplateConfiguration alloc];
  -[REMTemplateConfiguration sourceListID](self, "sourceListID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMTemplateConfiguration initWithSourceListID:shouldSaveCompleted:](v4, "initWithSourceListID:shouldSaveCompleted:", v5, -[REMTemplateConfiguration shouldSaveCompleted](self, "shouldSaveCompleted"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMTemplateConfiguration sourceListID](self, "sourceListID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("sourceListID"));

  objc_msgSend(v5, "encodeBool:forKey:", -[REMTemplateConfiguration shouldSaveCompleted](self, "shouldSaveCompleted"), CFSTR("shouldSaveCompleted"));
}

- (REMTemplateConfiguration)initWithCoder:(id)a3
{
  id v4;
  REMTemplateConfiguration *v5;
  uint64_t v6;
  REMObjectID *sourceListID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplateConfiguration;
  v5 = -[REMTemplateConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceListID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceListID = v5->_sourceListID;
    v5->_sourceListID = (REMObjectID *)v6;

    v5->_shouldSaveCompleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSaveCompleted"));
  }

  return v5;
}

- (REMObjectID)sourceListID
{
  return self->_sourceListID;
}

- (BOOL)shouldSaveCompleted
{
  return self->_shouldSaveCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceListID, 0);
}

@end
