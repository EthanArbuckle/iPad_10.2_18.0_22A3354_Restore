@implementation ProxyPlayerController

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _TtC11PodcastsKit21ProxyPlayerController *v13;
  _QWORD v14[6];

  v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_22FB2DAF4;
  }
  else
  {
    v9 = 0;
  }
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  *(_QWORD *)(v10 + 24) = v9;
  v14[4] = sub_22FB2DAAC;
  v14[5] = v10;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_22FB2CF48;
  v14[3] = &block_descriptor_9;
  v11 = _Block_copy(v14);
  v12 = a3;
  v13 = self;
  sub_22FB2DAD4((uint64_t)v8);
  swift_release();
  -[ProxyPlayerController setManifest:startPlayback:detailedCompletion:](v13, sel_setManifest_startPlayback_detailedCompletion_, v12, v5, v11);
  _Block_release(v11);
  sub_22FB2DAE4((uint64_t)v8);

}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 detailedCompletion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC11PodcastsKit21ProxyPlayerController *v11;

  v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_22FB2D9D0;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_22FB2D0F4((uint64_t)v10, v5, (uint64_t)v8, v9);
  sub_22FB2DAE4((uint64_t)v8);

}

- (_TtC11PodcastsKit21ProxyPlayerController)init
{
  return (_TtC11PodcastsKit21ProxyPlayerController *)sub_22FB32A10();
}

- (PKEpisode)currentEpisode
{
  return (PKEpisode *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_currentEpisode));
}

- (void)setCurrentEpisode:(id)a3
{
  void *v4;
  _TtC11PodcastsKit21ProxyPlayerController *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_currentEpisode);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_currentEpisode) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_22FB32B84(v4);

}

- (PKDurationSnapshot)durationSnapshot
{
  _TtC11PodcastsKit21ProxyPlayerController *v2;
  id v3;

  v2 = self;
  v3 = sub_22FB32D24();

  return (PKDurationSnapshot *)v3;
}

- (void)playWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC11PodcastsKit21ProxyPlayerController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_22FB32564;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_22FB32E4C((uint64_t)v7, v6);
  sub_22FB2DAE4((uint64_t)v7);

}

- (void)playWithDetailedCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  _TtC11PodcastsKit21ProxyPlayerController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_22FB2D9D0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_22FB32EF4((uint64_t)v7, v6);
  sub_22FB2DAE4((uint64_t)v7);

}

- (void)pauseWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC11PodcastsKit21ProxyPlayerController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_22FB32564;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_22FB32F9C((uint64_t)v7, v6);
  sub_22FB2DAE4((uint64_t)v7);

}

- (void)startPlayback:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC11PodcastsKit21ProxyPlayerController *v10;
  id v11;
  _TtC11PodcastsKit21ProxyPlayerController *v12;
  _QWORD v13[6];

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_22FB32564;
    v13[4] = sub_22FB32564;
    v13[5] = v7;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_22FB33168;
    v13[3] = &block_descriptor_100;
    v8 = _Block_copy(v13);
    v9 = a3;
    v10 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v11 = a3;
    v12 = self;
    v8 = 0;
  }
  -[ProxyPlayerController setManifest:startPlayback:completion:](self, sel_setManifest_startPlayback_completion_, a3, 1, v8);
  _Block_release(v8);
  sub_22FB2DAE4((uint64_t)v6);

}

- (void)seekToPositionWithElapsedTime:(double)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)();
  _TtC11PodcastsKit21ProxyPlayerController *v10;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    v9 = sub_22FB32564;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v10 = self;
  sub_22FB332B4((uint64_t)v9, v8, a3);
  sub_22FB2DAE4((uint64_t)v9);

}

- (void)jumpForwardsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC11PodcastsKit21ProxyPlayerController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_22FB32564;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_22FB33508((uint64_t)v7, v6);
  sub_22FB2DAE4((uint64_t)v7);

}

- (void)jumpBackwardsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC11PodcastsKit21ProxyPlayerController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_22FB32460;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_22FB335C4((uint64_t)v7, v6);
  sub_22FB2DAE4((uint64_t)v7);

}

- (double)forwardJumpDuration
{
  _TtC11PodcastsKit21ProxyPlayerController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_22FB33860();
  v4 = v3;

  return v4;
}

- (double)backwardJumpDuration
{
  _TtC11PodcastsKit21ProxyPlayerController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_22FB33A44();
  v4 = v3;

  return v4;
}

- (id)playerResponseHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler))
    return 0;
  v2 = *(_QWORD *)&self->currentEpisode[OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler];
  v5[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_22FB2EA24;
  v5[3] = &block_descriptor_82;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setPlayerResponseHandler:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_22FB37038;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler);
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_22FB2DAE4(v8);
}

- (void).cxx_destruct
{

  sub_22FB2DAE4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_requestResponseController));
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC11PodcastsKit21ProxyPlayerController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_22FB36C74((uint64_t)sub_22FB36C68, v7);

  swift_release();
}

@end
