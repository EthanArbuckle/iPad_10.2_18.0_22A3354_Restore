@implementation SUCoreScanResults

- (SUCoreScanResults)initWithPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4
{
  id v7;
  id v8;
  SUCoreScanResults *v9;
  SUCoreScanResults *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUCoreScanResults;
  v9 = -[SUCoreScanResults init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferredDescriptor, a3);
    objc_storeStrong((id *)&v10->_alternateDescriptor, a4);
  }

  return v10;
}

- (id)latestUpdate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[SUCoreScanResults preferredDescriptor](self, "preferredDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[SUCoreScanResults alternateDescriptor](self, "alternateDescriptor"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    -[SUCoreScanResults preferredDescriptor](self, "preferredDescriptor");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[SUCoreScanResults alternateDescriptor](self, "alternateDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[SUCoreScanResults preferredDescriptor](self, "preferredDescriptor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "productBuildVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScanResults alternateDescriptor](self, "alternateDescriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "productBuildVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "compare:options:", v10, 64) == -1)
          -[SUCoreScanResults alternateDescriptor](self, "alternateDescriptor");
        else
          -[SUCoreScanResults preferredDescriptor](self, "preferredDescriptor");
        v12 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v12;
      }
    }
  }
  else
  {
    -[SUCoreScanResults alternateDescriptor](self, "alternateDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n            Preferred Descriptor: %@\n            Alternate Descriptor: %@\n"), self->_preferredDescriptor, self->_alternateDescriptor);
}

- (SUCoreDescriptor)preferredDescriptor
{
  return self->_preferredDescriptor;
}

- (void)setPreferredDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_preferredDescriptor, a3);
}

- (SUCoreDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void)setAlternateDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_alternateDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredDescriptor, 0);
}

@end
