@implementation PKAccountDailyCashDestinationsSummary

- (PKAccountDailyCashDestinationsSummary)initWithDestinations:(id)a3 localizedTitle:(id)a4 localizedFooterText:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKAccountDailyCashDestinationsSummary *v12;
  PKAccountDailyCashDestinationsSummary *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountDailyCashDestinationsSummary;
  v12 = -[PKAccountDailyCashDestinationsSummary init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_destinations, a3);
    objc_storeStrong((id *)&v13->_localizedTitle, a4);
    objc_storeStrong((id *)&v13->_localizedFooterText, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountDailyCashDestinationsSummary)initWithCoder:(id)a3
{
  id v4;
  PKAccountDailyCashDestinationsSummary *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *destinations;
  uint64_t v11;
  NSString *localizedTitle;
  uint64_t v13;
  NSString *localizedFooterText;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountDailyCashDestinationsSummary;
  v5 = -[PKAccountDailyCashDestinationsSummary init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("destinations"));
    v9 = objc_claimAutoreleasedReturnValue();
    destinations = v5->_destinations;
    v5->_destinations = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedFooterText"));
    v13 = objc_claimAutoreleasedReturnValue();
    localizedFooterText = v5->_localizedFooterText;
    v5->_localizedFooterText = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *destinations;
  id v5;

  destinations = self->_destinations;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", destinations, CFSTR("destinations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedFooterText, CFSTR("localizedFooterText"));

}

- (NSArray)destinations
{
  return self->_destinations;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedFooterText
{
  return self->_localizedFooterText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFooterText, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end
