@implementation PKWebServiceSharingActivationConfiguration

- (PKWebServiceSharingActivationConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKWebServiceSharingActivationConfiguration *v5;
  uint64_t v6;
  NSString *channelBundleIdentifier;
  __CFString *v8;
  __CFString *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  NSString *manufacturerIdentifier;
  void *v14;
  void *v15;
  void *v16;
  PKOSVersionRequirementRange *v17;
  PKOSVersionRequirementRange *versionRange;
  void *v19;
  int v20;
  uint64_t v21;
  PKWebServiceSharingActivationConfiguration *v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *blockedSharingChannels;
  uint64_t v29;
  NSArray *allowedSharingChannels;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  char v37;
  __CFString *v38;
  __CFString *v39;
  int v40;
  __CFString *v41;
  __CFString *v42;
  char v43;
  objc_super v44;

  v4 = a3;
  if (v4)
  {
    v44.receiver = self;
    v44.super_class = (Class)PKWebServiceSharingActivationConfiguration;
    v5 = -[PKWebServiceSharingActivationConfiguration init](&v44, sel_init);
    if (!v5)
    {
LABEL_25:
      self = v5;
      v22 = self;
      goto LABEL_26;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("channelBundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    channelBundleIdentifier = v5->_channelBundleIdentifier;
    v5->_channelBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("channelRiskLevel"));
    v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 == CFSTR("high"))
      goto LABEL_6;
    if (!v8)
      goto LABEL_8;
    v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("high"));

    if ((v10 & 1) != 0)
    {
LABEL_6:
      v11 = 1;
    }
    else
    {
      v32 = v9;
      if (v32 == CFSTR("medium")
        || (v33 = v32,
            v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("medium")),
            v33,
            (v34 & 1) != 0))
      {
        v11 = 2;
      }
      else
      {
        v38 = v33;
        if (v38 != CFSTR("low"))
        {
          v39 = v38;
          v40 = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("low"));

          if (!v40)
          {
LABEL_8:
            objc_msgSend(v4, "PKStringForKey:", CFSTR("manufacturerIdentifier"));
            v12 = objc_claimAutoreleasedReturnValue();
            manufacturerIdentifier = v5->_manufacturerIdentifier;
            v5->_manufacturerIdentifier = (NSString *)v12;

            objc_msgSend(v4, "PKStringForKey:", CFSTR("accessPassType"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
              v5->_accessPassType = PKSecureElementAccessPassTypeFromString(v14);
            objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("versionRange"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = -[PKOSVersionRequirementRange initWithDictionary:]([PKOSVersionRequirementRange alloc], "initWithDictionary:", v16);
              versionRange = v5->_versionRange;
              v5->_versionRange = v17;

            }
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultState"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("defaultState"));
              v21 = 1;
              if (!v20)
                v21 = 2;
              v5->_defaultState = v21;
            }
            if (objc_msgSend(v4, "PKBoolForKey:", CFSTR("isTrustedChannel")))
            {
              v5->_trustLevel = 1;
LABEL_24:
              v5->_codeLength = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("codeLength"));
              objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("blockedSharingChannels"));
              v27 = objc_claimAutoreleasedReturnValue();
              blockedSharingChannels = v5->_blockedSharingChannels;
              v5->_blockedSharingChannels = (NSArray *)v27;

              objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("allowedSharingChannels"));
              v29 = objc_claimAutoreleasedReturnValue();
              allowedSharingChannels = v5->_allowedSharingChannels;
              v5->_allowedSharingChannels = (NSArray *)v29;

              goto LABEL_25;
            }
            objc_msgSend(v4, "PKStringForKey:", CFSTR("trustLevel"));
            v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23 != CFSTR("trusted"))
            {
              if (v23)
              {
                v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("trusted"));

                if ((v25 & 1) == 0)
                {
                  v35 = v24;
                  if (v35 == CFSTR("blocked")
                    || (v36 = v35,
                        v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("blocked")),
                        v36,
                        (v37 & 1) != 0))
                  {
                    v26 = 3;
                    goto LABEL_23;
                  }
                  v41 = v36;
                  if (v41 == CFSTR("untrusted")
                    || (v42 = v41,
                        v43 = -[__CFString isEqualToString:](v41, "isEqualToString:", CFSTR("untrusted")),
                        v42,
                        (v43 & 1) != 0))
                  {
                    v26 = 2;
                    goto LABEL_23;
                  }
                }
              }
            }
            v26 = 1;
LABEL_23:
            v5->_trustLevel = v26;

            goto LABEL_24;
          }
        }
        v11 = 3;
      }
    }
    v5->_channelRiskLevel = v11;
    goto LABEL_8;
  }
  v22 = 0;
LABEL_26:

  return v22;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("channelBundleIdentifier: '%@'; "), self->_channelBundleIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("channelRiskLevel: '%lu'; "), self->_channelRiskLevel);
  objc_msgSend(v6, "appendFormat:", CFSTR("manufacturerIdentifier: '%@'; "), self->_manufacturerIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("accessPassType: '%lu'; "), self->_accessPassType);
  objc_msgSend(v6, "appendFormat:", CFSTR("defaultState: '%lu'; "), self->_defaultState);
  objc_msgSend(v6, "appendFormat:", CFSTR("trustLevel: '%lu'; "), self->_trustLevel);
  objc_msgSend(v6, "appendFormat:", CFSTR("codeLength: '%lu'; "), self->_codeLength);
  objc_msgSend(v6, "appendFormat:", CFSTR("blockedSharingChannels: '%@'; "), self->_blockedSharingChannels);
  objc_msgSend(v6, "appendFormat:", CFSTR("allowedSharingChannels: '%@'; "), self->_allowedSharingChannels);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)channelBundleIdentifier
{
  return self->_channelBundleIdentifier;
}

- (int64_t)channelRiskLevel
{
  return self->_channelRiskLevel;
}

- (int64_t)accessPassType
{
  return self->_accessPassType;
}

- (PKOSVersionRequirementRange)versionRange
{
  return self->_versionRange;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (int64_t)codeLength
{
  return self->_codeLength;
}

- (unint64_t)defaultState
{
  return self->_defaultState;
}

- (int64_t)trustLevel
{
  return self->_trustLevel;
}

- (NSArray)blockedSharingChannels
{
  return self->_blockedSharingChannels;
}

- (NSArray)allowedSharingChannels
{
  return self->_allowedSharingChannels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSharingChannels, 0);
  objc_storeStrong((id *)&self->_blockedSharingChannels, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_versionRange, 0);
  objc_storeStrong((id *)&self->_channelBundleIdentifier, 0);
}

@end
