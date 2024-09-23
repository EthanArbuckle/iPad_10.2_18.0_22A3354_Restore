@implementation SKVolumeDescriptor

- (SKVolumeDescriptor)initWithName:(id)a3 password:(id)a4 filesystem:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKVolumeDescriptor *v12;
  SKVolumeDescriptor *v13;
  void **p_name;
  void *v15;
  char v16;
  void *v17;
  const __CFString *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SKVolumeDescriptor;
  v12 = -[SKVolumeDescriptor init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_filesystem, a5);
    p_name = (void **)&v13->_name;
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v13->_password, a4);
    if (!v13->_name)
    {
      objc_msgSend(v11, "majorType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("msdos"));

      v17 = *p_name;
      if ((v16 & 1) != 0)
      {
        v18 = CFSTR("NO NAME");
LABEL_7:
        *p_name = (void *)v18;

        goto LABEL_8;
      }
      if (!v17)
      {
        v18 = CFSTR("Untitled");
        goto LABEL_7;
      }
    }
  }
LABEL_8:

  return v13;
}

+ (id)descriptorWithName:(id)a3 filesystem:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:password:filesystem:", v6, 0, v5);

  return v7;
}

+ (id)descriptorWithName:(id)a3 password:(id)a4 filesystem:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:password:filesystem:", v9, v8, v7);

  return v10;
}

- (BOOL)validateForErase
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  int v17;
  int v19;
  const char *v20;
  __int16 v21;
  SKVolumeDescriptor *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SKVolumeDescriptor name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    SKGetOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v19 = 136315394;
    v20 = "-[SKVolumeDescriptor validateForErase]";
    v21 = 2112;
    v22 = self;
    v15 = "%s: Empty name on descriptor %@";
LABEL_17:
    _os_log_impl(&dword_22FE50000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, 0x16u);
    goto LABEL_18;
  }
  -[SKVolumeDescriptor password](self, "password");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[SKVolumeDescriptor password](self, "password");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      SKGetOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v19 = 136315394;
      v20 = "-[SKVolumeDescriptor validateForErase]";
      v21 = 2112;
      v22 = self;
      v15 = "%s: Empty password on descriptor %@";
      goto LABEL_17;
    }
  }
  -[SKVolumeDescriptor password](self, "password");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[SKVolumeDescriptor filesystem](self, "filesystem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEncrypted");

    if ((v12 & 1) == 0)
    {
      SKGetOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      v19 = 136315394;
      v20 = "-[SKVolumeDescriptor validateForErase]";
      v21 = 2112;
      v22 = self;
      v15 = "%s: Non encrypted filesystem provided with password %@";
      goto LABEL_17;
    }
  }
  -[SKVolumeDescriptor password](self, "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[SKVolumeDescriptor filesystem](self, "filesystem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEncrypted");

    if (!v17)
      return 1;
    SKGetOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[SKVolumeDescriptor validateForErase]";
      v21 = 2112;
      v22 = self;
      v15 = "%s: Encrypted filesystem provided without password %@";
      goto LABEL_17;
    }
LABEL_18:

    return 0;
  }

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SKVolumeDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[SKVolumeDescriptor filesystem](self, "filesystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fs"));

  -[SKVolumeDescriptor password](self, "password");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("password"));

}

- (SKVolumeDescriptor)initWithCoder:(id)a3
{
  id v4;
  SKVolumeDescriptor *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SKFilesystem *v18;
  SKFilesystem *filesystem;
  uint64_t v20;
  NSString *password;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SKVolumeDescriptor;
  v5 = -[SKVolumeDescriptor init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("fs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[SKFilesystem initWithDictionaryRepresentation:]([SKFilesystem alloc], "initWithDictionaryRepresentation:", v17);
    filesystem = v5->_filesystem;
    v5->_filesystem = v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
    v20 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v20;

  }
  return v5;
}

- (id)redactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKVolumeDescriptor filesystem](self, "filesystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { filesystem: \"%@\"}>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKVolumeDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKVolumeDescriptor filesystem](self, "filesystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { name: \"%@\", filesystem: \"%@\"}>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SKFilesystem)filesystem
{
  return self->_filesystem;
}

- (void)setFilesystem:(id)a3
{
  objc_storeStrong((id *)&self->_filesystem, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
