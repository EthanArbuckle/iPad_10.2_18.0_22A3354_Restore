@implementation CreateLightObject

void __CreateLightObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  CFIndex Length;
  rsize_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  int v16;
  CFIndex v17;
  void *v18;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  const void *v24;
  _QWORD *v25;
  const void *v26;
  const void *v27;
  const void *PublicID;
  _BYTE v29[16];
  _QWORD v30[5];
  _BYTE *v31;
  CFDataRef v32;
  size_t v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 72))
  {
    MEMORY[0x1AF415034]();
    v5 = ccsha256_di();
    ccaes_ecb_decrypt_mode();
    v6 = (unint64_t)(cczp_bitlen() + 7) >> 3;
    if (CFDataGetLength(*(CFDataRef *)(a1 + 40)) >= v6 + 3)
    {
      Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
      v8 = Length - (v6 + 3);
      if (v8 <= 0x28 && (v8 & 7) == 0)
      {
        v30[2] = v5;
        v30[4] = v30;
        v10 = MEMORY[0x1E0C80A78](Length);
        v30[3] = v29;
        v11 = MEMORY[0x1E0C80A78](v10);
        v31 = &v29[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
        MEMORY[0x1E0C80A78](v11);
        v12 = ccecb_context_size();
        MEMORY[0x1E0C80A78](v12);
        v30[1] = &v29[-v13];
        v14 = cczp_bitlen();
        MEMORY[0x1E0C80A78](v14);
        v34 = (unint64_t)(cczp_bitlen() + 7) >> 3;
        if (PCSIdentityGetPrivateKey(a3))
        {
          if (!ccec_compact_import_pub())
          {
            ccDRBGGetRngState();
            if (!ccecdh_compute_shared_secret())
            {
              v32 = PCSIdentityCopyExportedPublicKey(a3);
              if (CFDataGetLength(v32) == v6)
              {
                v15 = v32;
                CFDataGetLength(v32);
                CFDataGetBytePtr(v15);
                if (!cchkdf())
                {
                  ccecb_init();
                  v33 = 32;
                  v16 = ccwrap_auth_decrypt();
                  ccecb_context_size();
                  cc_clear();
                  if (!v16)
                  {
                    v17 = v33;
                    v18 = v31;
                    if (v33 == 32 || v33 == 16)
                    {
                      Mutable = CFDataCreateMutable(0, 0);
                      CFDataSetLength(Mutable, v17);
                      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 72) = Mutable;
                      MutableBytePtr = CFDataGetMutableBytePtr(*(CFMutableDataRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                               + 24)
                                                                                   + 72));
                      memcpy(MutableBytePtr, v18, v33);
                      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80) = CreateKeyIDFromKey(*(const __CFData **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 72));
                      v21 = *(_QWORD *)(a1 + 48);
                      if (*(unsigned __int16 *)(v21 + v6 + 1 + v8) != *(unsigned __int16 *)CFDataGetBytePtr(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80)))
                      {
                        v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
                        v23 = *(const void **)(v22 + 72);
                        if (v23)
                        {
                          *(_QWORD *)(v22 + 72) = 0;
                          CFRelease(v23);
                          v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
                        }
                        v24 = *(const void **)(v22 + 80);
                        if (v24)
                        {
                          *(_QWORD *)(v22 + 80) = 0;
                          CFRelease(v24);
                        }
                        goto LABEL_26;
                      }
                      v25 = PCSIdentityCopyPublicIdentity(a3);
                      if (v25)
                      {
                        v26 = v25;
                        v27 = (const void *)ShareEntryCreate(v25, 0);
                        PublicID = (const void *)PCSPublicIdentityGetPublicID((uint64_t)v26);
                        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 40), PublicID, v27);
                        if (v27)
                          CFRelease(v27);
                        CFRelease(v26);
                      }
                    }
                    memset_s(v18, v8, 0, v8);
                  }
                }
              }
LABEL_26:
              if (v32)
                CFRelease(v32);
            }
          }
        }
      }
    }
  }
}

@end
