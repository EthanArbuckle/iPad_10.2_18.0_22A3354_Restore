@implementation SPMLLogging

+ (id)submitttedSpotlightReportsError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPMLLogging submittedLogsURL](SPMLLogging, "submittedLogsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x24BDBD6D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v6, 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (a3 && v8)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

+ (id)logURLForCurrentTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[SPMLLogging candidateLogsURL](SPMLLogging, "candidateLogsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  +[SPMLLogging dateFormatter](SPMLLogging, "dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("searchd-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)submittedLogsURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD block[4];
  id v9;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/Spotlight/Diagnostics/SubmittedReports"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SPMLLogging_submittedLogsURL__block_invoke;
  block[3] = &unk_24CF63D90;
  v9 = v3;
  v4 = submittedLogsURL_onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&submittedLogsURL_onceToken, block);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __31__SPMLLogging_submittedLogsURL__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, 0);

}

+ (id)candidateLogsURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD block[4];
  id v9;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/Spotlight/Diagnostics/CandidateReports"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SPMLLogging_candidateLogsURL__block_invoke;
  block[3] = &unk_24CF63D90;
  v9 = v3;
  v4 = candidateLogsURL_onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&candidateLogsURL_onceToken, block);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __31__SPMLLogging_candidateLogsURL__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, 0);

}

+ (id)dateFormatter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

@end
