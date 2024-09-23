@implementation SUCoreDocumentationData

- (SUCoreDocumentationData)init
{
  return -[SUCoreDocumentationData initWithDocumentationDataDictionary:](self, "initWithDocumentationDataDictionary:", 0);
}

- (SUCoreDocumentationData)initWithDocumentationDataDictionary:(id)a3
{
  id v4;
  SUCoreDocumentationData *v5;
  uint64_t v6;
  NSData *readme;
  uint64_t v8;
  NSData *readmeSummary;
  uint64_t v10;
  NSData *license;
  void *v12;
  uint64_t v13;
  NSString *humanReadableUpdateName;
  void *v15;
  uint64_t v16;
  NSString *humanReadableUpdateTitle;
  void *v18;
  uint64_t v19;
  NSString *humanReadableUpdateVersion;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUCoreDocumentationData;
  v5 = -[SUCoreDocumentationData init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReadMe"));
    v6 = objc_claimAutoreleasedReturnValue();
    readme = v5->_readme;
    v5->_readme = (NSData *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReadMeSummary"));
    v8 = objc_claimAutoreleasedReturnValue();
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("License"));
    v10 = objc_claimAutoreleasedReturnValue();
    license = v5->_license;
    v5->_license = (NSData *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanReadableUpdateName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);
      humanReadableUpdateName = v5->_humanReadableUpdateName;
      v5->_humanReadableUpdateName = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanReadableUpdateTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
      humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
      v5->_humanReadableUpdateTitle = (NSString *)v16;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanReadableUpdateVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v18, 4);
      humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
      v5->_humanReadableUpdateVersion = (NSString *)v19;

    }
  }

  return v5;
}

- (id)summary
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v17 = v3;
  -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v16 = v5;
  -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[SUCoreDocumentationData readme](self, "readme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[SUCoreDocumentationData license](self, "license");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("SUCoreDocumentationData(humanReadableUpdateName:%@|humanReadableUpdateTitle:%@|humanReadableUpdateVersion:%@|readMe:%@|readMeSummary:%@|license:%@)"), v17, v16, v7, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SUCoreDocumentationData:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("humanReadableUpdateName:\n%@\n"), v4);

  -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("humanReadableUpdateTitle:\n%@\n"), v5);

  -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("humanReadableUpdateVersion:\n%@\n"), v6);

  -[SUCoreDocumentationData readme](self, "readme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("readme:\n%@\n"), v7);

  -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("readmeSummary:\n%@\n"), v8);

  -[SUCoreDocumentationData license](self, "license");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("license:\n%@\n"), v9);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreDocumentationData)initWithCoder:(id)a3
{
  id v4;
  SUCoreDocumentationData *v5;
  uint64_t v6;
  NSString *humanReadableUpdateName;
  uint64_t v8;
  NSString *humanReadableUpdateTitle;
  uint64_t v10;
  NSString *humanReadableUpdateVersion;
  uint64_t v12;
  NSData *readme;
  uint64_t v14;
  NSData *readmeSummary;
  uint64_t v16;
  NSData *license;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUCoreDocumentationData;
  v5 = -[SUCoreDocumentationData init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HumanReadableUpdateName"));
    v6 = objc_claimAutoreleasedReturnValue();
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HumanReadableUpdateTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
    v5->_humanReadableUpdateTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HumanReadableUpdateVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
    v5->_humanReadableUpdateVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReadMe"));
    v12 = objc_claimAutoreleasedReturnValue();
    readme = v5->_readme;
    v5->_readme = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReadMeSummary"));
    v14 = objc_claimAutoreleasedReturnValue();
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("License"));
    v16 = objc_claimAutoreleasedReturnValue();
    license = v5->_license;
    v5->_license = (NSData *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HumanReadableUpdateName"));

  -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HumanReadableUpdateTitle"));

  -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HumanReadableUpdateVersion"));

  -[SUCoreDocumentationData readme](self, "readme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ReadMe"));

  -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ReadMeSummary"));

  -[SUCoreDocumentationData license](self, "license");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("License"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setHumanReadableUpdateName:", v7);

  -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setHumanReadableUpdateTitle:", v9);

  -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setHumanReadableUpdateVersion:", v11);

  -[SUCoreDocumentationData readme](self, "readme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setReadme:", v13);

  -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setReadmeSummary:", v15);

  -[SUCoreDocumentationData license](self, "license");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setLicense:", v17);

  return v5;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableUpdateName, a3);
}

- (NSString)humanReadableUpdateTitle
{
  return self->_humanReadableUpdateTitle;
}

- (void)setHumanReadableUpdateTitle:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableUpdateTitle, a3);
}

- (NSString)humanReadableUpdateVersion
{
  return self->_humanReadableUpdateVersion;
}

- (void)setHumanReadableUpdateVersion:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableUpdateVersion, a3);
}

- (NSData)readme
{
  return self->_readme;
}

- (void)setReadme:(id)a3
{
  objc_storeStrong((id *)&self->_readme, a3);
}

- (NSData)readmeSummary
{
  return self->_readmeSummary;
}

- (void)setReadmeSummary:(id)a3
{
  objc_storeStrong((id *)&self->_readmeSummary, a3);
}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
  objc_storeStrong((id *)&self->_license, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_readmeSummary, 0);
  objc_storeStrong((id *)&self->_readme, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateVersion, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateTitle, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
}

@end
