@implementation SDAirDropClassroomBrowser

- (void)shareTargetBrowser:(id)a3 didFindTargets:(id)a4
{
  sub_10028A234(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_10028AE84);
}

- (void)shareTargetBrowser:(id)a3 didRemoveTargets:(id)a4
{
  sub_10028A234(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_10028B244);
}

- (void)shareTargetBrowser:(id)a3 didInterruptWithError:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  _TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = swift_allocObject(&unk_10071FA38, 24, 7);
  swift_unknownObjectWeakInit(v11 + 16, self);
  v12 = (_QWORD *)swift_allocObject(&unk_10071FA60, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a4;
  v12[5] = v11;
  v13 = a4;
  v14 = a3;
  v15 = self;
  v16 = sub_100252EC0((uint64_t)v9, (uint64_t)&unk_1007B7738, (uint64_t)v12);

  swift_release(v16);
}

- (_TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser)init
{
  _TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser *result;

  result = (_TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropClassroomBrowser", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_browserQueue));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_managedConfig));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_classroomEndpoints));
  swift_release(*(_QWORD *)&self->browserQueue[OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_endpointsUpdateHandler]);
}

@end
