@implementation AudiobookNowPlayingDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC5Books30AudiobookNowPlayingDataManager *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  v5 = self;
  objc_msgSend(v4, "removeObserver:", v5);
  v6 = objc_msgSend(*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_libraryItemStateProvider), "stateCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[AudiobookNowPlayingDataManager dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_assetService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_libraryItemStateProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_sourceLabel]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_productProfile));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_sharedStateProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_persistenceController));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_contextMenuProvider));
  v3 = (char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_firstLaunchTimestampKey]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_storeID]);
}

- (_TtC5Books30AudiobookNowPlayingDataManager)init
{
  _TtC5Books30AudiobookNowPlayingDataManager *result;

  result = (_TtC5Books30AudiobookNowPlayingDataManager *)_swift_stdlib_reportUnimplementedInitializer("Books.AudiobookNowPlayingDataManager", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)audiobookBuyButtonProgressDidChangeTo:(double)a3
{
  uint64_t Strong;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC5Books30AudiobookNowPlayingDataManager *v11;
  _BYTE v12[24];

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_delegate);
  if (Strong)
  {
    v6 = Strong;
    v7 = (_QWORD *)(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_buyButtonPresenter);
    swift_beginAccess(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_buyButtonPresenter, v12, 0, 0);
    v8 = v7[3];
    if (v8)
    {
      sub_10003F198(v7, v8);
      sub_100009E04(0, (unint64_t *)&qword_1009CEC30, OS_dispatch_queue_ptr);
      v9 = swift_allocObject(&unk_100904048, 24, 7);
      swift_unknownObjectWeakInit(v9 + 16);
      v10 = swift_allocObject(&unk_100904070, 32, 7);
      *(_QWORD *)(v10 + 16) = v9;
      *(double *)(v10 + 24) = a3;
      v11 = self;
      swift_retain(v9);
      static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_1003FBF54, v10);

      swift_unknownObjectRelease(v6);
      swift_release(v9);
      swift_release(v10);
    }
    else
    {
      swift_unknownObjectRelease(v6);
    }
  }
}

- (void)audiobookCoverWillChangeTo:(CGImage *)a3
{
  uint64_t Strong;
  uint64_t v6;
  CGImage *v7;
  _TtC5Books30AudiobookNowPlayingDataManager *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_delegate);
  if (Strong)
  {
    v6 = Strong;
    if (a3)
    {
      v7 = a3;
      v8 = self;
      sub_1002A4684(a3);

    }
    swift_unknownObjectRelease(v6);
  }
}

- (void)audiobookIsStreamingDidChangeTo:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_streaming) = a3;
}

- (void)audiobookProductProfileDidChangeTo:(id)a3
{
  uint64_t v4;
  _TtC5Books30AudiobookNowPlayingDataManager *v5;

  if (a3)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v4 = 0;
  v5 = self;
  sub_1003F8300(v4);

  swift_bridgeObjectRelease(v4);
}

- (void)audiobookStoreIDDidChangeTo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_storeID);
  v7 = *(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_storeID];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (void)audiobookPreorderStateChangedTo:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Books30AudiobookNowPlayingDataManager *v4;

  v3 = a3;
  v4 = self;
  sub_1003F8434(v3);

}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  sub_1003F87D0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1003F84EC);
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
  sub_1003F87D0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1003F86C8);
}

- (void)player:(id)a3 artworkDidChange:(CGImage *)a4
{
  CGImage *v7;
  _TtC5Books30AudiobookNowPlayingDataManager *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_1003F8848((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);

}

- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6
{
  _TtC5Books30AudiobookNowPlayingDataManager *v11;

  swift_unknownObjectRetain(a3);
  v11 = self;
  sub_1003F8BE0((uint64_t)a3, a5, a4, a6);
  swift_unknownObjectRelease(a3);

}

- (void)player:(id)a3 bufferedPositionsDidChangeInChapter:(unint64_t)a4 bufferInfo:(id)a5
{
  id v9;
  _TtC5Books30AudiobookNowPlayingDataManager *v10;

  swift_unknownObjectRetain(a3);
  v9 = a5;
  v10 = self;
  sub_1003F8D50(a3, (char **)a4, v9);
  swift_unknownObjectRelease(a3);

}

- (void)player:(id)a3 failedWithError:(id)a4
{
  _TtC5Books30AudiobookNowPlayingDataManager *v7;
  id v8;

  swift_unknownObjectRetain(a3);
  v8 = a4;
  v7 = self;
  sub_1003F91C0(a3, (uint64_t)v8);
  swift_unknownObjectRelease(a3);

}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
  sub_1003FA23C(self, a4, (uint64_t)a2, (uint64_t)a3, sub_1003F9B38);
}

