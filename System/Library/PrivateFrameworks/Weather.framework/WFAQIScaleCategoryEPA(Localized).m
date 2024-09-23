@implementation WFAQIScaleCategoryEPA(Localized)

- (NSString)scaleClassName
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (uint64_t)warningLevel
{
  return 2;
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
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Good");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Moderate");
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_UnhealthyForSensitiveGroups");
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Unhealthy");
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Very_Unhealthy");
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Hazardous");
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

- (id)longDescription
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
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Good_Long");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Moderate_Long");
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_UnhealthyForSensitiveGroups_Long");
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Unhealthy_Long");
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Very_Unhealthy_Long");
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("WFAQI_Scale_EPA_Category_Hazardous_Long");
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
