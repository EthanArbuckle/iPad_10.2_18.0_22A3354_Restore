@implementation DOCGoToRecentLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCGoToRecentLocation)initWithCoder:(id)a3
{
  return (DOCGoToRecentLocation *)sub_100435D5C(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  DOCGoToRecentLocation *v5;

  v4 = a3;
  v5 = self;
  sub_1004363EC(v4);

}

- (DOCGoToRecentLocation)init
{
  DOCGoToRecentLocation *result;

  result = (DOCGoToRecentLocation *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCGoToRecentLocation", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___DOCGoToRecentLocation_parents));
}

@end
