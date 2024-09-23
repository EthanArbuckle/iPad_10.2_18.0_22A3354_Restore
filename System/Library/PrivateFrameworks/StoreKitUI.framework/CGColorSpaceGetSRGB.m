@implementation CGColorSpaceGetSRGB

void __CGColorSpaceGetSRGB_block_invoke()
{
  unsigned __int8 v0;
  uint64_t *v1;
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;

  v1 = &defaultCenter_sOnce;
  if ((v0 & 1) == 0)
    goto LABEL_21;
  while (1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v2 = (uint64_t *)v1[247];
    v16 = v2;
    if (!v2)
    {
      v3 = (void *)ColorSyncLibrary();
      v2 = (uint64_t *)dlsym(v3, "kColorSyncSRGBProfile");
      v14[3] = (uint64_t)v2;
      v1[247] = (uint64_t)v2;
    }
    _Block_object_dispose(&v13, 8);
    if (!v2)
    {
      getCNComposeRecipientViewDidChangeNotification_cold_1();
LABEL_19:
      getCNComposeRecipientViewDidChangeNotification_cold_1();
      goto LABEL_20;
    }
    v4 = *v2;
    if ((v5 & 1) == 0
    {
      getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = 0;
    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v1 = (uint64_t *)getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
    v16 = (uint64_t *)getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
    if (!getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr)
    {
      v6 = (void *)ColorSyncLibrary();
      v1 = (uint64_t *)dlsym(v6, "ColorSyncProfileCreateWithName");
      v14[3] = (uint64_t)v1;
      getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = v1;
    }
    _Block_object_dispose(&v13, 8);
    if (!v1)
      goto LABEL_19;
    v7 = ((uint64_t (*)(uint64_t))v1)(v4);
    if (!v7)
      return;
    v8 = (const void *)v7;
    {
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = 0;
    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v1 = (uint64_t *)getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    v16 = (uint64_t *)getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    if (!getColorSyncProfileCopyDataSymbolLoc(void)::ptr)
    {
      v10 = (void *)ColorSyncLibrary();
      v1 = (uint64_t *)dlsym(v10, "ColorSyncProfileCopyData");
      v14[3] = (uint64_t)v1;
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = v1;
    }
    _Block_object_dispose(&v13, 8);
    if (v1)
      break;
LABEL_20:
    getCNComposeRecipientViewDidChangeNotification_cold_1();
LABEL_21:
    {
      v1[247] = 0;
    }
  }
  v11 = ((uint64_t (*)(const void *, _QWORD))v1)(v8, 0);
  if (v11)
  {
    v12 = (const void *)v11;
    CGColorSpaceGetSRGB::sSpace = MEMORY[0x1BCCE6244](v11);
    CFRelease(v12);
  }
  CFRelease(v8);
}

@end
