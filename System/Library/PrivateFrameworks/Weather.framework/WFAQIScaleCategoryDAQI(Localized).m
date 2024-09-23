@implementation WFAQIScaleCategoryDAQI(Localized)

- (NSString)scaleClassName
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)warningLevel
{
  return 4;
}

- (id)description
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(objc_msgSend(a1, "categoryIndex"))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_Low_1");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_Low_2");
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_Low_3");
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_Moderate_1");
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_Moderate_2");
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_Moderate_3");
      break;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_High_1");
      break;
    case 8:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_High_2");
      break;
    case 9:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_High_3");
      break;
    case 10:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_DAQI_Category_Very_High");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_Category_Unknown");
      break;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
