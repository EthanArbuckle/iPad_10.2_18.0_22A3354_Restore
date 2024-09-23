@implementation EligibilityDomain

- (unint64_t)domain
{
  unint64_t result;

  result = _os_crash("This property must be overridden", a2);
  __break(1u);
  return result;
}

- (NSString)domainChangeNotificationName
{
  NSString *result;

  result = (NSString *)_os_crash("This property must be overridden", a2);
  __break(1u);
  return result;
}

- (void)updateParameters
{
  _os_crash("This method must be overridden", a2);
  __break(1u);
}

- (unint64_t)defaultAnswer
{
  return 2;
}

- (EligibilityDomain)init
{
  EligibilityDomain *v2;
  EligibilityDomain *v3;
  NSDictionary *context;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EligibilityDomain;
  v2 = -[EligibilityDomain init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    context = v2->_context;
    v2->_answer = 0;
    v2->_context = 0;

    v3->_supportedInputs = 0;
  }
  return v3;
}

- (void)setLocatedCountriesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  NSSet *v6;
  NSSet *locatedCountriesOfInterest;

  v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFFELL | (v6 != 0));
  locatedCountriesOfInterest = self->_locatedCountriesOfInterest;
  self->_locatedCountriesOfInterest = v6;

  self->_invertLocatedCountries = a4;
}

- (void)setLocatedCountriesOfInterest:(id)a3
{
  -[EligibilityDomain setLocatedCountriesOfInterest:isInverted:](self, "setLocatedCountriesOfInterest:isInverted:", a3, 0);
}

- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4 isInverted:(BOOL)a5
{
  EligibilityTimer *v7;
  EligibilityTimer *v8;

  -[EligibilityDomain setLocatedCountriesOfInterest:isInverted:](self, "setLocatedCountriesOfInterest:isInverted:", a3, a5);
  v7 = (EligibilityTimer *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  if (v7)
  {
    v8 = v7;
    -[EligibilityTimer setDurationWithSeconds:](v7, "setDurationWithSeconds:", a4);
  }
  else
  {
    v8 = -[EligibilityTimer initWithSeconds:]([EligibilityTimer alloc], "initWithSeconds:", a4);
  }
  -[EligibilityDomain setLocatedCountryTimer:](self, "setLocatedCountryTimer:", v8);

}

- (void)setLocatedCountriesOfInterest:(id)a3 withGracePeriod:(unint64_t)a4
{
  -[EligibilityDomain setLocatedCountriesOfInterest:withGracePeriod:isInverted:](self, "setLocatedCountriesOfInterest:withGracePeriod:isInverted:", a3, a4, 0);
}

- (void)setBillingCountriesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  NSSet *v6;
  NSSet *billingCountriesOfInterest;

  v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFFDLL | (2 * (v6 != 0)));
  billingCountriesOfInterest = self->_billingCountriesOfInterest;
  self->_billingCountriesOfInterest = v6;

  self->_invertBillingCountries = a4;
}

- (void)setBillingCountriesOfInterest:(id)a3
{
  -[EligibilityDomain setBillingCountriesOfInterest:isInverted:](self, "setBillingCountriesOfInterest:isInverted:", a3, 0);
}

- (void)setDeviceClassesOfInterest:(id)a3
{
  NSSet *v4;
  NSSet *deviceClassesOfInterest;

  v4 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFFBLL | (4 * (v4 != 0)));
  deviceClassesOfInterest = self->_deviceClassesOfInterest;
  self->_deviceClassesOfInterest = v4;

}

- (void)setDeviceLocalesOfInterest:(id)a3 isInverted:(BOOL)a4
{
  NSSet *v6;
  NSSet *deviceLocalesOfInterest;

  v6 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFF7 | (8 * (v6 != 0)));
  deviceLocalesOfInterest = self->_deviceLocalesOfInterest;
  self->_deviceLocalesOfInterest = v6;

  self->_invertLocales = a4;
}

- (void)setDeviceLocalesOfInterest:(id)a3
{
  -[EligibilityDomain setDeviceLocalesOfInterest:isInverted:](self, "setDeviceLocalesOfInterest:isInverted:", a3, 0);
}

- (void)setLocatedCountryInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 1);
}

- (void)setBillingCountryInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 2);
}

- (void)setChinaCellularInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x10);
}

- (void)setDeviceRegionInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x20);
}

