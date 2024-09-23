@implementation BKAudiobookPresenterAssetStatus

- (BOOL)assetAudiobookStatusIsPlaying
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusIsPlaying);
}

- (void)setAssetAudiobookStatusPlaying:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusIsPlaying) = a3;
}

- (double)assetAudiobookStatusTrackDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackDuration);
}

- (void)setAssetAudiobookStatusTrackDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackDuration) = a3;
}

- (double)assetAudiobookStatusTrackProgress
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackProgress);
}

- (void)setAssetAudiobookStatusTrackProgress:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackProgress) = a3;
}

- (double)assetAudiobookStatusTrackTimeRemaining
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackTimeRemaining);
}

- (void)setAssetAudiobookStatusTrackTimeRemaining:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackTimeRemaining) = a3;
}

- (void)assetAudiobookStatusTogglePlayPause
{
  BKAudiobookPresenterAssetStatus *v2;

  v2 = self;
  sub_1004CC854();

}

- (BKAudiobookPresenterAssetStatus)init
{
  char *v3;
  objc_super v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusIsPlaying) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackDuration) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackProgress) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackTimeRemaining) = 0;
  v3 = (char *)self + OBJC_IVAR___BKAudiobookPresenterAssetStatus_delegate;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookNowPlayingPresenterAssetStatus();
  return -[BKAudiobookPresenterAssetStatus init](&v5, "init");
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKAudiobookPresenterAssetStatus_delegate);
}

@end
