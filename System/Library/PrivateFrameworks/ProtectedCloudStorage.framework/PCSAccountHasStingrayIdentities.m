@implementation PCSAccountHasStingrayIdentities

intptr_t ____PCSAccountHasStingrayIdentities_block_invoke(uint64_t a1, CFDictionaryRef theDict, uint64_t a3)
{
  const __CFBoolean *Value;
  const __CFBoolean *v6;
  CFTypeID v7;
  BOOL v8;
  CFTypeID v9;
  char v10;
  int valuePtr;

  if (a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  if (theDict)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, kPCSSecureBackupCFContainsiCloudIdentityKey[0]);
    if (Value)
    {
      v6 = Value;
      v7 = CFGetTypeID(Value);
      if (v7 == CFBooleanGetTypeID())
      {
        v8 = CFBooleanGetValue(v6) == 0;
      }
      else
      {
        v9 = CFGetTypeID(v6);
        if (v9 != CFNumberGetTypeID())
          return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
        valuePtr = 0;
        if (!CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr))
          return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
        v8 = valuePtr == 0;
      }
      v10 = !v8;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
