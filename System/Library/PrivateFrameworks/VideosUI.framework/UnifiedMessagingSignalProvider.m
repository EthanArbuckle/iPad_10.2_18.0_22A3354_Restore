@implementation UnifiedMessagingSignalProvider

- (_TtC8VideosUI30UnifiedMessagingSignalProvider)init
{
  _TtC8VideosUI30UnifiedMessagingSignalProvider *result;

  sub_1D97BDED4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)dealloc
{
  _TtC8VideosUI30UnifiedMessagingSignalProvider *v2;

  v2 = self;
  sub_1D9DF1164();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI30UnifiedMessagingSignalProvider_downloadAndPurchaseAccessQueue));

}

- (void)handleActiveDownloadButtonsDidChange:(id)a3
{
  sub_1D9DF1D20(self, (uint64_t)a2, (uint64_t)a3, sub_1D9DF1348);
}

- (void)debounceActiveDownloadButtonDidChange
{
  self;
  OUTLINED_FUNCTION_143_21();
}

- (void)handleHasFavoriteTeamsDidChange:(id)a3
{
  sub_1D9DF23F4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D9DF1588);
}

- (void)handleIsPlaybackUIBeingShownDidChange:(id)a3
{
  sub_1D9DF1D20(self, (uint64_t)a2, (uint64_t)a3, sub_1D9DF17F4);
}

- (void)handleLibraryContentsDidChange:(id)a3
{
  sub_1D9DF1D90(self);
}

- (void)handleLocationStatusDidChange:(id)a3
{
  sub_1D9DF1D90(self);
}

- (void)handleNotifAuthStatusDidChange
{
  _TtC8VideosUI30UnifiedMessagingSignalProvider *v2;

  v2 = self;
  sub_1D9DF1E28();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)handleHasEventforTVPlus:(id)a3
{
  sub_1D9DF23F4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D9DF1F1C);
}

- (void)handleAppDidFinishLoading
{
  _TtC8VideosUI30UnifiedMessagingSignalProvider *v2;

  v2 = self;
  sub_1D97BF248();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)handleDownloadDidStart
{
  self;
  OUTLINED_FUNCTION_143_21();
}

- (void)handleGDPRDidAccept
{
  self;
  OUTLINED_FUNCTION_143_21();
}

@end
