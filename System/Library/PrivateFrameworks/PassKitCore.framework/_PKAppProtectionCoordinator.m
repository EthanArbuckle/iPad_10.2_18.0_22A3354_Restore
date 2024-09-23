@implementation _PKAppProtectionCoordinator

- (APApplication)application
{
  return (APApplication *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____PKAppProtectionCoordinator_application));
}

+ (_PKAppProtectionCoordinator)shared
{
  if (qword_1EE1BCF48 != -1)
    swift_once();
  return (_PKAppProtectionCoordinator *)(id)qword_1EE1BD550;
}

- (BOOL)isEffectivelyLocked
{
  _PKAppProtectionCoordinator *v2;
  unsigned __int8 v3;

  v2 = self;
  if (PKAppProtectionEnabled())
    v3 = objc_msgSend(*(id *)((char *)&v2->super.isa + OBJC_IVAR____PKAppProtectionCoordinator_application), sel_isEffectivelyLocked);
  else
    v3 = 0;

  return v3;
}

- (void)isShieldRequiredWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _PKAppProtectionCoordinator *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1BF3B0);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_1903D085C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EE1BD5B8;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE1BD5C0;
  v11[5] = v10;
  v12 = self;
  sub_18FDDE314((uint64_t)v6, (uint64_t)&unk_1EE1BD5C8, (uint64_t)v11);
  swift_release();
}

- (void)requestAccess
{
  _PKAppProtectionCoordinator *v2;

  v2 = self;
  AppProtectionCoordinator.requestAccess()();

}

- (void)requestAccessWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _PKAppProtectionCoordinator *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1BF3B0);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_1903D085C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EE1BD598;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE1BD5A0;
  v11[5] = v10;
  v12 = self;
  sub_18FDDE314((uint64_t)v6, (uint64_t)&unk_1EE1BD5A8, (uint64_t)v11);
  swift_release();
}

- (void)registerObserver:(id)a3
{
  sub_18FCDE4AC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

- (void)unregisterObserver:(id)a3
{
  sub_18FCDE4AC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (_PKAppProtectionCoordinator)init
{
  return (_PKAppProtectionCoordinator *)AppProtectionCoordinator.init()();
}

- (void).cxx_destruct
{

  swift_release();
}

@end
