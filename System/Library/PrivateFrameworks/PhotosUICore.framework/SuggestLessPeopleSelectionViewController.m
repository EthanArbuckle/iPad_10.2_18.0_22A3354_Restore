@implementation SuggestLessPeopleSelectionViewController

- (_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController)initWithPeople:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *v9;

  v6 = _Block_copy(a5);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
  v7 = sub_1A7AE3A10();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  swift_unknownObjectRetain();
  v9 = (_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *)sub_1A704C8C4(v7, (uint64_t)a4, (uint64_t)sub_1A687EE84, v8);
  swift_unknownObjectRelease();
  swift_release();
  return v9;
}

- (_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *result;

  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore40SuggestLessPeopleSelectionViewController_completionHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SuggestLessPeopleSelectionViewController();
  v2 = v3.receiver;
  -[SuggestLessPeopleSelectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  objc_msgSend(v2, sel_setupSelectionView, v3.receiver, v3.super_class);

}

- (void)setupSelectionView
{
  _TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *v2;

  v2 = self;
  sub_1A7049534();

}

- (_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *result;

  v4 = a4;
  result = (_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore40SuggestLessPeopleSelectionViewController_delegate);
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICore40SuggestLessPeopleSelectionViewController_completionHandler));
}

@end
