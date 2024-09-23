void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

id WAImageForConditionNamed(uint64_t a1, uint64_t a2)
{
  return +[WeatherImageLoader conditionImageNamed:style:](WeatherImageLoader, "conditionImageNamed:style:", a1, a2);
}

id WAImageForLegacyConditionCode(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v4;

  if (a2 > 1)
  {
    +[WeatherImageLoader conditionImageNameWithConditionIndex:](WeatherImageLoader, "conditionImageNameWithConditionIndex:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WeatherImageLoader conditionImageNamed:style:](WeatherImageLoader, "conditionImageNamed:style:", v4, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WAMapsImageForLegacyConditionCode(a1, a2 == 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id WAMapsImageForLegacyConditionCode(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;

  switch(a1)
  {
    case 0:
      v3 = 1;
      goto LABEL_47;
    case 1:
      v3 = 2;
      goto LABEL_47;
    case 2:
      v3 = 3;
      goto LABEL_47;
    case 3:
      v3 = 4;
      goto LABEL_47;
    case 4:
      v3 = 5;
      goto LABEL_47;
    case 5:
      v3 = 6;
      goto LABEL_47;
    case 6:
      v3 = 7;
      goto LABEL_47;
    case 7:
      v3 = 8;
      goto LABEL_47;
    case 8:
      v3 = 9;
      goto LABEL_47;
    case 9:
      v3 = 10;
      goto LABEL_47;
    case 10:
      v3 = 11;
      goto LABEL_47;
    case 11:
      v3 = 12;
      goto LABEL_47;
    case 12:
      v3 = 13;
      goto LABEL_47;
    case 13:
      v3 = 14;
      goto LABEL_47;
    case 14:
      v3 = 15;
      goto LABEL_47;
    case 15:
      v3 = 16;
      goto LABEL_47;
    case 16:
      v3 = 17;
      goto LABEL_47;
    case 17:
      v3 = 18;
      goto LABEL_47;
    case 18:
      v3 = 19;
      goto LABEL_47;
    case 19:
      v3 = 20;
      goto LABEL_47;
    case 20:
      v3 = 21;
      goto LABEL_47;
    case 21:
      v3 = 22;
      goto LABEL_47;
    case 22:
      v3 = 23;
      goto LABEL_47;
    case 23:
      v3 = 24;
      goto LABEL_47;
    case 24:
      v3 = 25;
      goto LABEL_47;
    case 25:
      v3 = 26;
      goto LABEL_47;
    case 26:
      v3 = 27;
      goto LABEL_47;
    case 27:
      v3 = 29;
      goto LABEL_36;
    case 28:
      v3 = 29;
      goto LABEL_47;
    case 29:
      v3 = 31;
      goto LABEL_36;
    case 30:
      v3 = 31;
      goto LABEL_47;
    case 31:
    case 33:
      v3 = 33;
LABEL_36:
      v4 = 0;
      goto LABEL_48;
    case 32:
    case 34:
      v3 = 33;
      goto LABEL_47;
    case 35:
      v3 = 36;
      goto LABEL_47;
    case 36:
      v3 = 37;
      goto LABEL_47;
    case 37:
      v3 = 38;
      goto LABEL_47;
    case 38:
      v3 = 39;
      goto LABEL_47;
    case 39:
    case 45:
      v3 = 40;
      goto LABEL_47;
    case 40:
      v3 = 41;
      goto LABEL_47;
    case 41:
    case 46:
      v3 = 42;
      goto LABEL_47;
    case 42:
      v3 = 43;
      goto LABEL_47;
    case 43:
      v3 = 44;
      goto LABEL_47;
    case 47:
      v3 = 45;
      goto LABEL_47;
    default:
      v3 = 0;
LABEL_47:
      v4 = 1;
LABEL_48:
      WAImageForConditionCode(v3, v4, a2);
      return (id)objc_claimAutoreleasedReturnValue();
  }
}

id WAMapsImageWithinBundle(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = v3;
  if (a2 == 1)
  {
    v5 = CFSTR("-black");
    goto LABEL_5;
  }
  if (!a2)
  {
    v5 = CFSTR("-white");
LABEL_5:
    objc_msgSend(v3, "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id WAImageForConditionCode(uint64_t a1, int a2, uint64_t a3)
{
  __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;

  v4 = CFSTR("blowingsnow");
  switch(a1)
  {
    case 1:
      v4 = CFSTR("tornado");
      break;
    case 2:
      v4 = CFSTR("tropical_storm");
      break;
    case 3:
      v4 = CFSTR("hurricane");
      break;
    case 4:
      v5 = CFSTR("severe_thunderstorm_night");
      v6 = CFSTR("severe_thunderstorm_day");
      goto LABEL_27;
    case 5:
    case 38:
    case 39:
    case 45:
      v5 = CFSTR("scattered-thunderstorm-night");
      v6 = CFSTR("scattered-thunderstorm-day");
      goto LABEL_27;
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 36:
      v5 = CFSTR("mix-rainfall_night");
      v6 = CFSTR("mix-rainfall_day");
      goto LABEL_27;
    case 10:
      v5 = CFSTR("drizzle_night");
      v6 = CFSTR("drizzle_day");
      goto LABEL_27;
    case 12:
    case 13:
      v5 = CFSTR("rain_night");
      v6 = CFSTR("rain_day");
      goto LABEL_27;
    case 14:
      v4 = CFSTR("flurry");
      break;
    case 15:
    case 17:
    case 26:
    case 42:
      v4 = CFSTR("flurry_snow_shower");
      break;
    case 16:
      break;
    case 18:
      v5 = CFSTR("hail_night");
      v6 = CFSTR("hail_day");
      goto LABEL_27;
    case 19:
      v5 = CFSTR("sleet_night");
      v6 = CFSTR("sleet_day");
      goto LABEL_27;
    case 20:
      v4 = CFSTR("dust");
      break;
    case 21:
      v5 = CFSTR("fog_night");
      v6 = CFSTR("fog_day");
      goto LABEL_27;
    case 22:
      v4 = CFSTR("haze");
      break;
    case 23:
      v4 = CFSTR("smoke");
      break;
    case 24:
    case 25:
      v4 = CFSTR("breezy");
      break;
    case 27:
    case 29:
      v5 = CFSTR("mostly-cloudy_night");
      v6 = CFSTR("mostly-cloudy_day");
      goto LABEL_27;
    case 31:
      v5 = CFSTR("partly-cloudy-night");
      v6 = CFSTR("partly-cloudy-day");
      goto LABEL_27;
    case 33:
    case 35:
      v5 = CFSTR("clear-night");
      v6 = CFSTR("mostly-sunny");
      goto LABEL_27;
    case 37:
      v4 = CFSTR("hot");
      break;
    case 40:
      v5 = CFSTR("scattered-showers-night");
      v6 = CFSTR("scattered-showers-day");
      goto LABEL_27;
    case 41:
      v5 = CFSTR("heavy-rain_night");
      v6 = CFSTR("heavy-rain_day");
      goto LABEL_27;
    case 43:
    case 44:
      v5 = CFSTR("blizzard_night");
      v6 = CFSTR("blizzard_day");
LABEL_27:
      if (a2)
        v5 = (__CFString *)v6;
      v4 = v5;
      break;
    default:
      v4 = CFSTR("no_report");
      break;
  }
  WAMapsImageWithinBundle(v4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id WAImageForSunset(uint64_t a1)
{
  return +[WeatherImageLoader conditionImageNamed:style:](WeatherImageLoader, "conditionImageNamed:style:", CFSTR("sunset"), a1);
}

id WAImageForSunrise(uint64_t a1)
{
  return +[WeatherImageLoader conditionImageNamed:style:](WeatherImageLoader, "conditionImageNamed:style:", CFSTR("sunrise"), a1);
}

id WADetailColor()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t WAContentColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

uint64_t WADividerLineColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
}

uint64_t _WAAirQualityIsAQI(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = _WAAirQualityIsAQI_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_WAAirQualityIsAQI_onceToken, &__block_literal_global);
  v3 = (void *)_WAAirQualityIsAQI_AQICountries;
  objc_msgSend(v2, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "containsObject:", v4);
  return v5;
}

uint64_t _WAAirQualityIsDAQI(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = _WAAirQualityIsDAQI_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_WAAirQualityIsDAQI_onceToken, &__block_literal_global_99);
  v3 = (void *)_WAAirQualityIsDAQI_DAQICountries;
  objc_msgSend(v2, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "containsObject:", v4);
  return v5;
}

uint64_t _WAAirQualityIsUBA(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = _WAAirQualityIsUBA_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_WAAirQualityIsUBA_onceToken, &__block_literal_global_105);
  v3 = (void *)_WAAirQualityIsUBA_UBACountries;
  objc_msgSend(v2, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "containsObject:", v4);
  return v5;
}

uint64_t WAAirQualityIsSignificantForCategory(unint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  unsigned int IsUBA;

  v3 = a2;
  if (_WAAirQualityIsAQI(v3))
  {
    v4 = a1 > 2;
    goto LABEL_5;
  }
  if (_WAAirQualityIsDAQI(v3))
  {
    v4 = a1 > 6;
LABEL_5:
    v5 = v4;
    goto LABEL_11;
  }
  IsUBA = _WAAirQualityIsUBA(v3);
  if (a1 > 3)
    v5 = IsUBA;
  else
    v5 = 0;
LABEL_11:

  return v5;
}

id WAAirQualityDescriptionForCategory(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WFAirQualityCategoryUnknown"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_WAAirQualityIsAQI(v3))
  {
    switch(a1)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryUnhealthyForSensitiveGroups");
        goto LABEL_19;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryUnhealthy");
        goto LABEL_19;
      case 5:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryUnhealthy");
        goto LABEL_19;
      case 6:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryHazardous");
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsDAQI(v3))
  {
    switch(a1)
    {
      case 1:
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryLow");
        goto LABEL_19;
      case 4:
      case 5:
      case 6:
        goto LABEL_10;
      case 7:
      case 8:
      case 9:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryHigh");
        goto LABEL_19;
      case 10:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryHigh");
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsUBA(v3))
  {
    switch(a1)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryGood");
        goto LABEL_19;
      case 2:
LABEL_11:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryGood");
        goto LABEL_19;
      case 3:
LABEL_10:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryModerate");
        goto LABEL_19;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryBad");
        goto LABEL_19;
      case 5:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryBad");
LABEL_19:
        objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v9;
        break;
      default:
        break;
    }
  }

  return v5;
}

id WAAirQualityLongDescriptionForCategory(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WFAirQualityCategoryUnknown-Long"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_WAAirQualityIsAQI(v3))
  {
    switch(a1)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryUnhealthyForSensitiveGroups-Long");
        goto LABEL_19;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryUnhealthy-Long");
        goto LABEL_19;
      case 5:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryUnhealthy-Long");
        goto LABEL_19;
      case 6:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryHazardous-Long");
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsDAQI(v3))
  {
    switch(a1)
    {
      case 1:
      case 2:
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryLow-Long");
        goto LABEL_19;
      case 4:
      case 5:
      case 6:
        goto LABEL_10;
      case 7:
      case 8:
      case 9:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryHigh-Long");
        goto LABEL_19;
      case 10:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryHigh-Long");
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsUBA(v3))
  {
    switch(a1)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryGood-Long");
        goto LABEL_19;
      case 2:
LABEL_11:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryGood-Long");
        goto LABEL_19;
      case 3:
LABEL_10:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryModerate-Long");
        goto LABEL_19;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryBad-Long");
        goto LABEL_19;
      case 5:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("WFAirQualityCategoryVeryBad-Long");
LABEL_19:
        objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v9;
        break;
      default:
        break;
    }
  }

  return v5;
}

uint64_t WAHexStringFromColor(void *a1)
{
  const CGFloat *Components;
  float v2;
  unint64_t v3;
  float v4;
  unint64_t v5;
  float v6;

  Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
  v2 = *Components * 255.0;
  v3 = llroundf(v2);
  v4 = Components[1] * 255.0;
  v5 = llroundf(v4);
  v6 = Components[2] * 255.0;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX"), v3, v5, llroundf(v6));
}

id WAConditionsLineStringFromConditionCode(uint64_t a1)
{
  void *v1;
  void *v3;

  if (a1 <= 47)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", *(&WeatherDescription + a1), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = 0;
  }
  return v1;
}

__CFString *WASymbolGlyphFromConditionCode(uint64_t a1, int a2, int a3)
{
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString **v6;

  if (a1 <= 47)
  {
    v4 = 48;
    if (a2)
      v4 = 38;
    v5 = 49;
    if (a2)
      v5 = 40;
    if (a1 != 38)
      v4 = a1;
    if (v4 == 40)
      v4 = v5;
    v6 = &SymbolGlyphs;
    if (a3)
      v6 = &FilledSymbolGlyphs;
    v3 = v6[v4];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id WASymbolGlyphHexColorsFromConditionCode(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WASymbolGlyphColorsFromConditionCode(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        WAHexStringFromColor(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id WASymbolGlyphColorsFromConditionCode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("sun.max.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("cloud.sun.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

    objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("cloud.drizzle.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("cloud.rain.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v9);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("cloud.sun.rain.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v10);

    objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v12);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("cloud.moon.rain.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v13);

    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v14);

    objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v15);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("cloud.sun.bolt.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v16);

    objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v17);

    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v18);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("cloud.bolt.rain.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v19);

    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v21);

  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("sun.dust.fill")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("sun.haze.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v22);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("thermometer.snowflake")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemTealColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v23);

  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("thermometer.sun")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v24);

    objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v25);

  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("sunrise.fill")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("sunset.fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v26);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id WAConditionsLineStringFromCurrentForecasts(void *a1)
{
  return WAConditionsLineStringFromConditionCode(objc_msgSend(a1, "conditionCode"));
}

id WAConditionsLine2StringFromHourlyForecasts(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  const __CFString *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (WAConditionsLine2StringFromHourlyForecasts_onceToken != -1)
    dispatch_once(&WAConditionsLine2StringFromHourlyForecasts_onceToken, &__block_literal_global_197);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v3)
  {

    goto LABEL_35;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v2);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "conditionCode");
      if (((0x1017FFF80001uLL >> v13) & 1) == 0)
      {
        v14 = PrecipitationTypeMap[v13];
        if (!v7)
          v7 = PrecipitationTypeMap[v13];
        if (v14 == 4)
          v15 = v9 + 1;
        else
          v15 = v9;
        if (v14 == 3)
          v16 = v5 + 1;
        else
          v16 = v5;
        if (v14 == 3)
          v15 = v9;
        if (v14 == 2)
          ++v8;
        else
          v5 = v16;
        if (v14 != 2)
          v9 = v15;
      }
      objc_msgSend(v12, "temperature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "temperatureForUnit:", 2);
      v19 = v18;

      if (v19 < 0.0)
        ++v6;
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v4);

  if (v8 >= 1 && v8 > v5)
    goto LABEL_35;
  if (v5 >= 1 && v5 > v8)
    goto LABEL_32;
  if (v9 >= 1 && v9 > v8 && v9 > v5)
  {
    v20 = ChanceOfRainWithHourlyForecasts(v2);
LABEL_42:
    v21 = CFSTR("CHANCE_OF_HAIL");
    goto LABEL_37;
  }
  if (v7)
  {
    v20 = ChanceOfRainWithHourlyForecasts(v2);
    if (v7 == 4)
      goto LABEL_42;
    if (v7 == 3)
      goto LABEL_33;
LABEL_36:
    v21 = CFSTR("CHANCE_OF_RAIN_WIDGET");
    goto LABEL_37;
  }
  if (!v6)
  {
LABEL_35:
    v20 = ChanceOfRainWithHourlyForecasts(v2);
    goto LABEL_36;
  }
LABEL_32:
  v20 = ChanceOfRainWithHourlyForecasts(v2);
LABEL_33:
  v21 = CFSTR("CHANCE_OF_SNOW");
LABEL_37:
  v22 = (void *)MEMORY[0x24BDD17C8];
  v23 = v20 / 100.0;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("DETAIL_FORMAT_STRING_WIDGET"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", v21, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)WAConditionsLine2StringFromHourlyForecasts__percentFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringFromNumber:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringWithFormat:", v25, v27, v30, (_QWORD)v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

id WAHourlyConditionsTimeLabelFont(int a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (a1)
    v1 = 32770;
  else
    v1 = 0x8000;
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0], v1, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WAHourlyConditionsTemperatureLabelAttributesDictionary(int a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (a1)
    v1 = 32770;
  else
    v1 = 0x8000;
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0], v1, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF6600];
  v8[0] = *MEMORY[0x24BDF65F8];
  v8[1] = v5;
  v9[0] = v3;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void WASetupVibrancyOnView(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", 0);

  objc_msgSend(v3, "effectConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentConfig");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "configureLayerView:", v4);
}

id WATodayLoadSavedLastForecastModelFromPreferences(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  if (a1)
  {
    objc_msgSend(a1, "localWeatherCity");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
    {
      v2 = (void *)objc_opt_new();
      objc_msgSend(v1, "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setDisplayName:", v3);

      objc_msgSend(v1, "timeZone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setTimeZone:", v4);

      objc_msgSend(v1, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setGeoLocation:", v5);

      objc_msgSend(v1, "ISO3166CountryAbbreviation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setCountryAbbreviation:", v6);

      objc_msgSend(v1, "weatherDisplayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setWeatherDisplayName:", v7);

      objc_msgSend(v1, "weatherLocationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setWeatherLocationName:", v8);

      v9 = (void *)objc_opt_new();
      objc_msgSend(v1, "temperature");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTemperature:", v10);

      objc_msgSend(v1, "feelsLike");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFeelsLike:", v11);

      objc_msgSend(v1, "windSpeed");
      objc_msgSend(v9, "setWindSpeed:");
      objc_msgSend(v1, "windDirection");
      objc_msgSend(v9, "setWindDirection:");
      objc_msgSend(v1, "humidity");
      objc_msgSend(v9, "setHumidity:");
      objc_msgSend(v1, "dewPoint");
      objc_msgSend(v9, "setDewPoint:");
      objc_msgSend(v1, "visibility");
      objc_msgSend(v9, "setVisibility:");
      objc_msgSend(v1, "pressure");
      objc_msgSend(v9, "setPressure:");
      objc_msgSend(v9, "setPressureRising:", objc_msgSend(v1, "pressureRising"));
      objc_msgSend(v9, "setUVIndex:", objc_msgSend(v1, "uvIndex"));
      objc_msgSend(v1, "precipitationPast24Hours");
      *(float *)&v12 = v12;
      objc_msgSend(v9, "setPrecipitationPast24Hours:", v12);
      objc_msgSend(v9, "setConditionCode:", objc_msgSend(v1, "conditionCode"));
      objc_msgSend(v9, "setObservationTime:", objc_msgSend(v1, "observationTime"));
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setLocation:", v2);
      objc_msgSend(v1, "airQualityIdx");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLocalizedAirQualityIndex:", objc_msgSend(v14, "unsignedIntegerValue"));

      objc_msgSend(v1, "airQualityScaleCategory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLocalizedAirQualityScaleCategory:", v15);

      objc_msgSend(v1, "airQualityCategory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCategory:", objc_msgSend(v16, "unsignedIntegerValue"));

      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setCurrentConditions:", v9);
      objc_msgSend(v1, "hourlyForecasts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHourlyForecasts:", v18);

      objc_msgSend(v1, "dayForecasts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDailyForecasts:", v19);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "sunriseForDate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSunrise:", v21);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "sunsetForDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSunset:", v23);

      objc_msgSend(v17, "setLocation:", v2);
      objc_msgSend(v17, "setCity:", v1);
      objc_msgSend(v17, "setAirQualityConditions:", v13);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

id WATodayLoadSavedFirstCityFromPreferences(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (a1)
  {
    objc_msgSend(a1, "loadSavedCities");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "na_filter:", &__block_literal_global_217);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)objc_opt_new();
      objc_msgSend(v3, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDisplayName:", v5);

      objc_msgSend(v3, "timeZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTimeZone:", v6);

      objc_msgSend(v3, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGeoLocation:", v7);

      objc_msgSend(v3, "ISO3166CountryAbbreviation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCountryAbbreviation:", v8);

      objc_msgSend(v3, "weatherDisplayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWeatherDisplayName:", v9);

      objc_msgSend(v3, "weatherLocationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWeatherLocationName:", v10);

      v11 = (void *)objc_opt_new();
      objc_msgSend(v3, "temperature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTemperature:", v12);

      objc_msgSend(v3, "feelsLike");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFeelsLike:", v13);

      objc_msgSend(v3, "windSpeed");
      objc_msgSend(v11, "setWindSpeed:");
      objc_msgSend(v3, "windDirection");
      objc_msgSend(v11, "setWindDirection:");
      objc_msgSend(v3, "humidity");
      objc_msgSend(v11, "setHumidity:");
      objc_msgSend(v3, "dewPoint");
      objc_msgSend(v11, "setDewPoint:");
      objc_msgSend(v3, "visibility");
      objc_msgSend(v11, "setVisibility:");
      objc_msgSend(v3, "pressure");
      objc_msgSend(v11, "setPressure:");
      objc_msgSend(v11, "setPressureRising:", objc_msgSend(v3, "pressureRising"));
      objc_msgSend(v11, "setUVIndex:", objc_msgSend(v3, "uvIndex"));
      objc_msgSend(v3, "precipitationPast24Hours");
      *(float *)&v14 = v14;
      objc_msgSend(v11, "setPrecipitationPast24Hours:", v14);
      objc_msgSend(v11, "setConditionCode:", objc_msgSend(v3, "conditionCode"));
      objc_msgSend(v11, "setObservationTime:", objc_msgSend(v3, "observationTime"));
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "setLocation:", v4);
      objc_msgSend(v3, "airQualityIdx");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLocalizedAirQualityIndex:", objc_msgSend(v16, "unsignedIntegerValue"));

      objc_msgSend(v3, "airQualityScaleCategory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLocalizedAirQualityScaleCategory:", v17);

      objc_msgSend(v3, "airQualityCategory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCategory:", objc_msgSend(v18, "unsignedIntegerValue"));

      v19 = (void *)objc_opt_new();
      objc_msgSend(v19, "setCurrentConditions:", v11);
      objc_msgSend(v3, "hourlyForecasts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHourlyForecasts:", v20);

      objc_msgSend(v3, "dayForecasts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDailyForecasts:", v21);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sunriseForDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSunrise:", v23);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sunsetForDate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSunset:", v25);

      objc_msgSend(v19, "setLocation:", v4);
      objc_msgSend(v19, "setCity:", v3);
      objc_msgSend(v19, "setAirQualityConditions:", v15);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

id WANumberFormatterForDisplayingAQI()
{
  if (WANumberFormatterForDisplayingAQI_onceToken != -1)
    dispatch_once(&WANumberFormatterForDisplayingAQI_onceToken, &__block_literal_global_218);
  return (id)WANumberFormatterForDisplayingAQI_aqiNumberFormatter;
}

void sub_21AAF00F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AAF02A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AAF0400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AAF066C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AAF0C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WACityFromForecastModel(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v4);

  objc_msgSend(v1, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geoLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocation:", v6);

  objc_msgSend(v2, "updateCityForModel:", v1);
  return v2;
}

uint64_t WeatherCityListChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "weatherPreferencesWereSynchronized");
}

id TWCFallbackURL()
{
  if (TWCFallbackURL_onceToken != -1)
    dispatch_once(&TWCFallbackURL_onceToken, &__block_literal_global_2);
  return (id)TWCFallbackURL_TWCFallbackURL;
}

id TWCAttributionURLForTrafficParameter(void *a1)
{
  __CFString *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (TWCAttributionURLForTrafficParameter_onceToken != -1)
    dispatch_once(&TWCAttributionURLForTrafficParameter_onceToken, &__block_literal_global_9);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canOpenURL:", TWCAttributionURLForTrafficParameter_sTWCAppiPadURL);

  if (v3)
  {
    v4 = (void *)TWCAttributionURLForTrafficParameter_sTWCAppiPadURL;
LABEL_7:
    v7 = v4;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenURL:", TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL);

  if (v6)
  {
    v4 = (void *)TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("http://www.weather.com/wx/today/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v1, "length"))
  {

    v1 = CFSTR("TWC");
  }
  v9 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(CFSTR("apple_"), "stringByAppendingString:", v1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryItemWithName:value:", CFSTR("par"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (WAUserTemperatureUnit() == 1)
    v12 = CFSTR("e");
  else
    v12 = CFSTR("m");
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("units"), v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v13;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uppercaseString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v17, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("locale"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryItems");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = (void *)MEMORY[0x24BDBD1A8];
  v29[0] = v11;
  v29[1] = v19;
  v29[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v24);

  objc_msgSend(v8, "URL");
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  WALogForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    TWCAttributionURLForTrafficParameter_cold_1(v7, v25);

  return v7;
}

id WeatherChannelBaseURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("WeatherChannelBaseURL"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v2 = (void *)objc_msgSend(v1, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/v1/geocode"), CFSTR("api.weather.com"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v3, "copy");

  }
  return v2;
}

id WAAttributionString()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[WAProviderAttributionManager sharedManager](WAProviderAttributionManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "providerName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "length");
  WALogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v18 = v1;
      _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "WAAttributionString: we got a provider name: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WFAttributionSourceNameLocalizedAttributionString"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v3 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WFAttributionSourceProviderLocalizedAttributionString"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "rangeOfString:options:", v3, 1);
    v12 = v11;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v9);
    if (v12)
    {
      v14 = *MEMORY[0x24BDF6618];
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://weather.com/?par=apple_notificationcenter"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttribute:value:range:", v14, v15, v10, v12);

      objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x24BDF66D8], MEMORY[0x24BDBD1C8], v10, v12);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      WAAttributionString_cold_1((uint64_t)v3, (uint64_t)v9);
    }

  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "WAAttributionString: No provider name, returning nil", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

id CardinalDirectionStringForIndex(unint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1 > 0xF)
    return 0;
  v4 = &unk_24DDB11D0;
  v5 = (void *)__cardinalDirections;
  if (a2)
    v4 = &unk_24DDB11B8;
  __cardinalDirections = (uint64_t)v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__cardinalDirections, "objectAtIndexedSubscript:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

double WeatherRowDegreeOffset()
{
  return 0.0;
}

id WeatherFrameworkBundle()
{
  if (WeatherFrameworkBundle_onceToken != -1)
    dispatch_once(&WeatherFrameworkBundle_onceToken, &__block_literal_global_5);
  return (id)__bundle;
}

BOOL IsLoDPI()
{
  void *v0;
  double v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1 < 2.0;

  return v2;
}

uint64_t IsInternalInstall()
{
  if (IsInternalInstall_onceToken != -1)
    dispatch_once(&IsInternalInstall_onceToken, &__block_literal_global_3);
  return IsInternalInstall___isInternalInstall;
}

uint64_t IsTallDevice()
{
  if (IsTallDevice_onceToken != -1)
    dispatch_once(&IsTallDevice_onceToken, &__block_literal_global_5);
  return IsTallDevice___isTallDevice;
}

uint64_t ShouldUseLargeiPadLayout()
{
  return objc_msgSend(MEMORY[0x24BE6B638], "naui_shouldUseLargeiPadLayout");
}

uint64_t ShouldUseLargeiPadLayoutForSize()
{
  return objc_msgSend(MEMORY[0x24BE6B638], "naui_shouldUseLargeiPadLayoutForSize:");
}

uint64_t IsPad()
{
  return objc_msgSend(MEMORY[0x24BE6B638], "naui_isPad");
}

double GetDeviceWidth()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v2 = v1;

  return v2;
}

double GetDeviceHeight()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v2 = v1;

  return v2;
}

uint64_t SupportsLandscapeWeather()
{
  if (SupportsLandscapeWeather_onceToken != -1)
    dispatch_once(&SupportsLandscapeWeather_onceToken, &__block_literal_global_8);
  return SupportsLandscapeWeather_support;
}

BOOL WAIsShortDevice()
{
  return GetDeviceHeight() < 667.0;
}

id TemperatureDegreeSign(int a1)
{
  __CFString *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v1 = CFSTR("TEMP_UNIT_FAHRENHEIT");
  if (a1)
    v1 = CFSTR("TEMP_UNIT_CELSIUS");
  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = v1;
  objc_msgSend(v2, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id TemperatureDegreeSignShort(int a1)
{
  __CFString *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v1 = CFSTR("TEMP_UNIT_FAHRENHEIT_SHORT");
  if (a1)
    v1 = CFSTR("TEMP_UNIT_CELSIUS_SHORT");
  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = v1;
  objc_msgSend(v2, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *PrecipitationDescription(void *a1)
{
  uint64_t v1;
  const __CFString *v2;

  v1 = objc_msgSend(a1, "precipitationForecast");
  v2 = CFSTR("CHANCE_OF_RAIN");
  if (v1 == 4)
    v2 = CFSTR("CHANCE_OF_HAIL");
  if (v1 == 3)
    return CFSTR("CHANCE_OF_SNOW");
  else
    return v2;
}

double SpecialTemperatureForCity(void *a1, const __CFString **a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  float v7;
  double v8;
  float v9;
  float v10;
  const __CFString *v11;

  v3 = a1;
  objc_msgSend(v3, "feelsLike");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temperatureForUnit:", WAUserTemperatureUnit());
  v6 = v5;

  objc_msgSend(v3, "windChill");
  v8 = v7;
  objc_msgSend(v3, "heatIndex");
  v10 = v9;

  if (*(double *)&CityMaxWindChillTemperature >= v8)
  {
    v11 = CFSTR("WIND_CHILL");
  }
  else
  {
    v8 = v10;
    if (*(double *)&CityMinHeatIndexTemperature <= v10)
    {
      v11 = CFSTR("HEAT_INDEX");
    }
    else
    {
      v11 = CFSTR("FEELS_LIKE");
      v8 = v6;
    }
  }
  *a2 = v11;
  return v8;
}

uint64_t WAUserTemperatureUnit()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BEC2238], "sharedObserver");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "temperatureUnit");

  return v1;
}

double ChanceOfRainWithHourlyForecasts(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v3 = 0.0;
  v4 = 0.0;
  if (v2)
  {
    v5 = v2;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "percentPrecipitation");
        v4 = v4 + v8;
        v3 = v3 + 1.0;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v9 = v4 / v3 / 10.0;
  if (v3 <= 0.0)
    v9 = 0.0;
  v10 = round(v9) * 10.0;
  v11 = fmax(v10, 10.0);
  if (v4 <= 0.0)
    v12 = v10;
  else
    v12 = v11;

  return v12;
}

uint64_t TimeStringToIntValue(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") > 2)
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(":"), &stru_24DD9EDF8, 0, 2, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "intValue");

  }
  else
  {
    WALogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v1;
      _os_log_impl(&dword_21AAEC000, v2, OS_LOG_TYPE_DEFAULT, "Malformed Time String %@", (uint8_t *)&v6, 0xCu);
    }

    v3 = 0;
  }

  return v3;
}

uint64_t IsPrecipitationCondition(unint64_t a1)
{
  unint64_t v1;
  unsigned int v2;

  v1 = (0xEFE800070000uLL >> a1) & 1;
  if (a1 > 0x2F)
    LODWORD(v1) = 0;
  if (a1 - 3 >= 0xC)
    v2 = v1;
  else
    v2 = 1;
  if (a1 == 1)
    return 1;
  else
    return v2;
}

id WoeidFromLocationID(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("|"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndex:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id WATemperatureStringFromString(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BEC2220];
  v4 = a1;
  v5 = [v3 alloc];
  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  v8 = (void *)objc_msgSend(v5, "initWithTemperatureUnit:value:", a2, v7);
  WATemperatureString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id WATemperatureString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  v2 = WAUserTemperatureUnit();
  WATemperatureStringForOutputUnit(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *WATemperatureStringForOutputUnit(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  __CFString *v7;
  __CFString *v8;

  v3 = a1;
  v4 = v3;
  if ((_DWORD)a2)
  {
    if (v3)
    {
      v5 = objc_msgSend(v3, "temperatureForUnit:", a2);
      LODWORD(v5) = llround(v6);
      LocalizedDecimalString(v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("--");
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id LocalizedDecimalString(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)__decimalNumberFormatter;
  if (!__decimalNumberFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v4 = (void *)__decimalNumberFormatter;
    __decimalNumberFormatter = (uint64_t)v3;

    objc_msgSend((id)__decimalNumberFormatter, "setNumberStyle:", 1);
    v2 = (void *)__decimalNumberFormatter;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL WAIsChinaSKUAndSimplifiedChinese()
{
  void *v0;
  void *v1;
  void *v2;
  _BOOL8 v3;

  CPGetDeviceRegionCode();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("CH")))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localeIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (objc_msgSend(v2, "hasPrefix:", CFSTR("zh-Hans")) & 1) != 0
      || objc_msgSend(v2, "hasPrefix:", CFSTR("zh_CN"));

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t WAIsPadAndChinaSKU()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x24BE6B638], "naui_isPad");
  if ((_DWORD)result)
  {
    CPGetDeviceRegionCode();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("CH"));

    return v2;
  }
  return result;
}

void WAPresentFirstUsageDialogIfNeeded()
{
  NSObject *v0;
  int network_use_flow;
  int v2;
  NSObject *v3;
  dispatch_time_t v4;

  network_usage_policy_create_client();
  v0 = dispatch_semaphore_create(0);
  network_use_flow = perform_first_network_use_flow();
  if (network_use_flow)
  {
    v2 = network_use_flow;
    WALogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      WAPresentFirstUsageDialogIfNeeded_cold_1(v2, v3);

  }
  else
  {
    v4 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v0, v4);
  }
  network_usage_policy_destroy_client();

}

uint64_t IsAllCapsMeridiemIndicatorRegion()
{
  if (IsAllCapsMeridiemIndicatorRegion_onceToken != -1)
    dispatch_once(&IsAllCapsMeridiemIndicatorRegion_onceToken, &__block_literal_global_48);
  return IsAllCapsMeridiemIndicatorRegion_isAllCapsLanguage;
}

uint64_t IsUIRTL()
{
  if (IsUIRTL_onceToken != -1)
    dispatch_once(&IsUIRTL_onceToken, &__block_literal_global_51);
  return IsUIRTL_isUIRTL;
}

void ClearNumberRTL()
{
  gIsNumberRTL = 0;
  gIsNumberRTLSet = 0;
}

uint64_t IsNumberRTL()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if ((gIsNumberRTLSet & 1) == 0)
  {
    v0 = (void *)__percentNumberFormatter;
    if (!__percentNumberFormatter)
    {
      v1 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      v2 = (void *)__percentNumberFormatter;
      __percentNumberFormatter = (uint64_t)v1;

      objc_msgSend((id)__percentNumberFormatter, "setNumberStyle:", 3);
      v0 = (void *)__percentNumberFormatter;
    }
    gIsNumberRTL = 1;
    objc_msgSend(v0, "stringFromNumber:", &unk_24DDB1758);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("%"));

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      gIsNumberRTL = 0;
    gIsNumberRTLSet = 1;
  }
  return gIsNumberRTL;
}

uint64_t IsDynamicTypeLargeOrSmaller()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7690]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF76B8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF76A8]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF76A0]);
  }

  return v2;
}

