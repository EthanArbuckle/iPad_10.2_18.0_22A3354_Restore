@implementation SRDRequestDispatcherInternal

- (SRDRequestDispatcherInternal)initWithRequestDispatcherServiceHelper:(id)a3 bridgeConnectionListeners:(id)a4
{
  SRDRequestDispatcherInternal *result;

  sub_1C2F9BD28(0, &qword_1ED7AF508);
  sub_1C2FC9ABC();
  swift_unknownObjectRetain();
  RequestDispatcher.init(requestDispatcherServiceHelper:bridgeConnectionListeners:)();
  return result;
}

- (id)domains
{
  SRDRequestDispatcherInternal *v2;
  void *v3;

  v2 = self;
  sub_1C2FAB594();

  v3 = (void *)sub_1C2FC9AB0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)commandsForDomain:(id)a3
{
  SRDRequestDispatcherInternal *v4;
  void *v5;

  sub_1C2FC99F0();
  v4 = self;
  sub_1C2FAB8A8();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1C2FC9AB0();
  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  SRDRequestDispatcherInternal *v5;
  char v6;
  char v7;

  sub_1C2FC99F0();
  sub_1C2FC99F0();
  v5 = self;
  sub_1C2FABBF0();
  v7 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)handleCommand:(id)a3 executionContextInfo:(id)a4 reply:(id)a5
{
  void *v8;
  id v9;
  id v10;
  SRDRequestDispatcherInternal *v11;

  v8 = _Block_copy(a5);
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = sub_1C2FBFE90;
  }
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1C2FABFA0();
  sub_1C2FBFE5C((uint64_t)v8);

}

- (void)cancelRequestWithAssistantId:(id)a3 requestId:(id)a4 reason:(int64_t)a5
{
  SRDRequestDispatcherInternal *v6;

  sub_1C2FC99F0();
  sub_1C2FC99F0();
  v6 = self;
  sub_1C2FAC6C0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4
{
  sub_1C2FBB09C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1C2FACDA8);
}

- (void)startSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  SRDRequestDispatcherInternal *v21;
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

  HIDWORD(v24) = a7;
  v23 = sub_1C2FC99F0();
  v12 = v11;
  v13 = sub_1C2FC99F0();
  v15 = v14;
  v16 = sub_1C2FC99F0();
  v18 = v17;
  v19 = a6;
  v20 = a8;
  v21 = self;
  sub_1C2FAD4C8(v23, v12, v13, v15, v16, v18, (uint64_t)a6, HIDWORD(v24), (uint64_t)v20, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
    v32,
    v33);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)sessionExistsForAssistantId:(id)a3
{
  SRDRequestDispatcherInternal *v4;
  char v5;
  char v6;

  sub_1C2FC99F0();
  v4 = self;
  sub_1C2FAE920();
  v6 = v5;

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6
{
  SRDRequestDispatcherInternal *v8;

  sub_1C2FC99F0();
  sub_1C2FC99F0();
  if (a6)
    sub_1C2FC99F0();
  v8 = self;
  sub_1C2FAEC8C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startSessionWithConfiguration:(id)a3
{
  id v4;
  SRDRequestDispatcherInternal *v5;

  v4 = a3;
  v5 = self;
  sub_1C2FAF2C0();

}

- (void)endSessionWithAssistantId:(id)a3 withDelay:(BOOL)a4
{
  SRDRequestDispatcherInternal *v5;

  sub_1C2FC99F0();
  v5 = self;
  sub_1C2FAFE08();

  swift_bridgeObjectRelease();
}

- (void)startLocalRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6
{
  sub_1C2FBA418();
}

- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  SRDRequestDispatcherInternal *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  HIDWORD(v29) = a5;
  v12 = a9;
  v28 = sub_1C2FC99F0();
  v14 = v13;
  v26 = sub_1C2FC99F0();
  v16 = v15;
  v25 = sub_1C2FC99F0();
  v18 = v17;
  if (a8)
    a8 = (id)sub_1C2FC9ABC();
  if (a9)
  {
    v19 = sub_1C2FC99F0();
    v12 = v20;
  }
  else
  {
    v19 = 0;
  }
  v21 = a7;
  v22 = a10;
  v23 = self;
  sub_1C2FB1998(v28, v14, v26, v16, HIDWORD(v29), v25, v18, (uint64_t)a7, (uint64_t)a8, v19, (uint64_t)v12, (uint64_t)v22, v24, v25, v26, (uint64_t)self, v28, v29, v30,
    v31,
    v32,
    v33,
    v34);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6
{
  sub_1C2FBA418();
}

- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5
{
  sub_1C2FB39FC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t))sub_1C2FB2FF4);
}

- (void)startUnderstandingOnServerRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5
{
  sub_1C2FB39FC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t))sub_1C2FB36C8);
}

- (void)startUnderstandingOnServerTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  sub_1C2FB6330(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))sub_1C2FB4520);
}

- (void)startTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  sub_1C2FB6330(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))sub_1C2FB5FC8);
}

