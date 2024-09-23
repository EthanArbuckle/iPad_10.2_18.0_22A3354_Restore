@implementation ICQiCloudPlusSpecifierInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  -[ICQSpecifierInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, featureList: %@"), v4, self->_featureList);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  v4 = -[ICQSpecifierInfo copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFeatureList:", self->_featureList);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  v4 = a3;
  -[ICQSpecifierInfo encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureList, CFSTR("featureList"), v5.receiver, v5.super_class);

}

- (ICQiCloudPlusSpecifierInfo)initWithCoder:(id)a3
{
  id v4;
  ICQiCloudPlusSpecifierInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *featureList;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  v5 = -[ICQSpecifierInfo initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("featureList"));
    v9 = objc_claimAutoreleasedReturnValue();
    featureList = v5->_featureList;
    v5->_featureList = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)featureList
{
  return self->_featureList;
}

- (void)setFeatureList:(id)a3
{
  objc_storeStrong((id *)&self->_featureList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureList, 0);
}

@end
