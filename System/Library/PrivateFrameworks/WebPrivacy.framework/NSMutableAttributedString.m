@implementation NSMutableAttributedString

void __92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  void **v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "length");
    objc_msgSend(v3, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = operator new(0x18uLL);
    v8 = v7 + 3;
    v12[0] = v7;
    v12[2] = v7 + 3;
    *v7 = 0;
    v7[1] = v5;
    v9 = v6;
    v7[2] = v9;
    v12[1] = v7 + 3;
    while (v8 != (_QWORD *)v12[0])
    {
      v10 = *(v8 - 3);
      v11 = *(v8 - 2);
      v8 -= 3;
      objc_msgSend(WeakRetained, "replaceCharactersInRange:withString:", v10, v11, v8[2]);
    }
    v13 = (void **)v12;
    std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke_2(uint64_t a1, _QWORD *a2)
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
