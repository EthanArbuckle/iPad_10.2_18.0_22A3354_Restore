@implementation WFWorkflowCollection

- (WFWorkflowCollection)initWithIdentifier:(id)a3 isFolder:(BOOL)a4 name:(id)a5 glyphCharacter:(unsigned __int16)a6 isDeleted:(BOOL)a7
{
  id v12;
  WFWorkflowCollection *v13;
  uint64_t v14;
  NSString *name;
  WFWorkflowCollection *v16;
  objc_super v18;

  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFWorkflowCollection;
  v13 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:](&v18, sel_initWithIdentifier_objectType_, a3, 2);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v13->_glyphCharacter = a6;
    v13->_folder = a4;
    v13->_deleted = a7;
    v16 = v13;
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[WFWorkflowCollection name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[WFWorkflowCollection glyphCharacter](self, "glyphCharacter");
  v6 = -[WFWorkflowCollection isFolder](self, "isFolder");
  v7 = v5 ^ v6 ^ -[WFWorkflowCollection isDeleted](self, "isDeleted");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowCollection *v4;
  WFWorkflowCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = (WFWorkflowCollection *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFDatabaseObjectDescriptor identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDatabaseObjectDescriptor identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[WFWorkflowCollection name](v5, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowCollection name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          v10 = -[WFWorkflowCollection glyphCharacter](v5, "glyphCharacter");
          v11 = v10 == -[WFWorkflowCollection glyphCharacter](self, "glyphCharacter");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (WFWorkflowCollection)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowCollection *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  WFWorkflowCollection *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFWorkflowCollection;
  v5 = -[WFDatabaseObjectDescriptor initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("glyphCharacter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_glyphCharacter = objc_msgSend(v8, "unsignedLongValue");

    v5->_folder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("folder"));
    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deleted"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWorkflowCollection;
  v4 = a3;
  -[WFDatabaseObjectDescriptor encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFWorkflowCollection name](self, "name", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[WFWorkflowCollection glyphCharacter](self, "glyphCharacter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("glyphCharacter"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowCollection isFolder](self, "isFolder"), CFSTR("folder"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowCollection isDeleted](self, "isDeleted"), CFSTR("deleted"));

}

- (BOOL)isFolder
{
  return self->_folder;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