- (void)startDirectActionRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 directAction:(id)a6 requestExecutionParameters:(id)a7 requestContextData:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  SRDRequestDispatcherInternal *v23;
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

  v25 = sub_1C2FC99F0();
  v12 = v11;
  v13 = sub_1C2FC99F0();
  v15 = v14;
  v16 = sub_1C2FC99F0();
  v18 = v17;
  if (!a6)
  {
    v19 = 0;
    if (a7)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  v19 = sub_1C2FC99F0();
  a6 = v20;
  if (!a7)
    goto LABEL_5;
LABEL_3:
  v21 = sub_1C2FC999C();
LABEL_6:
  v22 = a8;
  v23 = self;
  sub_1C2FB6E2C(v25, v12, v13, v15, v16, v18, v19, (uint64_t)a6, v21, (uint64_t)v22, (uint64_t)self, v25, v26, v27, v28, v29, v30, v31, v32,
    v33,
    v34,
    v35);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startCorrectionSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  SRDRequestDispatcherInternal *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  v26 = sub_1C2FC99F0();
  v11 = v10;
  v24 = sub_1C2FC99F0();
  v13 = v12;
  v14 = sub_1C2FC99F0();
  v16 = v15;
  v17 = sub_1C2FC99F0();
  v19 = v18;
  if (a7)
  {
    v20 = sub_1C2FC99F0();
    a7 = v21;
  }
  else
  {
    v20 = 0;
  }
  v22 = a8;
  v23 = self;
  sub_1C2FB79D0(v26, v11, v24, v13, v14, v16, v17, v19, v20, (uint64_t)a7, (uint64_t)v22, v24, (uint64_t)self, v26, v27, v28, v29, v30, v31,
    v32,
    v33,
    v34);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startSpeechDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5
{
  sub_1C2FB9D38(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(uint64_t))sub_1C2FB8D50);
}

- (void)startUnderstandingDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 understandingOnDevice:(BOOL)a5
{
  sub_1C2FB9D38(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(uint64_t))sub_1C2FB9B10);
}

- (void)startUnderstandingDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6
{
  sub_1C2FBA418();
}

- (void)endDictationSessionWithAssistantId:(id)a3
{
  SRDRequestDispatcherInternal *v4;

  sub_1C2FC99F0();
  v4 = self;
  sub_1C2FBAB50();

  swift_bridgeObjectRelease();
}

- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4
{
  sub_1C2FBB09C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1C2FBAE88);
}

- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SRDRequestDispatcherInternal *v22;
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

  v24 = sub_1C2FC99F0();
  v9 = v8;
  v10 = sub_1C2FC99F0();
  v12 = v11;
  v13 = sub_1C2FC99F0();
  v15 = v14;
  v16 = sub_1C2FC99F0();
  v18 = v17;
  v19 = sub_1C2FC99F0();
  v21 = v20;
  v22 = self;
  sub_1C2FBB574(v24, v9, v10, v12, v13, v15, v16, v18, v19, v21, v23, v24, v25, v26, v27, v28, v29, v30, v31,
    v32,
    v33,
    v34);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SRDRequestDispatcherInternal *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  *((_QWORD *)&v32 + 1) = a8;
  *(_QWORD *)&v32 = sub_1C2FC99F0();
  *(_QWORD *)&v34 = v16;
  v31 = sub_1C2FC99F0();
  *((_QWORD *)&v33 + 1) = v17;
  if (a5)
  {
    v30 = sub_1C2FC99F0();
    *(_QWORD *)&v33 = v18;
    if (a6)
      goto LABEL_3;
LABEL_6:
    v29 = 0;
    v20 = 0;
    if (a7)
      goto LABEL_4;
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  v30 = 0;
  *(_QWORD *)&v33 = 0;
  if (!a6)
    goto LABEL_6;
LABEL_3:
  v29 = sub_1C2FC99F0();
  v20 = v19;
  if (!a7)
    goto LABEL_7;
LABEL_4:
  v21 = sub_1C2FC99F0();
  a7 = v22;
LABEL_8:
  v23 = self;
  v24 = a12;
  v25 = a11;
  v26 = a10;
  v27 = a9;
  v28 = *((id *)&v32 + 1);
  sub_1C2FBBE14(v32, v34, v31, *((uint64_t *)&v33 + 1), v30, v33, v29, v20, v21, (uint64_t)a7, (uint64_t)v28, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)a7, v29, v30, (uint64_t)a9,
    v31,
    v32,
    v33,
    v34,
    v35);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4
{
  SRDRequestDispatcherInternal *v5;

  sub_1C2FC99F0();
  v5 = self;
  sub_1C2FBC874();

  swift_bridgeObjectRelease();
}

- (void)sendMultiUserInfoWithDeviceAssistantId:(id)a3 multiUserInfo:(id)a4 isRMVEnabled:(BOOL)a5
{
  id v7;
  SRDRequestDispatcherInternal *v8;
  uint64_t v9;

  sub_1C2FC99F0();
  v7 = a4;
  v8 = self;
  sub_1C2FBCFD0((uint64_t)v8, v9, v7);

  swift_bridgeObjectRelease();
}

- (SRDRequestDispatcherInternal)init
{
  RequestDispatcher.init()();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_234();
  OUTLINED_FUNCTION_234();
  OUTLINED_FUNCTION_234();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_234();
  OUTLINED_FUNCTION_234();
  sub_1C2F9BD60((uint64_t)self + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId, &qword_1ED7AF490);
  OUTLINED_FUNCTION_376();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker);
}

@end
