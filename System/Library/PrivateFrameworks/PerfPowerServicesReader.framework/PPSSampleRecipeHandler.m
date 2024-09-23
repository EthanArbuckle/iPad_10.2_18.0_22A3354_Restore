@implementation PPSSampleRecipeHandler

+ (id)metricRecipes
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("BatteryMetrics::Battery::Voltage");
  objc_msgSend(a1, "voltageRecipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)voltageRecipe
{
  return &__block_literal_global_8;
}

id __39__PPSSampleRecipeHandler_voltageRecipe__block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD18F0], "millivolts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD18F0], "volts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PPSConvertValueWithNSUnit(v5, v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    *a4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Recipe supports NSNumber, value sent %@"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PPSRecipeEngine"), 4, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }

  return v8;
}

@end
