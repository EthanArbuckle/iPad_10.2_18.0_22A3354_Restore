@implementation TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols

void __TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[14];
  _QWORD v21[15];

  v21[14] = *MEMORY[0x24BDAC8D0];
  v0 = objc_opt_new();
  v1 = (void *)sDateFormatterCldrLock;
  sDateFormatterCldrLock = v0;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)sDateFormatterCldrSymbolsCache;
  sDateFormatterCldrSymbolsCache = (uint64_t)v2;

  v4 = *MEMORY[0x24BDBD348];
  v20[0] = CFSTR("months.format.narrow");
  v20[1] = CFSTR("months.stand-alone.narrow");
  v5 = *MEMORY[0x24BDBD350];
  v21[0] = v4;
  v21[1] = v5;
  v6 = *MEMORY[0x24BDBD2F8];
  v20[2] = CFSTR("months.format.abbreviated");
  v20[3] = CFSTR("months.stand-alone.abbreviated");
  v7 = *MEMORY[0x24BDBD308];
  v21[2] = v6;
  v21[3] = v7;
  v8 = *MEMORY[0x24BDBD2E0];
  v20[4] = CFSTR("months.format.wide");
  v20[5] = CFSTR("months.stand-alone.wide");
  v9 = *MEMORY[0x24BDBD328];
  v21[4] = v8;
  v21[5] = v9;
  v10 = *MEMORY[0x24BDBD360];
  v20[6] = CFSTR("days.format.narrow");
  v20[7] = CFSTR("days.stand-alone.narrow");
  v11 = *MEMORY[0x24BDBD358];
  v21[6] = v10;
  v21[7] = v11;
  v12 = *MEMORY[0x24BDBD320];
  v20[8] = CFSTR("days.format.abbreviated");
  v20[9] = CFSTR("days.stand-alone.abbreviated");
  v13 = *MEMORY[0x24BDBD318];
  v21[8] = v12;
  v21[9] = v13;
  v14 = *MEMORY[0x24BDBD368];
  v20[10] = CFSTR("days.format.wide");
  v20[11] = CFSTR("days.stand-alone.wide");
  v15 = *MEMORY[0x24BDBD338];
  v21[10] = v14;
  v21[11] = v15;
  v20[12] = CFSTR("dayPeriods.format.abbreviated.am");
  v20[13] = CFSTR("dayPeriods.format.abbreviated.pm");
  v16 = *MEMORY[0x24BDBD2E8];
  v21[12] = *MEMORY[0x24BDBD2B8];
  v21[13] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 14);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)sDateFormatterCldrOverridingKeys;
  sDateFormatterCldrOverridingKeys = v17;

  v19 = (void *)sDateFormatterCldrOverridingFormatKeys;
  sDateFormatterCldrOverridingFormatKeys = (uint64_t)&unk_24F469E50;

}

@end
