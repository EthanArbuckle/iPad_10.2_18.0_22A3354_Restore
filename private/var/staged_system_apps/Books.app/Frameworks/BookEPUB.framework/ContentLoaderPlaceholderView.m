@implementation ContentLoaderPlaceholderView

- (_TtC8BookEPUB28ContentLoaderPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_51FC8();
}

- (void)dealloc
{
  void *v3;
  _TtC8BookEPUB28ContentLoaderPlaceholderView *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_watchdogTimer);
  v4 = self;
  if (v3)
    objc_msgSend(v3, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ContentLoaderPlaceholderView(0);
  -[ContentLoaderPlaceholderView dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_scrollView));
  sub_52128((uint64_t)self + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_url, (uint64_t *)&unk_3B8C50);
  swift_bridgeObjectRelease(*(_QWORD *)&self->ContentLoadShowReloadOptionTimeout[OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_be_configurationKey]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_watchdogTimer));
  swift_release(*(_QWORD *)&self->ContentLoadShowReloadOptionTimeout[OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_reloadAction]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView____lazy_storage___activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView____lazy_storage___reloadView));
}

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC8BookEPUB28ContentLoaderPlaceholderView *v6;

  v5 = a3;
  v6 = self;
  sub_51070((uint64_t)a3);

}

- (_TtC8BookEPUB28ContentLoaderPlaceholderView)initWithFrame:(CGRect)a3
{
  sub_517C8((uint64_t)self, (uint64_t)a2, (uint64_t)"BookEPUB.ContentLoaderPlaceholderView", 37);
}

@end
