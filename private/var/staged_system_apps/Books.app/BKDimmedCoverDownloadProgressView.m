@implementation BKDimmedCoverDownloadProgressView

- (BKDimmedCoverDownloadProgressViewDelegate)delegate
{
  return (BKDimmedCoverDownloadProgressViewDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___BKDimmedCoverDownloadProgressView_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKDimmedCoverDownloadProgressView_delegate, a3);
}

- (BKLibraryAsset)asset
{
  return (BKLibraryAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR___BKDimmedCoverDownloadProgressView_asset));
}

- (void)setAsset:(id)a3
{
  BKDimmedCoverDownloadProgressView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100289B00(a3);

}

- (void)stopDownloadButtonPressed
{
  void *v2;
  uint64_t Strong;
  void *v5;
  BKDimmedCoverDownloadProgressView *v6;
  id v7;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKDimmedCoverDownloadProgressView_asset);
  if (v2)
  {
    Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___BKDimmedCoverDownloadProgressView_delegate);
    if (Strong)
    {
      v5 = (void *)Strong;
      v6 = self;
      v7 = v2;
      objc_msgSend(v5, "didTapStopDownloadButtonWithAsset:", v7);

      swift_unknownObjectRelease(v5);
    }
  }
}

- (BKDimmedCoverDownloadProgressView)initWithFrame:(CGRect)a3
{
  return (BKDimmedCoverDownloadProgressView *)sub_100289794(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKDimmedCoverDownloadProgressView)initWithCoder:(id)a3
{
  return (BKDimmedCoverDownloadProgressView *)sub_100289888(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKDimmedCoverDownloadProgressView_downloadProgressButton));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___BKDimmedCoverDownloadProgressView_progressObservers));

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKDimmedCoverDownloadProgressView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKDimmedCoverDownloadProgressView_downloadProgressStatus));

}

@end
