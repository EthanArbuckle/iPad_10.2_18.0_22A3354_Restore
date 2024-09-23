@implementation MTPlaybackPositionController

- (void)updatePlaybackPositionWithEpisodeStoreId:(int64_t)a3 completed:(BOOL)a4 position:(double)a5 account:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  void *v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  id v16;
  MTPlaybackPositionController *v17;

  v9 = a4;
  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A47B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A9405520;
  if (a3 < 0)
  {
    sub_1A93F8E08();
    __break(1u);
  }
  else
  {
    v15 = inited;
    *(_QWORD *)(inited + 32) = a3;
    v16 = a6;
    v17 = self;
    sub_1A9175A68(v15, v9, a6, (uint64_t)sub_1A9115814, v13, a5);
    swift_setDeallocating();

    swift_release();
  }
}

- (MTPlaybackPositionController)init
{
  uint64_t v3;
  id v4;
  MTPlaybackPositionController *v5;
  objc_super v7;

  v3 = OBJC_IVAR___MTPlaybackPositionController_requestController;
  v4 = objc_allocWithZone((Class)type metadata accessor for MediaRequestController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for PlaybackPositionController();
  return -[MTPlaybackPositionController init](&v7, sel_init);
}

- (void).cxx_destruct
{

}

@end
