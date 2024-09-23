@implementation ModalSheetWrapper

- (void)loadView
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  _TtC10PodcastsUI17ModalSheetWrapper *v9;
  _TtC10PodcastsUI17ModalSheetWrapper *v10;
  objc_super v11;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_minWidth);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_height);
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_maxSize);
  v6 = (objc_class *)type metadata accessor for SheetView();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____TtC10PodcastsUI9SheetView_sizeRestrictions];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v4;
  *((_QWORD *)v8 + 2) = v5;
  *((_QWORD *)v8 + 3) = v4;
  v11.receiver = v7;
  v11.super_class = v6;
  v9 = self;
  v10 = -[ModalSheetWrapper initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[ModalSheetWrapper setView:](v9, sel_setView_, v10, v11.receiver, v11.super_class);

}

- (_TtC10PodcastsUI17ModalSheetWrapper)initWithCoder:(id)a3
{
  id v4;
  _TtC10PodcastsUI17ModalSheetWrapper *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_minWidth) = (Class)0x407C200000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_maxSize) = (Class)0x4085E00000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper____lazy_storage___separatorView) = 0;
  v4 = a3;

  result = (_TtC10PodcastsUI17ModalSheetWrapper *)sub_1DA670570();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC10PodcastsUI17ModalSheetWrapper *v2;

  v2 = self;
  sub_1DA5BE5EC();

}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ModalSheetWrapper();
  -[ModalSheetWrapper viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ModalSheetWrapper();
  v4 = v7.receiver;
  -[ModalSheetWrapper viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 1, 0);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI17ModalSheetWrapper____lazy_storage___separatorView));
}

@end
