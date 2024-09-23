@implementation TUNearbySuggestionAdvertisement

- (TUNearbySuggestionAdvertisement)initWithSuggestionIdentifier:(id)a3 deviceIdentifier:(id)a4 type:(int64_t)a5
{
  id v9;
  id v10;
  TUNearbySuggestionAdvertisement *v11;
  TUNearbySuggestionAdvertisement *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUNearbySuggestionAdvertisement;
  v11 = -[TUNearbySuggestionAdvertisement init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestionIdentifier, a3);
    objc_storeStrong((id *)&v12->_deviceIdentifier, a4);
    v12->_type = a5;
  }

  return v12;
}

- (TUNearbySuggestionAdvertisement)initWithSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TUNearbySuggestionAdvertisement *v9;

  v4 = a3;
  objc_msgSend(v4, "deviceHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierWithType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "type");

  v9 = -[TUNearbySuggestionAdvertisement initWithSuggestionIdentifier:deviceIdentifier:type:](self, "initWithSuggestionIdentifier:deviceIdentifier:type:", v7, v6, v8);
  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" suggestionIdentifier=%@"), self->_suggestionIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(" deviceIdentifier=%@"), self->_deviceIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(" type=%zu"), self->_type);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbySuggestionAdvertisement)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  TUNearbySuggestionAdvertisement *v13;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_suggestionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_deviceIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_type);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", v11);

  v13 = -[TUNearbySuggestionAdvertisement initWithSuggestionIdentifier:deviceIdentifier:type:](self, "initWithSuggestionIdentifier:deviceIdentifier:type:", v7, v10, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *suggestionIdentifier;
  id v5;
  void *v6;
  NSString *deviceIdentifier;
  void *v8;
  int64_t type;
  id v10;

  suggestionIdentifier = self->_suggestionIdentifier;
  v5 = a3;
  NSStringFromSelector(sel_suggestionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", suggestionIdentifier, v6);

  deviceIdentifier = self->_deviceIdentifier;
  NSStringFromSelector(sel_deviceIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", deviceIdentifier, v8);

  type = self->_type;
  NSStringFromSelector(sel_type);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v10);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUNearbySuggestionAdvertisement isEqualToSuggestionAdvertisement:](self, "isEqualToSuggestionAdvertisement:", v4);

  return v5;
}

- (BOOL)isEqualToSuggestionAdvertisement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUNearbySuggestionAdvertisement suggestionIdentifier](self, "suggestionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TUNearbySuggestionAdvertisement suggestionIdentifier](self, "suggestionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
}

@end
