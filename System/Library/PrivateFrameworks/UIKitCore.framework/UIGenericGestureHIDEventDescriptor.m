@implementation UIGenericGestureHIDEventDescriptor

id __68___UIGenericGestureHIDEventDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 16);
  else
    v4 = 0;
  v5 = (id)objc_msgSend(v2, "appendUInt64:withName:", v4, CFSTR("senderID"));
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    v7 = *(unsigned int *)(v6 + 8);
  else
    v7 = 0;
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", v7, CFSTR("eventType"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("gestureType"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("tapCount"));
}

@end
