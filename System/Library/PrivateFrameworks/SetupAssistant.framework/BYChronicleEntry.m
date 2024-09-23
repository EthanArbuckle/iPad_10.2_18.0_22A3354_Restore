@implementation BYChronicleEntry

- (BYChronicleEntry)init
{
  void *v3;
  void *v4;
  BYChronicleEntry *v5;

  +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BYChronicleEntry initWithProductVersion:](self, "initWithProductVersion:", v4);

  return v5;
}

- (BYChronicleEntry)initWithProductVersion:(id)a3
{
  id v4;
  BYChronicleEntry *v5;
  BYChronicleEntry *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYChronicleEntry;
  v5 = -[BYChronicleEntry init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BYChronicleEntry setProductVersion:](v5, "setProductVersion:", v4);

  return v6;
}

- (BYChronicleEntry)initWithDictionary:(id)a3
{
  void *v4;
  BYChronicleEntry *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("productVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BYChronicleEntry initWithProductVersion:](self, "initWithProductVersion:", v4);

  return v5;
}

- (BOOL)createdOnCurrentMajorVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;

  +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    -[BYChronicleEntry productVersion](self, "productVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");

      v12 = v7 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("productVersion");
  -[BYChronicleEntry productVersion](self, "productVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BYChronicleEntry productVersion](self, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p> Product Version: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BYChronicleEntry isEqualToEntry:](self, "isEqualToEntry:", v4);

  return v5;
}

- (BOOL)isEqualToEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BYChronicleEntry productVersion](self, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productVersion, 0);
}

@end