- (void)setDeviceRegionCodesOfInterest:(id)a3
{
  NSSet *v4;
  NSSet *deviceRegionCodesOfInterest;

  v4 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFDFLL | (32 * (v4 != 0)));
  deviceRegionCodesOfInterest = self->_deviceRegionCodesOfInterest;
  self->_deviceRegionCodesOfInterest = v4;

}

- (void)setDeviceLanguageInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x40);
}

- (void)setDeviceLanguagesOfInterest:(id)a3
{
  NSSet *v4;
  NSSet *deviceLanguagesOfInterest;

  v4 = (NSSet *)a3;
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(v4 != 0) << 6));
  deviceLanguagesOfInterest = self->_deviceLanguagesOfInterest;
  self->_deviceLanguagesOfInterest = v4;

}

- (void)setGenerativeModelSystemVersionInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x80);
}

- (void)setGreymatterQueueInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x100);
}

- (void)setSiriLanguageInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x200);
}

- (void)setExternalBootInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x400);
}

- (void)setSharediPadInterest
{
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs") | 0x800);
}

- (void)resetInputsOfInterest
{
  -[EligibilityDomain setLocatedCountriesOfInterest:](self, "setLocatedCountriesOfInterest:", 0);
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", 0);
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", 0);
  -[EligibilityDomain setDeviceLocalesOfInterest:](self, "setDeviceLocalesOfInterest:", 0);
  -[EligibilityDomain setDeviceRegionCodesOfInterest:](self, "setDeviceRegionCodesOfInterest:", 0);
  -[EligibilityDomain setDeviceLanguagesOfInterest:](self, "setDeviceLanguagesOfInterest:", 0);
  -[EligibilityDomain setSupportedInputs:](self, "setSupportedInputs:", 0);
}

- (unint64_t)answerSource
{
  return 1;
}

- (NSDictionary)status
{
  NSMutableDictionary *v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](InputManager, "sharedInstance"));
  for (i = 1; i != 13; ++i)
  {
    if (-[EligibilityDomain isInterestedInInput:](self, "isInterestedInInput:", i))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForInputValue:", i));
      v7 = v6;
      if (v6)
      {
        v8 = (unint64_t)objc_msgSend(v6, "status");
        if (!v8)
          v8 = -[EligibilityDomain computeInputStatusForInput:](self, "computeInputStatusForInput:", v7);
      }
      else
      {
        v8 = 1;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v8));
      v10 = sub_10000C5A4(i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, v11);

    }
  }
  v12 = -[NSMutableDictionary copy](v3, "copy");

  return (NSDictionary *)v12;
}

