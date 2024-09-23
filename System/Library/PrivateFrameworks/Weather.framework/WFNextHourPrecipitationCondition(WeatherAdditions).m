@implementation WFNextHourPrecipitationCondition(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", 0x24DDA41F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(a1, "stringForType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", 0x24DDA40F8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKey:", 0x24DDA4218);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v4, "objectForKey:", 0x24DDA4238);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v14, "unsignedIntegerValue");
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)v15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(a1, "initWithType:intensity:probability:validUntil:", v7, v15, v10, v13);

  return v16;
}

- (const)stringForType:()WeatherAdditions
{
  if ((unint64_t)(a3 - 1) > 5)
    return &stru_24DD9EDF8;
  else
    return off_24DD9D460[a3 - 1];
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
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = 0x24DDA41F8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = 0x24DDA40F8;
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "intensity");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = 0x24DDA4218;
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "probability");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = 0x24DDA4238;
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "validUntil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
