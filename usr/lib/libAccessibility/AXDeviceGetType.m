@implementation AXDeviceGetType

uint64_t __AXDeviceGetType_block_invoke()
{
  uint64_t (*v0)(const __CFString *, uint64_t);
  uint64_t result;
  int v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (uint64_t (*)(const __CFString *, uint64_t))getMGGetSInt32AnswerSymbolLoc_ptr;
  v7 = getMGGetSInt32AnswerSymbolLoc_ptr;
  if (!getMGGetSInt32AnswerSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMGGetSInt32AnswerSymbolLoc_block_invoke;
    v3[3] = &unk_1E2939F70;
    v3[4] = &v4;
    __getMGGetSInt32AnswerSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (uint64_t (*)(const __CFString *, uint64_t))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    __AXDeviceGetType_block_invoke_cold_1();
  result = v0(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL);
  v2 = result - 1;
  if ((result - 1) <= 0xA && ((0x46Fu >> v2) & 1) != 0)
    AXDeviceGetType__AXDeviceType = qword_18F1CEEA0[v2];
  return result;
}

void __AXDeviceGetType_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MGDeviceClass soft_MGGetSInt32Answer(CFStringRef, SInt32)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SoftGestalt.h"), 12, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
