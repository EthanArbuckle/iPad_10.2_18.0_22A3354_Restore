@implementation SNConnectionInternal

- (SNConnectionDelegateInternal)delegate
{
  Connection.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  SNConnectionInternal *v4;

  swift_unknownObjectRetain();
  v4 = self;
  Connection.delegate.setter();

}

- (SNConnectionInternal)initWithConnectionInfo:(id)a3 connectionQueue:(id)a4
{
  return (SNConnectionInternal *)Connection.init(connectionInfo:connectionQueue:)(a3, a4);
}

- (SNConnectionInternal)initWithConnectionInfo:(id)a3 connectionQueue:(id)a4 networkManager:(id)a5 networkAnalytics:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  return (SNConnectionInternal *)Connection.init(connectionInfo:connectionQueue:networkManager:networkAnalytics:)();
}

- (void)dealloc
{
  SNConnectionInternal *v2;

  v2 = self;
  Connection.__deallocating_deinit();
}

- (void).cxx_destruct
{
  _QWORD v3[65];

  outlined destroy of weak ConnectionProviderDelegate?((uint64_t)self + OBJC_IVAR___SNConnectionInternal_delegate);
  OUTLINED_FUNCTION_28(v3, (char *)self + OBJC_IVAR___SNConnectionInternal_connectionConfiguration);
  outlined release of ConnectionConfiguration(v3);
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNConnectionInternal_connectionQueue);
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNConnectionInternal_activeConnectionGroup);
  swift_release();
  outlined consume of ConnectionPolicyRoute?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SNConnectionInternal_activeRoute), *(_QWORD *)&self->delegate[OBJC_IVAR___SNConnectionInternal_activeRoute]);
  OUTLINED_FUNCTION_85_3();
  OUTLINED_FUNCTION_85_3();
  OUTLINED_FUNCTION_85_3();
  OUTLINED_FUNCTION_85_3();
  OUTLINED_FUNCTION_85_3();
  OUTLINED_FUNCTION_85_3();
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNConnectionInternal_networkManager);
  OUTLINED_FUNCTION_2_0(OBJC_IVAR___SNConnectionInternal_networkAnalytics);
  OUTLINED_FUNCTION_3();
}

- (BOOL)startAndReturnError:(id *)a3
{
  SNConnectionInternal *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  Connection.start()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)_convertErrorToNSError(_:)();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (void)sendData:(id)a3 with:(id)a4
{
  uint64_t (*v5)();
  SNConnectionInternal *v6;
  uint64_t v7;

  v5 = (uint64_t (*)())_Block_copy(a4);
  swift_unknownObjectRetain();
  v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v5 = thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  }
  Connection.sendData(_:with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
}

- (void)sendCommand:(id)a3 with:(id)a4
{
  void *v5;

  v5 = _Block_copy(a4);
  if (v5)
    *(_QWORD *)(swift_allocObject() + 16) = v5;
  swift_unknownObjectRetain();
  self;
  Connection.sendCommand(_:with:)();
}

- (void)sendCommands:(id)a3 with:(id)a4
{
  void *v5;
  SNConnectionInternal *v6;

  v5 = _Block_copy(a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
    *(_QWORD *)(swift_allocObject() + 16) = v5;
  v6 = self;
  Connection.sendCommands(_:with:)();
}

- (void)setSendPings:(BOOL)a3
{
  SNConnectionInternal *v4;

  v4 = self;
  Connection.setSendPings(_:)(a3);

}

- (void)cancelSynchronously:(BOOL)a3 isOnConnectionQueue:(BOOL)a4 with:(id)a5
{
  void *v6;
  SNConnectionInternal *v7;

  v6 = _Block_copy(a5);
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = _sIeyB_Ieg_TRTA_0;
  }
  v7 = self;
  Connection.cancelSynchronously(_:isOnConnectionQueue:with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v6);

}

- (void)getSNConnectionMetrics:(BOOL)a3 with:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  SNConnectionInternal *v8;

  v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ();
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  Connection.getSNConnectionMetrics(_:with:)(v4, (uint64_t)v6, v7);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v6);

}

- (void)getSNConnectionAnalysisInfo:(id)a3
{
  void *v4;
  uint64_t (*v5)();
  SNConnectionInternal *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ()partial apply;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  Connection.getSNConnectionAnalysisInfo(_:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);

}

- (void)probeConnection
{
  SNConnectionInternal *v2;

  v2 = self;
  Connection.probeConnection()();

}

- (void)barrierWith:(id)a3
{
  void *v4;
  uint64_t (*v5)(char);
  SNConnectionInternal *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ();
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  Connection.barrier(with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);

}

- (SNConnectionInternal)init
{
  Connection.init()();
}

@end
