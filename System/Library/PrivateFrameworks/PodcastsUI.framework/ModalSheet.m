@implementation ModalSheet

+ (id)presentableViewController:(id)a3 height:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)_s10PodcastsUI10ModalSheetC25presentableViewController_6heightSo06UIViewG0CAG_12CoreGraphics7CGFloatVtFZ_0(v5, a4);

  return v6;
}

- (_TtC10PodcastsUI10ModalSheet)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s10PodcastsUI10ModalSheetC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC10PodcastsUI10ModalSheet *v2;

  v2 = self;
  sub_1DA5BDC10();

}

- (void)handleButton:(id)a3
{
  _TtC10PodcastsUI10ModalSheet *v4;
  _TtC10PodcastsUI10ModalSheet *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DA670360();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1DA5BD51C((uint64_t)v6);

  sub_1DA480E84((uint64_t)v6);
}

- (_TtC10PodcastsUI10ModalSheet)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10PodcastsUI10ModalSheet *result;

  v4 = a4;
  result = (_TtC10PodcastsUI10ModalSheet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI10ModalSheet____lazy_storage___marginGuide));
}

@end
