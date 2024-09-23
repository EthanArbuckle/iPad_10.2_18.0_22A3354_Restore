@implementation SVXLocalizationGetAllTables

void __SVXLocalizationGetAllTables_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("Localizable");
  v2[1] = CFSTR("Clock");
  v2[2] = CFSTR("DeviceSetup");
  v2[3] = CFSTR("Errors");
  v2[4] = CFSTR("Interstitials");
  v2[5] = CFSTR("StoreDemo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SVXLocalizationGetAllTables_tables;
  SVXLocalizationGetAllTables_tables = v0;

}

@end
