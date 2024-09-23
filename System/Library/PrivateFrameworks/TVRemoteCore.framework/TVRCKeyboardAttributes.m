@implementation TVRCKeyboardAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRCKeyboardAttributes;
  result = -[TVRCKeyboardAttributes init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 8) = 2;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p; title='%@'; PINEntryAttributes=%@; secure=%d; enablesReturnKeyAutomatically=%d; keyboardType=%d; returnKeyType=%d; autocapitalizationType=%d; autocorrectionType=%d; spellCheckingType=%d>"),
               objc_opt_class(),
               self,
               self->_title,
               self->_PINEntryAttributes,
               self->_secure,
               self->_enablesReturnKeyAutomatically,
               self->_keyboardType,
               self->_returnKeyType,
               self->_autocapitalizationType,
               self->_autocorrectionType,
               self->_spellCheckingType);
}

- (TVRCKeyboardAttributes)initWithCoder:(id)a3
{
  id v4;
  TVRCKeyboardAttributes *v5;
  uint64_t v6;
  RTIDataPayload *rtiDataPayload;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  TVRCPINEntryAttributes *PINEntryAttributes;

  v4 = a3;
  v5 = -[TVRCKeyboardAttributes _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rtiDataPayload"));
    v6 = objc_claimAutoreleasedReturnValue();
    rtiDataPayload = v5->_rtiDataPayload;
    v5->_rtiDataPayload = (RTIDataPayload *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_likelyPINEntry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("likelyPINEntry"));
    v5->_secure = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secure"));
    v5->_enablesReturnKeyAutomatically = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enablesReturnKeyAutomatically"));
    v5->_keyboardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyboardType"));
    v5->_returnKeyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("returnKeyType"));
    v5->_autocapitalizationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("autocapitalizationType"));
    v5->_autocorrectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("autocorrectionType"));
    v5->_spellCheckingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("spellCheckingType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINEntryAttributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    PINEntryAttributes = v5->_PINEntryAttributes;
    v5->_PINEntryAttributes = (TVRCPINEntryAttributes *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  RTIDataPayload *rtiDataPayload;
  id v5;

  rtiDataPayload = self->_rtiDataPayload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rtiDataPayload, CFSTR("rtiDataPayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_likelyPINEntry, CFSTR("likelyPINEntry"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_secure, CFSTR("secure"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enablesReturnKeyAutomatically, CFSTR("enablesReturnKeyAutomatically"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_keyboardType, CFSTR("keyboardType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_returnKeyType, CFSTR("returnKeyType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_autocapitalizationType, CFSTR("autocapitalizationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_autocorrectionType, CFSTR("autocorrectionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_spellCheckingType, CFSTR("spellCheckingType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_PINEntryAttributes, CFSTR("PINEntryAttributes"));

}

- (BOOL)isEqualToAttributes:(id)a3
{
  _QWORD *v4;
  RTIDataPayload *rtiDataPayload;
  char v6;
  NSString *title;

  v4 = a3;
  rtiDataPayload = self->_rtiDataPayload;
  if (!rtiDataPayload)
  {
    title = self->_title;
    if (!title)
      goto LABEL_23;
    if (!v4[2] || !-[NSString isEqualToString:](title, "isEqualToString:"))
      goto LABEL_19;
    if (self->_title)
    {
      if (!v4[2])
        goto LABEL_19;
    }
    else
    {
LABEL_23:
      if (v4[2])
        goto LABEL_19;
    }
    if (self->_likelyPINEntry == *((unsigned __int8 *)v4 + 8)
      && self->_secure == *((unsigned __int8 *)v4 + 9)
      && self->_enablesReturnKeyAutomatically == *((unsigned __int8 *)v4 + 10)
      && self->_keyboardType == v4[6]
      && self->_returnKeyType == v4[7]
      && self->_autocapitalizationType == v4[8]
      && self->_autocorrectionType == v4[9])
    {
      v6 = self->_spellCheckingType == v4[10];
      goto LABEL_20;
    }
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if (!v4)
    goto LABEL_19;
  v6 = -[RTIDataPayload isEqual:](rtiDataPayload, "isEqual:", v4[5]);
LABEL_20:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TVRCKeyboardAttributes isEqualToAttributes:](self, "isEqualToAttributes:", v4);

  return v5;
}

- (unint64_t)hash
{
  return 1;
}

- (void)applyToTextField:(id)a3
{
  void *v4;
  void *v5;
  int64_t keyboardType;
  int64_t returnKeyType;
  int64_t autocapitalizationType;
  uint64_t v9;
  int64_t spellCheckingType;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "_rtiSourceSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && self->_rtiDataPayload)
  {
    objc_msgSend(v4, "handleTextActionPayload:");
  }
  else
  {
    objc_msgSend(v12, "setSecureTextEntry:", self->_secure);
    objc_msgSend(v12, "setEnablesReturnKeyAutomatically:", self->_enablesReturnKeyAutomatically);
    keyboardType = self->_keyboardType;
    switch(keyboardType)
    {
      case 1:
      case 2:
      case 3:
      case 6:
      case 7:
      case 9:
      case 10:
        break;
      case 4:
      case 5:
      case 8:
        keyboardType = 2;
        break;
      case 11:
        if (self->_likelyPINEntry)
          keyboardType = 11;
        else
          keyboardType = 2;
        break;
      default:
        keyboardType = 0;
        break;
    }
    objc_msgSend(v12, "setKeyboardType:", keyboardType);
    if ((unint64_t)(self->_returnKeyType - 1) >= 0xB)
      returnKeyType = 0;
    else
      returnKeyType = self->_returnKeyType;
    objc_msgSend(v12, "setReturnKeyType:", returnKeyType);
    if ((unint64_t)(self->_autocapitalizationType - 1) >= 3)
      autocapitalizationType = 0;
    else
      autocapitalizationType = self->_autocapitalizationType;
    objc_msgSend(v12, "setAutocapitalizationType:", autocapitalizationType);
    if (self->_autocorrectionType == 2)
      v9 = 2;
    else
      v9 = 1;
    objc_msgSend(v12, "setAutocorrectionType:", v9);
    spellCheckingType = self->_spellCheckingType;
    if (spellCheckingType == 2)
      v11 = 2;
    else
      v11 = spellCheckingType == 1;
    objc_msgSend(v12, "setSpellCheckingType:", v11);
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TVRCPINEntryAttributes)PINEntryAttributes
{
  return self->_PINEntryAttributes;
}

- (void)setPINEntryAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_PINEntryAttributes, a3);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (RTIDataPayload)rtiDataPayload
{
  return self->_rtiDataPayload;
}

- (void)setRtiDataPayload:(id)a3
{
  objc_storeStrong((id *)&self->_rtiDataPayload, a3);
}

- (BOOL)_isLikelyPINEntry
{
  return self->_likelyPINEntry;
}

- (void)_setLikelyPINEntry:(BOOL)a3
{
  self->_likelyPINEntry = a3;
}

- (BOOL)_isSecure
{
  return self->_secure;
}

- (void)_setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (BOOL)_enablesReturnKeyAutomatically
{
  return self->_enablesReturnKeyAutomatically;
}

- (void)_setEnablesReturnKeyAutomatically:(BOOL)a3
{
  self->_enablesReturnKeyAutomatically = a3;
}

- (int64_t)_keyboardType
{
  return self->_keyboardType;
}

- (void)_setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)_returnKeyType
{
  return self->_returnKeyType;
}

- (void)_setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (int64_t)_autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)_setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)_autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)_setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)_spellCheckingType
{
  return self->_spellCheckingType;
}

- (void)_setSpellCheckingType:(int64_t)a3
{
  self->_spellCheckingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtiDataPayload, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_PINEntryAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
