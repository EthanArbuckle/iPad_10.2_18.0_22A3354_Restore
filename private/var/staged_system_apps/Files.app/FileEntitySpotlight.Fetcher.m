@implementation FileEntitySpotlight.Fetcher

- (_TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher)init
{
  _TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher *result;

  result = (_TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher *)_swift_stdlib_reportUnimplementedInitializer("Files.Fetcher", 13, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100087534(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher_completionHandler), *(_QWORD *)&self->completionHandler[OBJC_IVAR____TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher_completionHandler]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher_queryCollection));
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4;
  _TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher *v5;

  v4 = a3;
  v5 = self;
  sub_1002A1720(v4);

}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

@end
