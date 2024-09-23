@implementation BCRCDataContainer

+ (BCRCDataContainer)defaultContainer
{
  if (qword_30AB00 != -1)
    swift_once(&qword_30AB00, sub_18B014);
  return (BCRCDataContainer *)(id)qword_30BF28;
}

- (BRCJSABridge)bridge
{
  return (BRCJSABridge *)sub_18B140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BCRCDataContainer_bridge);
}

- (void)setBridge:(id)a3
{
  sub_18B1E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BCRCDataContainer_bridge);
}

- (BASessionHosting)sessionHosting
{
  return (BASessionHosting *)sub_18B140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BCRCDataContainer_sessionHosting);
}

- (void)setSessionHosting:(id)a3
{
  sub_18B1E0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BCRCDataContainer_sessionHosting);
}

- (BCRCDataContainer)init
{
  objc_class *ObjectType;
  id v4;
  id v5;
  BCRCDataContainer *v6;
  uint64_t v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = objc_msgSend((id)objc_opt_self(BRCConfigurationManager), "sharedInstance");
  v5 = objc_allocWithZone(ObjectType);
  v6 = (BCRCDataContainer *)sub_18B364(v4);
  v7 = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, v7, 168, 7);
  return v6;
}

- (void)dealloc
{
  BCRCDataContainer *v2;

  v2 = self;
  RCDataContainer.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_bridge));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_sessionHosting));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_cancellables));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_isTimerSuspended));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_dispatchTimer));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_aq_currentDataSource));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_aq_stagedDataSource));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_currentABData));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_stagedABData));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_configVersionCounter));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_configChangeHandler));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BCRCDataContainer____lazy_storage___overrides));
}

- (BOOL)configurationLoaded
{
  void *v3;
  BCRCDataContainer *v4;
  id v5;
  unsigned __int8 v6;

  v3 = (void *)objc_opt_self(BRCConfigurationManager);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedInstance");
  v6 = objc_msgSend(v5, "configurationLoaded");

  return v6;
}

- (BOOL)waitForConfiguration:(double)a3
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_configManager), "waitForCachedConfigurationLoaded:", a3);
}

- (void)deployStagedDataIfNeeded
{
  BCRCDataContainer *v2;

  v2 = self;
  RCDataContainer.deployStagedDataIfNeeded()();

}

- (BABooksTreatmentData)treatmentData
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_treatmentData);
  swift_beginAccess((char *)self + OBJC_IVAR___BCRCDataContainer_treatmentData, v4, 0, 0);
  return (BABooksTreatmentData *)*v2;
}

- (void)setTreatmentData:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_treatmentData);
  swift_beginAccess((char *)self + OBJC_IVAR___BCRCDataContainer_treatmentData, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSDictionary)configs
{
  BCRCDataContainer *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = RCDataContainer.configs.getter();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)registerOnConfigChange:(id)a3
{
  id v4;
  BCRCDataContainer *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = self;
  v6 = static os_log_type_t.default.getter(v5);
  if (qword_30AB08 != -1)
    swift_once(&qword_30AB08, sub_1967E0);
  v7 = (id)qword_30C710;
  os_log(_:dso:log:_:_:)(v6, &dword_0);

  v8 = *(uint64_t *)((char *)&v5->super.isa + OBJC_IVAR___BCRCDataContainer_configChangeHandler);
  v10 = objc_msgSend(objc_allocWithZone((Class)JSManagedValue), "initWithValue:", v4);
  v9 = sub_16B968(&qword_30BFC8);
  OSAllocatedUnfairLock.valueWithLock.setter(&v10, v8, v9);

}

- (void)unregisterOnConfigChange:(id)a3
{
  uint64_t v4;
  id v5;
  BCRCDataContainer *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BCRCDataContainer_configChangeHandler);
  v8 = 0;
  v5 = a3;
  v6 = self;
  v7 = sub_16B968(&qword_30BFC8);
  OSAllocatedUnfairLock.valueWithLock.setter(&v8, v4, v7);

}

- (BOOL)isReadingNow2Enabled
{
  return 1;
}

- (BOOL)isPriceTrackingEnabled
{
  return 0;
}

- (void)setOverrideObject:(id)a3 forKey:(id)a4
{
  id v7;
  BCRCDataContainer *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  _QWORD v14[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v14);
  swift_unknownObjectRelease(a3);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v11 = v10;

  v13 = (objc_class *)sub_18F2D4();
  sub_19016C((uint64_t)v14, v9, v11, (uint64_t *)&v13);
  v12 = *(uint64_t *)((char *)&v8->super.isa + OBJC_IVAR___BCRCDataContainer____lazy_storage___overrides);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___BCRCDataContainer____lazy_storage___overrides) = v13;
  swift_bridgeObjectRelease(v12);
  sub_18DE48();

  swift_bridgeObjectRelease(v11);
  sub_184A38(v14);
}

- (void)configurationManager:(id)a3 namespaceDataDidUpdateFrom:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCRCDataContainer *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_192D7C(v10);

}

@end
