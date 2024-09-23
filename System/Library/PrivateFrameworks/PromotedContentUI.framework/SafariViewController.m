@implementation SafariViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC17PromotedContentUI20SafariViewController *v4;

  v4 = self;
  sub_1B12E39D8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC17PromotedContentUI20SafariViewController *v4;

  v4 = self;
  sub_1B12E4164(a3);

}

- (_TtC17PromotedContentUI20SafariViewController)initWithURL:(id)a3 configuration:(id)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _TtC17PromotedContentUI20SafariViewController *v15;
  objc_super v17;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_1B1371DC4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationCloseObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationOpenObserver) = 0;
  v11 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_backgroundedTime;
  v12 = sub_1B1371EB4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_actionDelegate) = 0;
  swift_unknownObjectWeakInit();
  v13 = a4;
  v14 = (void *)sub_1B1371D88();
  v17.receiver = self;
  v17.super_class = ObjectType;
  v15 = -[SafariViewController initWithURL:configuration:](&v17, sel_initWithURL_configuration_, v14, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (_TtC17PromotedContentUI20SafariViewController)initWithURL:(id)a3 entersReaderIfAvailable:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  _TtC17PromotedContentUI20SafariViewController *v14;
  objc_super v16;

  v4 = a4;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_1B1371DC4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationCloseObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationOpenObserver) = 0;
  v11 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_backgroundedTime;
  v12 = sub_1B1371EB4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_actionDelegate) = 0;
  swift_unknownObjectWeakInit();
  v13 = (void *)sub_1B1371D88();
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = -[SafariViewController initWithURL:entersReaderIfAvailable:](&v16, sel_initWithURL_entersReaderIfAvailable_, v13, v4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B12D0D40((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_backgroundedTime, (uint64_t *)&unk_1ED3893B0);
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_actionDelegate);
}

@end