id FormatShortTime(void *a1, int a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = a1;
  if (__timeFormatter)
  {
    if (a2)
    {
LABEL_3:
      v6 = (void *)__formatStringWithMinutes;
      if (__formatStringWithMinutes)
        goto LABEL_9;
      v7 = (void *)MEMORY[0x24BDD1500];
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateFormatFromTemplate:options:locale:", CFSTR("jmm"), 0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = &__formatStringWithMinutes;
      goto LABEL_8;
    }
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v12 = (void *)__timeFormatter;
    __timeFormatter = (uint64_t)v11;

    if (a2)
      goto LABEL_3;
  }
  v6 = (void *)__formatStringWithoutMinutes;
  if (__formatStringWithoutMinutes)
    goto LABEL_9;
  v13 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = &__formatStringWithoutMinutes;
LABEL_8:
  v14 = objc_msgSend(v9, "copy");
  v15 = (void *)*v10;
  *v10 = v14;

  v6 = (void *)*v10;
LABEL_9:
  v16 = v6;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("STRING_TO_REMOVE_FROM_CONDENSED_TIME_FORMAT"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v18, &stru_24DD9EDF8);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v19;
  }
  objc_msgSend((id)__timeFormatter, "setDateFormat:", v16);
  objc_msgSend((id)__timeFormatter, "stringFromDate:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id TimeInRegionFormatFromFourDigitTime(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CFLocaleRef v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  if (v4 < 3)
  {
    v14 = 0;
  }
  else
  {
    v5 = v4 - 2;
    objc_msgSend(v3, "substringWithRange:", v4 - 2, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringWithRange:", 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFLocaleCopyCurrent();
    v9 = (void *)__components;
    if (!__components)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v11 = (void *)__components;
      __components = (uint64_t)v10;

      v9 = (void *)__components;
    }
    objc_msgSend(v9, "setHour:", (int)objc_msgSend(v7, "intValue"));
    objc_msgSend((id)__components, "setMinute:", (int)objc_msgSend(v6, "intValue"));
    GetCurrentCalendar();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", __components);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    FormatShortTime(v13, 1, a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      CFRelease(v8);

  }
  return v14;
}

