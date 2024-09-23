@implementation ArtistRadioStationController

- (void)dealloc
{
  _TtC16MusicApplication28ArtistRadioStationController *v2;

  v2 = self;
  sub_5C1D10();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_modelObject));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_artistContainerURL, &qword_14AED20);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_presentationSource, (uint64_t *)&unk_14AD380);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_radioStationStoreItemMetadata));
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_playbackCompletionHandler), *(_QWORD *)&self->modelObject[OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_playbackCompletionHandler]);
}

- (_TtC16MusicApplication28ArtistRadioStationController)init
{
  _TtC16MusicApplication28ArtistRadioStationController *result;

  result = (_TtC16MusicApplication28ArtistRadioStationController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ArtistRadioStationController", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
