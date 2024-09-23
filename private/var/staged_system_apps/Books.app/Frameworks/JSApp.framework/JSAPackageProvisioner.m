@implementation JSAPackageProvisioner

- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  JSAPackageProvisioner *v7;

  v3 = a3;
  if (qword_B8118 != -1)
    swift_once(&qword_B8118, sub_508AC);
  v5 = *(_QWORD *)(qword_B8EF0 + OBJC_IVAR___JSAProcessEnvironment__variant);
  v6 = (void *)static InMemoryJetPackLoader.sharedUnpackQueue.getter();
  v7 = -[JSAPackageProvisioner initWithLaunching:processVariant:overridePackageURLCachePath:on:](self, "initWithLaunching:processVariant:overridePackageURLCachePath:on:", v3, v5, 0, v6);

  return v7;
}

- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3 onQueue:(id)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;
  JSAPackageProvisioner *v8;

  v4 = a3;
  v6 = qword_B8118;
  v7 = a4;
  if (v6 != -1)
    swift_once(&qword_B8118, sub_508AC);
  v8 = -[JSAPackageProvisioner initWithLaunching:processVariant:overridePackageURLCachePath:on:](self, "initWithLaunching:processVariant:overridePackageURLCachePath:on:", v4, *(_QWORD *)(qword_B8EF0 + OBJC_IVAR___JSAProcessEnvironment__variant), 0, v7);

  return v8;
}

- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3 processVariant:(int64_t)a4 overridePackageURLCachePath:(id)a5 on:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  JSAPackageProvisioner *v13;

  if (a5)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v11 = v10;
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  v12 = a6;
  v13 = (JSAPackageProvisioner *)sub_37310(a3, a4, v9, v11, v12);

  return v13;
}

- (void)provisionWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_9FE90, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  swift_retain(self);
  PackageProvisioner.provision(completionHandler:)((uint64_t)sub_37814, v5);
  swift_release(v5);
  swift_release(self);
}

- (JSAPackageProvisioner)init
{
  JSAPackageProvisioner *result;

  swift_defaultActor_initialize(self);
  result = (JSAPackageProvisioner *)_swift_stdlib_reportUnimplementedInitializer("JSApp.PackageProvisioner", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
