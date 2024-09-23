@implementation ICQSubscriptionInfo

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isiCloudPlusSubscriber: %d, specifiersInfo: %@"), self->_iCloudPlusSubscriber, self->_specifiersInfo);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQSubscriptionInfo *v4;

  v4 = objc_alloc_init(ICQSubscriptionInfo);
  -[ICQSubscriptionInfo setICloudPlusSubscriber:](v4, "setICloudPlusSubscriber:", self->_iCloudPlusSubscriber);
  -[ICQSubscriptionInfo setSpecifiersInfo:](v4, "setSpecifiersInfo:", self->_specifiersInfo);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 iCloudPlusSubscriber;
  id v5;

  iCloudPlusSubscriber = self->_iCloudPlusSubscriber;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", iCloudPlusSubscriber, CFSTR("isICloudPlusSubscriber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specifiersInfo, CFSTR("specifiersInfo"));

}

- (ICQSubscriptionInfo)initWithCoder:(id)a3
{
  id v4;
  ICQSubscriptionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *specifiersInfo;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQSubscriptionInfo;
  v5 = -[ICQSubscriptionInfo init](&v12, sel_init);
  if (v5)
  {
    v5->_iCloudPlusSubscriber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isICloudPlusSubscriber"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("specifiersInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    specifiersInfo = v5->_specifiersInfo;
    v5->_specifiersInfo = (NSArray *)v9;

  }
  return v5;
}

- (BOOL)isiCloudPlusSubscriber
{
  return self->_iCloudPlusSubscriber;
}

- (void)setICloudPlusSubscriber:(BOOL)a3
{
  self->_iCloudPlusSubscriber = a3;
}

- (NSArray)specifiersInfo
{
  return self->_specifiersInfo;
}

- (void)setSpecifiersInfo:(id)a3
{
  objc_storeStrong((id *)&self->_specifiersInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiersInfo, 0);
}

@end
