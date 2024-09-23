@implementation PKPaymentSetupField

+ (id)paymentSetupFieldWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "paymentSetupFieldWithIdentifier:configuration:", a3, 0);
}

+ (id)paymentSetupFieldWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v5;
  objc_class *v6;
  void *v7;

  v5 = a3;
  v6 = +[PKPaymentSetupField classForIdentifier:type:](PKPaymentSetupField, "classForIdentifier:type:", v5, a4);
  if (v6)
    v7 = (void *)objc_msgSend([v6 alloc], "initWithIdentifier:type:", v5, a4);
  else
    v7 = 0;

  return v7;
}

+ (id)paymentSetupFieldWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("fieldType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "paymentSetupFieldWithIdentifier:type:", v7, PKPaymentSetupFieldTypeFromString(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v9)
    objc_msgSend(v9, "updateWithConfiguration:", v6);

  return v9;
}

+ (id)paymentSetupFieldWithDIAttribute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "attributeType") - 1;
  if (v6 > 7)
    v7 = 0;
  else
    v7 = qword_190453498[v6];
  objc_msgSend(v4, "paymentSetupFieldWithIdentifier:type:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateWithAttribute:", v3);
  return v8;
}

- (PKPaymentSetupField)init
{
  return -[PKPaymentSetupField initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (PKPaymentSetupField)initWithIdentifier:(id)a3
{
  return -[PKPaymentSetupField initWithIdentifier:configuration:](self, "initWithIdentifier:configuration:", a3, 0);
}

- (PKPaymentSetupField)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  PKPaymentSetupField *v14;
  uint64_t v15;
  NSString *identifier;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = +[PKPaymentSetupField classForIdentifier:type:](PKPaymentSetupField, "classForIdentifier:type:", v6, a4);
  if (!v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Error: Attempted to directly init the PKPaymentSetupField base class. This is not supported.", buf, 2u);
    }

    goto LABEL_14;
  }
  v8 = v7;
  if (v7 != (objc_class *)objc_opt_class())
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 - 1 > 4)
      v12 = CFSTR("unknown");
    else
      v12 = off_1E2AC1650[a4 - 1];
    NSStringFromClass(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Error: Attempted to init %@ with identifier:%@ and type:%@ which actually requires %@. Give +[PKPaymentSetupField paymentSetupFieldWithIdentifier: type:] a go instead!"), v11, v6, v12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v18);
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentSetupField;
  v14 = -[PKPaymentSetupField init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v6, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    -[PKPaymentSetupField setSubmissionKey:](v14, "setSubmissionKey:", v6);
    -[PKPaymentSetupField setOptional:](v14, "setOptional:", 0);
    -[PKPaymentSetupField setReadonly:](v14, "setReadonly:", 0);
    -[PKPaymentSetupField setSubmissionDestination:](v14, "setSubmissionDestination:", CFSTR("enable"));
    *(_WORD *)&v14->_requiresSecureSubmission = 256;
  }
LABEL_15:

  return v14;
}

- (PKPaymentSetupField)initWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPaymentSetupField *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("fieldType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentSetupField initWithIdentifier:type:](self, "initWithIdentifier:type:", v7, PKPaymentSetupFieldTypeFromString(v8));

  if (v6 && v9)
    -[PKPaymentSetupField updateWithConfiguration:](v9, "updateWithConfiguration:", v6);

  return v9;
}

