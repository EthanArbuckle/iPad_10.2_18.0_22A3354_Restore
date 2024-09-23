@implementation _RTCReportingS

- (void)setMessageLoggingBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  _RTCReportingS *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1921D7FE0;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  _RTCReportingS.messageLoggingBlock.setter((uint64_t)v4, v5);

}

- (_RTCReportingS)initWithSessionInfo:(id)a3 userInfo:(id)a4 frameworksToCheck:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _RTCReportingS *result;

  v6 = sub_1921DB8C8();
  v7 = sub_1921DB8C8();
  if (a5)
    v8 = sub_1921DB994();
  else
    v8 = 0;
  _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(v6, v7, v8);
  return result;
}

+ (id)newHierarchyTokenFromParentToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  static _RTCReportingS.newHierarchyTokenFromParentToken(_:)(a3);
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  sub_1921C1508(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____RTCReportingS_messageLoggingBlock));
  sub_1921C07DC((uint64_t)self + OBJC_IVAR____RTCReportingS_messageSentDelegate);
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_73_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_72_0();

  OUTLINED_FUNCTION_72_0();
  swift_bridgeObjectRelease();
}

+ (BOOL)sendOneMessageWithSessionInfo:(id)a3 userInfo:(id)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6 payload:(id)a7 error:(id *)a8
{
  uint64_t v11;
  uint64_t v12;

  v11 = sub_1921DB8C8();
  v12 = sub_1921DB8C8();
  if (a7)
    a7 = (id)sub_1921DB8C8();
  swift_getObjCClassMetadata();
  static _RTCReportingS.sendOneMessage(sessionInfo:userInfo:category:type:payload:)(v11, v12, a5, a6, (uint64_t)a7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (void)startConfigurationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _RTCReportingS *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1921D8F38;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  _RTCReportingS.startConfiguration(completionHandler:)((void (*)(_QWORD))v7, v6);
  sub_1921C1508((uint64_t)v7);

}

- (BOOL)sendMessageWithCategory:(unsigned __int16)a3 type:(unsigned __int16)a4 payload:(id)a5 error:(id *)a6
{
  void *v10;
  _RTCReportingS *v11;
  void *v12;
  void *v13;
  id v14;
  Swift::OpaquePointer_optional v16;

  if (a5)
    v10 = (void *)sub_1921DB8C8();
  else
    v10 = 0;
  v11 = self;
  v16.value._rawValue = v10;
  _RTCReportingS.sendMessage(category:type:payload:)(a3, a4, v16);

  swift_bridgeObjectRelease();
  if (v12)
  {
    if (a6)
    {
      v13 = (void *)sub_1921DB760();

      v14 = v13;
      *a6 = v13;
    }
    else
    {

    }
  }
  return v12 == 0;
}

- (void)dealloc
{
  _RTCReportingS *v2;

  v2 = self;
  _RTCReportingS.__deallocating_deinit();
}

- (_RTCReportingS)initWithSessionInfo:(id)a3 userInfo:(id)a4 frameworksToCheck:(id)a5 aggregationBlock:(id)a6
{
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, unsigned __int16, unsigned __int16, uint64_t, double);

  v8 = _Block_copy(a6);
  v9 = sub_1921DB8C8();
  if (a4)
    a4 = (id)sub_1921DB8C8();
  if (a5)
    a5 = (id)sub_1921DB994();
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v10 = sub_1921D7FD8;
  }
  else
  {
    v10 = 0;
  }
  return (_RTCReportingS *)_RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(v9, (uint64_t)a4, (uint64_t)a5, (uint64_t)v10);
}

- (id)messageLoggingBlock
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  _RTCReportingS.messageLoggingBlock.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1921D3768;
  v6[3] = &block_descriptor_44;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (RTCReportingMessageSentNotifier)messageSentDelegate
{
  return (RTCReportingMessageSentNotifier *)(id)_RTCReportingS.messageSentDelegate.getter();
}

- (void)setMessageSentDelegate:(id)a3
{
  _RTCReportingS *v4;

  swift_unknownObjectRetain();
  v4 = self;
  _RTCReportingS.messageSentDelegate.setter();

}

