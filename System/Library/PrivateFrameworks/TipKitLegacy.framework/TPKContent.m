@implementation TPKContent

- (TPSDiscoverabilityTip)tip
{
  return (TPSDiscoverabilityTip *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___TPKContent_tip));
}

- (void)setTip:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_tip);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_tip) = (Class)a3;
  v3 = a3;

}

- (int64_t)displayCount
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPKContent_displayCount);
  swift_beginAccess();
  return *v2;
}

- (void)setDisplayCount:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPKContent_displayCount);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)identifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248A9C5A4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_248A9C5C8();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___TPKContent_identifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)customizationID
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPKContent_customizationID);
  swift_beginAccess();
  return *v2;
}

- (void)setCustomizationID:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPKContent_customizationID);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)version
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPKContent_version);
  swift_beginAccess();
  return *v2;
}

- (void)setVersion:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPKContent_version);
  swift_beginAccess();
  *v4 = a3;
}

- (NSDictionary)userInfo
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_userInfo);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_248A9C574();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setUserInfo:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_248A9C58C();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___TPKContent_userInfo);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_state);
}

- (void)setState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_state) = (Class)a3;
}

- (TPSMonitoringEvents)monitoringEvents
{
  return (TPSMonitoringEvents *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___TPKContent_monitoringEvents));
}

- (void)setMonitoringEvents:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_monitoringEvents);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_monitoringEvents) = (Class)a3;
  v3 = a3;

}

- (BOOL)hasTipContent
{
  TPKContent *v2;
  char v3;

  v2 = self;
  v3 = sub_248A80600();

  return v3 & 1;
}

- (BOOL)isLocalContent
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_tip);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_isLocalContent);
  return (char)v2;
}

- (NSError)parsingError
{
  TPKContent *v2;
  void *v3;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_cachedViewModel))
  {
    v2 = self;
    swift_retain();
    v3 = sub_248A7BDD4();

    swift_release();
  }
  else
  {
    v3 = 0;
  }
  return (NSError *)v3;
}

- (NSString)description
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248A9C5A4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)debugDescription
{
  TPKContent *v2;
  void *v3;

  v2 = self;
  sub_248A8082C();

  v3 = (void *)sub_248A9C5A4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emptyContent
{
  id v2;
  id result;

  v2 = objc_allocWithZone((Class)type metadata accessor for TPKContent());
  sub_248A8118C(0x746E6F4374736554, 0xEB00000000746E65, 0, 0, 0);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (TPKContent)initWithIdentifier:(id)a3 monitoringEvents:(id)a4 customizationID:(int64_t)a5 userInfo:(id)a6
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  TPKContent *result;

  v9 = sub_248A9C5C8();
  v11 = v10;
  if (a6)
    a6 = (id)sub_248A9C58C();
  v12 = a4;
  sub_248A8118C(v9, v11, a4, a5, (uint64_t)a6);
  return result;
}

- (TPKContent)initWithDiscoverabilityTip:(id)a3 monitoringEvents:(id)a4 customizationID:(int64_t)a5 userInfo:(id)a6
{
  uint64_t v9;
  id v10;
  id v11;

  if (a6)
    v9 = sub_248A9C58C();
  else
    v9 = 0;
  v10 = a3;
  v11 = a4;
  return (TPKContent *)sub_248A81700(v10, a4, a5, v9);
}

- (TPKContent)initWithCoder:(id)a3
{
  return (TPKContent *)TPKContent.init(coder:)(a3);
}

- (TPKContent)initWithCopy:(id)a3
{
  id v3;
  TPKContent *v4;

  v3 = a3;
  v4 = (TPKContent *)sub_248A8387C((uint64_t)v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  TPKContent *v4;
  TPKContent *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_248A9C730();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_248A81DF0((uint64_t)v8);

  sub_248A75A1C((uint64_t)v8);
  return v6 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPKContent *v5;

  v4 = a3;
  v5 = self;
  sub_248A82018(v4);

}

- (id)copyWithZone:(void *)a3
{
  id v4;
  TPKContent *v5;

  v4 = objc_allocWithZone((Class)type metadata accessor for TPKContent());
  v5 = self;
  sub_248A8387C((uint64_t)v5);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577AE660);
  return (id)sub_248A9C814();
}

- (void)incrementDisplaycount
{
  sub_248A82498();
}

- (void)updateState:(int64_t)a3
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_state) != (Class)a3)
    *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPKContent_state) = (Class)a3;
}

- (void)updateDisplayCount:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPKContent_displayCount);
  swift_beginAccess();
  *v4 = a3;
}

- (unint64_t)monitoringEventOptionsForCurrentState
{
  TPKContent *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_248A82600();

  return v3;
}

- (unint64_t)monitoringEventOptionsMatchedWithRegistrableEventIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TPKContent *v7;
  unint64_t v8;

  v4 = sub_248A9C5C8();
  v6 = v5;
  v7 = self;
  v8 = sub_248A827A4(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)createCachedViewModelUsingViewDelegate:(id)a3
{
  TPKContent *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_248A82C9C((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (TPKContent)init
{
  TPKContent *result;

  result = (TPKContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
