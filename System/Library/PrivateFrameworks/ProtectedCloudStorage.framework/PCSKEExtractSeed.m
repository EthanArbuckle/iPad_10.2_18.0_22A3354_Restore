@implementation PCSKEExtractSeed

void ___PCSKEExtractSeed_block_invoke(uint64_t a1, CFDataRef theData, const __CFData *a3)
{
  unint64_t Length;
  void *v7;
  unint64_t v8;
  const UInt8 *BytePtr;
  id v10;
  const void *v11;
  void *v12;
  const void **v13;
  const void *v14;
  const __CFData *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    Length = CFDataGetLength(theData);
    objc_msgSend(*(id *)(a1 + 32), "masterKeyId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (Length >= v8)
    {
      BytePtr = CFDataGetBytePtr(theData);
      objc_msgSend(*(id *)(a1 + 32), "masterKeyId");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (const void *)objc_msgSend(v10, "bytes");
      objc_msgSend(*(id *)(a1 + 32), "masterKeyId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(BytePtr) = memcmp(BytePtr, v11, objc_msgSend(v12, "length"));

      if (!(_DWORD)BytePtr)
      {
        v13 = *(const void ***)(a1 + 48);
        v14 = *v13;
        if (*v13)
        {
          *v13 = 0;
          CFRelease(v14);
        }
        v15 = *(const __CFData **)(a1 + 56);
        v16 = objc_msgSend(*(id *)(a1 + 32), "version");
        if ((_DWORD)v16)
        {
          if ((_DWORD)v16 == 1)
          {
            v17 = CFSTR("HKDF_SIV_GCM_HMAC_256");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v17 = CFSTR("UNKNOWN");
        }
        v18 = v17;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _PCSKEExtractSeedWithMasterKey(a3, v15, v17, *(const __CFData **)(*(_QWORD *)(a1 + 64) + 24), *(const void ***)(a1 + 48));

      }
    }
  }
}

@end
