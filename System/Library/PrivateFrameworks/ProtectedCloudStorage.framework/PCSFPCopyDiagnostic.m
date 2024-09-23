@implementation PCSFPCopyDiagnostic

void __PCSFPCopyDiagnostic_block_invoke(uint64_t a1, uint64_t a2)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, CFSTR("PCS keys %d: %@\n"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __PCSFPCopyDiagnostic_block_invoke_2(uint64_t a1, const void *a2, uint64_t a3)
{
  const __CFData *v6;
  const __CFDictionary *v7;

  v6 = PCSPublicIdentityCopyWebSafePublicKeyID(*(_QWORD *)(a3 + 16));
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, CFSTR("Share peer %d: %@ (%@) flags: %d\n"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2, v6, *(unsigned int *)(a3 + 24));
  if (v6)
    CFRelease(v6);
  v7 = (const __CFDictionary *)PCSGetPublicIdentitites();
  if (CFDictionaryGetValue(v7, a2))
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, CFSTR("\tis CloudKit Public Identity\n"));
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __PCSFPCopyDiagnostic_block_invoke_3(uint64_t a1, const __CFData *a2, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v8;
  char *v9;
  CFIndex v10;
  CFStringRef v11;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v8 = _PCSCreateBase64((uint64_t)BytePtr, Length, 0);
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, CFSTR("old master key %d: %@\n"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v8);
  if (v8)
    CFRelease(v8);
  v9 = (char *)CFDataGetBytePtr(a2);
  v10 = CFDataGetLength(a2);
  v11 = _PCSCreateHexString(v9, v10);
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0, CFSTR("old master key ID %d: %@\n"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v11);
  if (v11)
    CFRelease(v11);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __PCSFPCopyDiagnostic_block_invoke_4(uint64_t a1, uint64_t a2)
{
  const __CFData *v4;
  _BOOL4 IsDiversified;
  __CFString *v6;
  uint64_t v7;
  uint64_t PublicID;
  const char *v9;

  v4 = PCSPublicIdentityCopyWebSafePublicKeyID(a2);
  IsDiversified = _PCSPublicIdentityIsDiversified(a2);
  v6 = *(__CFString **)(a1 + 40);
  v7 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  PublicID = PCSPublicIdentityGetPublicID(a2);
  v9 = "";
  if (IsDiversified)
    v9 = " div";
  CFStringAppendFormat(v6, 0, CFSTR("public identity %d: %@ (%@)%s\n"), v7, PublicID, v4, v9);
  if (v4)
    CFRelease(v4);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

@end
