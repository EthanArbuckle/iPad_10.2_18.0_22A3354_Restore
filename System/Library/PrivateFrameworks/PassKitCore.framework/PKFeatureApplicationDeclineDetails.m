@implementation PKFeatureApplicationDeclineDetails

- (PKFeatureApplicationDeclineDetails)initWithDictionary:(id)a3
{
  id v4;
  PKFeatureApplicationDeclineDetails *v5;
  uint64_t v6;
  NSString *declinedTermsIdentifier;
  uint64_t v8;
  NSString *pathTermsIdentifier;
  uint64_t v10;
  NSString *pathIdentifier;
  PKFeatureApplicationDeclineDetails *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKFeatureApplicationDeclineDetails;
  v5 = -[PKFeatureApplicationDeclineDetails init](&v17, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("declineTermsIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  declinedTermsIdentifier = v5->_declinedTermsIdentifier;
  v5->_declinedTermsIdentifier = (NSString *)v6;

  if (v5->_declinedTermsIdentifier)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("pathTermsIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    pathTermsIdentifier = v5->_pathTermsIdentifier;
    v5->_pathTermsIdentifier = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("pathIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    pathIdentifier = v5->_pathIdentifier;
    v5->_pathIdentifier = (NSString *)v10;

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xDuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Error: Declined identifier missing from :%@", buf, 0xCu);

  }
  v12 = 0;
LABEL_8:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationDeclineDetails)initWithCoder:(id)a3
{
  id v4;
  PKFeatureApplicationDeclineDetails *v5;
  uint64_t v6;
  NSString *declinedTermsIdentifier;
  uint64_t v8;
  NSString *pathTermsIdentifier;
  uint64_t v10;
  NSString *pathIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFeatureApplicationDeclineDetails;
  v5 = -[PKFeatureApplicationDeclineDetails init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("declinedTermsIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    declinedTermsIdentifier = v5->_declinedTermsIdentifier;
    v5->_declinedTermsIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathTermsIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    pathTermsIdentifier = v5->_pathTermsIdentifier;
    v5->_pathTermsIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    pathIdentifier = v5->_pathIdentifier;
    v5->_pathIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *declinedTermsIdentifier;
  id v5;

  declinedTermsIdentifier = self->_declinedTermsIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", declinedTermsIdentifier, CFSTR("declinedTermsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pathTermsIdentifier, CFSTR("pathTermsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pathIdentifier, CFSTR("pathIdentifier"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("declinedTermsIdentifier: '%@'; "), self->_declinedTermsIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("pathTermsIdentifier: '%@'; "), self->_pathTermsIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("pathIdentifier: '%@'; "), self->_pathIdentifier);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *declinedTermsIdentifier;
  NSString *v6;
  NSString *pathTermsIdentifier;
  NSString *v8;
  NSString *pathIdentifier;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  declinedTermsIdentifier = self->_declinedTermsIdentifier;
  v6 = (NSString *)v4[1];
  if (declinedTermsIdentifier && v6)
  {
    if ((-[NSString isEqual:](declinedTermsIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (declinedTermsIdentifier != v6)
  {
    goto LABEL_14;
  }
  pathTermsIdentifier = self->_pathTermsIdentifier;
  v8 = (NSString *)v4[2];
  if (!pathTermsIdentifier || !v8)
  {
    if (pathTermsIdentifier == v8)
      goto LABEL_10;
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if ((-[NSString isEqual:](pathTermsIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_14;
LABEL_10:
  pathIdentifier = self->_pathIdentifier;
  v10 = (NSString *)v4[3];
  if (pathIdentifier && v10)
    v11 = -[NSString isEqual:](pathIdentifier, "isEqual:");
  else
    v11 = pathIdentifier == v10;
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_declinedTermsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_pathTermsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_pathIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKFeatureApplicationDeclineDetails *v5;
  uint64_t v6;
  NSString *declinedTermsIdentifier;
  uint64_t v8;
  NSString *pathTermsIdentifier;
  uint64_t v10;
  NSString *pathIdentifier;

  v5 = -[PKFeatureApplicationDeclineDetails init](+[PKFeatureApplicationDeclineDetails allocWithZone:](PKFeatureApplicationDeclineDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_declinedTermsIdentifier, "copyWithZone:", a3);
  declinedTermsIdentifier = v5->_declinedTermsIdentifier;
  v5->_declinedTermsIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_pathTermsIdentifier, "copyWithZone:", a3);
  pathTermsIdentifier = v5->_pathTermsIdentifier;
  v5->_pathTermsIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_pathIdentifier, "copyWithZone:", a3);
  pathIdentifier = v5->_pathIdentifier;
  v5->_pathIdentifier = (NSString *)v10;

  return v5;
}

- (NSString)declinedTermsIdentifier
{
  return self->_declinedTermsIdentifier;
}

- (void)setDeclinedTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)pathTermsIdentifier
{
  return self->_pathTermsIdentifier;
}

- (void)setPathTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)pathIdentifier
{
  return self->_pathIdentifier;
}

- (void)setPathIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathIdentifier, 0);
  objc_storeStrong((id *)&self->_pathTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_declinedTermsIdentifier, 0);
}

@end
