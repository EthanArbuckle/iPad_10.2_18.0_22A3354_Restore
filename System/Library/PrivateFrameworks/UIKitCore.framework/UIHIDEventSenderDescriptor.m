@implementation UIHIDEventSenderDescriptor

id __60___UIHIDEventSenderDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("senderID"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("eventType"));
}

@end
