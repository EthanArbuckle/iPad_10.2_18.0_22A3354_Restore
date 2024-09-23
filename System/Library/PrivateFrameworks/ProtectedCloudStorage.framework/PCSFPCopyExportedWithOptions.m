@implementation PCSFPCopyExportedWithOptions

void ___PCSFPCopyExportedWithOptions_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  const void *PublicID;
  __CFData *Value;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFData *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  char v50;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_DWORD *)(a3 + 24);
  v7 = (v6 & 1) == 0 && *(_DWORD *)(v5 + 204) == 3;
  v8 = 72;
  if (v7)
    v8 = 64;
  if ((v6 & 4) != 0 && *(_QWORD *)(v5 + 56))
  {
    PublicID = (const void *)PCSPublicIdentityGetPublicID(*(_QWORD *)(a3 + 16));
    Value = (__CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 48) + 56), PublicID);
    if (!Value)
      PCSAbort("Failed to get anonymous wrapped key:wrappedKey != NULL", v11, v12, v13, v14, v15, v16, v17, v50);
    v18 = Value;
    CFRetain(Value);
  }
  else
  {
    v18 = PCSPublicServiceIdentityCopyWrappedKey(*(_QWORD *)(a3 + 16), *(const __CFData **)(v5 + v8), *(const void ***)(a1 + 56));
    if (!v18)
    {
      v49 = *(_QWORD **)(a1 + 56);
      if (v49)
        v49 = (_QWORD *)*v49;
      PCSAbortCF(CFSTR("Failed to get wrapped key: %@"), v49);
    }
  }
  if ((*(_BYTE *)(a3 + 24) & 4) != 0)
  {
    if ((_PCSExportRandomPCSSPKey(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48)+ 56 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) & 1) == 0)PCSAbort("failed to randomly fill PCSSPKey:_PCSExportRandomPCSSPKey(&share.tbs.shareList.val[n].key)", v32, v33, v34, v35, v36, v37, v38, v50);
  }
  else if ((_PCSPublicIdentityExportPCSSPKey(*(_QWORD *)(a3 + 16), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48)+ 56 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v19, v20, v21, v22, v23, v24) & 1) == 0)
  {
    PCSAbort("failed to fill PCSSPKey:_PCSPublicIdentityExportPCSSPKey(se->identity, &share.tbs.shareList.val[n].key)", v25, v26, v27, v28, v29, v30, v31, v50);
  }
  if (*(_DWORD *)(a3 + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48)
              + 56 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
              + 48) = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
    v39 = *(_DWORD **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48)
                     + 56 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
                     + 48);
    if (!v39)
      PCSAbortCF(CFSTR("Failed allocate flags"));
    *v39 = *(_DWORD *)(a3 + 24);
  }
  if (!FillOctetString((CFIndex *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48)+ 56 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)+ 32), v18))PCSAbort("failed to allocate wrappedMaster:FillOctetString(&share.tbs.shareList.val[n].wrappedMaster, wrappedKey)", v40, v41, v42, v43, v44, v45, v46, v50);
  CFRelease(v18);
  v47 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v48 = *(unsigned int *)(v47 + 24);
  if (*(_QWORD *)(a1 + 64) <= v48)
    ___PCSFPCopyExportedWithOptions_block_invoke_cold_1();
  *(_DWORD *)(v47 + 24) = v48 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
}

void ___PCSFPCopyExportedWithOptions_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFData *v7;
  __CFData *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = a1[6];
  v6 = *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24);
  v7 = PCSIdentityCopyExternalForm(a2, 0, 0);
  FillOctetString((CFIndex *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 32 * v6 + 16), v7);
  CFRelease(v7);
  *(_DWORD *)(*(_QWORD *)(v5 + 8) + 32 * v6) = 3;
  v8 = PCSIdentityCopyExportedPublicKey(a2);
  FillOctetString((CFIndex *)(*(_QWORD *)(v5 + 8) + 32 * v6 + 16), v8);
  CFRelease(v8);
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(unsigned int *)(v9 + 24);
  if (a1[7] <= v10)
    ___PCSFPCopyExportedWithOptions_block_invoke_2_cold_1();
  *(_DWORD *)(v9 + 24) = v10 + 1;
  **(_DWORD **)(*(_QWORD *)(a1[4] + 8) + 48) = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  *(_DWORD *)a1[6] = *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
}

BOOL ___PCSFPCopyExportedWithOptions_block_invoke_3(uint64_t a1, int a2, CFDataRef theData)
{
  _BOOL8 result;

  result = FillOctetString((CFIndex *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) + 8)+ 16 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)), theData);
  **(_DWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);
  return result;
}

void ___PCSFPCopyExportedWithOptions_block_invoke_cold_1()
{
  __assert_rtn("_PCSFPCopyExportedWithOptions_block_invoke", "PCSShareProtection.m", 1690, "n < count");
}

void ___PCSFPCopyExportedWithOptions_block_invoke_2_cold_1()
{
  __assert_rtn("_PCSFPCopyExportedWithOptions_block_invoke_2", "PCSShareProtection.m", 1727, "n < count");
}

@end
