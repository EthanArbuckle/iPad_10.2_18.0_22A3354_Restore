@implementation BookReaderActionTarget

- (NSArray)keyCommands
{
  _TtC5Books22BookReaderActionTarget *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1004658A4();

  if (v3)
  {
    sub_100009E04(0, &qword_1009D76A0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)copy:(id)a3
{
  _TtC5Books22BookReaderActionTarget *v5;
  uint64_t v6;
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t Strong;
  uint64_t v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v9 = Strong;
    sub_10020B0FC();

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_100010960((uint64_t)v10, (uint64_t *)&unk_1009D04E0);
}

- (void)books_pageBackward:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100466344);
}

- (void)books_pageForward:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_10046635C);
}

- (void)books_lineBackward:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100466374);
}

- (void)books_lineForward:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_10046648C);
}

- (void)books_chapterLeft:(id)a3
{
  sub_100468D18(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))sub_1004665A4);
}

- (void)books_chapterRight:(id)a3
{
  sub_100468D18(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))sub_1004665C4);
}

- (void)books_chapterBackward:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100466710);
}

- (void)books_chapterForward:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100466728);
}

- (void)books_chapterStart:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100466740);
}

- (void)books_chapterEnd:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100466758);
}

- (void)books_toggleBookmark:(id)a3
{
  _TtC5Books22BookReaderActionTarget *v5;
  uint64_t v6;
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t Strong;
  uint64_t v9;
  char v10;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v9 = Strong;
    v10 = sub_100437C40();
    sub_100437D74((v10 & 1) == 0);

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_100010960((uint64_t)v11, (uint64_t *)&unk_1009D04E0);
}

- (void)books_addHighlight:(id)a3
{
  sub_10046740C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100908050, (uint64_t)&unk_1009E4D88);
}

- (void)books_removeHighlight:(id)a3
{
  sub_10046773C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100908028, (uint64_t)&unk_1009E4D78);
}

- (void)books_setHighlightStyle:(id)a3
{
  sub_100468D18(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))sub_100466D30);
}

- (void)books_addNote:(id)a3
{
  sub_10046740C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100908000, (uint64_t)&unk_1009E4D68);
}

- (void)books_removeNote:(id)a3
{
  sub_10046773C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100907FD8, (uint64_t)&unk_1009E4D58);
}

- (void)books_search:(id)a3
{
  _TtC5Books22BookReaderActionTarget *v5;
  uint64_t v6;
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v9 = Strong;
    v10 = sub_10046C844((uint64_t)v13);
    v12 = v11;
    sub_1005DF384(v10, v11);

    swift_bridgeObjectRelease(v12);
    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_100010960((uint64_t)v13, (uint64_t *)&unk_1009D04E0);
}

- (void)books_find:(id)a3
{
  sub_100467E8C((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1005E2384);
}

- (void)books_findSelection:(id)a3
{
  _TtC5Books22BookReaderActionTarget *v5;
  uint64_t v6;
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t Strong;
  uint64_t v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v9 = Strong;
    sub_1005E2500();

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_100010960((uint64_t)v10, (uint64_t *)&unk_1009D04E0);
}

- (void)books_resetSize:(id)a3
{
  sub_1004679E8((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of ContentSizeCategoryManaging.resetContentSize());
}

- (void)books_decreaseSize:(id)a3
{
  sub_1004679E8((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of ContentSizeCategoryManaging.decreaseContentSize());
}

- (void)books_increaseSize:(id)a3
{
  sub_1004679E8((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of ContentSizeCategoryManaging.increaseContentSize());
}

- (void)books_increaseBrightness:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100467ABC);
}

- (void)books_decreaseBrightness:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100467BA8);
}

- (void)books_close:(id)a3
{
  _TtC5Books22BookReaderActionTarget *v5;
  uint64_t v6;
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t Strong;
  void *v9;
  uint64_t v10;
  id v11;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v9 = (void *)Strong;
    v10 = swift_allocObject(&unk_100907FB0, 24, 7);
    *(_QWORD *)(v10 + 16) = v9;
    v11 = v9;
    sub_1006498E4((void (*)(uint64_t))sub_10046D5D8, v10);

    swift_unknownObjectRelease(v11);
    swift_release(v10);
  }
  else
  {

  }
  sub_100010960((uint64_t)v12, (uint64_t *)&unk_1009D04E0);
}

- (void)books_showContent:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100467D70);
}

- (void)books_showTableOfContents:(id)a3
{
  sub_100467E8C((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1005DFC5C);
}

- (void)books_showBookmarks:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100467F30);
}

- (void)books_showHighlightsAndNotes:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100467F9C);
}

- (void)books_showPrintedPageNumbers:(id)a3
{
  _TtC5Books22BookReaderActionTarget *v5;
  uint64_t v6;
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v9 = Strong;
    v10 = *(_QWORD *)(*(_QWORD *)(Strong + OBJC_IVAR____TtC5Books19BookReaderPresenter_interactor) + 120);
    ObjectType = swift_getObjectType();
    dispatch thunk of PageNumberManaging.usePhysicalPagesValue.setter(1, ObjectType, v10);

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_100010960((uint64_t)v12, (uint64_t *)&unk_1009D04E0);
}

