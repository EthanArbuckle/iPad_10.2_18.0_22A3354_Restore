@implementation JSAURLParser

- (void)typeForURL:(NSURL *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSURL *v15;
  JSAURLParser *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_A0938, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_A0960, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_B86A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_A0988, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_B8C20;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_4CD0C((uint64_t)v9, (uint64_t)&unk_B8C30, (uint64_t)v14);
  swift_release(v17);
}

- (JSAURLParser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[JSAURLParser init](&v3, "init");
}

+ (id)sharedParser
{
  if (qword_B8098 != -1)
    swift_once(&qword_B8098, sub_3B9C0);
  return (id)qword_B8648;
}

- (void)isCommerceUIURLWithCallback:(id)a3 :(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  JSAURLParser *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_29EF0(&qword_B8B00);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_A0910, 64, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = v10;
  v14[6] = v12;
  v14[7] = a4;
  v15 = a4;
  v16 = self;
  v17 = v15;
  swift_bridgeObjectRetain(v12);
  v18 = sub_3B71C((uint64_t)v9, (uint64_t)&unk_B8698, (uint64_t)v14);
  swift_release(v18);
  sub_2E618((uint64_t)v9, &qword_B8B00);

  swift_bridgeObjectRelease(v12);
}

- (id)processCampaignAttributedURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  JSAURLParser *v7;
  void *v8;
  void *v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  _s5JSApp9URLParserC28processCampaignAttributedURLySo7JSValueCSSF_0(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease(v6);
  return v9;
}

@end
