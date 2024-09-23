@implementation SUICGetViewModelVoicesForVoiceCollection

uint64_t ___SUICGetViewModelVoicesForVoiceCollection_block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CFE900];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputVoiceComparator");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "voiceInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "voiceInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "voiceInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "voiceInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = ((uint64_t (**)(_QWORD, void *, void *))v9)[2](v9, v10, v11);

  return v12;
}

@end