id GetCurrentCalendar()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)__currentCalendar;
  if (!__currentCalendar)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__currentCalendar;
    __currentCalendar = v1;

    v0 = (void *)__currentCalendar;
  }
  return v0;
}

id WAUIFormattedTimeString(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  char v25;
  _QWORD v26[2];
  _QWORD v27[2];
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  v29 = *MEMORY[0x24BDF7748];
  v5 = *MEMORY[0x24BDF7778];
  v26[0] = *MEMORY[0x24BDF7780];
  v26[1] = v5;
  v27[0] = &unk_24DDB1650;
  v27[1] = &unk_24DDB1668;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fontDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptorByAddingAttributes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "languageCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v12) = objc_msgSend(v13, "isEqualToString:", CFSTR("en"));
  v14 = objc_msgSend(v4, "length");
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __WAUIFormattedTimeString_block_invoke;
  v21[3] = &unk_24DD9D1D0;
  v25 = (char)v12;
  v15 = v4;
  v22 = v15;
  v23 = v11;
  v24 = v3;
  v16 = v3;
  v17 = v11;
  objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0, v21);
  v18 = v24;
  v19 = v15;

  return v19;
}

id WATimeInRegionFormat(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)__components;
    if (!__components)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v9 = (void *)__components;
      __components = (uint64_t)v8;

      v7 = (void *)__components;
    }
    objc_msgSend(v7, "setHour:", (int)objc_msgSend(v5, "intValue"));
    objc_msgSend((id)__components, "setMinute:", (int)objc_msgSend(v6, "intValue"));
    if (gDateFormatter)
      goto LABEL_6;
    v10 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v11 = (void *)gDateFormatter;
    gDateFormatter = (uint64_t)v10;

    objc_msgSend((id)gDateFormatter, "setDateStyle:", 0);
    objc_msgSend((id)gDateFormatter, "setTimeStyle:", 1);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)gDateFormatter, "setLocale:", v12);

    if (gDateFormatter)
    {
LABEL_6:
      GetCurrentCalendar();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateFromComponents:", __components);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)gDateFormatter, "_attributedStringWithFieldsFromDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      WAUIFormattedTimeString(v15, v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

id WATimeInRegionFormatFromFourDigitTime(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "substringToIndex:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WATimeInRegionFormat(v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id WACondensedTimeInRegionFormat(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a2;
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)__components;
    if (!__components)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      v9 = (void *)__components;
      __components = (uint64_t)v8;

      v7 = (void *)__components;
    }
    objc_msgSend(v7, "setHour:", (int)objc_msgSend(v5, "intValue"));
    objc_msgSend((id)__components, "setMinute:", (int)objc_msgSend(v6, "intValue"));
    if (gCondensedTimeFormatter)
      goto LABEL_8;
    if (!__formatStringWithoutMinutes)
    {
      v10 = (void *)MEMORY[0x24BDD1500];
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      v14 = (void *)__formatStringWithoutMinutes;
      __formatStringWithoutMinutes = v13;

    }
    v15 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v16 = (void *)gCondensedTimeFormatter;
    gCondensedTimeFormatter = (uint64_t)v15;

    objc_msgSend((id)gCondensedTimeFormatter, "setDateFormat:", __formatStringWithoutMinutes);
    if (gCondensedTimeFormatter)
    {
LABEL_8:
      GetCurrentCalendar();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateFromComponents:", __components);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)gCondensedTimeFormatter, "_attributedStringWithFieldsFromDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      WAUIFormattedTimeString(v19, v3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

  }
  return v20;
}

id weatherWeekdayFormatter()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)gWeekdayFormatter;
  if (!gWeekdayFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v2 = (void *)gWeekdayFormatter;
    gWeekdayFormatter = (uint64_t)v1;

    objc_msgSend((id)gWeekdayFormatter, "setDateStyle:", 0);
    objc_msgSend((id)gWeekdayFormatter, "setTimeStyle:", 0);
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)gWeekdayFormatter, "setLocale:", v3);

    objc_msgSend((id)gWeekdayFormatter, "setFormattingContext:", 2);
    v0 = (void *)gWeekdayFormatter;
  }
  return v0;
}

