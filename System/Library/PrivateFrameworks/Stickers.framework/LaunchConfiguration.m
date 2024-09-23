@implementation LaunchConfiguration

- (NSString)identifier
{
  void *v2;

  if (*(_QWORD *)&self->sectionType[OBJC_IVAR____TtC8Stickers19LaunchConfiguration_identifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_247A1AEC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (double)creationDate
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Stickers19LaunchConfiguration_creationDate);
}

- (void)setCreationDate:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Stickers19LaunchConfiguration_creationDate) = a3;
}

- (_TtC8Stickers19LaunchConfiguration)init
{
  return (_TtC8Stickers19LaunchConfiguration *)LaunchConfiguration.init()();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2576D2E40;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2576D2E40 = a3;
}

- (_TtC8Stickers19LaunchConfiguration)initWithCoder:(id)a3
{
  return (_TtC8Stickers19LaunchConfiguration *)LaunchConfiguration.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Stickers19LaunchConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_247A07B90();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
