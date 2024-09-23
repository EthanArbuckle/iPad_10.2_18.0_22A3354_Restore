@implementation LibMPSource

- (void)dealloc
{
  _TtC8VideosUI11LibMPSource *v2;

  v2 = self;
  sub_1D9C80FC0();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_3();
}

- (_TtC8VideosUI11LibMPSource)init
{
  sub_1D9C846B4();
}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  _TtC8VideosUI11LibMPSource *v7;
  id v8;
  _TtC8VideosUI11LibMPSource *v9;

  v7 = self;
  if (a4)
  {
    OUTLINED_FUNCTION_6_10((uint64_t)self, &qword_1F020B8D8);
    self = (_TtC8VideosUI11LibMPSource *)sub_1DA1440FC();
  }
  if (a5)
  {
    OUTLINED_FUNCTION_6_10((uint64_t)self, &qword_1F020B8D8);
    sub_1DA1440FC();
  }
  v8 = a3;
  v9 = v7;
  sub_1D9C846EC();

  OUTLINED_FUNCTION_22();
  swift_bridgeObjectRelease();
}

- (void)mpMediaLibraryContentChanged
{
  _TtC8VideosUI11LibMPSource *v2;

  v2 = self;
  sub_1D9C84950();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)mpMediaLibraryDownloadingDidChange
{
  _TtC8VideosUI11LibMPSource *v2;

  v2 = self;
  sub_1D9C84BE4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)refreshRentalMenu
{
  _TtC8VideosUI11LibMPSource *v2;

  v2 = self;
  sub_1D9C84CEC();
  OUTLINED_FUNCTION_5_8(v2);
}

@end
