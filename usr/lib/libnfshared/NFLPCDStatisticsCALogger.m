@implementation NFLPCDStatisticsCALogger

+ (void)postAnalyticsLPCDStatistic:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[8];
  _QWORD v23[8];
  _QWORD v24[8];
  _QWORD v25[8];
  _QWORD v26[8];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateDailyUUIDForCA");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("falseDetectionCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v26[0] = CFSTR("falseDetectionCount");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("falseDetectionCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    v27[1] = &unk_1E7D88718;
    v26[1] = CFSTR("tagType1ReadSuccessCount");
    v26[2] = CFSTR("tagType2ReadSuccessCount");
    v27[2] = &unk_1E7D88718;
    v27[3] = &unk_1E7D88718;
    v26[3] = CFSTR("tagType3ReadSuccessCount");
    v26[4] = CFSTR("tagType4ReadSuccessCount");
    v27[4] = &unk_1E7D88718;
    v27[5] = &unk_1E7D88718;
    v26[5] = CFSTR("tagType5ReadSuccessCount");
    v26[6] = CFSTR("notNDEFFormatedTagCount");
    v26[7] = CFSTR("dailyDeviceUUID");
    v8 = CFSTR("noUUID");
    if (v5)
      v8 = v5;
    v27[6] = &unk_1E7D88718;
    v27[7] = v8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v27;
    v11 = v26;
LABEL_9:
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("notNDEFFormatedTagCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v24[0] = CFSTR("falseDetectionCount");
    v24[1] = CFSTR("tagType1ReadSuccessCount");
    v25[0] = &unk_1E7D88718;
    v25[1] = &unk_1E7D88718;
    v24[2] = CFSTR("tagType2ReadSuccessCount");
    v24[3] = CFSTR("tagType3ReadSuccessCount");
    v25[2] = &unk_1E7D88718;
    v25[3] = &unk_1E7D88718;
    v24[4] = CFSTR("tagType4ReadSuccessCount");
    v24[5] = CFSTR("tagType5ReadSuccessCount");
    v25[4] = &unk_1E7D88718;
    v25[5] = &unk_1E7D88718;
    v24[6] = CFSTR("notNDEFFormatedTagCount");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("notNDEFFormatedTagCount"));
    v13 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v13;
    v24[7] = CFSTR("dailyDeviceUUID");
    v14 = CFSTR("noUUID");
    if (v5)
      v14 = v5;
    v25[6] = v13;
    v25[7] = v14;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v25;
    v11 = v24;
    goto LABEL_9;
  }
  v23[0] = &unk_1E7D88718;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("falseDetectionCount"), CFSTR("tagType1ReadSuccessCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v22[2] = CFSTR("tagType2ReadSuccessCount");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  v22[3] = CFSTR("tagType3ReadSuccessCount");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  v22[4] = CFSTR("tagType4ReadSuccessCount");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v19;
  v22[5] = CFSTR("tagType5ReadSuccessCount");
  objc_msgSend(v3, "objectForKeyedSubscript:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v20;
  v23[6] = &unk_1E7D88718;
  v22[6] = CFSTR("notNDEFFormatedTagCount");
  v22[7] = CFSTR("dailyDeviceUUID");
  if (v5)
    v21 = v5;
  else
    v21 = CFSTR("noUUID");
  v23[7] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  v16 = (void *)MEMORY[0x1C3BD2368]();
  objc_msgSend(v4, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.lpcdStatistic"), v15);
  objc_autoreleasePoolPop(v16);

}

@end
