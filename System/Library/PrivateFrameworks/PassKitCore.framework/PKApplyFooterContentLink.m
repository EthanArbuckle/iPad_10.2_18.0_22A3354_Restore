@implementation PKApplyFooterContentLink

- (PKApplyFooterContentLink)initWithDictionary:(id)a3
{
  id v4;
  PKApplyFooterContentLink *v5;
  uint64_t v6;
  NSString *linkText;
  uint64_t v8;
  NSURL *linkURL;
  uint64_t v10;
  NSString *termsIdentifier;
  uint64_t v12;
  NSString *analyticsIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyFooterContentLink;
  v5 = -[PKApplyFooterContentLink init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("linkText"));
    v6 = objc_claimAutoreleasedReturnValue();
    linkText = v5->_linkText;
    v5->_linkText = (NSString *)v6;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("linkURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("termsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("analyticsIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v12;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_linkText, CFSTR("linkText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_linkURL, CFSTR("linkURL"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_analyticsIdentifier, CFSTR("analyticsIdentifier"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKApplyFooterContentLink *v4;
  PKApplyFooterContentLink *v5;
  PKApplyFooterContentLink *v6;
  NSString *linkText;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSURL *linkURL;
  NSURL *v13;
  NSString *termsIdentifier;
  NSString *v15;
  NSString *analyticsIdentifier;
  NSString *v17;
  NSString *v18;

  v4 = (PKApplyFooterContentLink *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        linkText = v6->_linkText;
        v8 = self->_linkText;
        v9 = linkText;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_28;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_29;
        }
        linkURL = self->_linkURL;
        v13 = v6->_linkURL;
        if (linkURL && v13)
        {
          if ((-[NSURL isEqual:](linkURL, "isEqual:") & 1) != 0)
          {
LABEL_15:
            termsIdentifier = v6->_termsIdentifier;
            v8 = self->_termsIdentifier;
            v15 = termsIdentifier;
            if (v8 == v15)
            {

LABEL_23:
              analyticsIdentifier = self->_analyticsIdentifier;
              v17 = v6->_analyticsIdentifier;
              v8 = analyticsIdentifier;
              v18 = v17;
              if (v8 == v18)
              {
                LOBYTE(v11) = 1;
                v10 = v8;
              }
              else
              {
                v10 = v18;
                LOBYTE(v11) = 0;
                if (v8 && v18)
                  LOBYTE(v11) = -[NSString isEqualToString:](v8, "isEqualToString:", v18);
              }
              goto LABEL_28;
            }
            v10 = v15;
            LOBYTE(v11) = 0;
            if (v8 && v15)
            {
              v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v15);

              if (!v11)
                goto LABEL_29;
              goto LABEL_23;
            }
LABEL_28:

            goto LABEL_29;
          }
        }
        else if (linkURL == v13)
        {
          goto LABEL_15;
        }
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_linkText);
  objc_msgSend(v3, "safelyAddObject:", self->_linkURL);
  objc_msgSend(v3, "safelyAddObject:", self->_termsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_analyticsIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_linkText)
    objc_msgSend(v3, "appendFormat:", CFSTR("linkText: '%@'; "), self->_linkText);
  if (self->_linkURL)
    objc_msgSend(v4, "appendFormat:", CFSTR("termsIdentifier: '%@'; "), self->_termsIdentifier);
  if (self->_termsIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("termsIdentifier: '%@'; "), self->_termsIdentifier);
  if (self->_analyticsIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("analyticsIdentifier: '%@'; "), self->_analyticsIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplyFooterContentLink)initWithCoder:(id)a3
{
  id v4;
  PKApplyFooterContentLink *v5;
  uint64_t v6;
  NSString *linkText;
  uint64_t v8;
  NSURL *linkURL;
  uint64_t v10;
  NSString *termsIdentifier;
  uint64_t v12;
  NSString *analyticsIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyFooterContentLink;
  v5 = -[PKApplyFooterContentLink init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkText"));
    v6 = objc_claimAutoreleasedReturnValue();
    linkText = v5->_linkText;
    v5->_linkText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analyticsIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *linkText;
  id v5;

  linkText = self->_linkText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", linkText, CFSTR("linkText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkURL, CFSTR("linkURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsIdentifier, CFSTR("analyticsIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKApplyFooterContentLink *v5;
  uint64_t v6;
  NSString *linkText;
  uint64_t v8;
  NSURL *linkURL;
  uint64_t v10;
  NSString *termsIdentifier;
  uint64_t v12;
  NSString *analyticsIdentifier;

  v5 = -[PKApplyFooterContentLink init](+[PKApplyFooterContentLink allocWithZone:](PKApplyFooterContentLink, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_linkText, "copyWithZone:", a3);
  linkText = v5->_linkText;
  v5->_linkText = (NSString *)v6;

  v8 = -[NSURL copyWithZone:](self->_linkURL, "copyWithZone:", a3);
  linkURL = v5->_linkURL;
  v5->_linkURL = (NSURL *)v8;

  v10 = -[NSString copyWithZone:](self->_termsIdentifier, "copyWithZone:", a3);
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_analyticsIdentifier, "copyWithZone:", a3);
  analyticsIdentifier = v5->_analyticsIdentifier;
  v5->_analyticsIdentifier = (NSString *)v12;

  return v5;
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
}

@end
