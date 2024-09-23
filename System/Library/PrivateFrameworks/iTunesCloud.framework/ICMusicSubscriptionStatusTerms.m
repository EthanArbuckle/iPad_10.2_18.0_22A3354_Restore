@implementation ICMusicSubscriptionStatusTerms

- (ICMusicSubscriptionStatusTerms)initWithResponseTermsDictionary:(id)a3
{
  id v4;
  ICMusicSubscriptionStatusTerms *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionStatusTerms;
  v5 = -[ICMusicSubscriptionStatusTerms init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v5->_type = objc_msgSend(v6, "isEqualToString:", CFSTR("Store"));
    objc_msgSend(v4, "objectForKey:", CFSTR("source"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v5->_sourceType = objc_msgSend(v7, "isEqualToString:", CFSTR("account"));
    objc_msgSend(v4, "objectForKey:", CFSTR("latestTerms"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_currentVersion = objc_msgSend(v8, "integerValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("agreedToTerms"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_acceptedVersion = objc_msgSend(v9, "integerValue");

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ICMusicSubscriptionStatusTerms *v4;
  ICMusicSubscriptionStatusTerms *v5;
  BOOL v6;

  v4 = (ICMusicSubscriptionStatusTerms *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_acceptedVersion == v5->_acceptedVersion
        && self->_currentVersion == v5->_currentVersion
        && self->_sourceType == v5->_sourceType
        && self->_type == v5->_type;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (ICMusicSubscriptionStatusTerms)initWithCoder:(id)a3
{
  id v4;
  ICMusicSubscriptionStatusTerms *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicSubscriptionStatusTerms;
  v5 = -[ICMusicSubscriptionStatusTerms init](&v7, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_sourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceType"));
    v5->_currentVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("currentVersion"));
    v5->_acceptedVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("acceptedVersion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceType, CFSTR("sourceType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentVersion, CFSTR("currentVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_acceptedVersion, CFSTR("acceptedVersion"));

}

- (int64_t)acceptedVersion
{
  return self->_acceptedVersion;
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int64_t)type
{
  return self->_type;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