id weekdayNameForDayOfWeekHelper(unint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;

  weatherWeekdayFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    v6 = (void *)gShortWeekdayNames;
    if (gShortWeekdayNames)
      goto LABEL_7;
    objc_msgSend(v4, "shortStandaloneWeekdaySymbols");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = &gShortWeekdayNames;
  }
  else
  {
    v6 = (void *)gWeekdayNames;
    if (gWeekdayNames)
      goto LABEL_7;
    objc_msgSend(v4, "standaloneWeekdaySymbols");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = &gWeekdayNames;
  }
  v9 = (void *)*v8;
  *v8 = v7;

  v6 = (void *)*v8;
LABEL_7:
  v10 = v6;
  v11 = v10;
  v12 = 7;
  if (a1 < 7)
    v12 = a1;
  if (v12 <= 1)
    v12 = 1;
  objc_msgSend(v10, "objectAtIndex:", v12 - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id shortWeekdayNameForDayOfWeek(unint64_t a1)
{
  return weekdayNameForDayOfWeekHelper(a1, 1);
}

id weekdayNameForDayOfWeek(unint64_t a1)
{
  return weekdayNameForDayOfWeekHelper(a1, 0);
}

id weekdayNameForDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  weatherWeekdayFormatter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WAMonospacedFont(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDF7748];
  v2 = *MEMORY[0x24BDF7778];
  v9[0] = *MEMORY[0x24BDF7780];
  v9[1] = v2;
  v10[0] = &unk_24DDB1680;
  v10[1] = &unk_24DDB1698;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorByAddingAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void WAWeatherUtilityResetForTimeChange()
{
  void *v0;

  v0 = (void *)__currentCalendar;
  __currentCalendar = 0;

}

id LocalizedPercentageString(double a1)
{
  int v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = LODWORD(a1);
  v2 = (void *)__percentNumberFormatter;
  if (!__percentNumberFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v4 = (void *)__percentNumberFormatter;
    __percentNumberFormatter = (uint64_t)v3;

    objc_msgSend((id)__percentNumberFormatter, "setNumberStyle:", 3);
    v2 = (void *)__percentNumberFormatter;
  }
  LODWORD(a1) = v1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t LocalizedPercentageSign()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)__percentNumberFormatter;
  if (!__percentNumberFormatter)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v2 = (void *)__percentNumberFormatter;
    __percentNumberFormatter = (uint64_t)v1;

    objc_msgSend((id)__percentNumberFormatter, "setNumberStyle:", 3);
    v0 = (void *)__percentNumberFormatter;
  }
  return objc_msgSend(v0, "percentSymbol");
}

