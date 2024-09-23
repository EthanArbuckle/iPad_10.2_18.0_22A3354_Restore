@implementation FooterViewCoordinator

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v6;
  _TtC12PhotosUICore21FooterViewCoordinator *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1A6F84D70(a4);

  swift_unknownObjectRelease();
}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  id v4;
  _TtC12PhotosUICore21FooterViewCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1A6F84F00(v4);

}

- (_TtC12PhotosUICore21FooterViewCoordinator)init
{
  _TtC12PhotosUICore21FooterViewCoordinator *result;

  result = (_TtC12PhotosUICore21FooterViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end
