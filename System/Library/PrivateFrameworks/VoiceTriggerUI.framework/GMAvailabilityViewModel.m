@implementation GMAvailabilityViewModel

- (_TtC14VoiceTriggerUI23GMAvailabilityViewModel)init
{
  return (_TtC14VoiceTriggerUI23GMAvailabilityViewModel *)GMAvailabilityViewModel.init()();
}

- (BOOL)isBuddy
{
  return sub_229F374A0() & 1;
}

- (unint64_t)enrollmentType
{
  _TtC14VoiceTriggerUI23GMAvailabilityViewModel *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_229F36B04();

  return v3;
}

- (BOOL)showNotNowWithEnrollmentType:(unint64_t)a3
{
  return a3 == 0;
}

- (id)titleKeyWithEnrollmentType:(unint64_t)a3
{
  void *v3;
  id result;
  _TtC14VoiceTriggerUI23GMAvailabilityViewModel *v6;

  if (a3 - 2 >= 3 && a3 > 1)
  {
    type metadata accessor for VTUIGMEnrollmentType(0);
    v6 = self;
    result = (id)sub_229F4B910();
    __break(1u);
  }
  else
  {
    v3 = (void *)sub_229F4B7A8();
    swift_bridgeObjectRelease();
    return v3;
  }
  return result;
}

- (id)subtitleKeyWithEnrollmentType:(unint64_t)a3
{
  void *v3;

  sub_229F37814(a3);
  v3 = (void *)sub_229F4B7A8();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)continueButtonTitleKeyWithEnrollmentType:(unint64_t)a3
{
  void *v3;
  id result;
  id v5;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      v3 = (void *)sub_229F4B7A8();
      swift_bridgeObjectRelease();
      result = v3;
      break;
    default:
      type metadata accessor for VTUIGMEnrollmentType(0);
      v5 = (id)0xD000000000000017;
      result = (id)sub_229F4B910();
      __break(1u);
      break;
  }
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14VoiceTriggerUI23GMAvailabilityViewModel_provider);

}

@end
