@implementation SearchConfiguration

- (BEWebViewFactoryPaginationOptions)paginationOptions
{
  return (BEWebViewFactoryPaginationOptions *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_paginationOptions));
}

- (BEContentCleanupJSOptions)cleanupOptions
{
  return (BEContentCleanupJSOptions *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_cleanupOptions));
}

- (BEWebViewFactoryStylesheetSet)stylesheetSet
{
  return (BEWebViewFactoryStylesheetSet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_stylesheetSet));
}

- (CGSize)contentLayoutSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_contentLayoutSize);
  v3 = *(double *)&self->paginationOptions[OBJC_IVAR____TtC8BookEPUB19SearchConfiguration_contentLayoutSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC8BookEPUB19SearchConfiguration)init
{
  _TtC8BookEPUB19SearchConfiguration *result;

  result = (_TtC8BookEPUB19SearchConfiguration *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.SearchConfiguration", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
