@implementation CreateWithExportedInternal

void __CreateWithExportedInternal_block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  const __CFData *v5;
  CFDataRef v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v5 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _PCSIdentityCopyUnwappedKey((uint64_t)a3, v5, 0);
    if (v5)
      CFRelease(v5);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(a3);
      if ((*(_BYTE *)(a1 + 72) & 4) != 0)
      {
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 56) + 56))
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 56) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v6 = CFDataCreate(0, *(const UInt8 **)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 56) + 56), *(const void **)(a1 + 64), v6);
        CFRelease(v6);
      }
    }
  }
}

@end
