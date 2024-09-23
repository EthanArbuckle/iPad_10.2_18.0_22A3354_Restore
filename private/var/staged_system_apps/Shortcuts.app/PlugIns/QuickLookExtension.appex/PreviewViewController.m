@implementation PreviewViewController

- (void)loadView
{
  _TtC18QuickLookExtension21PreviewViewController *v2;

  v2 = self;
  sub_10000369C();

}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _TtC18QuickLookExtension21PreviewViewController *v12;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  sub_10000606C();
  v10 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = swift_allocObject(&unk_100008660, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  sub_100003870(v4, (uint64_t)sub_100004EF4, v11);

  swift_release(v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
  sub_100006120();
}

- (_TtC18QuickLookExtension21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC18QuickLookExtension21PreviewViewController *result;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_100003B20(v5, v7, a4);
  sub_1000061A4();
  return result;
}

- (_TtC18QuickLookExtension21PreviewViewController)initWithCoder:(id)a3
{
  _TtC18QuickLookExtension21PreviewViewController *result;

  sub_100003BF0(a3);
  sub_100006058();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView));
}

@end
