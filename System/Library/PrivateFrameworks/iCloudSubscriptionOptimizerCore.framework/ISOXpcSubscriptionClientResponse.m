@implementation ISOXpcSubscriptionClientResponse

- (ISOXpcSubscriptionClientResponse)initWithCoder:(id)a3
{
  return (ISOXpcSubscriptionClientResponse *)XpcSubscriptionClientResponse.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  char *v4;
  id v5;
  ISOXpcSubscriptionClientResponse *v6;

  v4 = (char *)self + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto;
  v5 = a3;
  v6 = self;
  sub_228CB63B0((uint64_t)v4, v5);

}

- (ISOXpcSubscriptionClientResponse)init
{
  ISOXpcSubscriptionClientResponse *result;

  result = (ISOXpcSubscriptionClientResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_228C28A54((uint64_t)self + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto, type metadata accessor for SubscriptionClientResponse);
}

@end
