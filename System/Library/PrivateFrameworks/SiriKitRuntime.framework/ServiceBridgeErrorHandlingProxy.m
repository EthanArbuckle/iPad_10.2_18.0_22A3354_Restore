@implementation ServiceBridgeErrorHandlingProxy

- (void)submitWithExecutionOutput:(id)a3 completion:(id)a4
{
  @objc ServiceBridgeErrorHandlingProxy.submit(executionOutput:completion:)((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))specialized ServiceBridgeErrorHandlingProxy.submit(executionOutput:completion:));
}

- (void)closeWithExecutionOutput:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.close(withExecutionOutput:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_266, (SEL *)&selRef_closeWithExecutionOutput_);
}

- (void)closeWithExecutionOutput:(id)a3 errorString:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  v12 = a3;
  v8 = swift_retain();
  v9 = specialized ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:)(v8, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_263);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1B5E432E8](v5, v7);
    objc_msgSend(v10, sel_closeWithExecutionOutput_errorString_, v12, v11);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }

}

- (void)closeWithExecutionOutput:(id)a3 needsUserInput:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = swift_retain();
  v7 = (void *)specialized ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:)(v6, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_260);
  if (v7)
  {
    objc_msgSend(v7, sel_closeWithExecutionOutput_needsUserInput_, v5, v4);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_release();
  }
}

- (void)flowPluginWillExecuteWithFlowPluginInfo:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.close(withExecutionOutput:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_257, (SEL *)&selRef_flowPluginWillExecuteWithFlowPluginInfo_);
}

- (void)fallbackToServerForResultCandidateId:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.fallbackToServer(forResultCandidateId:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_254_0, (SEL *)&selRef_fallbackToServerForResultCandidateId_);
}

- (void)fallbackToInfoDomainResultsForResultCandidateId:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.fallbackToServer(forResultCandidateId:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_251_0, (SEL *)&selRef_fallbackToInfoDomainResultsForResultCandidateId_);
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.prepareForAudioHandoff(completion:)((int)self, (int)a2, a3, (void (*)(uint64_t, void *))specialized ServiceBridgeErrorHandlingProxy.prepareForAudioHandoff(completion:));
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.prepareForAudioHandoff(completion:)((int)self, (int)a2, a3, (void (*)(uint64_t, void *))specialized ServiceBridgeErrorHandlingProxy.prepareForAudioHandoffFailed(completion:));
}

- (void)fetchContextsFor:(id)a3 includesNearByDevices:(BOOL)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;

  v7 = _Block_copy(a5);
  v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v7);
  swift_retain();
  specialized ServiceBridgeErrorHandlingProxy.fetchContexts(for:includesNearByDevices:completion:)(v8, a4, (uint64_t)self, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)fetchSpeechInfoWithReply:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.prepareForAudioHandoff(completion:)((int)self, (int)a2, a3, (void (*)(uint64_t, void *))specialized ServiceBridgeErrorHandlingProxy.fetchSpeechInfo(reply:));
}

- (void)retriggerOriginalRequestWithExecutionRequestId:(id)a3 forUserId:(id)a4 givenCurrentExecutionRequestId:(id)a5 reply:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = _Block_copy(a6);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  _Block_copy(v7);
  swift_retain();
  specialized ServiceBridgeErrorHandlingProxy.retriggerOriginalRequest(withExecutionRequestId:forUserId:givenCurrentExecutionRequestId:reply:)(v8, v10, v11, v13, v14, v16, (uint64_t)self, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)closeServerRequestForExecutionRequestId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  swift_retain();
  v7 = specialized ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:)((uint64_t)self, (uint64_t)specialized closure #1 in ServiceBridgeErrorHandlingProxy.withErrorHandler(onError:), (uint64_t)&block_descriptor_163);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x1B5E432E8](v4, v6);
    objc_msgSend(v8, sel_closeServerRequestForExecutionRequestId_, v9);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
}

- (void)fetchRecentDialogsWithReply:(id)a3
{
  @objc ServiceBridgeErrorHandlingProxy.prepareForAudioHandoff(completion:)((int)self, (int)a2, a3, (void (*)(uint64_t, void *))specialized ServiceBridgeErrorHandlingProxy.fetchRecentDialogs(reply:));
}

- (void)submitExternalActivationRequestWithRequestInfo:(id)a3 completion:(id)a4
{
  @objc ServiceBridgeErrorHandlingProxy.submit(executionOutput:completion:)((uint64_t)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))specialized ServiceBridgeErrorHandlingProxy.submitExternalActivationRequest(withRequestInfo:completion:));
}

@end
