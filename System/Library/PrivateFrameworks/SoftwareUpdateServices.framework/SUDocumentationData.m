@implementation SUDocumentationData

- (SUDocumentationData)initWithSUCoreDocumentationData:(id)a3
{
  id v4;
  SUDocumentationData *v5;
  void *v6;
  uint64_t v7;
  NSData *readme;
  void *v9;
  uint64_t v10;
  NSData *readmeSummary;
  void *v12;
  uint64_t v13;
  NSData *license;
  void *v15;
  uint64_t v16;
  NSString *humanReadableUpdateName;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUDocumentationData;
  v5 = -[SUDocumentationData init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "readme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    readme = v5->_readme;
    v5->_readme = (NSData *)v7;

    objc_msgSend(v4, "readmeSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v10;

    objc_msgSend(v4, "license");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    license = v5->_license;
    v5->_license = (NSData *)v13;

    objc_msgSend(v4, "humanReadableUpdateName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v16;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentationData readme](self, "readme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentationData readmeSummary](self, "readmeSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDocumentationData license](self, "license");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            SUDocumentationData\n            humanReadableUpdateName: %@\n            readme: %@\n            readmeSummary: %@\n            license: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDocumentationData)initWithCoder:(id)a3
{
  id v4;
  SUDocumentationData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUDocumentationData;
  v5 = -[SUDocumentationData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("humanReadableUpdateName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDocumentationData setHumanReadableUpdateName:](v5, "setHumanReadableUpdateName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readMe"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDocumentationData setReadme:](v5, "setReadme:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readMeSummary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDocumentationData setReadmeSummary:](v5, "setReadmeSummary:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("license"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDocumentationData setLicense:](v5, "setLicense:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *humanReadableUpdateName;
  id v5;

  humanReadableUpdateName = self->_humanReadableUpdateName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", humanReadableUpdateName, CFSTR("humanReadableUpdateName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readme, CFSTR("readMe"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readmeSummary, CFSTR("readMeSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_license, CFSTR("license"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setHumanReadableUpdateName:", self->_humanReadableUpdateName);
  objc_msgSend(v4, "setReadme:", self->_readme);
  objc_msgSend(v4, "setReadmeSummary:", self->_readmeSummary);
  objc_msgSend(v4, "setLicense:", self->_license);
  return v4;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableUpdateName, a3);
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

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_readmeSummary, 0);
  objc_storeStrong((id *)&self->_readme, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
