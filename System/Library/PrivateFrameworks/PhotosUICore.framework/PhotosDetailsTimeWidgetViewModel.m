@implementation PhotosDetailsTimeWidgetViewModel

- (void)clipBoardChangedWithPasteboardNotification:(id)a3
{
  id v4;
  _TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1A6943624(v4);

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  _TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1A6943870(v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel__cloudLocalState;
  sub_1A6943554(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel__date;
  sub_1A69430A4(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsTimeWidgetViewModel__timeZone;
  sub_1A6943570(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

@end
