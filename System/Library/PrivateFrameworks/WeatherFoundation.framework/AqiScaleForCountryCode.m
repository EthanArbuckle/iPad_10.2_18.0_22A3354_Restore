@implementation AqiScaleForCountryCode

void __AqiScaleForCountryCode_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x24BDAC8D0];
  v0 = objc_opt_new();
  v1 = (void *)AqiScaleForCountryCode_defaultScale;
  AqiScaleForCountryCode_defaultScale = v0;

  v11[0] = CFSTR("CN");
  v2 = (void *)objc_opt_new();
  v12[0] = v2;
  v11[1] = CFSTR("DE");
  v3 = (void *)objc_opt_new();
  v12[1] = v3;
  v11[2] = CFSTR("IN");
  v4 = (void *)objc_opt_new();
  v12[2] = v4;
  v11[3] = CFSTR("MX");
  v5 = (void *)objc_opt_new();
  v12[3] = v5;
  v11[4] = CFSTR("GB");
  v6 = (void *)objc_opt_new();
  v12[4] = v6;
  v11[5] = CFSTR("ES");
  v7 = (void *)objc_opt_new();
  v12[5] = v7;
  v11[6] = CFSTR("FR");
  v8 = (void *)objc_opt_new();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)AqiScaleForCountryCode_AQIScalesForCountries;
  AqiScaleForCountryCode_AQIScalesForCountries = v9;

}

@end