- (void)books_showDigitalPageNumbers:(id)a3
{
  _TtC5Books22BookReaderActionTarget *v5;
  uint64_t v6;
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v9 = Strong;
    v10 = *(_QWORD *)(*(_QWORD *)(Strong + OBJC_IVAR____TtC5Books19BookReaderPresenter_interactor) + 120);
    ObjectType = swift_getObjectType();
    dispatch thunk of PageNumberManaging.usePhysicalPagesValue.setter(0, ObjectType, v10);

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_100010960((uint64_t)v12, (uint64_t *)&unk_1009D04E0);
}

- (void)books_toggleContinuousScroll:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100468180);
}

- (void)books_enableContinuousScroll:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1004682D8);
}

- (void)books_disableContinuousScroll:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100468368);
}

- (void)books_toggleTheme:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC5Books22BookReaderActionTarget *v8;
  uint64_t v9;
  _TtC5Books22BookReaderActionTarget *v10;
  char v11;
  uint64_t v12;
  _TtC5Books22BookReaderActionTarget *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v10 = self;
  }
  v11 = sub_10046BC50((uint64_t)v17);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  type metadata accessor for MainActor(0);
  v13 = self;
  v14 = static MainActor.shared.getter(v13);
  v15 = swift_allocObject(&unk_100907F88, 41, 7);
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = &protocol witness table for MainActor;
  *(_QWORD *)(v15 + 32) = v13;
  *(_BYTE *)(v15 + 40) = v11;
  v16 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009E4D48, v15);

  swift_release(v16);
  sub_100010960((uint64_t)v17, (uint64_t *)&unk_1009D04E0);
}

- (void)books_enableTheme:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC5Books22BookReaderActionTarget *v8;
  uint64_t v9;
  _TtC5Books22BookReaderActionTarget *v10;
  char v11;
  uint64_t v12;
  _TtC5Books22BookReaderActionTarget *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v10 = self;
  }
  v11 = sub_10046CAD0((uint64_t)v17);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  type metadata accessor for MainActor(0);
  v13 = self;
  v14 = static MainActor.shared.getter(v13);
  v15 = swift_allocObject(&unk_100907F60, 41, 7);
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = &protocol witness table for MainActor;
  *(_QWORD *)(v15 + 32) = v13;
  *(_BYTE *)(v15 + 40) = v11;
  v16 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009E4D40, v15);

  swift_release(v16);
  sub_100010960((uint64_t)v17, (uint64_t *)&unk_1009D04E0);
}

- (void)books_disableTheme:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC5Books22BookReaderActionTarget *v8;
  uint64_t v9;
  _TtC5Books22BookReaderActionTarget *v10;
  uint64_t v11;
  _TtC5Books22BookReaderActionTarget *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v10 = self;
  }
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  type metadata accessor for MainActor(0);
  v12 = self;
  v13 = static MainActor.shared.getter(v12);
  v14 = swift_allocObject(&unk_100907F38, 41, 7);
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = &protocol witness table for MainActor;
  *(_QWORD *)(v14 + 32) = v12;
  *(_BYTE *)(v14 + 40) = 0;
  v15 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009E4D38, v14);

  swift_release(v15);
  sub_100010960((uint64_t)v16, (uint64_t *)&unk_1009D04E0);
}

- (void)books_setTheme:(id)a3
{
  sub_10046740C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100907F10, (uint64_t)&unk_1009E4D28);
}

- (void)books_editTheme:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Books22BookReaderActionTarget *v9;
  uint64_t v10;
  _TtC5Books22BookReaderActionTarget *v11;
  uint64_t Strong;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  double v16;
  _OWORD v17[2];

  v5 = type metadata accessor for BookThemeEntity(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v9 = self;
    v10 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v11 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
  if (Strong)
  {
    v13 = Strong;
    v14 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Books19BookReaderPresenter_readingSettingsProvider + 8);
    ObjectType = swift_getObjectType();
    dispatch thunk of ReadingSettingsProviding.currentTheme.getter(ObjectType, v14);
    v16 = sub_1005E046C((uint64_t)v8);
    (*(void (**)(char *, uint64_t, double))(v6 + 8))(v8, v5, v16);

    swift_unknownObjectRelease(v13);
  }
  else
  {

  }
  sub_100010960((uint64_t)v17, (uint64_t *)&unk_1009D04E0);
}

- (void)books_toggleDarkAppearance:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100468A78);
}

- (void)books_enableDarkAppearance:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100468BA8);
}

- (void)books_disableDarkAppearance:(id)a3
{
  sub_100219640(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100468C18);
}

- (void)books_setThemeAppearance:(id)a3
{
  sub_100468D18(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))sub_100468C88);
}

- (void)books_translate:(id)a3
{
  sub_10046773C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100907EE8, (uint64_t)&unk_1009E4D18);
}

- (void)books_lookup:(id)a3
{
  sub_10046773C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100907EC0, (uint64_t)&unk_1009E4D08);
}

- (void)books_share:(id)a3
{
  sub_10046773C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100907E98, (uint64_t)&unk_1009E4CF8);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Books22BookReaderActionTarget *v7;
  uint64_t v8;
  _TtC5Books22BookReaderActionTarget *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_100469308((uint64_t)a3, (uint64_t)v12);

  sub_100010960((uint64_t)v12, (uint64_t *)&unk_1009D04E0);
  return v10 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  _TtC5Books22BookReaderActionTarget *v5;

  v4 = a3;
  v5 = self;
  sub_10046A40C(v4);

}

- (_TtC5Books22BookReaderActionTarget)init
{
  _TtC5Books22BookReaderActionTarget *result;

  result = (_TtC5Books22BookReaderActionTarget *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderActionTarget", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books22BookReaderActionTarget_delegate);
}

@end