- (void)updateWithAttribute:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKPaymentSetupField setAttribute:](self, "setAttribute:", v7);
  objc_msgSend(v7, "localizedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    -[PKPaymentSetupField _setLocalizedDisplayName:](self, "_setLocalizedDisplayName:", v4);
  objc_msgSend(v7, "localizedPlaceholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    -[PKPaymentSetupField setLocalizedPlaceholder:](self, "setLocalizedPlaceholder:", v5);
  objc_msgSend(v7, "displayFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    -[PKPaymentSetupField setDisplayFormat:](self, "setDisplayFormat:", v6);
  -[PKPaymentSetupField setOptional:](self, "setOptional:", objc_msgSend(v7, "optional"));

}

- (void)updateWithConfiguration:(id)a3
{
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *odiAttribute;
  void *v24;
  void *v25;
  NSDictionary *rawConfigurationDictionary;
  NSDictionary *v27;
  NSDictionary *v28;
  NSDictionary *v29;
  NSDictionary *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  PKPaymentSetupFieldRequirement *v38;
  NSArray *v39;
  NSArray *requirements;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = (NSDictionary *)a3;
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("localizedDisplayName"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PKPaymentSetupField _setLocalizedDisplayName:](self, "_setLocalizedDisplayName:", v5);
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("localizedPlaceholder"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PKPaymentSetupField setLocalizedPlaceholder:](self, "setLocalizedPlaceholder:", v6);
  v48 = (void *)v5;
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("displayFormat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    -[PKPaymentSetupField setDisplayFormat:](self, "setDisplayFormat:", v7);
  v46 = v7;
  v8 = -[PKPaymentSetupField _shouldStripDiacritics](self, "_shouldStripDiacritics");
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("defaultValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (v10)
    -[PKPaymentSetupField setDefaultValue:](self, "setDefaultValue:", v10);
  -[NSDictionary PKNumberForKey:](v4, "PKNumberForKey:", CFSTR("optional"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    -[PKPaymentSetupField setOptional:](self, "setOptional:", objc_msgSend(v12, "BOOLValue"));
  -[NSDictionary PKNumberForKey:](v4, "PKNumberForKey:", CFSTR("readonly"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    -[PKPaymentSetupField setReadonly:](self, "setReadonly:", objc_msgSend(v14, "BOOLValue"));
  -[NSDictionary PKNumberForKey:](v4, "PKNumberForKey:", CFSTR("hidden"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    -[PKPaymentSetupField setHidden:](self, "setHidden:", objc_msgSend(v16, "BOOLValue"));
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("submissionKey"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
    -[PKPaymentSetupField setSubmissionKey:](self, "setSubmissionKey:", v18);
  v47 = (void *)v6;
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("submissionDestination"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
    -[PKPaymentSetupField setSubmissionDestination:](self, "setSubmissionDestination:", v19);
  v41 = (void *)v19;
  v45 = v10;
  -[NSDictionary PKNumberForKey:](v4, "PKNumberForKey:", CFSTR("requiresSecureSubmission"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    -[PKPaymentSetupField setRequiresSecureSubmission:](self, "setRequiresSecureSubmission:", objc_msgSend(v20, "BOOLValue"));
  v44 = v13;
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("odiAttribute"));
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  odiAttribute = self->_odiAttribute;
  self->_odiAttribute = v22;

  -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("populateFromMeCard"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    self->_populateFromMeCard = -[NSDictionary PKBoolForKey:](v4, "PKBoolForKey:", CFSTR("populateFromMeCard"));
  v42 = (void *)v18;
  -[NSDictionary PKStringForKey:](v4, "PKStringForKey:", CFSTR("groupNumber"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_groupNumber = objc_msgSend(v25, "integerValue");

  rawConfigurationDictionary = self->_rawConfigurationDictionary;
  if (rawConfigurationDictionary != v4)
  {
    if (rawConfigurationDictionary)
    {
      v27 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_rawConfigurationDictionary);
      -[NSDictionary addEntriesFromDictionary:](v27, "addEntriesFromDictionary:", v4);
      v28 = (NSDictionary *)-[NSDictionary copy](v27, "copy");
      v29 = self->_rawConfigurationDictionary;
      self->_rawConfigurationDictionary = v28;

    }
    else
    {
      v30 = (NSDictionary *)-[NSDictionary copy](v4, "copy");
      v27 = self->_rawConfigurationDictionary;
      self->_rawConfigurationDictionary = v30;
    }

  }
  v43 = v17;
  -[NSDictionary PKArrayContaining:forKey:](v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requirements"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v31, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = v31;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(v33);
        v38 = -[PKPaymentSetupFieldRequirement initWithDictionary:]([PKPaymentSetupFieldRequirement alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        if (-[PKPaymentSetupFieldRequirement type](v38, "type"))
          objc_msgSend(v32, "addObject:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v35);
  }

  v39 = (NSArray *)objc_msgSend(v32, "copy");
  requirements = self->_requirements;
  self->_requirements = v39;

}

- (BOOL)isBuiltIn
{
  return 0;
}

- (BOOL)supportsAddressAutofill
{
  return 0;
}

- (BOOL)isFieldTypeText
{
  return -[PKPaymentSetupField fieldType](self, "fieldType") == 1;
}

- (BOOL)isFieldTypeDate
{
  return -[PKPaymentSetupField fieldType](self, "fieldType") == 2;
}

- (BOOL)isFieldTypeLabel
{
  return -[PKPaymentSetupField fieldType](self, "fieldType") == 3;
}

- (BOOL)isFieldTypeFooter
{
  return -[PKPaymentSetupField fieldType](self, "fieldType") == 4;
}

- (BOOL)isFieldTypePicker
{
  return -[PKPaymentSetupField fieldType](self, "fieldType") == 5;
}

- (BOOL)preventVoiceOver
{
  return 0;
}

- (BOOL)_shouldStripDiacritics
{
  if (-[PKPaymentSetupField isFieldTypeLabel](self, "isFieldTypeLabel"))
    return 0;
  else
    return !-[PKPaymentSetupField isFieldTypeFooter](self, "isFieldTypeFooter");
}

- (id)textFieldObject
{
  PKPaymentSetupField *v3;

  if (-[PKPaymentSetupField isFieldTypeText](self, "isFieldTypeText"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)dateFieldObject
{
  PKPaymentSetupField *v3;

  if (-[PKPaymentSetupField isFieldTypeDate](self, "isFieldTypeDate"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)labelFieldObject
{
  PKPaymentSetupField *v3;

  if (-[PKPaymentSetupField isFieldTypeLabel](self, "isFieldTypeLabel"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)footerFieldObject
{
  PKPaymentSetupField *v3;

  if (-[PKPaymentSetupField isFieldTypeFooter](self, "isFieldTypeFooter"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)pickerFieldObject
{
  PKPaymentSetupField *v3;

  if (-[PKPaymentSetupField isFieldTypePicker](self, "isFieldTypePicker"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (NSString)localizedPlaceholder
{
  NSString *v3;
  __CFString *v4;

  v3 = self->_localizedPlaceholder;
  if (!v3)
  {
    if (self->_optional)
      v4 = CFSTR("OPTIONAL");
    else
      v4 = CFSTR("REQUIRED");
    PKLocalizedPaymentString(&v4->isa, 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)displayString
{
  void *v3;

  -[PKPaymentSetupField currentValue](self, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKPaymentSetupField defaultValue](self, "defaultValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)submissionString
{
  void *v3;
  void *v4;

  -[PKPaymentSetupField currentValue](self, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupField _submissionStringForValue:](self, "_submissionStringForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_submissionStringForValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[PKPaymentSetupField defaultValue](self, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  return 1;
}

- (BOOL)submissionStringMeetsValidationRegex
{
  return 1;
}

- (void)setLocalizedDisplayName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = CFSTR("localizedDisplayName");
    v8[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentSetupField updateWithConfiguration:](self, "updateWithConfiguration:", v6);
  }
}

- (void)_setLocalizedDisplayName:(id)a3
{
  NSString *v4;
  NSString *localizedDisplayName;

  if (self->_localizedDisplayName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    localizedDisplayName = self->_localizedDisplayName;
    self->_localizedDisplayName = v4;

  }
}

- (void)setDefaultValue:(id)a3
{
  NSString *v4;
  NSString *defaultValue;

  if (self->_defaultValue != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    defaultValue = self->_defaultValue;
    self->_defaultValue = v4;

    -[PKPaymentSetupField noteCurrentValueChanged](self, "noteCurrentValueChanged");
  }
}

- (void)setCurrentValue:(id)a3
{
  NSObject *v4;
  NSObject *currentValue;

  if (self->_currentValue != a3)
  {
    v4 = objc_msgSend(a3, "copyWithZone:", 0);
    currentValue = self->_currentValue;
    self->_currentValue = v4;

    -[DIAttribute setCurrentValue:](self->_attribute, "setCurrentValue:", self->_currentValue);
    -[PKPaymentSetupField noteCurrentValueChanged](self, "noteCurrentValueChanged");
  }
}

- (void)setOriginalCameraCaptureValue:(id)a3
{
  NSObject *v4;
  NSObject *originalCameraCaptureValue;

  if (self->_originalCameraCaptureValue != a3)
  {
    v4 = objc_msgSend(a3, "copyWithZone:", 0);
    originalCameraCaptureValue = self->_originalCameraCaptureValue;
    self->_originalCameraCaptureValue = v4;

  }
}

- (BOOL)isCurrentValueFromCameraCapture
{
  return self->_source == 1;
}

- (void)setSource:(unint64_t)a3
{
  if (self->_source != a3)
  {
    self->_source = a3;
    -[PKPaymentSetupField noteCurrentValueChanged](self, "noteCurrentValueChanged");
  }
}

- (unint64_t)fieldType
{
  return 0;
}

+ (Class)classForIdentifier:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  objc_class *v26;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(CFSTR("cardholderName"), "isEqualToString:", v5);
    if (a4 > 1 || (v7 & 1) == 0)
    {
      v8 = objc_msgSend(CFSTR("primaryAccountNumber"), "isEqualToString:", v6);
      if (a4 > 1 || (v8 & 1) == 0)
      {
        v9 = objc_msgSend(CFSTR("cardExpiration"), "isEqualToString:", v6);
        if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 || (v9 & 1) == 0)
        {
          v10 = objc_msgSend(CFSTR("cardSecurityCode"), "isEqualToString:", v6);
          if (a4 > 1 || (v10 & 1) == 0)
          {
            v11 = objc_msgSend(CFSTR("cardOnFilePrimaryAccountNumber"), "isEqualToString:", v6);
            if (a4 > 1 || (v11 & 1) == 0)
            {
              v12 = objc_msgSend(CFSTR("firstName"), "isEqualToString:", v6);
              if (a4 > 1 || (v12 & 1) == 0)
              {
                v13 = objc_msgSend(CFSTR("lastName"), "isEqualToString:", v6);
                if (a4 > 1 || (v13 & 1) == 0)
                {
                  v14 = objc_msgSend(CFSTR("email"), "isEqualToString:", v6);
                  if (a4 > 1 || (v14 & 1) == 0)
                  {
                    if ((objc_msgSend(CFSTR("addressLine1"), "isEqualToString:", v6) & 1) != 0)
                    {
                      if (a4 >= 2)
                      {
                        if ((objc_msgSend(CFSTR("addressLine2"), "isEqualToString:", v6) & 1) == 0)
                          objc_msgSend(CFSTR("street2"), "isEqualToString:", v6);
                        goto LABEL_27;
                      }
                    }
                    else
                    {
                      v15 = objc_msgSend(CFSTR("street1"), "isEqualToString:", v6);
                      if (a4 > 1 || (v15 & 1) == 0)
                      {
                        if ((objc_msgSend(CFSTR("addressLine2"), "isEqualToString:", v6) & 1) != 0)
                        {
                          if (a4 >= 2)
                          {
LABEL_27:
                            objc_msgSend(CFSTR("postalCode"), "isEqualToString:", v6);
                            goto LABEL_28;
                          }
                        }
                        else
                        {
                          v18 = objc_msgSend(CFSTR("street2"), "isEqualToString:", v6);
                          if (a4 > 1 || (v18 & 1) == 0)
                          {
                            v20 = objc_msgSend(CFSTR("postalCode"), "isEqualToString:", v6);
                            if (a4 > 1 || (v20 & 1) == 0)
                            {
LABEL_28:
                              v16 = objc_msgSend(CFSTR("dateOfBirth"), "isEqualToString:", v6);
                              if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 || (v16 & 1) == 0)
                              {
                                v17 = objc_msgSend(CFSTR("subLocality"), "isEqualToString:", v6);
                                if (a4 > 1 || (v17 & 1) == 0)
                                {
                                  v19 = objc_msgSend(CFSTR("administrativeArea"), "isEqualToString:", v6);
                                  if ((a4 > 1 || (v19 & 1) == 0)
                                    && (!objc_msgSend(CFSTR("state"), "isEqualToString:", v6)
                                     || a4 && a4 != 5))
                                  {
                                    v21 = objc_msgSend(CFSTR("city"), "isEqualToString:", v6);
                                    if ((a4 > 1 || (v21 & 1) == 0)
                                      && (!objc_msgSend(CFSTR("countryCode"), "isEqualToString:", v6)
                                       || a4 && a4 != 5))
                                    {
                                      v22 = objc_msgSend(CFSTR("phoneNumber"), "isEqualToString:", v6);
                                      if ((a4 > 1 || (v22 & 1) == 0)
                                        && (!objc_msgSend(CFSTR("citizenship"), "isEqualToString:", v6)
                                         || a4 && a4 != 5))
                                      {
                                        v23 = objc_msgSend(CFSTR("yearlyIncome"), "isEqualToString:", v6);
                                        if (a4 > 1 || (v23 & 1) == 0)
                                        {
                                          v24 = objc_msgSend(CFSTR("totalIncome"), "isEqualToString:", v6);
                                          if (a4 > 1 || (v24 & 1) == 0)
                                          {
                                            v25 = objc_msgSend(CFSTR("totalAssets"), "isEqualToString:", v6);
                                            if ((a4 > 1 || (v25 & 1) == 0)
                                              && (!objc_msgSend(CFSTR("totalAssetsPicker"), "isEqualToString:", v6)|| a4 && a4 != 5)&& (!objc_msgSend(CFSTR("yearlyIncomeLabel"), "isEqualToString:", v6)|| a4 && a4 != 3))
                                            {
                                              v28 = objc_msgSend(CFSTR("ssnFull"), "isEqualToString:", v6);
                                              if (a4 > 1 || (v28 & 1) == 0)
                                              {
                                                v29 = objc_msgSend(CFSTR("ssnSuffix"), "isEqualToString:", v6);
                                                if (a4 > 1 || (v29 & 1) == 0)
                                                {
                                                  v30 = objc_msgSend(CFSTR("transactionLimit"), "isEqualToString:", v6);
                                                  if (a4 > 1 || (v30 & 1) == 0)
                                                  {
                                                    v31 = objc_msgSend(CFSTR("monthlySpendLimit"), "isEqualToString:", v6);
                                                    if ((a4 > 1 || (v31 & 1) == 0)
                                                      && (!objc_msgSend(CFSTR("aboutCreditReporting"), "isEqualToString:", v6)|| a4 && a4 != 3))
                                                    {
                                                      v32 = objc_msgSend(CFSTR("balance"), "isEqualToString:", v6);
                                                      if (a4 > 1 || (v32 & 1) == 0)
                                                      {
                                                        v33 = objc_msgSend(CFSTR("otpCode"), "isEqualToString:", v6);
                                                        if ((a4 > 1 || (v33 & 1) == 0) && a4 - 1 > 4)
                                                        {
                                                          v5 = 0;
                                                          goto LABEL_62;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v5 = (id)objc_opt_class();
  }
LABEL_62:
  v26 = (objc_class *)v5;

  return v26;
}

- (void)noteCurrentValueChanged
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PKPaymentSetupFieldCurrentValueChangedNotification"), self);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_localizedPlaceholder, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_displayFormat, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  *(_BYTE *)(v5 + 24) = self->_optional;
  *(_BYTE *)(v5 + 25) = self->_readonly;
  *(_BYTE *)(v5 + 26) = self->_hidden;
  v10 = -[NSString copyWithZone:](self->_submissionKey, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  v12 = -[NSString copyWithZone:](self->_submissionDestination, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v12;

  *(_BYTE *)(v5 + 28) = self->_requiresSecureSubmission;
  objc_storeStrong((id *)(v5 + 128), self->_rawConfigurationDictionary);
  v14 = -[NSString copyWithZone:](self->_defaultValue, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  *(_BYTE *)(v5 + 29) = self->_populateFromMeCard;
  objc_storeStrong((id *)(v5 + 32), self->_attribute);
  v16 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v18 = -[NSString copyWithZone:](self->_localizedDisplayName, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v18;

  v20 = -[NSObject copyWithZone:](self->_currentValue, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v20;

  v22 = -[NSObject copyWithZone:](self->_originalCameraCaptureValue, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;

  *(_QWORD *)(v5 + 88) = self->_source;
  v24 = -[NSString copyWithZone:](self->_odiAttribute, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v24;

  v26 = -[NSArray copyWithZone:](self->_requirements, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v26;

  return (id)v5;
}

- (NSObject)currentValue
{
  return self->_currentValue;
}

- (DIAttribute)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_attribute, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)displayFormat
{
  return self->_displayFormat;
}

- (void)setDisplayFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (int64_t)groupNumber
{
  return self->_groupNumber;
}

- (NSObject)originalCameraCaptureValue
{
  return self->_originalCameraCaptureValue;
}

- (void)setCurrentValueFromCameraCapture:(BOOL)a3
{
  self->_currentValueFromCameraCapture = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSString)submissionKey
{
  return self->_submissionKey;
}

- (void)setSubmissionKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)submissionDestination
{
  return self->_submissionDestination;
}

- (void)setSubmissionDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)requiresSecureSubmission
{
  return self->_requiresSecureSubmission;
}

- (void)setRequiresSecureSubmission:(BOOL)a3
{
  self->_requiresSecureSubmission = a3;
}

- (NSString)odiAttribute
{
  return self->_odiAttribute;
}

- (NSArray)requirements
{
  return self->_requirements;
}

- (NSDictionary)rawConfigurationDictionary
{
  return self->_rawConfigurationDictionary;
}

- (BOOL)populateFromMeCard
{
  return self->_populateFromMeCard;
}

- (void)setPopulateFromMeCard:(BOOL)a3
{
  self->_populateFromMeCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_odiAttribute, 0);
  objc_storeStrong((id *)&self->_submissionDestination, 0);
  objc_storeStrong((id *)&self->_submissionKey, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_originalCameraCaptureValue, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
}

+ (id)newRandomlyGeneratedField
{
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  uint32_t v6;
  const __CFString *v7;
  uint32_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint32_t v21;
  const __CFString *v22;
  void *v23;

  v2 = arc4random_uniform(0x64u);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier-%i"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(arc4random_uniform(5u))
  {
    case 0u:
      v5 = CFSTR("First");
      break;
    case 1u:
      v5 = CFSTR("Second");
      break;
    case 2u:
      v5 = CFSTR("Second Name");
      break;
    case 3u:
      v5 = CFSTR("Oh, Why So Long!");
      break;
    case 4u:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Field %i"), v2);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = &stru_1E2ADF4C0;
      break;
  }
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("localizedDisplayName"));

  if (arc4random_uniform(2u))
  {
    v6 = arc4random_uniform(4u);
    if (v6 > 3)
      v7 = &stru_1E2ADF4C0;
    else
      v7 = off_1E2AC16A0[v6];
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("defaultValue"));
  }
  v8 = arc4random_uniform(3u);
  if (v8 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rsub%i"), arc4random_uniform(0x64u) + 100);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("submissionKey"));

  }
  else if (v8 == 1)
  {
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("submissionKey"));
  }
  if (arc4random_uniform(2u))
    v10 = CFSTR("eligibility");
  else
    v10 = CFSTR("enable");
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("submissionDestination"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", arc4random_uniform(2u) != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("requiresSecureSubmission"));

  if (!arc4random_uniform(2u))
  {
    objc_msgSend(v4, "setObject:forKey:", CFSTR("date"), CFSTR("fieldType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", arc4random_uniform(2u) != 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("showsDay"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", arc4random_uniform(2u) != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("showsMonth"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", arc4random_uniform(2u) != 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("showsYear"));

    v21 = arc4random_uniform(6u);
    if (v21 > 5)
      v22 = &stru_1E2ADF4C0;
    else
      v22 = off_1E2AC16C0[v21];
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("displayFormat"));
    if (arc4random_uniform(2u))
      v16 = CFSTR("MM/yy");
    else
      v16 = CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    v17 = CFSTR("submissionFormat");
    goto LABEL_36;
  }
  objc_msgSend(v4, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", arc4random_uniform(4u));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("minLength"));

  if (arc4random_uniform(2u))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", arc4random_uniform(0xAu) + 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("maxLength"));

  }
  if (arc4random_uniform(2u))
  {
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", arc4random_uniform(2u) != 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("secureVisibleText"));

  }
  if (arc4random_uniform(2u))
  {
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("numeric"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", arc4random_uniform(2u) != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("useLuhnCheck"));

  }
  if (arc4random_uniform(2u))
  {
    v16 = CFSTR("XXX XX X  XXX");
    v17 = CFSTR("displayFormat");
LABEL_36:
    objc_msgSend(v4, "setObject:forKey:", v16, v17);
  }
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v3, v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)sampleCustomPaymentSetupFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[4];

  v70[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", CFSTR("label"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("The below fields are for testing purposes only. \nTheir values are not used!"), CFSTR("defaultValue"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("labelShort"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v4);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("date"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Date of Birth"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"));
  v5 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("showsDay"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("showsMonth"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("showsYear"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("MM/dd/yy"), CFSTR("displayFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("yyyy-MM-dd"), CFSTR("submissionFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("1995-01-01"), CFSTR("defaultValue"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("optional"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("birthDate"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v6);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("date"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Birth Year"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Custom Placeholder"), CFSTR("localizedPlaceholder"));
  v7 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("showsDay"));
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("showsMonth"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("showsYear"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("yyyy"), CFSTR("displayFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("yyyy"), CFSTR("submissionFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("1995"), CFSTR("defaultValue"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("birthYear"), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v8);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("date"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Birth Month"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  v9 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("showsDay"));
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:");
  v11 = v9;
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("showsYear"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("MMMM"), CFSTR("displayFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("MM"), CFSTR("submissionFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("12"), CFSTR("defaultValue"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("birthMonth"), v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v12);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("date"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Birth Day"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("showsDay"));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("showsMonth"));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("showsYear"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("dd"), CFSTR("displayFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("dd"), CFSTR("submissionFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("01"), CFSTR("defaultValue"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("birthDay"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v13);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("date"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Birth Day Year"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  v14 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("showsDay"));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("showsMonth"));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("showsYear"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("dd/yyyy"), CFSTR("displayFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("dd/yyyy"), CFSTR("submissionFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("02/2012"), CFSTR("defaultValue"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("birthDayYear"), v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v15);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("picker"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Color Picker"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("color_blue"), CFSTR("defaultValue"));
  v68[0] = CFSTR("localizedDisplayName");
  v68[1] = CFSTR("submissionValue");
  v69[0] = CFSTR("Red!");
  v69[1] = CFSTR("color_red");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v16;
  v66[0] = CFSTR("localizedDisplayName");
  v66[1] = CFSTR("submissionValue");
  v67[0] = CFSTR("Green!");
  v67[1] = CFSTR("color_green");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v17;
  v64[0] = CFSTR("localizedDisplayName");
  v64[1] = CFSTR("submissionValue");
  v65[0] = CFSTR("Blue!");
  v65[1] = CFSTR("color_blue");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("pickerItems"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("colorPicker"), v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v19);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Phone"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E878, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E878, CFSTR("maxLength"));
  v20 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("secureVisibleText"));
  v21 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("(XXX) XXX-XXXX"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("usaPhone"), v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v22);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("ZIP Code"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E890, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E890, CFSTR("maxLength"));
  v23 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", &stru_1E2ADF4C0, CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("usaZIP"), v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v24);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Overly long ZIP Code (UK) and then some"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Custom Placeholder"), CFSTR("localizedPlaceholder"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8A8, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8A8, CFSTR("maxLength"));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXX-XXX"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("ukZIP"), v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v25);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("SSN"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:");
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8C0, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8C0, CFSTR("maxLength"));
  v26 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXX-XX-XXXX"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("ssn"), v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v27);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("CURP (MX)"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8D8, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8D8, CFSTR("maxLength"));
  v28 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  v29 = v28;
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("secureVisibleText"));
  v30 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", &stru_1E2ADF4C0, CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("curp"), v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v31);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("HKID (HK)"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8F0, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8C0, CFSTR("maxLength"));
  v32 = v29;
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("secureVisibleText"));
  v33 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXXXXXXXX"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("hkid"), v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v34);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("NIR (FR)"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E908, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E908, CFSTR("maxLength"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("secureVisibleText"));
  v35 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXXXXXXXXXXXX XX"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("nir"), v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v36);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("BSN (NL)"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8C0, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8C0, CFSTR("maxLength"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXXXXXXXX"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("bsn"), v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v37);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("AHV-Nr. (CH)"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8D8, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8D8, CFSTR("maxLength"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("numeric"));
  v38 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXX.XXXX.XXXX.XX"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("ahvnr"), v3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v39);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("NINO (UK)"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8C0, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8C0, CFSTR("maxLength"));
  v40 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XX XX XX XX X"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("nino"), v3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v41);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("NHS No. (UK)"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E878, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E878, CFSTR("maxLength"));
  v42 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0]);
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("numeric"));
  v43 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXX-XXX-XXXX"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("nhsno"), v3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v44);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Kohl's PIN"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E8A8, CFSTR("maxLength"));
  v45 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", &stru_1E2ADF4C0, CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("kohlsPin"), v3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v46);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Macy's PIN"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E920, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E920, CFSTR("maxLength"));
  v47 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  v48 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", &stru_1E2ADF4C0, CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("macysPin"), v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v49);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Disc Sq. No."), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E938, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E938, CFSTR("maxLength"));
  v50 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("AXXX"), CFSTR("localizedPlaceholder"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("AXXX"), CFSTR("displayFormat"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("X"), CFSTR("displayFormatPlaceholder"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("disc"), v3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v51);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("CVV 4 S"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E920, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E920, CFSTR("maxLength"));
  v52 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("useLuhnCheck"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("ccvS4"), v3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v53);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("CVV 4 SV"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E920, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E920, CFSTR("maxLength"));
  v54 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("numeric"));
  v55 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("useLuhnCheck"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("ccvSV4"), v3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v56);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("text"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Parens Check Card Last 5"), CFSTR("localizedDisplayName"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("enable"), CFSTR("submissionDestination"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E890, CFSTR("minLength"));
  objc_msgSend(v3, "setObject:forKey:", &unk_1E2C3E890, CFSTR("maxLength"));
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("secureText"));
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("secureVisibleText"));
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("numeric"));
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("useLuhnCheck"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Last 5 digits"), CFSTR("localizedPlaceholder"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("XXXX (X)"), CFSTR("displayFormat"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("parensCheck"), v3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v57);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("label"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("This is a center label"), CFSTR("defaultValue"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("center"), CFSTR("alignment"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("centerLabel"), v3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v58);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("label"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("This is a left label"), CFSTR("defaultValue"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("left"), CFSTR("alignment"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("leftLabel"), v3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v59);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("label"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("This is a really long label. You should really not be reading this! Feel free to not read this in the future. Also, here is some more text for some more fun!"), CFSTR("defaultValue"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("labelLong"), v3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v60);

  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKey:", CFSTR("footer"), CFSTR("fieldType"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Adding a Suica card will associate it with your Apple Account so it can be backed up. When you use your card, the station names from your recent transactions can be accessed."), CFSTR("defaultValue"));
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("footerLong"), v3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safelyAddObject:", v61);

  objc_msgSend(v3, "removeAllObjects");
  return v2;
}

@end
