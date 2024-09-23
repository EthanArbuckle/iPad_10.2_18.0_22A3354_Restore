@implementation PCSIdentitySetCopyPublishableIdentities

void __PCSIdentitySetCopyPublishableIdentities_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  uint32_t v6;
  uint64_t v7;
  int *v8;
  int v9;
  const void *NameByIndex;
  uint64_t v11;
  const void *v12;
  const void *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  if (!_PCSIdentityValidate(a2, &v15, 0) && v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 138412290;
    v17 = a2;
    v4 = MEMORY[0x1E0C81028];
    v5 = "PCSIdentitySetCopyPublishableIdentities found unpublishable identity: %@";
    v6 = 12;
LABEL_17:
    _os_log_impl(&dword_1A9508000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
    return;
  }
  v7 = *(_QWORD *)(a2 + 16);
  if (v7 && (v8 = *(int **)(v7 + 16)) != 0)
    v9 = *v8;
  else
    v9 = 0;
  NameByIndex = (const void *)PCSServiceItemGetNameByIndex(v9);
  if (!NameByIndex || !CFEqual(*(CFTypeRef *)(a1 + 32), NameByIndex))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = NameByIndex;
    v4 = MEMORY[0x1E0C81028];
    v5 = "PCSIdentitySetCopyPublishableIdentities found invalid match: expected %@ found %@";
    v6 = 22;
    goto LABEL_17;
  }
  v11 = *(_QWORD *)(a2 + 16);
  if (v11 && *(_QWORD *)(v11 + 16))
  {
    v12 = (const void *)PCSCreateExportedPublicKeyInfo();
    if (v12)
    {
      v13 = v12;
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v12);
      CFRelease(v13);
    }
  }
}

@end
