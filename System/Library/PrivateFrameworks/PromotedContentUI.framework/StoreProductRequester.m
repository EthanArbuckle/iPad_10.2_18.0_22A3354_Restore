@implementation StoreProductRequester

- (_TtC17PromotedContentUI21StoreProductRequester)init
{
  _TtC17PromotedContentUI21StoreProductRequester *result;

  result = (_TtC17PromotedContentUI21StoreProductRequester *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionResult;
  v4 = sub_1B137225C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_adamIdentifier));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B12D0D40((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_backgroundedTime, (uint64_t *)&unk_1ED3893B0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController));
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  _TtC17PromotedContentUI21StoreProductRequester *v7;

  v6 = a3;
  v7 = self;
  sub_1B1343C54(a4);

}

@end
