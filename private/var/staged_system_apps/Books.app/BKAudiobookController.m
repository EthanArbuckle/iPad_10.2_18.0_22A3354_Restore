@implementation BKAudiobookController

- (BKAudiobookController)initWithPlayer:(id)a3 sleepTimer:(id)a4 bag:(id)a5 bridge:(id)a6
{
  return (BKAudiobookController *)sub_10042A388(a3, a4, a5, a6);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKAudiobookController_delegate, a3);
}

- (BKAudiobookControllerDelegate)delegate
{
  return (BKAudiobookControllerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___BKAudiobookController_delegate);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BKAudiobookController *v7;
  uint64_t v8;
  BKAudiobookController *v9;
  unsigned __int8 v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_10042A6B8((uint64_t)a3, (uint64_t)v12);

  sub_10004A7B8((uint64_t)v12);
  return v10 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  BKAudiobookController *v5;

  v4 = a3;
  v5 = self;
  sub_10042AC84(v4);

}

- (void)books_togglePlaying:(id)a3
{
  BKAudiobookController *v5;
  uint64_t v6;
  double v7;
  BKAudiobookController *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAudiobookController_player), "togglePlayPause", v7, v9, v10);

  sub_10004A7B8((uint64_t)&v9);
}

- (void)books_stopPlaying:(id)a3
{
  sub_100369CA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_10042B308);
}

- (void)books_skipForward:(id)a3
{
  sub_10042B430((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_forwardSkipTime, 1);
}

- (void)books_skipBackward:(id)a3
{
  sub_10042B430((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_backwardSkipTime, 0);
}

- (void)books_trackForward:(id)a3
{
  sub_10042B500((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_nextChapterOrRestartAudiobook);
}

- (void)books_trackBackward:(id)a3
{
  sub_10042B500((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_previousChapterOrRestartChapter);
}

- (void)books_increaseVolume:(id)a3
{
  BKAudiobookController *v5;
  uint64_t v6;
  double v7;
  BKAudiobookController *v8;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v8 = self;
  }
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAudiobookController_player);
  objc_msgSend(v9, "volume", v7, v11, v12);
  *(float *)&v10 = *(float *)&v10 + 0.1;
  if (*(float *)&v10 < 0.0)
    *(float *)&v10 = 0.0;
  if (*(float *)&v10 > 1.0)
    *(float *)&v10 = 1.0;
  objc_msgSend(v9, "setVolume:", v10);

  sub_10004A7B8((uint64_t)&v11);
}

- (void)books_decreaseVolume:(id)a3
{
  BKAudiobookController *v5;
  uint64_t v6;
  double v7;
  BKAudiobookController *v8;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v8 = self;
  }
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAudiobookController_player);
  objc_msgSend(v9, "volume", v7, v11, v12);
  *(float *)&v10 = *(float *)&v10 + -0.1;
  if (*(float *)&v10 < 0.0)
    *(float *)&v10 = 0.0;
  if (*(float *)&v10 > 1.0)
    *(float *)&v10 = 1.0;
  objc_msgSend(v9, "setVolume:", v10);

  sub_10004A7B8((uint64_t)&v11);
}

- (void)books_setPlaybackSpeed75Percent:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_player, (SEL *)&selRef_setPlaybackSpeed_, 0);
}

- (void)books_setPlaybackSpeed100Percent:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_player, (SEL *)&selRef_setPlaybackSpeed_, 1);
}

- (void)books_setPlaybackSpeed125Percent:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_player, (SEL *)&selRef_setPlaybackSpeed_, 2);
}

- (void)books_setPlaybackSpeed150Percent:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_player, (SEL *)&selRef_setPlaybackSpeed_, 3);
}

- (void)books_setPlaybackSpeed175Percent:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_player, (SEL *)&selRef_setPlaybackSpeed_, 4);
}

- (void)books_setPlaybackSpeed200Percent:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_player, (SEL *)&selRef_setPlaybackSpeed_, 5);
}

- (void)books_setSleepTimer5Minutes:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 2);
}

- (void)books_setSleepTimer10Minutes:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 3);
}

- (void)books_setSleepTimer15Minutes:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 4);
}

- (void)books_setSleepTimer30Minutes:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 5);
}

- (void)books_setSleepTimer45Minutes:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 6);
}

- (void)books_setSleepTimer1Hour:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 7);
}

- (void)books_setSleepTimerWhenCurrentChapterEnds:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 1);
}

- (void)books_unsetSleepTimer:(id)a3
{
  sub_10042B844((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKAudiobookController_sleepTimer, (SEL *)&selRef_setSleepTimerOption_, 0);
}

- (void)books_reportAudioIssue:(id)a3
{
  sub_100369CA0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_10042B8D8);
}

- (BKAudiobookController)init
{
  BKAudiobookController *result;

  result = (BKAudiobookController *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookController", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKAudiobookController_delegate);
}

@end
