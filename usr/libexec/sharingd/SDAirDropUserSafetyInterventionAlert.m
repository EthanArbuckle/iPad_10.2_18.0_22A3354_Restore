@implementation SDAirDropUserSafetyInterventionAlert

- (void)showInterventionWithIsSend:(BOOL)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16DaemoniOSLibrary36SDAirDropUserSafetyInterventionAlert *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_100726918, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = swift_allocObject(&unk_100726940, 64, 7);
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  *(_BYTE *)(v13 + 32) = a3;
  *(_QWORD *)(v13 + 40) = self;
  *(_QWORD *)(v13 + 48) = sub_1003CB53C;
  *(_QWORD *)(v13 + 56) = v11;
  v14 = self;
  swift_retain(v11);
  v15 = sub_100252EC0((uint64_t)v9, (uint64_t)&unk_1007BE6F0, v13);

  swift_release(v11);
  swift_release(v15);
}

- (_TtC16DaemoniOSLibrary36SDAirDropUserSafetyInterventionAlert)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SDAirDropUserSafetyInterventionAlert init](&v3, "init");
}

@end