void WeatherUtilityFunctionsLocaleChanged()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v0 = (void *)gDateFormatter;
  gDateFormatter = 0;

  v1 = (void *)gCondensedTimeFormatter;
  gCondensedTimeFormatter = 0;

  v2 = (void *)gWeekdayFormatter;
  gWeekdayFormatter = 0;

  v3 = (void *)gWeekdayNames;
  gWeekdayNames = 0;

  v4 = (void *)gShortWeekdayNames;
  gShortWeekdayNames = 0;

  v5 = (void *)__components;
  __components = 0;

  v6 = (void *)__currentCalendar;
  __currentCalendar = 0;

  v7 = (void *)__percentNumberFormatter;
  __percentNumberFormatter = 0;

  v8 = (void *)__decimalNumberFormatter;
  __decimalNumberFormatter = 0;

  v9 = (void *)__timeFormatter;
  __timeFormatter = 0;

  v10 = (void *)__formatStringWithoutMinutes;
  __formatStringWithoutMinutes = 0;

  v11 = (void *)__formatStringWithMinutes;
  __formatStringWithMinutes = 0;

  gIsNumberRTL = 0;
  gIsNumberRTLSet = 0;
}

uint64_t Time24StringToInt(void *a1)
{
  void *v1;
  int v2;
  uint64_t v3;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_24DD9EDF8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");
  if (v2 >= 100)
    v3 = v2;
  else
    v3 = (v2 + 2400);

  return v3;
}

