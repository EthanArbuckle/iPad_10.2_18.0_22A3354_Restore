@implementation VerticalStackViewController.Item

- (NSString)debugDescription
{
  _TtCC16MusicApplication27VerticalStackViewController4Item *v2;
  NSString v3;

  v2 = self;
  sub_AF8B20();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtCC16MusicApplication27VerticalStackViewController4Item)init
{
  _TtCC16MusicApplication27VerticalStackViewController4Item *result;

  result = (_TtCC16MusicApplication27VerticalStackViewController4Item *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.Item", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController4Item_scrollViewOffsetObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController4Item_scrollViewSizeObserver));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController4Item_viewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController4Item_verticalStackViewController);
}

@end
