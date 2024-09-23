@implementation NSMutableString

void __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  void **v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained, "length");
    objc_msgSend(v3, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = operator new(0x18uLL);
    v9 = v8 + 3;
    v13[0] = v8;
    v13[2] = v8 + 3;
    *v8 = 0;
    v8[1] = v6;
    v10 = v7;
    v8[2] = v10;
    v13[1] = v8 + 3;
    while (v9 != (_QWORD *)v13[0])
    {
      v11 = *(v9 - 3);
      v12 = *(v9 - 2);
      v9 -= 3;
      objc_msgSend(v5, "replaceCharactersInRange:withString:", v11, v12, v9[2]);
    }
    v14 = (void **)v13;
    std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v14);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    for (i = a2[1];
          i != *a2;
          objc_msgSend(WeakRetained, "replaceCharactersInRange:withString:", v6, v7, *(_QWORD *)(i + 16)))
    {
      v6 = *(_QWORD *)(i - 24);
      v7 = *(_QWORD *)(i - 16);
      i -= 24;
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
