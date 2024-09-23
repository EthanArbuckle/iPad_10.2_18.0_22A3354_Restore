@implementation VisionCoreProcessingDescriptorSpecifier

- (VisionCoreProcessingDescriptorSpecifier)initWithIdentifier:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  VisionCoreProcessingDescriptorSpecifier *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VisionCoreProcessingDescriptorSpecifier;
  v8 = -[VisionCoreProcessingDescriptorSpecifier init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_version, a4);
  }

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[VisionCoreProcessingDescriptorSpecifier identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreProcessingDescriptorSpecifier version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[VisionCoreProcessingDescriptorSpecifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[VisionCoreProcessingDescriptorSpecifier version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreProcessingDescriptorSpecifier *v4;
  VisionCoreProcessingDescriptorSpecifier *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (VisionCoreProcessingDescriptorSpecifier *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VisionCoreProcessingDescriptorSpecifier identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreProcessingDescriptorSpecifier identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        -[VisionCoreProcessingDescriptorSpecifier version](self, "version");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VisionCoreProcessingDescriptorSpecifier version](v5, "version");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

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

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));

}

- (VisionCoreProcessingDescriptorSpecifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VisionCoreProcessingDescriptorSpecifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:](self, "initWithIdentifier:version:", v5, v6);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (VisionCoreResourceVersion)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
