@implementation PKRule

- (PKRule)initWithIdentifier:(id)a3 predicateFormat:(id)a4 osVersionRequirementRange:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKRule *v12;
  PKRule *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Malformed Rule in manifest: nil or empty identifier.", buf, 2u);
    }

    goto LABEL_9;
  }
  v16.receiver = self;
  v16.super_class = (Class)PKRule;
  v12 = -[PKRule init](&v16, sel_init);
  self = v12;
  if (!v12
    || (objc_storeStrong((id *)&v12->_identifier, a3),
        objc_storeStrong((id *)&self->_predicateFormat, a4),
        objc_storeStrong((id *)&self->_osVersionRequirementRange, a5),
        -[PKRule parsePredicateFormat](self, "parsePredicateFormat"),
        self->_predicateFormat)
    && !self->_predicate)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  self = self;
  v13 = self;
LABEL_10:

  return v13;
}

- (PKRule)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKOSVersionRequirementRange *v8;
  PKRule *v9;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("predicateFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("osVersionRange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[PKOSVersionRequirementRange initWithDictionary:]([PKOSVersionRequirementRange alloc], "initWithDictionary:", v7);
  else
    v8 = 0;
  v9 = -[PKRule initWithIdentifier:predicateFormat:osVersionRequirementRange:](self, "initWithIdentifier:predicateFormat:osVersionRequirementRange:", v5, v6, v8);

  return v9;
}

- (void)parsePredicateFormat
{
  NSPredicate *v3;
  NSPredicate *predicate;

  if (self->_predicateFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:");
    v3 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  predicate = self->_predicate;
  self->_predicate = v3;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRule)initWithCoder:(id)a3
{
  id v4;
  PKRule *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *predicateFormat;
  uint64_t v10;
  NSPredicate *predicate;
  uint64_t v12;
  PKOSVersionRequirementRange *osVersionRequirementRange;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRule;
  v5 = -[PKRule init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicateFormat"));
    v8 = objc_claimAutoreleasedReturnValue();
    predicateFormat = v5->_predicateFormat;
    v5->_predicateFormat = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v10 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersionRange"));
    v12 = objc_claimAutoreleasedReturnValue();
    osVersionRequirementRange = v5->_osVersionRequirementRange;
    v5->_osVersionRequirementRange = (PKOSVersionRequirementRange *)v12;

    -[NSPredicate allowEvaluation](v5->_predicate, "allowEvaluation");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predicateFormat, CFSTR("predicateFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersionRequirementRange, CFSTR("osVersionRange"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("predicate: '%@'; "), self->_predicate);
  objc_msgSend(v3, "appendFormat:", CFSTR("predicateFormat: '%@'; "), self->_predicateFormat);
  objc_msgSend(v3, "appendFormat:", CFSTR("osVersionRange: '%@'; "), self->_osVersionRequirementRange);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSPredicate copyWithZone:](self->_predicate, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_predicateFormat, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[PKOSVersionRequirementRange copyWithZone:](self->_osVersionRequirementRange, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (PKOSVersionRequirementRange)osVersionRequirementRange
{
  return self->_osVersionRequirementRange;
}

- (void)setOsVersionRequirementRange:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionRequirementRange, a3);
}

- (NSString)predicateFormat
{
  return self->_predicateFormat;
}

- (void)setPredicateFormat:(id)a3
{
  objc_storeStrong((id *)&self->_predicateFormat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateFormat, 0);
  objc_storeStrong((id *)&self->_osVersionRequirementRange, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
