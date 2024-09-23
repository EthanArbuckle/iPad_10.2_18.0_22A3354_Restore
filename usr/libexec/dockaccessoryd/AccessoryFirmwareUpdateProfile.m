@implementation AccessoryFirmwareUpdateProfile

- (_TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile)init
{
  return (_TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile *)sub_100117A28();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->updateDuration[OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile_stagedFirmwareVersion]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile_stagingNotReadyReasons));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile_updateNotReadyReasons));
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd30AccessoryFirmwareUpdateProfile_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
