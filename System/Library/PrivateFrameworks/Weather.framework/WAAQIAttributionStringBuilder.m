@implementation WAAQIAttributionStringBuilder

- (id)buildAttributionStringFromCity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "airQualityAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataOrigination");
  if (!v6 || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WAAQIAttributionStringBuilder stationStringWithTimeElapsedFromCity:](self, "stationStringWithTimeElapsedFromCity:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6 == 1)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AQI_VIEW_ATTRIBUTION_MODELED_DATA"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)stationStringWithTimeElapsedFromCity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "airQualityAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stationLastReadDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = vcvtad_u64_f64(v8 / 60.0 / 60.0);
  objc_msgSend(v3, "airQualityAttribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stationLocationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(v3, "name");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (v9 == 1)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("AQI_VIEW_ATTRIBUTION_STATION_DATA_ONE_HOUR_AGO");
  }
  else
  {
    if (v9)
    {
      WANumberFormatterForDisplayingAQI();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromNumber:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AQI_VIEW_ATTRIBUTION_STATION_DATA_MORE_THAN_ONE_HOUR_AGO"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v22, v11, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("AQI_VIEW_ATTRIBUTION_STATION_DATA_LESS_THAN_ONE_HOUR_AGO");
  }
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v17, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  objc_msgSend(v3, "airQualityLearnMoreURL");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_msgSend(v3, "airQualityAttribution");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("AQI_VIEW_ATTRIBUTION_STATION_DATA_LEARN_MORE_SUFFIX"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "airQualityAttribution");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v28, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "stringByAppendingString:", v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v32;
    }
  }

  return v18;
}

@end
