@implementation SSFreeFormResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.freeform");
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSFreeFormResultBuilder;
  if ((objc_msgSendSuper2(&v9, sel_supportsResult_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", v7);

  }
  return v5;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSFreeFormResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSFreeFormResultBuilder *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSFreeFormResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v8, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFreeFormResultBuilder setFreeFormDescription:](v5, "setFreeFormDescription:", v6);

  }
  return v5;
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SSFreeFormResultBuilder freeFormDescription](self, "freeFormDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[SSFreeFormResultBuilder freeFormDescription](self, "freeFormDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richTextsFromStrings:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSFreeFormResultBuilder;
    -[SSResultBuilder buildDescriptions](&v9, sel_buildDescriptions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)freeFormDescription
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFreeFormDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeFormDescription, 0);
}

@end