- (unint64_t)computeInputStatusForInput:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  id v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  EligibilityDomain *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (-[EligibilityDomain isInterestedInInput:](self, "isInterestedInInput:", v5))
  {
    switch((unint64_t)v5)
    {
      case 1uLL:
        v6 = -[EligibilityDomain computeInputStatusForLocatedCountryInput:](self, "computeInputStatusForLocatedCountryInput:", v4);
        goto LABEL_19;
      case 2uLL:
        v6 = -[EligibilityDomain computeInputStatusForBillingCountryInput:](self, "computeInputStatusForBillingCountryInput:", v4);
        goto LABEL_19;
      case 3uLL:
        v6 = -[EligibilityDomain computeInputStatusForDeviceClassInput:](self, "computeInputStatusForDeviceClassInput:", v4);
        goto LABEL_19;
      case 4uLL:
        v6 = -[EligibilityDomain computeInputStatusForDeviceLocaleInput:](self, "computeInputStatusForDeviceLocaleInput:", v4);
        goto LABEL_19;
      case 5uLL:
        v6 = -[EligibilityDomain computeInputStatusForChinaCellularInput:](self, "computeInputStatusForChinaCellularInput:", v4);
        goto LABEL_19;
      case 6uLL:
        v6 = -[EligibilityDomain computeInputStatusForDeviceRegionCodesInput:](self, "computeInputStatusForDeviceRegionCodesInput:", v4);
        goto LABEL_19;
      case 7uLL:
        v6 = -[EligibilityDomain computeInputStatusForDeviceLanguageInput:](self, "computeInputStatusForDeviceLanguageInput:", v4);
        goto LABEL_19;
      case 8uLL:
        v6 = -[EligibilityDomain computeInputStatusForGenerativeModelSystemInput:](self, "computeInputStatusForGenerativeModelSystemInput:", v4);
        goto LABEL_19;
      case 9uLL:
        v6 = -[EligibilityDomain computeInputStatusForGreymatterQueueInput:](self, "computeInputStatusForGreymatterQueueInput:", v4);
        goto LABEL_19;
      case 0xAuLL:
        v6 = -[EligibilityDomain computeInputStatusForSiriLanguageInput:](self, "computeInputStatusForSiriLanguageInput:", v4);
        goto LABEL_19;
      case 0xBuLL:
        v6 = -[EligibilityDomain computeInputStatusForExternalBootDriveInput:](self, "computeInputStatusForExternalBootDriveInput:", v4);
        goto LABEL_19;
      case 0xCuLL:
        v6 = -[EligibilityDomain computeInputStatusForSharediPadInput:](self, "computeInputStatusForSharediPadInput:", v4);
LABEL_19:
        v7 = v6;
        break;
      default:
        v8 = sub_10000C5FC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = sub_10000C5A4((unint64_t)v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v13 = 136315906;
          v14 = "-[EligibilityDomain computeInputStatusForInput:]";
          v15 = 2112;
          v16 = self;
          v17 = 2112;
          v18 = v12;
          v19 = 2048;
          v20 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Unsupported input for %@: %@(%llu)", (uint8_t *)&v13, 0x2Au);

        }
        v7 = 5;
        break;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isInterestedInInput:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[EligibilityDomain supportedInputs](self, "supportedInputs");
  switch(a3)
  {
    case 1uLL:
      LOBYTE(v4) = v4 & 1;
      break;
    case 2uLL:
      v4 = (v4 >> 1) & 1;
      break;
    case 3uLL:
      v4 = (v4 >> 2) & 1;
      break;
    case 4uLL:
      v4 = (v4 >> 3) & 1;
      break;
    case 5uLL:
      v4 = (v4 >> 4) & 1;
      break;
    case 6uLL:
      v4 = (v4 >> 5) & 1;
      break;
    case 7uLL:
      v4 = (v4 >> 6) & 1;
      break;
    case 8uLL:
      v4 = (v4 >> 7) & 1;
      break;
    case 9uLL:
      v4 = (v4 >> 8) & 1;
      break;
    case 0xAuLL:
      v4 = (v4 >> 9) & 1;
      break;
    case 0xBuLL:
      v4 = (v4 >> 10) & 1;
      break;
    case 0xCuLL:
      v4 = (v4 >> 11) & 1;
      break;
    default:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (BOOL)hasActiveGracePeriod
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  if ((-[EligibilityDomain supportedInputs](self, "supportedInputs") & 1) == 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  v5 = v4;
  if (v4)
    v3 = objc_msgSend(v4, "isActive");
  else
    v3 = 0;

  return v3;
}

- (unint64_t)_computeInputStatusForSet:(id)a3 withObject:(id)a4 isInverted:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v5)
    v10 = 2;
  else
    v10 = 3;
  if (v5)
    v11 = 3;
  else
    v11 = 2;
  if (v7)
  {
    if (v8)
    {
      if (objc_msgSend(v7, "containsObject:", v8))
        v11 = v10;
    }
    else
    {
      v11 = 1;
    }
  }

  return v11;
}

- (unint64_t)computeInputStatusForLocatedCountryInput:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  v6 = -[EligibilityDomain invertLocatedCountries](self, "invertLocatedCountries");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCodes"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCodes"));
      v10 = objc_msgSend(v9, "intersectsSet:", v7);

      if (v6 == v10)
      {
        objc_msgSend(v5, "resume");
        if (v5)
        {
          if (objc_msgSend(v5, "hasExpired"))
            v11 = 2;
          else
            v11 = 3;
        }
        else
        {
          v11 = 2;
        }
      }
      else
      {
        objc_msgSend(v5, "reset");
        objc_msgSend(v5, "enable");
        v11 = 3;
      }
    }
    else
    {
      v11 = 1;
    }
  }
  else if (v6)
  {
    v11 = 3;
  }
  else
  {
    v11 = 2;
  }

  return v11;
}

- (unint64_t)computeInputStatusForBillingCountryInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "countryCode"));

  v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:](self, "_computeInputStatusForSet:withObject:isInverted:", v5, v6, -[EligibilityDomain invertBillingCountries](self, "invertBillingCountries"));
  return v7;
}

- (unint64_t)computeInputStatusForDeviceClassInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceClass"));

  v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:](self, "_computeInputStatusForSet:withObject:isInverted:", v5, v6, 0);
  return v7;
}

