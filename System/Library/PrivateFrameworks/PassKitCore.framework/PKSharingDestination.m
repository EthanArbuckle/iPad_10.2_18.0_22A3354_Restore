@implementation PKSharingDestination

- (PKSharingDestination)initWithDestinationIdentifier:(id)a3
{
  id v5;
  PKSharingDestination *v6;
  PKSharingDestination *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingDestination;
  v6 = -[PKSharingDestination init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_destinationIdentifier, a3);

  return v7;
}

- (id)idsDestination
{
  NSString *destinationIdentifier;
  void *v3;
  void *v4;

  destinationIdentifier = self->_destinationIdentifier;
  -[PKSharingDestination _name](self, "_name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKIDSDestination destinationWithDeviceIdentifier:name:](PKIDSDestination, "destinationWithDeviceIdentifier:name:", destinationIdentifier, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingDestination)initWithCoder:(id)a3
{
  id v4;
  PKSharingDestination *v5;
  uint64_t v6;
  NSString *destinationIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingDestination;
  v5 = -[PKSharingDestination init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    destinationIdentifier = v5->_destinationIdentifier;
    v5->_destinationIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_destinationIdentifier, CFSTR("destinationIdentifier"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_destinationIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_destinationIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSString **v4;
  char isKindOfClass;
  BOOL v6;

  v4 = (NSString **)a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
    v6 = self->_destinationIdentifier == v4[1];

  return v6;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("destinationIdentifier: '%@'; "), self->_destinationIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)_name
{
  void *destinationIdentifier;
  int v4;
  NSString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;

  destinationIdentifier = self->_destinationIdentifier;
  if (destinationIdentifier)
  {
    v4 = objc_msgSend(destinationIdentifier, "hasPrefix:", CFSTR("mailto:"));
    v5 = self->_destinationIdentifier;
    if (v4)
    {
      v6 = CFSTR("mailto:");
    }
    else
    {
      if (!-[NSString hasPrefix:](v5, "hasPrefix:", CFSTR("tel:")))
      {
        destinationIdentifier = 0;
        return destinationIdentifier;
      }
      v5 = self->_destinationIdentifier;
      v6 = CFSTR("tel:");
    }
    v7 = -[NSString rangeOfString:](v5, "rangeOfString:", v6);
    -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self->_destinationIdentifier, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1E2ADF4C0, 0, v7, v8);
    destinationIdentifier = (void *)objc_claimAutoreleasedReturnValue();
  }
  return destinationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
}

@end