- (void)player:(id)a3 isScrubbing:(BOOL)a4
{
  _TtC5Books30AudiobookNowPlayingDataManager *v7;

  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_1003F9F00((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);

}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  _TtC5Books30AudiobookNowPlayingDataManager *v8;

  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_1003FB52C((uint64_t)a3, a5);
  swift_unknownObjectRelease(a3);

}

- (void)player:(id)a3 volumeDidChange:(float)a4
{
  sub_1003FA23C(self, a4, (uint64_t)a2, (uint64_t)a3, sub_1003FA0D0);
}

- (void)player:(id)a3 isStalling:(BOOL)a4 isLoadingResources:(BOOL)a5
{
  _TtC5Books30AudiobookNowPlayingDataManager *v9;

  swift_unknownObjectRetain(a3);
  v9 = self;
  sub_1003FA2AC((uint64_t)a3, a4, a5);
  swift_unknownObjectRelease(a3);

}

- (void)sleepTimerEnabled:(id)a3
{
  id v4;
  _TtC5Books30AudiobookNowPlayingDataManager *v5;

  v4 = a3;
  v5 = self;
  sub_1003FB5F8((uint64_t)&unk_100903EE0, (uint64_t)sub_1003FBD8C, (uint64_t)&unk_100903EF8);

}

- (void)sleepTimerDidExpire:(id)a3
{
  id v4;
  _TtC5Books30AudiobookNowPlayingDataManager *v5;

  v4 = a3;
  v5 = self;
  sub_1003FB5F8((uint64_t)&unk_100903E90, (uint64_t)sub_1003FBF90, (uint64_t)&unk_100903EA8);

}

- (void)sleepTimerCanceled:(id)a3
{
  id v4;
  _TtC5Books30AudiobookNowPlayingDataManager *v5;

  v4 = a3;
  v5 = self;
  sub_1003FB5F8((uint64_t)&unk_100903E40, (uint64_t)sub_1003FBD74, (uint64_t)&unk_100903E58);

}

- (void)sleepTimer:(id)a3 remainingTimeDidUpdate:(double)a4
{
  id v6;
  _TtC5Books30AudiobookNowPlayingDataManager *v7;

  v6 = a3;
  v7 = self;
  sub_1003FB800(a4);

}

- (void)skipController:(id)a3 willBeginSkippingInDirection:(unint64_t)a4
{
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Books30AudiobookNowPlayingDataManager *v11;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_delegate);
    if (v8)
    {
      v9 = v8;
      v10 = a3;
      v11 = self;
      sub_1004CC398(1u);

      swift_unknownObjectRelease(v7);
      v7 = v9;
    }
    swift_unknownObjectRelease(v7);
  }
}

- (void)skipController:(id)a3 updatedCumulativeDelta:(double)a4
{
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t KeyPath;
  uint64_t v13;
  id v14;
  _TtC5Books30AudiobookNowPlayingDataManager *v15;
  double v16;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_delegate);
  if (Strong)
  {
    v8 = Strong;
    v9 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_delegate);
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(v9 + 16);
      KeyPath = swift_getKeyPath(&unk_100722490);
      v13 = swift_getKeyPath(&unk_1007224B8);
      v16 = a4;
      v14 = a3;
      v15 = self;
      static Published.subscript.setter(&v16, v11, KeyPath, v13);

      swift_unknownObjectRelease(v8);
      swift_unknownObjectRelease(v10);
    }
    else
    {
      swift_unknownObjectRelease(v8);
    }
  }
}

- (void)skipControllerDidEndSkipping:(id)a3 actionSource:(unint64_t)a4
{
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Books30AudiobookNowPlayingDataManager *v11;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_delegate);
    if (v8)
    {
      v9 = v8;
      v10 = a3;
      v11 = self;
      sub_1004CC398(0);

      swift_unknownObjectRelease(v7);
      v7 = v9;
    }
    swift_unknownObjectRelease(v7);
  }
}

- (void)skipControllerSettingsDidChange:(id)a3
{
  id v4;
  _TtC5Books30AudiobookNowPlayingDataManager *v5;

  v4 = a3;
  v5 = self;
  sub_1003FAAB8(v4);

}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  return 0;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (void)libraryItemStateCenter:(id)a3 didUpdateItemState:(id)a4 forIdentifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC5Books30AudiobookNowPlayingDataManager *v12;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  swift_unknownObjectRetain(a4);
  v12 = self;
  sub_1003FBA24((uint64_t)a4, v8, v10);

  swift_unknownObjectRelease(a4);
  swift_bridgeObjectRelease(v10);
}

@end
