@implementation _PSFTZKWConfig

+ (BOOL)onNonUIBuild
{
  uint64_t (*v2)(const __CFString *, _QWORD);
  const void *v3;
  const void *v4;
  BOOL v5;
  _Unwind_Exception *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v2 = (uint64_t (*)(const __CFString *, _QWORD))getMGCopyAnswerSymbolLoc_ptr;
  v12 = getMGCopyAnswerSymbolLoc_ptr;
  if (!getMGCopyAnswerSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getMGCopyAnswerSymbolLoc_block_invoke;
    v8[3] = &unk_1E43FEA00;
    v8[4] = &v9;
    __getMGCopyAnswerSymbolLoc_block_invoke((uint64_t)v8);
    v2 = (uint64_t (*)(const __CFString *, _QWORD))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    v7 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  v3 = (const void *)v2(CFSTR("ReleaseType"), 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFEqual(v3, CFSTR("NonUI")) != 0;
  CFRelease(v4);
  return v5;
}

- (_PSFTZKWConfig)init
{
  _PSFTZKWConfig *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22___PSFTZKWConfig_init__block_invoke;
  v5[3] = &unk_1E4401340;
  v5[4] = &v6;
  +[_PSFTZKWTrialWrapper runWithData:](_PSFTZKWTrialWrapper, "runWithData:", v5);
  v3 = -[_PSFTZKWConfig initWithTrialData:](self, "initWithTrialData:", v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (_PSFTZKWConfig)initWithTrialData:(id)a3
{
  id v4;
  _PSFTZKWConfig *v5;
  _PSZKWFTCalendarEventConfig *v6;
  _PSZKWFTCalendarEventConfig *calendarEventConfig;
  _PSZKWFTUnstructuredCalendarConfig *v8;
  _PSZKWFTUnstructuredCalendarConfig *unstructuredCalendarConfig;
  _PSZKWFTUnstructuredRemindersConfig *v10;
  _PSZKWFTUnstructuredRemindersConfig *unstructuredRemindersConfig;
  _PSZKWFTPrimaryInteractionsConfig *v12;
  _PSZKWFTPrimaryInteractionsConfig *faceTimeInteractionsConfig;
  _PSZKWFTFallbackInteractionsConfig *v14;
  _PSZKWFTFallbackInteractionsConfig *fallbackInteractionsConfig;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PSFTZKWConfig;
  v5 = -[_PSFTZKWConfig init](&v17, sel_init);
  if (v5)
  {
    v5->_useBlendingLayer = +[_PSFTZKWConfig useBlendingLayer](_PSFTZKWConfig, "useBlendingLayer");
    v6 = -[_PSZKWFTCalendarEventConfig initWithIsEnabled:defaultConfidenceCategory:]([_PSZKWFTCalendarEventConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:", objc_msgSend(v4, "structuredCalendarIsEnabled"), objc_msgSend(v4, "structuredCalendarDefaultConfidenceCategory"));
    calendarEventConfig = v5->_calendarEventConfig;
    v5->_calendarEventConfig = v6;

    v8 = -[_PSZKWFTUnstructuredCalendarConfig initWithIsEnabled:defaultConfidenceCategory:]([_PSZKWFTUnstructuredCalendarConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:", objc_msgSend(v4, "unstructuredCalendarIsEnabled"), objc_msgSend(v4, "unstructuredRemindersIsEnabled"));
    unstructuredCalendarConfig = v5->_unstructuredCalendarConfig;
    v5->_unstructuredCalendarConfig = v8;

    v10 = -[_PSZKWFTUnstructuredRemindersConfig initWithIsEnabled:defaultConfidenceCategory:]([_PSZKWFTUnstructuredRemindersConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:", objc_msgSend(v4, "unstructuredRemindersIsEnabled"), objc_msgSend(v4, "unstructuredRemindersDefaultConfidenceCategory"));
    unstructuredRemindersConfig = v5->_unstructuredRemindersConfig;
    v5->_unstructuredRemindersConfig = v10;

    v12 = -[_PSZKWFTPrimaryInteractionsConfig initWithIsEnabled:defaultConfidenceCategory:modelType:]([_PSZKWFTPrimaryInteractionsConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:modelType:", objc_msgSend(v4, "primaryInteractionsIsEnabled"), objc_msgSend(v4, "primaryInteractionsDefaultConfidenceCategory"), objc_msgSend(v4, "primaryInteractionsModelType"));
    faceTimeInteractionsConfig = v5->_faceTimeInteractionsConfig;
    v5->_faceTimeInteractionsConfig = v12;

    v14 = -[_PSZKWFTFallbackInteractionsConfig initWithIsEnabled:defaultConfidenceCategory:modelType:]([_PSZKWFTFallbackInteractionsConfig alloc], "initWithIsEnabled:defaultConfidenceCategory:modelType:", objc_msgSend(v4, "fallbackInteractionsIsEnabled"), objc_msgSend(v4, "fallbackInteractionsDefaultConfidenceCategory"), objc_msgSend(v4, "fallbackInteractionsModelType"));
    fallbackInteractionsConfig = v5->_fallbackInteractionsConfig;
    v5->_fallbackInteractionsConfig = v14;

  }
  return v5;
}

+ (BOOL)useBlendingLayer
{
  if ((objc_msgSend((id)objc_opt_class(), "onNonUIBuild") & 1) != 0)
    return 0;
  else
    return _os_feature_enabled_impl();
}

- (BOOL)useBlendingLayer
{
  return self->_useBlendingLayer;
}

- (void)setUseBlendingLayer:(BOOL)a3
{
  self->_useBlendingLayer = a3;
}

- (_PSZKWFTCalendarEventConfig)calendarEventConfig
{
  return self->_calendarEventConfig;
}

- (_PSZKWFTUnstructuredCalendarConfig)unstructuredCalendarConfig
{
  return self->_unstructuredCalendarConfig;
}

- (_PSZKWFTUnstructuredRemindersConfig)unstructuredRemindersConfig
{
  return self->_unstructuredRemindersConfig;
}

- (_PSZKWFTPrimaryInteractionsConfig)faceTimeInteractionsConfig
{
  return self->_faceTimeInteractionsConfig;
}

- (_PSZKWFTFallbackInteractionsConfig)fallbackInteractionsConfig
{
  return self->_fallbackInteractionsConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackInteractionsConfig, 0);
  objc_storeStrong((id *)&self->_faceTimeInteractionsConfig, 0);
  objc_storeStrong((id *)&self->_unstructuredRemindersConfig, 0);
  objc_storeStrong((id *)&self->_unstructuredCalendarConfig, 0);
  objc_storeStrong((id *)&self->_calendarEventConfig, 0);
}

@end
