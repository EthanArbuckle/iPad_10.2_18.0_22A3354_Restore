@implementation MOEventProactiveSuggested

+ (id)describeCategory:(unint64_t)a3
{
  if (a3 > 0xC)
    return CFSTR("Unknown");
  else
    return *(&off_1002B53A8 + a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *suggestedEventTitle;
  id v5;

  suggestedEventTitle = self->_suggestedEventTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestedEventTitle, CFSTR("suggestedEventTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedEventIdentifier, CFSTR("suggestedEventIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestedEventCategory, CFSTR("suggestedEventCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedEvent, CFSTR("suggestedEvent"));

}

- (MOEventProactiveSuggested)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventProactiveSuggested *v6;
  id v7;
  uint64_t v8;
  NSString *suggestedEventTitle;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *suggestedEventIdentifier;
  uint64_t v14;
  id v15;
  uint64_t v16;
  PPEvent *suggestedEvent;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MOEventProactiveSuggested;
  v6 = -[MOEventProactiveSuggested init](&v19, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("suggestedEventTitle"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    suggestedEventTitle = v6->_suggestedEventTitle;
    v6->_suggestedEventTitle = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("suggestedEventIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    suggestedEventIdentifier = v6->_suggestedEventIdentifier;
    v6->_suggestedEventIdentifier = (NSString *)v12;

    v6->_suggestedEventCategory = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestedEventCategory"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PPEvent, v14), CFSTR("suggestedEvent"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    suggestedEvent = v6->_suggestedEvent;
    v6->_suggestedEvent = (PPEvent *)v16;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventProactiveSuggested *v4;

  v4 = objc_alloc_init(MOEventProactiveSuggested);
  objc_storeStrong((id *)&v4->_suggestedEvent, self->_suggestedEvent);
  objc_storeStrong((id *)&v4->_suggestedEventTitle, self->_suggestedEventTitle);
  v4->_suggestedEventCategory = self->_suggestedEventCategory;
  objc_storeStrong((id *)&v4->_suggestedEventIdentifier, self->_suggestedEventIdentifier);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString mask](self->_suggestedEventTitle, "mask"));
  v5 = objc_msgSend(v3, "initWithFormat:", CFSTR("suggestedEventTitle, %@, suggestedEventIdentifier, %@"), v4, self->_suggestedEventIdentifier);

  return v5;
}

- (NSString)suggestedEventTitle
{
  return self->_suggestedEventTitle;
}

- (void)setSuggestedEventTitle:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEventTitle, a3);
}

- (NSString)suggestedEventIdentifier
{
  return self->_suggestedEventIdentifier;
}

- (void)setSuggestedEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEventIdentifier, a3);
}

- (unint64_t)suggestedEventCategory
{
  return self->_suggestedEventCategory;
}

- (void)setSuggestedEventCategory:(unint64_t)a3
{
  self->_suggestedEventCategory = a3;
}

- (PPEvent)suggestedEvent
{
  return self->_suggestedEvent;
}

- (void)setSuggestedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedEvent, 0);
  objc_storeStrong((id *)&self->_suggestedEventIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedEventTitle, 0);
}

@end
