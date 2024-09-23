@implementation TPSHeySiriEnabledValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[TPSHeySiriEnabledValidation getCurrentState](self, "getCurrentState");
  v6 = v5 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v6, v7);

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  uint64_t (*v2)(void);
  CFPropertyListRef v3;
  BOOL v4;
  _Unwind_Exception *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFAssistantRestrictedSymbolLoc_ptr;
  v11 = getAFAssistantRestrictedSymbolLoc_ptr;
  if (!getAFAssistantRestrictedSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getAFAssistantRestrictedSymbolLoc_block_invoke;
    v7[3] = &unk_1EA1DF510;
    v7[4] = &v8;
    __getAFAssistantRestrictedSymbolLoc_block_invoke((uint64_t)v7);
    v2 = (uint64_t (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    v6 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  if ((v2() & 1) != 0)
    return 0;
  v3 = CFPreferencesCopyAppValue(CFSTR("VoiceTrigger Enabled"), CFSTR("com.apple.voicetrigger"));
  if (!v3)
    return 0;
  v4 = v3 == (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
  CFRelease(v3);
  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSHeySiriEnabledValidation getCurrentState](self, "getCurrentState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v6, v7, 0);

}

- (uint64_t)getCurrentState
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[TPSMedicalIDEnabledValidation validateWithCompletion:].cold.1(v0);
}

@end
