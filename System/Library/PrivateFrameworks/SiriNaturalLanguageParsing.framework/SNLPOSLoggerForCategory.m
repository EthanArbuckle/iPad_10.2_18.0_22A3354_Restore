@implementation SNLPOSLoggerForCategory

void __SNLPOSLoggerForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;

  v0 = os_log_create("com.apple.sirinaturallanguageparsing", "General");
  v1 = (void *)SNLPOSLoggerForCategory::logObjects[0];
  SNLPOSLoggerForCategory::logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.sirinaturallanguageparsing", "NLv4");
  v3 = (void *)qword_1ED7B30D0;
  qword_1ED7B30D0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.sirinaturallanguageparsing", "UaaP");
  v5 = (void *)qword_1ED7B30E0;
  qword_1ED7B30E0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.sirinaturallanguageparsing", "Common");
  v7 = (void *)qword_1ED7B30E8;
  qword_1ED7B30E8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.sirinaturallanguageparsing", "OWL");
  v9 = (void *)qword_1ED7B30F0;
  qword_1ED7B30F0 = (uint64_t)v8;

  v10 = os_log_create("com.apple.sirinaturallanguageparsing", "UPDataDetectors");
  v11 = (void *)qword_1ED7B30F8;
  qword_1ED7B30F8 = (uint64_t)v10;

  v12 = os_log_create("com.apple.sirinaturallanguageparsing", "SiriNaturalLanguageParsingSignPosts");
  v13 = (void *)qword_1ED7B3100;
  qword_1ED7B3100 = (uint64_t)v12;

  v14 = os_log_create("com.apple.sirinaturallanguageparsing", "ITFM");
  v15 = (void *)qword_1ED7B30D8;
  qword_1ED7B30D8 = (uint64_t)v14;

  v16 = os_log_create("com.apple.sirinaturallanguageparsing", "SSU");
  v17 = (void *)qword_1ED7B3108;
  qword_1ED7B3108 = (uint64_t)v16;

}

@end