- (unint64_t)computeInputStatusForDeviceLocaleInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceLocale"));

  v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:](self, "_computeInputStatusForSet:withObject:isInverted:", v5, v6, -[EligibilityDomain invertLocales](self, "invertLocales"));
  return v7;
}

- (unint64_t)computeInputStatusForChinaCellularInput:(id)a3
{
  if (objc_msgSend(a3, "chinaCellularDevice"))
    return 3;
  else
    return 2;
}

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceRegionCode"));

  v7 = -[EligibilityDomain _computeInputStatusForSet:withObject:isInverted:](self, "_computeInputStatusForSet:withObject:isInverted:", v5, v6, 0);
  return v7;
}

- (unint64_t)computeInputStatusForDeviceLanguageInput:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  unint64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "primaryLanguage"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
      v7 = 3;
    else
      v7 = 2;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unint64_t)computeInputStatusForGenerativeModelSystemInput:(id)a3
{
  if (objc_msgSend(a3, "supportsGenerativeModelSystems"))
    return 3;
  else
    return 2;
}

- (unint64_t)computeInputStatusForGreymatterQueueInput:(id)a3
{
  if (objc_msgSend(a3, "onGreymatterQueue"))
    return 2;
  else
    return 3;
}

- (unint64_t)computeInputStatusForSiriLanguageInput:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t result;

  v3 = a3;
  result = _os_crash("This method must be overridden", v4);
  __break(1u);
  return result;
}

- (unint64_t)computeInputStatusForExternalBootDriveInput:(id)a3
{
  if (objc_msgSend(a3, "hasExternalBootDrive"))
    return 2;
  else
    return 3;
}

- (unint64_t)computeInputStatusForSharediPadInput:(id)a3
{
  if (objc_msgSend(a3, "isSharediPad"))
    return 2;
  else
    return 3;
}

- (id)serialize
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[EligibilityDomain answer](self, "answer")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("os_eligibility_answer_t"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[EligibilityDomain answerSource](self, "answerSource")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("os_eligibility_answer_source_t"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("status"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("context"));

  v8 = -[NSMutableDictionary copy](v3, "copy");
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[EligibilityDomain answer](self, "answer")));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("answer"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("context"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("locatedCountryTimer"));

}

- (EligibilityDomain)initWithCoder:(id)a3
{
  id v4;
  EligibilityDomain *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *context;
  id v15;
  uint64_t v16;
  EligibilityTimer *locatedCountryTimer;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EligibilityDomain;
  v5 = -[EligibilityDomain init](&v19, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("answer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_answer = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

    v8 = objc_opt_class(NSDictionary);
    v9 = objc_opt_class(NSString);
    v10 = objc_opt_class(NSNumber);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(NSArray), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("context")));
    context = v5->_context;
    v5->_context = (NSDictionary *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(EligibilityTimer), CFSTR("locatedCountryTimer"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    locatedCountryTimer = v5->_locatedCountryTimer;
    v5->_locatedCountryTimer = (EligibilityTimer *)v16;

  }
  return v5;
}

- (unint64_t)computeAnswerFromStatus:(id)a3
{
  void *v4;
  id v5;
  id v6;
  char v7;
  char v8;
  uint64_t v9;
  void *i;
  id v11;
  unint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
  {

    return -[EligibilityDomain defaultAnswer](self, "defaultAnswer");
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v14;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v4);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "unsignedLongLongValue");
      if (v11 == (id)3)
      {
        v7 = 1;
      }
      else
      {
        if ((unint64_t)v11 < 2)
        {

          return 1;
        }
        v8 = 1;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
      continue;
    break;
  }

  if ((v8 & 1) != 0)
    result = 2;
  else
    result = 4;
  if (((v8 | v7) & 1) == 0)
    return -[EligibilityDomain defaultAnswer](self, "defaultAnswer");
  return result;
}

- (BOOL)computeAnswerFromStatusWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  if (v5)
  {
    -[EligibilityDomain setAnswer:](self, "setAnswer:", -[EligibilityDomain computeAnswerFromStatus:](self, "computeAnswerFromStatus:", v5));
    v6 = 0;
  }
  else
  {
    v7 = sub_10000C5FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[EligibilityDomain computeAnswerFromStatusWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s: Failed to get status for a computed domain", (uint8_t *)&v11, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 93, 0));
    v6 = v9;
    if (a3)
    {
      v6 = objc_retainAutorelease(v9);
      *a3 = v6;
    }
  }

  return v5 != 0;
}