uint64_t RemapSmallIconForDayOrNight(uint64_t result, int a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = result - 27;
    if ((unint64_t)(result - 27) < 7 && ((0x55u >> v2) & 1) != 0)
    {
      v3 = &unk_21AB38F70;
      return v3[v2];
    }
  }
  else
  {
    v2 = result - 28;
    if ((unint64_t)(result - 28) < 7 && ((0x55u >> v2) & 1) != 0)
    {
      v3 = &unk_21AB38FA8;
      return v3[v2];
    }
  }
  return result;
}

uint64_t RemapStringIndexForDayOrNight(uint64_t result, int a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = result - 27;
    if ((unint64_t)(result - 27) < 7 && ((0x55u >> v2) & 1) != 0)
    {
      v3 = &unk_21AB38F70;
      return v3[v2];
    }
  }
  else
  {
    v2 = result - 28;
    if ((unint64_t)(result - 28) < 7 && ((0x55u >> v2) & 1) != 0)
    {
      v3 = &unk_21AB38FA8;
      return v3[v2];
    }
  }
  return result;
}

float toRadians(float a1)
{
  return a1 * 0.0174532925;
}

float haversineDistance(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  long double v21;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v3, "coordinate");
  v8 = v7;
  objc_msgSend(v4, "coordinate");
  v10 = v9;

  v11 = v10;
  objc_msgSend(v3, "coordinate");
  v13 = v12;

  v14 = v13;
  v15 = (float)(v8 - v6) * 0.0174532925;
  v16 = (float)(v14 - v11) * 0.0174532925;
  *(float *)&v13 = v6 * 0.0174532925;
  v17 = v8 * 0.0174532925;
  v18 = sinf(v15 * 0.5);
  v19 = sinf(v16 * 0.5);
  *(float *)&v13 = cosf(*(float *)&v13) * (float)(v19 * v19);
  v20 = cosf(v17);
  v21 = atan2(sqrt((float)((float)(v20 * *(float *)&v13) + (float)(v18 * v18))), sqrt((float)(1.0 - (float)((float)(v20 * *(float *)&v13) + (float)(v18 * v18)))));
  *(float *)&v21 = v21 + v21;
  return *(float *)&v21 * 6371.0;
}

