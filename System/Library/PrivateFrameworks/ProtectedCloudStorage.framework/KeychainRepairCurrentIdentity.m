@implementation KeychainRepairCurrentIdentity

void __KeychainRepairCurrentIdentity_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef v8;
  CFTypeRef cf;
  CFIndex v10;
  uint8_t buf[4];
  CFTypeRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  KeychainCopyXIdentityWithCount(*(_QWORD *)(a1 + 40), *(const __CFNumber **)(a1 + 48), &v10, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  cf = 0;
  if (v10 <= 1 && (!v2 || CFEqual((CFTypeRef)objc_msgSend(v2, "identity"), *(CFTypeRef *)(a1 + 56))))
  {
LABEL_9:
    v6 = 1;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "current pointer/bit mismatch detected", buf, 2u);
  }
  v4 = KeychainSetCurrentIdentity(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), (CFErrorRef *)&cf);
  v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "successfully set current identity", buf, 2u);
    }
    goto LABEL_9;
  }
  if (v5)
  {
    *(_DWORD *)buf = 138412290;
    v12 = cf;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to set current identity: %@", buf, 0xCu);
  }
  v6 = 0;
LABEL_13:
  v7 = *(_QWORD *)(a1 + 32);
  v8 = cf;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, CFTypeRef))(v7 + 16))(v7, v6, cf);
    v8 = cf;
  }
  if (v8)
  {
    cf = 0;
    CFRelease(v8);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));

}

@end
