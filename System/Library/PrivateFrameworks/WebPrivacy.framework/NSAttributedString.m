@implementation NSAttributedString

void __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  _QWORD v11[3];
  void **v12;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(v3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = operator new(0x18uLL);
  v11[0] = v8;
  v11[2] = v8 + 3;
  *v8 = 0;
  v8[1] = v6;
  v9 = v7;
  v8[2] = v9;
  v11[1] = v8 + 3;
  WebPrivacy::applyOrderedReplacements<NSAttributedString>(v5, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);

  v12 = (void **)v11;
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v12);

}

void __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  WebPrivacy::applyOrderedReplacements<objc_object>(*(void **)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

@end
