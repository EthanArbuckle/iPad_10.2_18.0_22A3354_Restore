@implementation MRNowPlayingQueueHeaderView

- (_TtC5Music27MRNowPlayingQueueHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music27MRNowPlayingQueueHeaderView *)sub_1004EADFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music27MRNowPlayingQueueHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004EBABC();
}

- (void)trailingButtonAction:(id)a3
{
  _TtC5Music27MRNowPlayingQueueHeaderView *v5;
  void (*v6)(__n128);
  uint64_t v7;
  __n128 v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3, a2);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v9, a3);
  swift_unknownObjectRelease(a3);
  v6 = *(void (**)(__n128))((char *)&v5->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_trailingButtonAction);
  if (v6)
  {
    v7 = *(_QWORD *)&v5->title[OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_trailingButtonAction];
    v8 = swift_retain();
    v6(v8);
    sub_10004BA30((uint64_t)v6, v7);
  }

  _s5Music18DragDropToPlaylistV6OriginVwxx_0(v9);
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MRNowPlayingQueueHeaderView();
  v2 = (char *)v4.receiver;
  -[MRNowPlayingQueueHeaderView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_backgroundLayer];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_leadingImage));
  swift_bridgeObjectRelease();
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_trailingButtonAction), *(_QWORD *)&self->title[OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_trailingButtonAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_mainStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_titleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_metadataStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_leadingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music27MRNowPlayingQueueHeaderView_backgroundLayer));
}

@end
