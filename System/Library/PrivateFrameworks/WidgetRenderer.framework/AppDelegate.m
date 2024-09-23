@implementation AppDelegate

- (_TtC14WidgetRenderer11AppDelegate)init
{
  objc_super v4;

  if (qword_2544D39D8 != -1)
    swift_once();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v4, sel_init);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14WidgetRenderer11AppDelegate *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  BSDispatchQueueAssertMain();
  type metadata accessor for WidgetSceneDelegate();
  v12 = objc_msgSend(v9, sel_role);
  v13 = objc_allocWithZone(MEMORY[0x24BEBD8E8]);
  v14 = (void *)sub_24A559310();
  v15 = objc_msgSend(v13, sel_initWithName_sessionRole_, v14, v12);

  objc_msgSend(v15, sel_setDelegateClass_, swift_getObjCClassFromMetadata());
  return v15;
}

- (uint64_t)applicationDidReceiveMemoryWarning:
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[12];

  v0 = sub_24A5584D0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A5594FC();
  if (qword_2544D27E0 != -1)
LABEL_37:
    swift_once();
  sub_24A5584C4();
  sub_24A5584AC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v5 = objc_msgSend(v4, sel_connectedScenes);

  v6 = sub_24A516AE0();
  v3 = (char *)sub_24A516B1C();
  v0 = sub_24A559418();

  v24[3] = v6;
  if ((v0 & 0xC000000000000001) != 0)
  {
    sub_24A55964C();
    sub_24A559430();
    v0 = v24[7];
    v7 = v24[8];
    v8 = v24[9];
    v9 = v24[10];
    v10 = v24[11];
  }
  else
  {
    v9 = 0;
    v11 = -1 << *(_BYTE *)(v0 + 32);
    v7 = v0 + 56;
    v8 = ~v11;
    v12 = -v11;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v10 = v13 & *(_QWORD *)(v0 + 56);
  }
  v24[4] = v0 & 0x7FFFFFFFFFFFFFFFLL;
  v24[1] = v8;
  v1 = (unint64_t)(v8 + 64) >> 6;
  v24[2] = MEMORY[0x24BEE4AD0] + 8;
  while (v0 < 0)
  {
    v17 = sub_24A5596A0();
    if (!v17)
      return sub_24A4FE10C();
    v3 = (char *)v17;
    v24[5] = v17;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v18 = (id)v24[6];
    swift_unknownObjectRelease();
    v16 = v9;
    v14 = v10;
    if (!v18)
      return sub_24A4FE10C();
LABEL_32:
    if (objc_msgSend(v18, sel_delegate))
    {
      type metadata accessor for WidgetSceneDelegate();
      v22 = swift_dynamicCastClass();
      if (v22)
      {
        v3 = (char *)v22;
        sub_24A50584C();
      }
      swift_unknownObjectRelease();
    }

    v9 = v16;
    v10 = v14;
  }
  if (v10)
  {
    v14 = (v10 - 1) & v10;
    v15 = __clz(__rbit64(v10)) | (v9 << 6);
    v16 = v9;
    goto LABEL_31;
  }
  v19 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v19 >= v1)
    return sub_24A4FE10C();
  v20 = *(_QWORD *)(v7 + 8 * v19);
  v16 = v9 + 1;
  if (v20)
    goto LABEL_30;
  v16 = v9 + 2;
  if (v9 + 2 >= v1)
    return sub_24A4FE10C();
  v20 = *(_QWORD *)(v7 + 8 * v16);
  if (v20)
    goto LABEL_30;
  v16 = v9 + 3;
  if (v9 + 3 >= v1)
    return sub_24A4FE10C();
  v20 = *(_QWORD *)(v7 + 8 * v16);
  if (v20)
    goto LABEL_30;
  v16 = v9 + 4;
  if (v9 + 4 >= v1)
    return sub_24A4FE10C();
  v20 = *(_QWORD *)(v7 + 8 * v16);
  if (v20)
  {
LABEL_30:
    v14 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v16 << 6);
LABEL_31:
    v18 = *(id *)(*(_QWORD *)(v0 + 48) + 8 * v15);
    if (!v18)
      return sub_24A4FE10C();
    goto LABEL_32;
  }
  v21 = v9 + 5;
  while (v1 != v21)
  {
    v20 = *(_QWORD *)(v7 + 8 * v21++);
    if (v20)
    {
      v16 = v21 - 1;
      goto LABEL_30;
    }
  }
  return sub_24A4FE10C();
}

@end
