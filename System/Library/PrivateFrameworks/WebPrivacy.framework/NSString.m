@implementation NSString

void __68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "absoluteString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  WebPrivacy::applyOrderedReplacements<objc_object>(*(void **)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

@end
