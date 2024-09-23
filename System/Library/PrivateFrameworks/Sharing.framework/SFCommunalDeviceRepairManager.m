@implementation SFCommunalDeviceRepairManager

- (id)updateIDSCacheHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler))
    return 0;
  v2 = *(_QWORD *)&self->isAttemptingRepair[OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler];
  v5[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1A2ABBFF4;
  v5[3] = &block_descriptor_6;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setUpdateIDSCacheHandler:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void (**v7)(uint64_t);
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_1A2ABD338;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
  v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
  *v7 = v6;
  v7[1] = (void (*)(uint64_t))v4;
  sub_1A297CC78(v8);
}

- (void)handleBLEDeviceFound:(id)a3
{
  id v4;
  _TtC7Sharing29SFCommunalDeviceRepairManager *v5;

  v4 = a3;
  v5 = self;
  sub_1A2ABC0D8(v4);

}

- (void)resetTrigger
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_isAttemptingRepair) = 0;
}

- (_TtC7Sharing29SFCommunalDeviceRepairManager)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_isAttemptingRepair) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[SFCommunalDeviceRepairManager init](&v6, sel_init);
}

- (void).cxx_destruct
{

  sub_1A297CC78(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler));
}

@end
