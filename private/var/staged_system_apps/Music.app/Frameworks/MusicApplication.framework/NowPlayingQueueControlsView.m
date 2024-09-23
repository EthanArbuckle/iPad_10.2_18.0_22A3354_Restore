@implementation NowPlayingQueueControlsView

- (_TtC16MusicApplication27NowPlayingQueueControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication27NowPlayingQueueControlsView *)sub_2723E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication27NowPlayingQueueControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2747AC();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication27NowPlayingQueueControlsView *v2;

  v2 = self;
  sub_2744C0();

}

- (int64_t)accessibilityShuffleType
{
  if (self->contentView[OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_shuffleType])
    return 0;
  else
    return *(int64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_shuffleType);
}

- (int64_t)accessibilityRepeatType
{
  if (self->contentView[OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_repeatType])
    return 0;
  else
    return *(int64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_repeatType);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_autoPlayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_repeatButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_useListeningHistoryButton));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_autoPlayButtonAction), *(_QWORD *)&self->contentView[OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_autoPlayButtonAction]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_shuffleButtonAction), *(_QWORD *)&self->contentView[OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_shuffleButtonAction]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_repeatButtonAction), *(_QWORD *)&self->contentView[OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_repeatButtonAction]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_useListeningHistoryButtonAction), *(_QWORD *)&self->contentView[OBJC_IVAR____TtC16MusicApplication27NowPlayingQueueControlsView_useListeningHistoryButtonAction]);
}

@end
