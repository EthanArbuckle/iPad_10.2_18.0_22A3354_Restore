@implementation BlueMoonStubPlayerAdapter

- (_TtC8Podcasts25BlueMoonStubPlayerAdapter)init
{
  return (_TtC8Podcasts25BlueMoonStubPlayerAdapter *)sub_100319424();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts25BlueMoonStubPlayerAdapter____lazy_storage___playerPathCoordinator));

  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_playerPathCoordinator[OBJC_IVAR____TtC8Podcasts25BlueMoonStubPlayerAdapter_currentItemPlainEpisodeNotes]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts25BlueMoonStubPlayerAdapter_currentItemEpisodeNotes));

  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_playerPathCoordinator[OBJC_IVAR____TtC8Podcasts25BlueMoonStubPlayerAdapter_explicitCharacter]);
}

@end
