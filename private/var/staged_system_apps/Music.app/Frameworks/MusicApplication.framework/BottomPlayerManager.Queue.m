@implementation BottomPlayerManager.Queue

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  id v7;
  _TtCC16MusicApplication19BottomPlayerManager5Queue *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_23A1AC(v7, (char *)v8, (void (**)(_QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (_TtCC16MusicApplication19BottomPlayerManager5Queue)init
{
  _TtCC16MusicApplication19BottomPlayerManager5Queue *result;

  result = (_TtCC16MusicApplication19BottomPlayerManager5Queue *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.Queue", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCC16MusicApplication19BottomPlayerManager5Queue__response;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14BAF20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(_QWORD *)&self->path[OBJC_IVAR____TtCC16MusicApplication19BottomPlayerManager5Queue_hashedDSID]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19BottomPlayerManager5Queue_playerRequestController));
}

@end
