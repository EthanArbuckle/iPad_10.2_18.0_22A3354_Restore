@implementation WiFiWalletPass

- (int64_t)source
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiWalletPass SSID](self, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("SSID: %@ "), v7);

  -[WiFiWalletPass password](self, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("YES");
  if (!v8)
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("Password: %@ "), v9);

  -[WiFiWalletPass uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Idenitifer: %@ "), v10);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  return 0;
}

- (NSString)SSID
{
  return self->SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)password
{
  return self->password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)attributes
{
  return self->attributes;
}

- (NSSet)accessPoints
{
  return self->accessPoints;
}

- (TBScore)qualityScore
{
  return self->qualityScore;
}

- (TBScore)popularityScore
{
  return self->popularityScore;
}

- (BOOL)matched
{
  return self->matched;
}

- (void)setMatched:(BOOL)a3
{
  self->matched = a3;
}

- (unsigned)venueType
{
  return self->venueType;
}

- (unint64_t)venueGroup
{
  return self->venueGroup;
}

- (unint64_t)type
{
  return self->type;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (void)setRelevantDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->popularityScore, 0);
  objc_storeStrong((id *)&self->qualityScore, 0);
  objc_storeStrong((id *)&self->accessPoints, 0);
  objc_storeStrong((id *)&self->attributes, 0);
  objc_storeStrong((id *)&self->password, 0);
  objc_storeStrong((id *)&self->SSID, 0);
}

@end
