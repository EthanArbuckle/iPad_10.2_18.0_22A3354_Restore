@implementation TelephonyNotificationCB

void __TelephonyNotificationCB_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const void *v3;

  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA75C8]))
  {
    v2 = CFSTR("kCTRegistrationCellChangedNotification");
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7780]))
  {
    v2 = CFSTR("kCTRegistrationStatusChangedNotification");
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7688]))
  {
    v2 = CFSTR("kCTRegistrationDataStatusChangedNotification");
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA76A8]))
  {
    v2 = CFSTR("kCTRegistrationOperatorNameChangedNotification");
  }
  else
  {
    if (!CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7890]))
      goto LABEL_12;
    v2 = CFSTR("kCTTimeUpdateNotification");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", CFSTR("Valid"), v2);
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "logTelephonyRegMsgWith:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

@end
