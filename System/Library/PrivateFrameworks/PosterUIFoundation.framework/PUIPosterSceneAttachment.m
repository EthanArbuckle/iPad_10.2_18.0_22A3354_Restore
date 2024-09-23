@implementation PUIPosterSceneAttachment

- (PUIPosterSceneAttachment)initWithContextId:(unsigned int)a3 renderId:(unint64_t)a4 level:(int64_t)a5
{
  PUIPosterSceneAttachment *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUIPosterSceneAttachment;
  result = -[PUIPosterSceneAttachment init](&v9, sel_init);
  if (result)
  {
    result->_contextId = a3;
    result->_level = a5;
    result->_renderId = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PUIPosterSceneAttachment *v4;
  PUIPosterSceneAttachment *v5;
  uint64_t v6;
  PUIPosterSceneAttachment *v7;
  PUIPosterSceneAttachment *v8;
  BOOL v9;
  PUIPosterSceneAttachment *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v4 = (PUIPosterSceneAttachment *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4)
  {
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    if (v10
      && (v11 = -[PUIPosterSceneAttachment renderId](v10, "renderId"),
          v11 == -[PUIPosterSceneAttachment renderId](self, "renderId"))
      && (v12 = -[PUIPosterSceneAttachment contextId](v10, "contextId"),
          v12 == -[PUIPosterSceneAttachment contextId](self, "contextId")))
    {
      v13 = -[PUIPosterSceneAttachment level](v10, "level");
      v9 = v13 == -[PUIPosterSceneAttachment level](self, "level");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_contextId, CFSTR("_contextId"));
  v5 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_renderId, CFSTR("_renderId"));
  v6 = (id)objc_msgSend(v3, "appendInt64:withName:", self->_level, CFSTR("_level"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t contextId;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  contextId = self->_contextId;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", contextId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("_contextId"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_renderId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("_renderId"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_level);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("_level"));

}

- (PUIPosterSceneAttachment)initWithCoder:(id)a3
{
  id v4;
  PUIPosterSceneAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUIPosterSceneAttachment;
  v5 = -[PUIPosterSceneAttachment init](&v13, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_contextId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contextId = objc_msgSend(v7, "unsignedIntValue");

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("_renderId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_renderId = objc_msgSend(v9, "unsignedLongLongValue");

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("_level"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_level = objc_msgSend(v11, "unsignedIntegerValue");

  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  uint64_t contextId;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  contextId = self->_contextId;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", contextId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("_contextId"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_renderId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("_renderId"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_level);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("_level"));

}

- (PUIPosterSceneAttachment)initWithBSXPCCoder:(id)a3
{
  id v4;
  PUIPosterSceneAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[PUIPosterSceneAttachment init](self, "init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_contextId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contextId = objc_msgSend(v7, "unsignedIntValue");

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("_renderId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_renderId = objc_msgSend(v9, "unsignedLongLongValue");

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("_level"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_level = objc_msgSend(v11, "unsignedIntegerValue");

  }
  return v5;
}

- (int64_t)level
{
  return self->_level;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (unint64_t)renderId
{
  return self->_renderId;
}

@end
