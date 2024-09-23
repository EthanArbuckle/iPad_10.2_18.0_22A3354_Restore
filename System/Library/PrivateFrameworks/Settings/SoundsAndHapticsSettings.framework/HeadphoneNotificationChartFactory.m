@implementation HeadphoneNotificationChartFactory

+ (id)create
{
  void *v2;
  id v3;
  id v4;

  if (qword_255A16068 != -1)
    swift_once();
  v2 = (void *)static HeadphoneAudioNotificationModel.shared;
  type metadata accessor for HeadphoneAudioNotificationModel();
  sub_228D2D734(&qword_255A16070, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneAudioNotificationModel, (uint64_t)&protocol conformance descriptor for HeadphoneAudioNotificationModel);
  v3 = v2;
  sub_228D31D54();
  v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255A16078));
  return (id)sub_228D31DE4();
}

- (_TtC24SoundsAndHapticsSettings33HeadphoneNotificationChartFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneNotificationChartFactory();
  return -[HeadphoneNotificationChartFactory init](&v3, sel_init);
}

@end
