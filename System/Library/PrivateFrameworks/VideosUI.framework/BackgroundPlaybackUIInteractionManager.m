@implementation BackgroundPlaybackUIInteractionManager

- (_TtC8VideosUI38BackgroundPlaybackUIInteractionManager)init
{
  sub_1D9D87544();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_backgroundMediaController));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_hostingView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_swipeUpView);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_fullscreenTransitionHandler);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_playbackStateChangeHandler);
  OUTLINED_FUNCTION_50_2(OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_updateUICompletionHandler);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI38BackgroundPlaybackUIInteractionManager_menuGestureRecognizer);
  swift_release();
  swift_release();
  swift_release();
}

- (void)onSwipeUp
{
  _TtC8VideosUI38BackgroundPlaybackUIInteractionManager *v2;

  v2 = self;
  sub_1D9D8775C();

}

@end
