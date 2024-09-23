@implementation PKTextContactFieldConfiguration

- (PKTextContactFieldConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKTextContactFieldConfiguration *v5;
  uint64_t v6;
  NSString *displayFormat;
  uint64_t v8;
  NSString *displayFormatPlaceholder;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSCharacterSet *characterSet;
  void *v24;
  uint64_t v25;
  id v26;
  NSRegularExpression *validRegex;
  PKTextContactFieldConfiguration *v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  id v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  PKTextContactFieldConfiguration *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKTextContactFieldConfiguration;
  v5 = -[PKContactFieldConfiguration initWithType:](&v34, sel_initWithType_, 1);
  if (!v5)
    goto LABEL_53;
  v5->_minLength = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("minLength"));
  v5->_maxLength = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("maxLength"));
  v5->_numeric = objc_msgSend(v4, "PKBoolForKey:", CFSTR("numeric"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("displayFormat"));
  v6 = objc_claimAutoreleasedReturnValue();
  displayFormat = v5->_displayFormat;
  v5->_displayFormat = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("displayFormatPlaceholder"));
  v8 = objc_claimAutoreleasedReturnValue();
  displayFormatPlaceholder = v5->_displayFormatPlaceholder;
  v5->_displayFormatPlaceholder = (NSString *)v8;

  v5->_keepPaddingCharactersForSubmission = objc_msgSend(v4, "PKBoolForKey:", CFSTR("keepPaddingCharactersForSubmission"));
  v5->_isValidCharacterSet = objc_msgSend(v4, "PKBoolForKey:", CFSTR("isValidCharacterSet"));
  objc_msgSend(v4, "PKArrayForKey:", CFSTR("characterSetDescriptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    if (objc_msgSend(v12, "count"))
    {
      v13 = objc_alloc_init(MEMORY[0x1E0CB3780]);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
      if (v15)
      {
        v16 = v15;
        v32 = v12;
        v17 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v14);
            v19 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);
            if (objc_msgSend(v19, "isEqualToString:", CFSTR("alphanumericCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("capitalizedLetterCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "capitalizedLetterCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("controlCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("decimalDigitCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("decomposableCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "decomposableCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("illegalCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "illegalCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("letterCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("lowercaseLetterCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("newlineCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("nonBaseCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "nonBaseCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("punctuationCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("symbolCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("uppercaseLetterCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v19, "isEqualToString:", CFSTR("whitespaceAndNewlineCharacterSet")))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("whitespaceCharacterSet")) & 1) == 0)
              {

LABEL_45:
                v13 = 0;
                goto LABEL_46;
              }
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v20 = objc_claimAutoreleasedReturnValue();
            }
            v21 = (void *)v20;

            if (!v21)
              goto LABEL_45;
            objc_msgSend(v13, "formUnionWithCharacterSet:", v21);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, buf, 16);
          if (v16)
            continue;
          break;
        }
LABEL_46:
        v12 = v32;
      }

      v22 = objc_msgSend(v13, "copy");
    }
    else
    {
      v22 = 0;
    }

    characterSet = v5->_characterSet;
    v5->_characterSet = (NSCharacterSet *)v22;

    if (!v5->_characterSet)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v5;
        v41 = 2112;
        v42 = v12;
        _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "%@: Failed to initialize validCharacterSet with array: %@", buf, 0x16u);
      }

      goto LABEL_60;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("validRegex"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v33 = 0;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v24, 0, &v33);
    v26 = v33;
    validRegex = v5->_validRegex;
    v5->_validRegex = (NSRegularExpression *)v25;

    if (!v5->_validRegex || v26)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v5;
        v41 = 2112;
        v42 = v26;
        _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "%@: Failed to initialize validRegex: %@", buf, 0x16u);
      }

LABEL_60:
      v28 = 0;
      goto LABEL_61;
    }
  }

LABEL_53:
  v28 = v5;
LABEL_61:

  return v28;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("minLength"), self->_minLength);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("maxLength"), self->_maxLength);
  if (self->_numeric)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("numeric"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("displayFormat"), self->_displayFormat);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("displayFormatPlaceholder"),
    self->_displayFormatPlaceholder);
  if (self->_keepPaddingCharactersForSubmission)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("keepPaddingCharactersForSubmission"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("characterSet"), self->_characterSet);
  if (self->_isValidCharacterSet)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("isValidCharacterSet"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("validRegex"), self->_validRegex);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextContactFieldConfiguration;
  v4 = a3;
  -[PKContactFieldConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minLength, CFSTR("minLength"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maxLength, CFSTR("maxLength"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_numeric, CFSTR("numeric"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayFormat, CFSTR("displayFormat"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayFormatPlaceholder, CFSTR("displayFormatPlaceholder"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_keepPaddingCharactersForSubmission, CFSTR("keepPaddingCharactersForSubmission"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_characterSet, CFSTR("characterSet"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isValidCharacterSet, CFSTR("isValidCharacterSet"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_validRegex, CFSTR("validRegex"));

}

- (PKTextContactFieldConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKTextContactFieldConfiguration *v5;
  uint64_t v6;
  NSString *displayFormat;
  uint64_t v8;
  NSString *displayFormatPlaceholder;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSCharacterSet *characterSet;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSRegularExpression *validRegex;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKTextContactFieldConfiguration;
  v5 = -[PKContactFieldConfiguration initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_minLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minLength"));
    v5->_maxLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxLength"));
    v5->_numeric = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("numeric"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayFormat = v5->_displayFormat;
    v5->_displayFormat = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayFormatPlaceholder"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayFormatPlaceholder = v5->_displayFormatPlaceholder;
    v5->_displayFormatPlaceholder = (NSString *)v8;

    v5->_keepPaddingCharactersForSubmission = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("keepPaddingCharactersForSubmission"));
    v5->_isValidCharacterSet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isValidCharacterSet"));
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("characterSet"));
    v13 = objc_claimAutoreleasedReturnValue();
    characterSet = v5->_characterSet;
    v5->_characterSet = (NSCharacterSet *)v13;

    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("validRegex"));
    v18 = objc_claimAutoreleasedReturnValue();
    validRegex = v5->_validRegex;
    v5->_validRegex = (NSRegularExpression *)v18;

  }
  return v5;
}

- (int64_t)minLength
{
  return self->_minLength;
}

- (int64_t)maxLength
{
  return self->_maxLength;
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (NSString)displayFormat
{
  return self->_displayFormat;
}

- (NSString)displayFormatPlaceholder
{
  return self->_displayFormatPlaceholder;
}

- (BOOL)keepPaddingCharactersForSubmission
{
  return self->_keepPaddingCharactersForSubmission;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (BOOL)isValidCharacterSet
{
  return self->_isValidCharacterSet;
}

- (NSRegularExpression)validRegex
{
  return self->_validRegex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRegex, 0);
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_displayFormatPlaceholder, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
}

@end
