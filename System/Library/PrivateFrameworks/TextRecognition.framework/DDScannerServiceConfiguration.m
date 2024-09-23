@implementation DDScannerServiceConfiguration

void __58__DDScannerServiceConfiguration_CRDD___crConfigForLocale___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0B4708;
  qword_1ED0B4708 = v0;

  v4[0] = CFSTR("ja-JP");
  v4[1] = CFSTR("ko-KR");
  v4[2] = CFSTR("th-TH");
  v4[3] = CFSTR("vi-VT");
  v4[4] = CFSTR("zh-Hans");
  v4[5] = CFSTR("zh-Hant");
  v4[6] = CFSTR("ar-SA");
  v4[7] = CFSTR("ars-SA");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0B4710;
  qword_1ED0B4710 = v2;

}

@end