- (void)addContextForKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
    v11 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    v11 = objc_opt_new(NSMutableDictionary);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, v7);

  v10 = -[NSMutableDictionary copy](v11, "copy");
  -[EligibilityDomain setContext:](self, "setContext:", v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAnswer:", -[EligibilityDomain answer](self, "answer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setContext:", v7);

  objc_msgSend(v5, "setSupportedInputs:", -[EligibilityDomain supportedInputs](self, "supportedInputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocatedCountriesOfInterest:", v9);

  objc_msgSend(v5, "setInvertLocatedCountries:", -[EligibilityDomain invertLocatedCountries](self, "invertLocatedCountries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
  v11 = objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setBillingCountriesOfInterest:", v11);

  objc_msgSend(v5, "setInvertBillingCountries:", -[EligibilityDomain invertBillingCountries](self, "invertBillingCountries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceClassesOfInterest:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  v15 = objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceLocalesOfInterest:", v15);

  objc_msgSend(v5, "setInvertLocales:", -[EligibilityDomain invertLocales](self, "invertLocales"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
  v17 = objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceRegionCodesOfInterest:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
  v19 = objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceLanguagesOfInterest:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  v21 = objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocatedCountryTimer:", v21);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;

  v3 = -[EligibilityDomain answer](self, "answer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  v7 = (unint64_t)objc_msgSend(v6, "hash");

  v8 = v5 ^ v7 ^ -[EligibilityDomain supportedInputs](self, "supportedInputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  v10 = (unint64_t)objc_msgSend(v9, "hash");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
  v12 = v10 ^ (unint64_t)objc_msgSend(v11, "hash");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
  v14 = v8 ^ v12 ^ (unint64_t)objc_msgSend(v13, "hash");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  v16 = (unint64_t)objc_msgSend(v15, "hash");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
  v18 = v16 ^ (unint64_t)objc_msgSend(v17, "hash");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  v20 = v18 ^ (unint64_t)objc_msgSend(v19, "hash");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
  v22 = v14 ^ v20 ^ (unint64_t)objc_msgSend(v21, "hash");

  v23 = -[EligibilityDomain invertLocatedCountries](self, "invertLocatedCountries");
  v24 = -[EligibilityDomain invertBillingCountries](self, "invertBillingCountries");
  v25 = 2;
  if (!v24)
    v25 = 0;
  v26 = v23 ^ v25;
  v27 = -[EligibilityDomain invertLocales](self, "invertLocales");
  v28 = 4;
  if (!v27)
    v28 = 0;
  return v22 ^ v26 ^ v28;
}

- (BOOL)isEqual:(id)a3
{
  EligibilityDomain *v4;
  uint64_t v5;
  EligibilityDomain *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  void *v29;
  char v30;
  unsigned int v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  unsigned int v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  id v53;
  id v54;
  id v55;
  objc_super v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  const char *v60;

  v4 = (EligibilityDomain *)a3;
  v56.receiver = self;
  v56.super_class = (Class)EligibilityDomain;
  if (-[EligibilityDomain isEqual:](&v56, "isEqual:", v4))
  {
    if (v4 == self)
    {
      v21 = 1;
      goto LABEL_27;
    }
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[EligibilityDomain answer](self, "answer");
      if (v7 == (id)-[EligibilityDomain answer](v6, "answer"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](v6, "status"));
        v10 = sub_1000163A4(v8, v9);

        if ((v10 & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](v6, "context"));
          v13 = sub_1000163A4(v11, v12);

          if ((v13 & 1) != 0)
          {
            v14 = -[EligibilityDomain supportedInputs](self, "supportedInputs");
            if (v14 == (id)-[EligibilityDomain supportedInputs](v6, "supportedInputs"))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](v6, "locatedCountriesOfInterest"));
              v17 = sub_1000163A4(v15, v16);

              if ((v17 & 1) != 0)
              {
                v18 = -[EligibilityDomain invertLocatedCountries](self, "invertLocatedCountries");
                if (v18 == -[EligibilityDomain invertLocatedCountries](v6, "invertLocatedCountries"))
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](v6, "billingCountriesOfInterest"));
                  v30 = sub_1000163A4(v28, v29);

                  if ((v30 & 1) == 0)
                  {
                    v33 = sub_10000C5FC();
                    v20 = objc_claimAutoreleasedReturnValue(v33);
                    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_25;
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "billingCountriesOfInterest";
                    goto LABEL_24;
                  }
                  v31 = -[EligibilityDomain invertBillingCountries](self, "invertBillingCountries");
                  if (v31 != -[EligibilityDomain invertBillingCountries](v6, "invertBillingCountries"))
                  {
                    v32 = sub_10000C5FC();
                    v20 = objc_claimAutoreleasedReturnValue(v32);
                    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_25;
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "invertBillingCountries";
                    goto LABEL_24;
                  }
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](v6, "deviceClassesOfInterest"));
                  v36 = sub_1000163A4(v34, v35);

                  if ((v36 & 1) == 0)
                  {
                    v42 = sub_10000C5FC();
                    v20 = objc_claimAutoreleasedReturnValue(v42);
                    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_25;
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "deviceClassesOfInterest";
                    goto LABEL_24;
                  }
                  v37 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](v6, "deviceLocalesOfInterest"));
                  v39 = sub_1000163A4(v37, v38);

                  if ((v39 & 1) == 0)
                  {
                    v43 = sub_10000C5FC();
                    v20 = objc_claimAutoreleasedReturnValue(v43);
                    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_25;
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "deviceLocalesOfInterest";
                    goto LABEL_24;
                  }
                  v40 = -[EligibilityDomain invertLocales](self, "invertLocales");
                  if (v40 != -[EligibilityDomain invertLocales](v6, "invertLocales"))
                  {
                    v41 = sub_10000C5FC();
                    v20 = objc_claimAutoreleasedReturnValue(v41);
                    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_25;
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "invertLocales";
                    goto LABEL_24;
                  }
                  v44 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](v6, "deviceLanguagesOfInterest"));
                  v46 = sub_1000163A4(v44, v45);

                  if ((v46 & 1) == 0)
                  {
                    v53 = sub_10000C5FC();
                    v20 = objc_claimAutoreleasedReturnValue(v53);
                    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_25;
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "deviceLanguagesOfInterest";
                    goto LABEL_24;
                  }
                  v47 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](v6, "locatedCountryTimer"));
                  v49 = sub_1000163A4(v47, v48);

                  if ((v49 & 1) == 0)
                  {
                    v54 = sub_10000C5FC();
                    v20 = objc_claimAutoreleasedReturnValue(v54);
                    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_25;
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "locatedCountryTimer";
                    goto LABEL_24;
                  }
                  v50 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
                  v51 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](v6, "deviceRegionCodesOfInterest"));
                  v52 = sub_1000163A4(v50, v51);

                  if ((v52 & 1) != 0)
                  {
                    v21 = 1;
                    goto LABEL_26;
                  }
                  v55 = sub_10000C5FC();
                  v20 = objc_claimAutoreleasedReturnValue(v55);
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "deviceRegionCodesOfInterest";
                    goto LABEL_24;
                  }
                }
                else
                {
                  v19 = sub_10000C5FC();
                  v20 = objc_claimAutoreleasedReturnValue(v19);
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v58 = "-[EligibilityDomain isEqual:]";
                    v59 = 2080;
                    v60 = "invertLocatedCountries";
LABEL_24:
                    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
                  }
                }
              }
              else
              {
                v26 = sub_10000C5FC();
                v20 = objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v58 = "-[EligibilityDomain isEqual:]";
                  v59 = 2080;
                  v60 = "locatedCountriesOfInterest";
                  goto LABEL_24;
                }
              }
            }
            else
            {
              v25 = sub_10000C5FC();
              v20 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v58 = "-[EligibilityDomain isEqual:]";
                v59 = 2080;
                v60 = "supportedInputs";
                goto LABEL_24;
              }
            }
          }
          else
          {
            v24 = sub_10000C5FC();
            v20 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v58 = "-[EligibilityDomain isEqual:]";
              v59 = 2080;
              v60 = "context";
              goto LABEL_24;
            }
          }
        }
        else
        {
          v23 = sub_10000C5FC();
          v20 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v58 = "-[EligibilityDomain isEqual:]";
            v59 = 2080;
            v60 = "status";
            goto LABEL_24;
          }
        }
      }
      else
      {
        v22 = sub_10000C5FC();
        v20 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[EligibilityDomain isEqual:]";
          v59 = 2080;
          v60 = "answer";
          goto LABEL_24;
        }
      }
