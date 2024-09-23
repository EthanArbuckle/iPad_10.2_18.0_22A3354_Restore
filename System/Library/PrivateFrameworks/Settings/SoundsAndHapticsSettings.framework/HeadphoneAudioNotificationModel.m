@implementation HeadphoneAudioNotificationModel

+ (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel)shared
{
  if (qword_255A16068 != -1)
    swift_once();
  return (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel *)(id)static HeadphoneAudioNotificationModel.shared;
}

- (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel)init
{
  _TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel *v3;
  objc_super v5;
  uint64_t v6;

  swift_beginAccess();
  v6 = MEMORY[0x24BEE4AF8];
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A160D8);
  sub_228D31D18();
  swift_endAccess();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for HeadphoneAudioNotificationModel();
  return -[HeadphoneAudioNotificationModel init](&v5, sel_init);
}

- (void)setData:(id)a3
{
  uint64_t v4;
  _TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16410);
  v4 = sub_228D31FF4();
  v5 = self;
  HeadphoneAudioNotificationModel.setData(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel__data;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16418);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
