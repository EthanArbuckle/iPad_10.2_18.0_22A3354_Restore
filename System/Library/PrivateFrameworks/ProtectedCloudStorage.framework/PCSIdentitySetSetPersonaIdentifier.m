@implementation PCSIdentitySetSetPersonaIdentifier

void ___PCSIdentitySetSetPersonaIdentifier_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(_QWORD *)(a1 + 40);
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Identity set persona changed: %@ to %@", (uint8_t *)&v7, 0x16u);
    }
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(const void **)(v4 + 80);
    if (v5)
    {
      *(_QWORD *)(v4 + 80) = 0;
      CFRelease(v5);
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    CFRetain(*(CFTypeRef *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = v6;
}

@end
