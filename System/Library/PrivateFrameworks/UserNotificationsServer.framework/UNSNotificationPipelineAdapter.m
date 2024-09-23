@implementation UNSNotificationPipelineAdapter

+ (void)createBulletin:(id)a3 category:(id)a4 destinations:(unint64_t)a5 sourceDescription:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v11 = _Block_copy(a7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  swift_getObjCClassMetadata();
  v13 = a3;
  v14 = a4;
  v15 = a6;
  sub_216DFCFB0(v13, a4, a5, v15, (uint64_t)sub_216DFF098, v12, (uint64_t)&unk_24D63AF08, (uint64_t)sub_216DFE7F8, MEMORY[0x24BEBF330]);

  swift_release();
}

+ (void)updateBulletin:(id)a3 category:(id)a4 destinations:(unint64_t)a5 sourceDescription:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v11 = _Block_copy(a7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  swift_getObjCClassMetadata();
  v13 = a3;
  v14 = a4;
  v15 = a6;
  sub_216DFCFB0(v13, a4, a5, v15, (uint64_t)sub_216DFE7D8, v12, (uint64_t)&unk_24D63AEB8, (uint64_t)sub_216DFE7F8, MEMORY[0x24BEBF348]);

  swift_release();
}

+ (void)deleteBulletin:(id)a3 sourceDescription:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_getObjCClassMetadata();
  v9 = a3;
  v10 = a4;
  sub_216DFD244(v9, v10, (uint64_t)sub_216DFE6EC, v8);

  swift_release();
}

+ (void)addInitialBulletins:(id)a3 categories:(id)a4 sourceDescription:(id)a5
{
  unint64_t v6;
  uint64_t v7;
  id v8;

  sub_216DFB2A0(0, (unint64_t *)&unk_253E78660);
  v6 = sub_216E02FDC();
  sub_216DFB2A0(0, &qword_253E78680);
  v7 = sub_216E02F70();
  swift_getObjCClassMetadata();
  v8 = a5;
  sub_216DFD45C(v6, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (UNSNotificationPipelineAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UNSNotificationPipelineAdapter;
  return -[UNSNotificationPipelineAdapter init](&v3, sel_init);
}

@end
