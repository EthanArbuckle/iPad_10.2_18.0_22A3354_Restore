@implementation AppReviewRequestManager

- (void)appleAccountChanged
{
  _TtC8StocksUI23AppReviewRequestManager *v2;

  v2 = self;
  swift_retain();
  sub_1DC402CA4();

  swift_release();
}

- (_TtC8StocksUI23AppReviewRequestManager)init
{
  _TtC8StocksUI23AppReviewRequestManager *result;

  result = (_TtC8StocksUI23AppReviewRequestManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_store);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_userInfo);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_appConfigurationManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager_featureAvailability);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1DC0926D8((uint64_t)self + OBJC_IVAR____TtC8StocksUI23AppReviewRequestManager____lazy_storage___appReviewPromptConfig, (uint64_t (*)(_QWORD))sub_1DC133914);
}

@end
