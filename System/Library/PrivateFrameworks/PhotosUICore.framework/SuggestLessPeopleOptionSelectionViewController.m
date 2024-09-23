@implementation SuggestLessPeopleOptionSelectionViewController

- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithPeople:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *v9;

  v6 = _Block_copy(a5);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
  v7 = sub_1A7AE3A10();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  swift_unknownObjectRetain();
  v9 = (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *)sub_1A6D8C20C(v7, (uint64_t)a4, (uint64_t)sub_1A687EE84, v8);
  swift_unknownObjectRelease();
  swift_release();
  return v9;
}

- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *result;

  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController_completionHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SuggestLessPeopleOptionSelectionViewController();
  v2 = v3.receiver;
  -[SuggestLessPeopleOptionSelectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  objc_msgSend(v2, sel_setupOptionSelectionView, v3.receiver, v3.super_class);

}

- (void)setupOptionSelectionView
{
  _TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *v2;

  v2 = self;
  sub_1A6D884D4();

}

- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *result;

  v4 = a4;
  result = (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController_delegate);
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController_completionHandler));
}

@end
