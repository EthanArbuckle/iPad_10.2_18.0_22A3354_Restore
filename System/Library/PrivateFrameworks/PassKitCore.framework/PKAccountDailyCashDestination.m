@implementation PKAccountDailyCashDestination

- (PKAccountDailyCashDestination)initWithDestination:(unint64_t)a3 isCurrent:(BOOL)a4 localizedTitle:(id)a5 localizedSubtitle:(id)a6
{
  id v11;
  id v12;
  PKAccountDailyCashDestination *v13;
  PKAccountDailyCashDestination *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountDailyCashDestination;
  v13 = -[PKAccountDailyCashDestination init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_destination = a3;
    v13->_current = a4;
    objc_storeStrong((id *)&v13->_localizedTitle, a5);
    objc_storeStrong((id *)&v14->_localizedSubtitle, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountDailyCashDestination)initWithCoder:(id)a3
{
  id v4;
  PKAccountDailyCashDestination *v5;
  uint64_t v6;
  NSString *localizedTitle;
  uint64_t v8;
  NSString *localizedSubtitle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountDailyCashDestination;
  v5 = -[PKAccountDailyCashDestination init](&v11, sel_init);
  if (v5)
  {
    v5->_destination = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destination"));
    v5->_current = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("current"));
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
  unint64_t destination;
  id v5;

  destination = self->_destination;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", destination, CFSTR("destination"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_current, CFSTR("current"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedSubtitle, CFSTR("localizedSubtitle"));

}

- (unint64_t)destination
{
  return self->_destination;
}

- (BOOL)isCurrent
{
  return self->_current;
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