LABEL_25:

      v21 = 0;
LABEL_26:

      goto LABEL_27;
    }
  }
  v21 = 0;
LABEL_27:

  return v21;
}

- (id)_supportedInputsString
{
  unsigned __int16 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = (unsigned __int16)-[EligibilityDomain supportedInputs](self, "supportedInputs");
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));

    if (v5)
      v4 = 108;
    else
      v4 = 76;
  }
  else
  {
    v4 = 95;
  }
  v6 = 80;
  if ((v3 & 0x800) == 0)
    v6 = 95;
  v7 = 69;
  if ((v3 & 0x400) == 0)
    v7 = 95;
  v25 = v7;
  v26 = v6;
  v8 = 65;
  if ((v3 & 0x200) == 0)
    v8 = 95;
  v9 = 81;
  if ((v3 & 0x100) == 0)
    v9 = 95;
  v23 = v9;
  v24 = v8;
  v10 = 77;
  if ((v3 & 0x80) == 0)
    v10 = 95;
  v11 = 84;
  if ((v3 & 0x40) == 0)
    v11 = 95;
  v21 = v11;
  v22 = v10;
  v12 = 83;
  if ((v3 & 0x20) == 0)
    v12 = 95;
  v13 = 67;
  if ((v3 & 0x10) == 0)
    v13 = 95;
  v19 = v13;
  v20 = v12;
  v14 = 82;
  if ((v3 & 8) == 0)
    v14 = 95;
  v15 = 68;
  if ((v3 & 4) == 0)
    v15 = 95;
  v18 = v14;
  v16 = 66;
  if ((v3 & 2) == 0)
    v16 = 95;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c%c%c%c%c%c%c%c%c%c%c%c"), v4, v16, v15, v18, v19, v20, v21, v22, v23, v24, v25, v26);
}

