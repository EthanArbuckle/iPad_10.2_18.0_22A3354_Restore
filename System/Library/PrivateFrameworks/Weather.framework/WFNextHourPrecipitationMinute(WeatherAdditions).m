@implementation WFNextHourPrecipitationMinute(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", 0x24DDA40F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKey:", 0x24DDA4118);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKey:", 0x24DDA4138);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v4, "objectForKey:", 0x24DDA4158);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  if (v15)
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v15);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "initWithIntensity:chance:perceivedIntensity:date:", v16, v7, v10, v13);

  return v17;
}

- (id)dictionaryRepresentation
{
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
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = 0x24DDA40F8;
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "intensity");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = 0x24DDA4118;
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "chance");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = 0x24DDA4138;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "perceivedIntensity");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = 0x24DDA4158;
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
