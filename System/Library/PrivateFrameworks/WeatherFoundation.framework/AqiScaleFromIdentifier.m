@implementation AqiScaleFromIdentifier

void __AqiScaleFromIdentifier_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("HJ6332012");
  v0 = (void *)objc_opt_new();
  v11[0] = v0;
  v10[1] = CFSTR("UBA");
  v1 = (void *)objc_opt_new();
  v11[1] = v1;
  v10[2] = CFSTR("NAQI");
  v2 = (void *)objc_opt_new();
  v11[2] = v2;
  v10[3] = CFSTR("IMECA");
  v3 = (void *)objc_opt_new();
  v11[3] = v3;
  v10[4] = CFSTR("DAQI");
  v4 = (void *)objc_opt_new();
  v11[4] = v4;
  v10[5] = CFSTR("CAQI");
  v5 = (void *)objc_opt_new();
  v11[5] = v5;
  v10[6] = CFSTR("ATMO");
  v6 = (void *)objc_opt_new();
  v11[6] = v6;
  v10[7] = CFSTR("AQI");
  v7 = (void *)objc_opt_new();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)AqiScaleFromIdentifier_AQIScalesFromIdentifiers;
  AqiScaleFromIdentifier_AQIScalesFromIdentifiers = v8;

}

@end
