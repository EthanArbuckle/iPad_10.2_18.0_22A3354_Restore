@implementation PKPaymentSetupProductPaymentOption

- (PKPaymentSetupProductPaymentOption)initWithPaymentOptionDictionary:(id)a3
{
  id v4;
  PKPaymentSetupProductPaymentOption *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentSetupProductPaymentOption;
  v5 = -[PKPaymentSetupProductPaymentOption init](&v19, sel_init);
  if (v5)
  {
    v5->_priority = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("priority"));
    v5->_cardType = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("cardTypeCode"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("protocols"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (!v7)
      goto LABEL_16;
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("a")))
        {
          if (objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("b")))
          {
            if (objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("f")))
              continue;
            v12 = 4;
          }
          else
          {
            v12 = 2;
          }
        }
        else
        {
          v12 = 1;
        }
        v5->_supportedProtocols |= v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (!v8)
      {
LABEL_16:

        break;
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupProductPaymentOption)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupProductPaymentOption *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupProductPaymentOption;
  v5 = -[PKPaymentSetupProductPaymentOption init](&v7, sel_init);
  if (v5)
  {
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardTypeCode"));
    v5->_supportedProtocols = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("protocols"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t priority;
  id v5;

  priority = self->_priority;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardType, CFSTR("cardTypeCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedProtocols, CFSTR("protocols"));

}

- (unint64_t)priority
{
  return self->_priority;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (int64_t)supportedProtocols
{
  return self->_supportedProtocols;
}

@end
