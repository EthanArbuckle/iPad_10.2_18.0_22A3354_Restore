@implementation LibrarySideBarManager

- (_TtC8VideosUI21LibrarySideBarManager)init
{
  return (_TtC8VideosUI21LibrarySideBarManager *)sub_1D9EBCFC0();
}

- (void)dealloc
{
  _TtC8VideosUI21LibrarySideBarManager *v2;

  v2 = self;
  sub_1D9EBD648();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI21LibrarySideBarManager_delegate);

  sub_1D9B47F8C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC8VideosUI21LibrarySideBarManager____lazy_storage___downloadItem));
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_155_16();
  OUTLINED_FUNCTION_155_16();
  OUTLINED_FUNCTION_155_16();
  swift_release();
  swift_release();
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4;
  _TtC8VideosUI21LibrarySideBarManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D9EC0230();

}

- (void)networkReachabilityDidChange:(id)a3
{
  sub_1D9EC0ED8(self, (uint64_t)a2, (uint64_t)a3, sub_1D9EC094C);
}

- (void)accountsChanged:(id)a3
{
  sub_1D9EC0ED8(self, (uint64_t)a2, (uint64_t)a3, sub_1D9EC0A40);
}

- (void)deviceMediaLibraryUpdateStateDidChange
{
  _TtC8VideosUI21LibrarySideBarManager *v2;

  v2 = self;
  sub_1D9EC0C18();

}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
  sub_1D9EC0ED8(self, (uint64_t)a2, (uint64_t)a3, sub_1D9EC0E10);
}

@end
