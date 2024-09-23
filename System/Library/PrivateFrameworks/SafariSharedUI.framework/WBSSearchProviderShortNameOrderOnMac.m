@implementation WBSSearchProviderShortNameOrderOnMac

void ___WBSSearchProviderShortNameOrderOnMac_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Google");
  v2[1] = CFSTR("Baidu");
  v2[2] = CFSTR("Sogou");
  v2[3] = CFSTR("Qihoo");
  v2[4] = CFSTR("Yahoo!");
  v2[5] = CFSTR("Bing");
  v2[6] = CFSTR("DuckDuckGo");
  v2[7] = CFSTR("Yandex");
  v2[8] = CFSTR("Ecosia");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_WBSSearchProviderShortNameOrderOnMac_definitionOrder;
  _WBSSearchProviderShortNameOrderOnMac_definitionOrder = v0;

}

void ___WBSSearchProviderShortNameOrderOnMac_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Google");
  v2[1] = CFSTR("Yandex");
  v2[2] = CFSTR("Yahoo!");
  v2[3] = CFSTR("Bing");
  v2[4] = CFSTR("DuckDuckGo");
  v2[5] = CFSTR("Baidu");
  v2[6] = CFSTR("Sogou");
  v2[7] = CFSTR("Qihoo");
  v2[8] = CFSTR("Ecosia");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_WBSSearchProviderShortNameOrderOnMac_definitionOrder_134;
  _WBSSearchProviderShortNameOrderOnMac_definitionOrder_134 = v0;

}

void ___WBSSearchProviderShortNameOrderOnMac_block_invoke_3()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Google");
  v2[1] = CFSTR("Yahoo!");
  v2[2] = CFSTR("Bing");
  v2[3] = CFSTR("Baidu");
  v2[4] = CFSTR("DuckDuckGo");
  v2[5] = CFSTR("Yandex");
  v2[6] = CFSTR("Sogou");
  v2[7] = CFSTR("Qihoo");
  v2[8] = CFSTR("Ecosia");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_WBSSearchProviderShortNameOrderOnMac_definitionOrder_137;
  _WBSSearchProviderShortNameOrderOnMac_definitionOrder_137 = v0;

}

@end
