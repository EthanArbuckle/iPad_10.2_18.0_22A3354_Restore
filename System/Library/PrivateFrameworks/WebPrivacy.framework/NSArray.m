@implementation NSArray

void __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v3, *(_QWORD *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
