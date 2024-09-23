@implementation REMCustomSmartListFilterDescriptor

- (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor)init
{
  return (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *)REMCustomSmartListFilterDescriptor.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *v5;

  v4 = a3;
  v5 = self;
  REMCustomSmartListFilterDescriptor.encode(with:)((NSCoder)v4);

}

- (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor)initWithCoder:(id)a3
{
  return (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *)REMCustomSmartListFilterDescriptor.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *v4;
  _TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A4691278();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = REMCustomSmartListFilterDescriptor.isEqual(_:)((uint64_t)v8);

  sub_1A445404C((uint64_t)v8, &qword_1ED243E68);
  return v6 & 1;
}

- (NSString)description
{
  _TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *v2;
  void *v3;

  v2 = self;
  REMCustomSmartListFilterDescriptor.description.getter();

  v3 = (void *)sub_1A469087C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_1A44F4804(*(unint64_t *)((char *)&self->super.isa
                                    + OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_hashtags));
  sub_1A445404C((uint64_t)self + OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_date, (uint64_t *)&unk_1EE71ED00);
  swift_bridgeObjectRelease();
  sub_1A44F4820(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location), *(_QWORD *)&self->operation[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location], *(_QWORD *)&self->hashtags[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 7], *(_QWORD *)&self->hashtags[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 15], *(_QWORD *)&self->priorities[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 5], *(_QWORD *)&self->location[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 4], self->location[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 12]);
  sub_1A44F4834(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_lists));
}

@end
