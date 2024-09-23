@implementation WiFiManagerNotificationCallback

uint64_t ___WiFiManagerNotificationCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_askToJoinNotification:", *(unsigned int *)(a1 + 40));
}

void ___WiFiManagerNotificationCallback_block_invoke_2(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_trustNotificationWithID:network:data:", *(unsigned int *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

void ___WiFiManagerNotificationCallback_block_invoke_3(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_joinRecommendationWithID:network:", *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

@end