id FirstValidTWCLinkFromLinks(void *a1)
{
  id v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __FirstValidTWCLinkFromLinks_block_invoke;
  v4[3] = &unk_24DD9D1F8;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_21AAFAA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id SelectTWCLinkForCity(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "deeplink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

  objc_msgSend(v1, "link");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "na_safeAddObject:", v4);
  v5 = (void *)MEMORY[0x24BDBCF48];
  TWCFallbackURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v7);

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FirstValidTWCLinkFromLinks(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void OpenTWCLinksInOrder(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)*MEMORY[0x24BDF74F8];
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __OpenTWCLinksInOrder_block_invoke;
    v4[3] = &unk_24DD9D188;
    v5 = v1;
    objc_msgSend(v3, "openURL:withCompletionHandler:", v2, v4);

  }
}

void OpenTWCLinkForCity(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v1 = a1;
  v8 = (id)objc_opt_new();
  objc_msgSend(v1, "deeplink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeAddObject:", v2);

  objc_msgSend(v1, "link");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_safeAddObject:", v3);
  v4 = (void *)MEMORY[0x24BDBCF48];
  TWCFallbackURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeAddObject:", v6);

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OpenTWCLinksInOrder(v7);

}

uint64_t DateIsTodayInTimezone(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v4);

  v7 = objc_msgSend(v6, "isDateInToday:", v5);
  return v7;
}

uint64_t DateIsYesterdayInTimezone(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v4);

  v7 = objc_msgSend(v6, "isDateInYesterday:", v5);
  return v7;
}

BOOL DatesAreNotWithinSameHour(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v12;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "component:fromDate:", 16, v5);
  v8 = objc_msgSend(v6, "component:fromDate:", 32, v5);

  v9 = objc_msgSend(v6, "component:fromDate:", 16, v4);
  v10 = objc_msgSend(v6, "component:fromDate:", 32, v4);

  v12 = v7 != v9 || v8 != v10;
  return v12;
}

id DateByAddingOneDay(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setDay:", 1);
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

double TruncateValueToDecimalAccuracy(int a1, double a2)
{
  double v3;

  v3 = __exp10((double)a1);
  return floor(a2 * v3 + 0.5) / v3;
}

uint64_t WFTemperatureUnitFromIsCelsiusValue(int a1)
{
  if (a1)
    return 2;
  else
    return 1;
}

uint64_t WAObjectIsEqual(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqual:", a2);
}

BOOL WAFloatIsEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.00000011921;
}

BOOL WADoubleIsEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

uint64_t CardinalDirectionFromAngle(double a1)
{
  double v1;

  v1 = (a1 + 11.25) / 22.5;
  if ((uint64_t)v1 <= 0)
    return -(-(uint64_t)v1 & 0xF);
  else
    return (uint64_t)v1 & 0xF;
}

void sub_21AAFC500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AAFDA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void MigrateDataProtectionClassOfPath(void *a1)
{
  id v1;
  void *v2;
  id v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_retainAutorelease(v1);
    v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0, 0);
    if ((v4 & 0x80000000) == 0)
    {
      v5 = v4;
      v6 = fcntl(v4, 64, 4);
      WALogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 == -1)
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412290;
          v11 = v3;
          v9 = "Failed to Migrate Data Protection Class of %@";
          goto LABEL_8;
        }
      }
      else if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v11 = v3;
        v9 = "Migrated Data Protection Class of %@";
LABEL_8:
        _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }

      close(v5);
    }
  }

}

id _WAWeatherIconCachePath()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)_WAWeatherIconCachePath___cacheDirectoryPath;
  if (!_WAWeatherIconCachePath___cacheDirectoryPath)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "userCachesDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Weather/MiniIcons/"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_WAWeatherIconCachePath___cacheDirectoryPath;
    _WAWeatherIconCachePath___cacheDirectoryPath = v3;

    v0 = (void *)_WAWeatherIconCachePath___cacheDirectoryPath;
  }
  return v0;
}

