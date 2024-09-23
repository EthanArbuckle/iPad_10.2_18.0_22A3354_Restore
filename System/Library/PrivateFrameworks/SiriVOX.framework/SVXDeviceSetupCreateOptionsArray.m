@implementation SVXDeviceSetupCreateOptionsArray

void __SVXDeviceSetupCreateOptionsArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLanguageCode:", v3);
  objc_msgSend(v4, "setGender:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  objc_msgSend(v4, "setHasActiveAccount:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
  objc_msgSend(v4, "setIsNewsRestricted:", objc_msgSend(*(id *)(a1 + 56), "integerValue"));

}

@end
