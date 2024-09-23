@implementation TPSAnalyticsEventContentEligibilityMet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentEligibilityMet)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventContentEligibilityMet *v5;
  uint64_t v6;
  NSString *contentID;
  uint64_t v8;
  NSString *bundleID;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *eligibleContext;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TPSAnalyticsEventContentEligibilityMet;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("eligibleContext"));
    v13 = objc_claimAutoreleasedReturnValue();
    eligibleContext = v5->_eligibleContext;
    v5->_eligibleContext = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayType = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usageFlags"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usageFlags = objc_msgSend(v16, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventContentEligibilityMet;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, CFSTR("contentID"), v7.receiver, v7.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_eligibleContext, CFSTR("eligibleContext"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_usageFlags);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("usageFlags"));

}

- (id)_initWithContentID:(id)a3 bundleID:(id)a4 eligibleContext:(id)a5 displayType:(unint64_t)a6 usageFlags:(unint64_t)a7 date:(id)a8
{
  id v15;
  id v16;
  id v17;
  TPSAnalyticsEventContentEligibilityMet *v18;
  TPSAnalyticsEventContentEligibilityMet *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentEligibilityMet;
  v18 = -[TPSAnalyticsEvent initWithDate:](&v21, sel_initWithDate_, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentID, a3);
    objc_storeStrong((id *)&v19->_bundleID, a4);
    objc_storeStrong((id *)&v19->_eligibleContext, a5);
    v19->_displayType = a6;
    v19->_usageFlags = a7;
  }

  return v19;
}

+ (id)eventWithContentID:(id)a3 bundleID:(id)a4 eligibleContext:(id)a5 displayType:(unint64_t)a6 usageFlags:(unint64_t)a7 date:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContentID:bundleID:eligibleContext:displayType:usageFlags:date:", v17, v16, v15, a6, a7, v14);

  return v18;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("content_eligible"));
}

- (id)mutableAnalyticsEventRepresentation
{
  return 0;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSArray)eligibleContext
{
  return self->_eligibleContext;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (unint64_t)usageFlags
{
  return self->_usageFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleContext, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