- (id)_interestedDataString
{
  unsigned __int16 v3;
  unsigned __int16 v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  unsigned int v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  id v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;

  v3 = (unsigned __int16)-[EligibilityDomain supportedInputs](self, "supportedInputs");
  v4 = v3;
  if ((v3 & 1) == 0)
  {
    v42 = &stru_100031450;
    if ((v3 & 2) != 0)
      goto LABEL_3;
LABEL_24:
    v41 = &stru_100031450;
    if ((v4 & 4) != 0)
      goto LABEL_6;
    goto LABEL_25;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountryTimer](self, "locatedCountryTimer"));
  v31 = v30;
  if (v30)
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "description"));
  else
    v32 = CFSTR("<NULL>");
  v33 = -[EligibilityDomain invertLocatedCountries](self, "invertLocatedCountries");
  v34 = CFSTR("N");
  if (v33)
    v34 = CFSTR("Y");
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain locatedCountriesOfInterest](self, "locatedCountriesOfInterest"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "description"));
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("locatedCountries: %@ gracePeriod: %@ inverted: %@"), v37, v32, v35));

  if ((v4 & 2) == 0)
    goto LABEL_24;
LABEL_3:
  v5 = -[EligibilityDomain invertBillingCountries](self, "invertBillingCountries");
  v6 = CFSTR("N");
  if (v5)
    v6 = CFSTR("Y");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain billingCountriesOfInterest](self, "billingCountriesOfInterest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("billingCountries: %@ inverted: %@"), v9, v7));

  if ((v4 & 4) != 0)
  {
LABEL_6:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceClassesOfInterest](self, "deviceClassesOfInterest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("deviceClasses: %@"), v11));

    if ((v4 & 8) != 0)
      goto LABEL_7;
LABEL_26:
    v17 = &stru_100031450;
    if ((v4 & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_25:
  v40 = &stru_100031450;
  if ((v4 & 8) == 0)
    goto LABEL_26;
LABEL_7:
  v12 = -[EligibilityDomain invertLocales](self, "invertLocales");
  v13 = CFSTR("N");
  if (v12)
    v13 = CFSTR("Y");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLocalesOfInterest](self, "deviceLocalesOfInterest"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("deviceLocales: %@ inverted: %@"), v16, v14));

  if ((v4 & 0x10) != 0)
  {
LABEL_10:
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("chinaCellular: Y")));
    if ((v4 & 0x20) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v18 = &stru_100031450;
  if ((v4 & 0x20) != 0)
  {
LABEL_11:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceRegionCodesOfInterest](self, "deviceRegionCodesOfInterest"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "description"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("regionCodes: %@"), v20));

    if ((v4 & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v21 = &stru_100031450;
  if ((v4 & 0x40) != 0)
  {
LABEL_12:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain deviceLanguagesOfInterest](self, "deviceLanguagesOfInterest"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("deviceLanguage: %@"), v23));

    if ((v4 & 0x80) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v24 = &stru_100031450;
  if ((v4 & 0x80) != 0)
  {
LABEL_13:
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("generativeModelInterest: Y")));
    if ((v4 & 0x100) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v25 = &stru_100031450;
  if ((v4 & 0x100) != 0)
  {
LABEL_14:
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("greymatterQueue: Y")));
    if ((v4 & 0x200) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v26 = &stru_100031450;
  if ((v4 & 0x200) != 0)
  {
LABEL_15:
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("siriLanguage: Y")));
    if ((v4 & 0x400) != 0)
      goto LABEL_16;
LABEL_33:
    v28 = &stru_100031450;
    if ((v4 & 0x800) != 0)
      goto LABEL_17;
LABEL_34:
    v29 = &stru_100031450;
    goto LABEL_35;
  }
LABEL_32:
  v27 = &stru_100031450;
  if ((v4 & 0x400) == 0)
    goto LABEL_33;
LABEL_16:
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("externalBootDrive: Y")));
  if ((v4 & 0x800) == 0)
    goto LABEL_34;
