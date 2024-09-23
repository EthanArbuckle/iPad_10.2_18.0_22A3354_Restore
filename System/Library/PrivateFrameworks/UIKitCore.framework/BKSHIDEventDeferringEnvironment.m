@implementation BKSHIDEventDeferringEnvironment

void __97__BKSHIDEventDeferringEnvironment_UIKitAdditions_Internal__ui_systemKeyCommandOverlayEnvironment__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)qword_1ECD7DB68;
  v8 = qword_1ECD7DB68;
  if (!qword_1ECD7DB68)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getSBSKeyboardFocusServiceClass_block_invoke;
    v4[3] = &unk_1E16B14C0;
    v4[4] = &v5;
    __getSBSKeyboardFocusServiceClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "systemKeyCommandOverlayEnvironment");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7DB58;
  qword_1ECD7DB58 = v2;

}

void __84__BKSHIDEventDeferringEnvironment_UIKitAdditions__ui_cameraCaptureButtonEnvironment__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D00CA8], "environmentWithIdentifier:", CFSTR("cameraCaptureButton"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1042;
  _MergedGlobals_1042 = v0;

}

@end
