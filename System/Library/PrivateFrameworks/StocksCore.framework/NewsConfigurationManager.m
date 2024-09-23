@implementation NewsConfigurationManager

- (FCNewsAppConfiguration)appConfiguration
{
  _TtC10StocksCore24NewsConfigurationManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1ABD19EE8((uint64_t)v2);

  return (FCNewsAppConfiguration *)v3;
}

- (void)fetchConfigurationIfNeededWithCompletion:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  _QWORD *v6;
  _TtC10StocksCore24NewsConfigurationManager *v7;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1ABDC8B64;
  }
  else
  {
    v5 = 0;
  }
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v4;
  v6[3] = v5;
  v6[4] = self;
  v7 = self;
  sub_1ABD1338C((uint64_t)v4);
  sub_1ABF312E8();
  swift_release();
  sub_1ABD12EC4((uint64_t)v4);

}

- (void)fetchConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC10StocksCore24NewsConfigurationManager *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1ABD16F5C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1ABD13190((uint64_t)a3, (uint64_t)v6, v7);
  sub_1ABD12EC4((uint64_t)v6);

}

- (FCNewsAppConfiguration)possiblyUnfetchedAppConfiguration
{
  _TtC10StocksCore24NewsConfigurationManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1ABD19EE8((uint64_t)v2);

  return (FCNewsAppConfiguration *)v3;
}

- (NSArray)treatmentIDs
{
  sub_1ABD22AD4();
  return (NSArray *)(id)sub_1ABF319FC();
}

- (void)addObserver:(id)a3
{
  sub_1ABD39DE4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  id v8;
  _TtC10StocksCore24NewsConfigurationManager *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1ABDC8B64;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1ABD12B50((uint64_t)v8, (uint64_t)v6, v7);
  sub_1ABD12EC4((uint64_t)v6);

}

- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  _QWORD *v6;
  _TtC10StocksCore24NewsConfigurationManager *v7;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1ABDC8B64;
  }
  else
  {
    v5 = 0;
  }
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v4;
  v6[3] = v5;
  v6[4] = self;
  v7 = self;
  sub_1ABD1338C((uint64_t)v4);
  sub_1ABF312E8();
  swift_release();
  sub_1ABD12EC4((uint64_t)v4);

}

- (_TtC10StocksCore24NewsConfigurationManager)init
{
  _TtC10StocksCore24NewsConfigurationManager *result;

  result = (_TtC10StocksCore24NewsConfigurationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[3120];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_appConfigurationManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_coreConfigObservers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_appConfigObservers));
  sub_1ABDC4288((uint64_t)self + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_lastKnownAppConfig, (uint64_t)v3);
  sub_1ABDC434C((uint64_t)v3);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)removeObserver:(id)a3
{
  sub_1ABD39DE4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  id v8;
  _TtC10StocksCore24NewsConfigurationManager *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1ABDC8B64;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1ABDC3BC4(v8, (uint64_t)v6, v7);
  sub_1ABD12EC4((uint64_t)v6);

}

- (void)addAppConfigObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_appConfigObservers), sel_addObject_, a3);
}

- (void)removeAppConfigObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC10StocksCore24NewsConfigurationManager_appConfigObservers), sel_removeObject_, a3);
}

@end