void sub_21AAFF068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id WATodayHeaderViewDegreeAttributedStringWithTemperatureObject(int a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __TemperatureFont_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = 0x4045800000000000;
    if (TemperatureFont_onceToken != -1)
      dispatch_once(&TemperatureFont_onceToken, block);
    v4 = (id)TemperatureFont_font;
    v5 = objc_alloc(MEMORY[0x24BDD1688]);
    v6 = *MEMORY[0x24BDF65F8];
    v20 = *MEMORY[0x24BDF65F8];
    v21[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v3, v7);

    if (a1)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 18.0, *MEMORY[0x24BDF7878]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BDF65D8];
      v18[0] = v6;
      v18[1] = v10;
      v19[0] = v9;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 18.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 176);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v3, "rangeOfString:", v13);
      objc_msgSend(v8, "addAttributes:range:", v12, v14, v15);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL WATodayPadViewFormatForSize(double a1, double a2)
{
  if (a1 < a2)
    a1 = a2;
  return a1 >= 1366.0;
}

void sub_21AB05118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WALogForCategory(uint64_t a1)
{
  if (WALogForCategory_onceToken != -1)
    dispatch_once(&WALogForCategory_onceToken, &__block_literal_global_8);
  return (id)WALogForCategory_logObjects[a1];
}

uint64_t CityTimeDigitForTimeZone(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCE60];
  v2 = a1;
  objc_msgSend(v1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (CityTimeDigitForTimeZone_onceToken != -1)
    dispatch_once(&CityTimeDigitForTimeZone_onceToken, &__block_literal_global_9);
  v4 = objc_msgSend(v2, "secondsFromGMT");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CityTimeDigitForTimeZone___timeZoneCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("ExpiryTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("TimeValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (!v6 || (objc_msgSend(v3, "timeIntervalSinceDate:", v7), v10 >= 0.0))
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)CityTimeDigitForTimeZone___currentTimeCalendar, "setTimeZone:", v11);
    objc_msgSend((id)CityTimeDigitForTimeZone___currentTimeCalendar, "components:fromDate:", 96, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hour");
    v20 = v7;
    v14 = v3;
    v9 = objc_msgSend(v12, "minute") + 100 * v13;
    v15 = (void *)CityTimeDigitForTimeZone___timeZoneCache;
    v21[0] = CFSTR("TimeValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("ExpiryTime");
    v22[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 60.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v18, v5);

    v3 = v14;
    v7 = v20;

  }
  return v9;
}

void sub_21AB06D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AB06E58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21AB06F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AB074EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *LocalizedWeatherDescription(uint64_t a1, int a2, int a3)
{
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a1 == 3200)
    return &stru_24DD9EDF8;
  v7 = RemapSmallIconForDayOrNight(a1, a2);
  v8 = *(&WeatherDescription + v7);
  if (!v8)
  {
    v9 = CFSTR("ShowingNight");
    if (a2)
      v9 = CFSTR("Showing Day");
    NSLog(CFSTR("Warning! (null) Weather Description for %d (Remapped %d - %@"), a1, v7, v9);
  }
  if (a3)
    v10 = CFSTR("%@-Leader");
  else
    v10 = CFSTR("%@-Embedded");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v11, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v13;
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_21AB0CEB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21AB15BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,id location,char a31)
{
  id *v31;
  uint64_t v32;

  objc_destroyWeak(v31);
  _Block_object_dispose((const void *)(v32 - 192), 8);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_21AB163F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t IsSunsetCondition(unint64_t a1)
{
  return (a1 < 0x25) & (0x1182800000uLL >> a1);
}

const __CFString *NSStringFromWAUpdateStatus(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(Unknown WAUpdateStatus)");
  else
    return off_24DD9DA10[a1];
}

const __CFString *NSStringFromWAUpdateErrorCode(unint64_t a1)
{
  if (a1 > 7)
    return CFSTR("(Unknown WAUpdateErrorCode)");
  else
    return off_24DD9DA28[a1];
}

const __CFString *NSStringFromWAWeatherDataAge(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(Unknown WAWeatherDataAge)");
  else
    return off_24DD9DA68[a1];
}

const __CFString *NSStringFromWAWeatherPressureState(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(Unknown WAWeatherPressureState)");
  else
    return off_24DD9DA80[a1];
}

__CFString *NSStringFromWeatherConditionCode(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 3200)
    v1 = CFSTR("(Unknown WeatherCondition)");
  else
    v1 = *(&WeatherDescription + a1);
  return v1;
}

id WAErrorWithCode(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  if (v7)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD1398]);
  if (v8)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("kWAUpdateErrorCityKey"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), a1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id WASmallWeatherIconsMap()
{
  if (WASmallWeatherIconsMap_onceToken != -1)
    dispatch_once(&WASmallWeatherIconsMap_onceToken, &__block_literal_global_12);
  return (id)WASmallWeatherIconsMap_s_smallWeatherIconsMap;
}

id WAG2FontWithSize(double a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDF6A78];
  v3 = *MEMORY[0x24BDC4CB8];
  v14[0] = *MEMORY[0x24BDC4CE0];
  v4 = *MEMORY[0x24BDC4DE0];
  v13[0] = v3;
  v13[1] = v4;
  v11 = *MEMORY[0x24BDC4D40];
  v12 = &unk_24DDB16E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = *MEMORY[0x24BDC4DA8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithFontAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_21AB1BAD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AB1BF24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21AB1D38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_21AB1EFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_21AB200BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_21AB213BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_21AB23714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AB23930(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21AB23A80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21AB293F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AB29B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AB29C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AB2A64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17, id a18)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(location);
  objc_destroyWeak(&a17);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

BOOL CLLocationCoordinate2DEqualToCoordinates(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

void TWCAttributionURLForTrafficParameter_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21AAEC000, a2, OS_LOG_TYPE_ERROR, "########### Logo URL %@", (uint8_t *)&v4, 0xCu);

}

void WAAttributionString_cold_1(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = a2;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_21AAEC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "#Attribution Warning! Missing (%@) from string (%@)! (Lang: %@)", (uint8_t *)&v6, 0x20u);

}

void WAPresentFirstUsageDialogIfNeeded_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21AAEC000, a2, OS_LOG_TYPE_ERROR, "Failed to present first usage dialog %d@", (uint8_t *)v2, 8u);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
  MEMORY[0x24BDBDD10](c, auxInfo, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x24BDBDE00](c, page);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x24BDBDE58](c);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x24BE04690]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t NSStringFromWFTemperatureUnit()
{
  return MEMORY[0x24BEC2170]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x24BDF7228]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x24BDF7CC8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _UIGraphicsDrawIntoImageContextWithOptions()
{
  return MEMORY[0x24BDF8120]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x24BED3BC0]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x24BED3BE0]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x24BED3BF8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x24BEDBD40]();
}

uint64_t network_usage_policy_destroy_client()
{
  return MEMORY[0x24BEDBD48]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t perform_first_network_use_flow()
{
  return MEMORY[0x24BEDBD50]();
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x24BEDC000](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

uint64_t uameasfmt_close()
{
  return MEMORY[0x24BEDC050]();
}

uint64_t uameasfmt_format()
{
  return MEMORY[0x24BEDC058]();
}

uint64_t uameasfmt_open()
{
  return MEMORY[0x24BEDC060]();
}

uint64_t unum_clone()
{
  return MEMORY[0x24BEDC1B0]();
}

uint64_t unum_close()
{
  return MEMORY[0x24BEDC1B8]();
}

uint64_t unum_open()
{
  return MEMORY[0x24BEDC208]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x24BEDC228]();
}