- (void)fetchReportingStatesWithUserInfo:(id)a3 fetchComplete:(id)a4
{
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  _RTCReportingS *v8;

  v5 = (void (*)(uint64_t))_Block_copy(a4);
  v6 = sub_1921DB8C8();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = sub_1921CC5D4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  _RTCReportingS.fetchReportingStates(userInfo:fetchComplete:)(v6, v5, v7);
  sub_1921C1508((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (id)getReportingSessionID
{
  _RTCReportingS *v2;
  void *v3;

  v2 = self;
  _RTCReportingS.getReportingSessionID()();

  v3 = (void *)sub_1921DB928();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)sendMessageWithDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  _RTCReportingS *v7;
  void *v8;
  void *v9;
  id v10;
  Swift::OpaquePointer_optional v12;

  if (a3)
    v6 = (void *)sub_1921DB8C8();
  else
    v6 = 0;
  v7 = self;
  v12.value._rawValue = v6;
  _RTCReportingS.sendMessage(dictionary:)(v12);

  swift_bridgeObjectRelease();
  if (v8)
  {
    if (a4)
    {
      v9 = (void *)sub_1921DB760();

      v10 = v9;
      *a4 = v9;
    }
    else
    {

    }
  }
  return v8 == 0;
}

- (void)flushMessages
{
  _RTCReportingS *v2;

  v2 = self;
  _RTCReportingS.flushMessages()();

}

- (void)flushMessagesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _RTCReportingS *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1921D8F98;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  _RTCReportingS.flushMessages(completion:)((uint64_t)v7, v6);
  sub_1921C1508((uint64_t)v7);

}

+ (id)getPersistentIdentifierForDNU:(BOOL)a3
{
  void *v3;

  v3 = (void *)sub_1921DB928();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)createEphemeralSessionWithSessionInfo:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  void *v5;

  sub_1921DB8C8();
  sub_1921DB8C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_1921DB928();
  swift_bridgeObjectRelease();
  return v5;
}

+ (BOOL)closeEphemeralSessiontWithSessionId:(id)a3
{
  sub_1921DB934();
  swift_bridgeObjectRelease();
  return 0;
}

- (void)updateSharedDataWithDictionary:(id)a3
{
  _RTCReportingS *v4;

  sub_1921DB8C8();
  v4 = self;
  _RTCReportingS.updateSharedData(dictionary:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)updateSharedDataForKey:(id)a3 value:(id)a4
{
  id v6;
  Swift::String v7;
  void *countAndFlagsBits;
  NSObject v9;

  sub_1921DB934();
  v6 = a4;
  v7._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v7._countAndFlagsBits;
  _RTCReportingS.updateSharedData(key:value:)(v7, v9);

  swift_bridgeObjectRelease();
}

- (void)startLogTimerWithInterval:(int)a3 reportingMultiplier:(int)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6
{
  _RTCReportingS *v10;

  v10 = self;
  _RTCReportingS.startLogTimer(interval:reportingMultiplier:category:type:)(a3, a4, a5, a6);

}

- (void)stopLogTimer
{
  _RTCReportingS *v2;

  v2 = self;
  _RTCReportingS.stopLogTimer()();

}

- (BOOL)registerPeriodicTaskForModule:(unsigned int)a3 needToUpdate:(BOOL)a4 needToReport:(BOOL)a5 serviceBlock:(id)a6
{
  uint64_t v8;
  void *v10;
  uint64_t v11;
  _RTCReportingS *v12;
  char v13;
  char v14;

  v8 = *(_QWORD *)&a3;
  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  _RTCReportingS.registerPeriodicTask(module:needToUpdate:needToReport:serviceBlock:)(v8, a4, a5, (uint64_t)sub_1921D7FC8, v11);
  v14 = v13;

  swift_release();
  return v14 & 1;
}

- (void)unregisterPeriodTaskForModule:(unsigned int)a3
{
  _RTCReportingS *v4;

  v4 = self;
  _RTCReportingS.unregisterPeriodicTask(module:)(a3);

}

- (BOOL)serverSupportsFileUpload
{
  return 0;
}

- (BOOL)uploadFileWithURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  _RTCReportingS *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = sub_1921D8F88;
  }
  v7 = a3;
  v8 = self;
  _RTCReportingS.uploadFile(URL:completionHandler:)();
  sub_1921C1508((uint64_t)v6);

  return 0;
}

- (BOOL)uploadDataArray:(id)a3 completionHandler:(id)a4
{
  void *v5;
  _RTCReportingS *v6;

  v5 = _Block_copy(a4);
  sub_1921DB994();
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v5 = sub_1921D7FB0;
  }
  v6 = self;
  _RTCReportingS.uploadFile(URL:completionHandler:)();
  sub_1921C1508((uint64_t)v5);

  swift_bridgeObjectRelease();
  return 0;
}

- (BOOL)setDigestKey:(id)a3 algorithm:(int)a4
{
  return 0;
}

- (void)terminateSessionWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _RTCReportingS *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1921D7FA4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  _RTCReportingS.terminateSession(completion:)((uint64_t)v7, v6);
  sub_1921C1508((uint64_t)v7);

}

+ (void)updateEarlyCacheLimitWithNewLimit:(int64_t)a3
{
  swift_getObjCClassMetadata();
  static _RTCReportingS.updateEarlyCacheLimit(newLimit:)(a3);
}

+ (id)_privacyLogs:(id *)a3
{
  void *v3;

  static _RTCReportingS._privacyLogs()();
  sub_1921DB7C0();
  v3 = (void *)sub_1921DB988();
  swift_bridgeObjectRelease();
  return v3;
}

- (_RTCReportingS)init
{
  _RTCReportingS.init()();
}

@end