LABEL_17:
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sharediPad: Y")));
LABEL_35:
  v39 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@"), v42, v41, v40, v17, v18, v21, v24, v25, v26, v27, v28, v29));

  return v39;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unint64_t v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain _supportedInputsString](self, "_supportedInputsString"));
  v4 = sub_10000C4A8(-[EligibilityDomain answer](self, "answer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[EligibilityDomain answerSource](self, "answerSource");
  if (v6 >= 3)
  {
    v8 = sub_10000C5FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "eligibility_answer_source_to_str";
      v21 = 2048;
      v22 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Unsupported answer source: %llu", buf, 0x16u);
    }

    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %llu>"), v6));
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_100030AA8)[v6]));
  }
  v10 = (void *)v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain _interestedDataString](self, "_interestedDataString"));
  v12 = -[EligibilityDomain domain](self, "domain");
  v13 = v12;
  if (v12 > 0x7D)
    v14 = "<Unknown Domain>";
  else
    v14 = off_1000305D8[v12];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain context](self, "context"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Domain: %s(%llu)>(%@) - <answer: %@, source: %@, context: %@, status: %@> - <%@>>"), v14, v13, v3, v5, v10, v15, v16, v11));

  return v17;
}

- (unint64_t)answer
{
  return self->_answer;
}

- (void)setAnswer:(unint64_t)a3
{
  self->_answer = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (unint64_t)supportedInputs
{
  return self->_supportedInputs;
}

- (void)setSupportedInputs:(unint64_t)a3
{
  self->_supportedInputs = a3;
}

- (NSSet)locatedCountriesOfInterest
{
  return self->_locatedCountriesOfInterest;
}

- (BOOL)invertLocatedCountries
{
  return self->_invertLocatedCountries;
}

- (void)setInvertLocatedCountries:(BOOL)a3
{
  self->_invertLocatedCountries = a3;
}

- (NSSet)billingCountriesOfInterest
{
  return self->_billingCountriesOfInterest;
}

- (BOOL)invertBillingCountries
{
  return self->_invertBillingCountries;
}

- (void)setInvertBillingCountries:(BOOL)a3
{
  self->_invertBillingCountries = a3;
}

- (NSSet)deviceClassesOfInterest
{
  return self->_deviceClassesOfInterest;
}

- (NSSet)deviceLocalesOfInterest
{
  return self->_deviceLocalesOfInterest;
}

- (BOOL)invertLocales
{
  return self->_invertLocales;
}

- (void)setInvertLocales:(BOOL)a3
{
  self->_invertLocales = a3;
}

- (NSSet)deviceRegionCodesOfInterest
{
  return self->_deviceRegionCodesOfInterest;
}

- (NSSet)deviceLanguagesOfInterest
{
  return self->_deviceLanguagesOfInterest;
}

- (EligibilityTimer)locatedCountryTimer
{
  return self->_locatedCountryTimer;
}

- (void)setLocatedCountryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_locatedCountryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locatedCountryTimer, 0);
  objc_storeStrong((id *)&self->_deviceLanguagesOfInterest, 0);
  objc_storeStrong((id *)&self->_deviceRegionCodesOfInterest, 0);
  objc_storeStrong((id *)&self->_deviceLocalesOfInterest, 0);
  objc_storeStrong((id *)&self->_deviceClassesOfInterest, 0);
  objc_storeStrong((id *)&self->_billingCountriesOfInterest, 0);
  objc_storeStrong((id *)&self->_locatedCountriesOfInterest, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
