@implementation PKRewardsTierEducationSection

- (PKRewardsTierEducationSection)initWithTier:(unint64_t)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5
{
  id v9;
  id v10;
  PKRewardsTierEducationSection *v11;
  PKRewardsTierEducationSection *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKRewardsTierEducationSection;
  v11 = -[PKRewardsTierEducationSection init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_tier = a3;
    objc_storeStrong((id *)&v11->_localizedTitle, a4);
    objc_storeStrong((id *)&v12->_localizedSubtitle, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRewardsTierEducationSection)initWithCoder:(id)a3
{
  id v4;
  PKRewardsTierEducationSection *v5;
  uint64_t v6;
  NSString *localizedTitle;
  uint64_t v8;
  NSString *localizedSubtitle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKRewardsTierEducationSection;
  v5 = -[PKRewardsTierEducationSection init](&v11, sel_init);
  if (v5)
  {
    v5->_tier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t tier;
  id v5;

  tier = self->_tier;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", tier, CFSTR("tier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedSubtitle, CFSTR("localizedSubtitle"));

}

- (unint64_t)tier
{
  return self->_tier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
