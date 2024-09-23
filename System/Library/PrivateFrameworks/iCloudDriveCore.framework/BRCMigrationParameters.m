@implementation BRCMigrationParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 cloneOnly;
  id v5;

  cloneOnly = self->cloneOnly;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", cloneOnly, CFSTR("cloneOnly"));
  objc_msgSend(v5, "encodeObject:forKey:", self->errorOverride, CFSTR("errorOverride"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->originatorIdOverride, CFSTR("originatorIdOverride"));
  objc_msgSend(v5, "encodeBool:forKey:", self->dropAccountFile, CFSTR("dropAccountFile"));
  objc_msgSend(v5, "encodeBool:forKey:", self->dropClientState, CFSTR("dropClientState"));

}

- (BRCMigrationParameters)initWithCoder:(id)a3
{
  id v4;
  BRCMigrationParameters *v5;
  uint64_t v6;
  NSError *errorOverride;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCMigrationParameters;
  v5 = -[BRCMigrationParameters init](&v9, sel_init);
  if (v5)
  {
    v5->cloneOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cloneOnly"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorOverride"));
    v6 = objc_claimAutoreleasedReturnValue();
    errorOverride = v5->errorOverride;
    v5->errorOverride = (NSError *)v6;

    v5->originatorIdOverride = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("originatorIdOverride"));
    v5->dropAccountFile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dropAccountFile"));
    v5->dropClientState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dropClientState"));
  }

  return v5;
}

- (BOOL)cloneOnly
{
  return self->cloneOnly;
}

- (void)setCloneOnly:(BOOL)a3
{
  self->cloneOnly = a3;
}

- (NSError)errorOverride
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)originatorIdOverride
{
  return self->originatorIdOverride;
}

- (void)setOriginatorIdOverride:(unint64_t)a3
{
  self->originatorIdOverride = a3;
}

- (BOOL)dropAccountFile
{
  return self->dropAccountFile;
}

- (void)setDropAccountFile:(BOOL)a3
{
  self->dropAccountFile = a3;
}

- (BOOL)dropClientState
{
  return self->dropClientState;
}

- (void)setDropClientState:(BOOL)a3
{
  self->dropClientState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->errorOverride, 0);
}

@end
