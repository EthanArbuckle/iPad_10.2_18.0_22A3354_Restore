@implementation BKAppAddToWTRDelegate

- (BKAppAddToWTRDelegate)initWithPriceTracker:(id)a3
{
  objc_class *ObjectType;
  void *v6;
  id v7;
  char *v8;
  uint64_t v9;
  BKAppAddToWTRDelegate *v10;
  uint64_t v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (void *)objc_opt_self(BKNotificationManager);
  swift_retain(a3);
  v7 = objc_msgSend(v6, "sharedInstance");
  v8 = (char *)objc_allocWithZone(ObjectType);
  v9 = swift_weakInit(&v8[OBJC_IVAR___BKAppAddToWTRDelegate_priceTracker], 0);
  swift_weakAssign(v9);
  *(_QWORD *)&v8[OBJC_IVAR___BKAppAddToWTRDelegate_notifications] = v7;
  v13.receiver = v8;
  v13.super_class = ObjectType;
  v10 = -[BKAppAddToWTRDelegate init](&v13, "init");
  swift_release(a3);
  v11 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v11, 24, 7);
  return v10;
}

- (void)addToWTR:(Class)a3 priceTrackingOptInTypeWithCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  BKAppAddToWTRDelegate *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100915B20, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100915B48, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1009EFA60;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100915B70, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1009EFA68;
  v14[5] = v13;
  v15 = self;
  v16 = sub_1005D61EC((uint64_t)v9, (uint64_t)&unk_1009EFA70, (uint64_t)v14);
  swift_release(v16);
}

- (void)addToWTR:(Class)a3 didShowPriceTrackingOptInWithCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  BKAppAddToWTRDelegate *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100915AA8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100915AD0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1009EFA40;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100915AF8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1009EFA48;
  v14[5] = v13;
  v15 = self;
  v16 = sub_1005D61EC((uint64_t)v9, (uint64_t)&unk_1009EFA50, (uint64_t)v14);
  swift_release(v16);
}

- (void)addToWTR:(Class)a3 didAcceptPriceTrackingOptInWithCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  BKAppAddToWTRDelegate *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1009159F0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100915A18, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1009EFA08;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100915A40, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1009D76E0;
  v14[5] = v13;
  v15 = self;
  v16 = sub_1005D61EC((uint64_t)v9, (uint64_t)&unk_1009E5570, (uint64_t)v14);
  swift_release(v16);
}

- (BKAppAddToWTRDelegate)init
{
  BKAppAddToWTRDelegate *result;

  result = (BKAppAddToWTRDelegate *)_swift_stdlib_reportUnimplementedInitializer("Books.AppAddToWTRDelegate", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR___BKAppAddToWTRDelegate_priceTracker);

}

@end
