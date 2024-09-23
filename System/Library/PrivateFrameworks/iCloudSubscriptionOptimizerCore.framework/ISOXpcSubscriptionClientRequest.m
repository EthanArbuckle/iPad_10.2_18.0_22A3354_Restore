@implementation ISOXpcSubscriptionClientRequest

- (ISOXpcSubscriptionClientRequest)initWithCoder:(id)a3
{
  return (ISOXpcSubscriptionClientRequest *)XpcSubscriptionClientRequest.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  char *v4;
  id v5;
  ISOXpcSubscriptionClientRequest *v6;

  v4 = (char *)self + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto;
  v5 = a3;
  v6 = self;
  sub_228CB63CC((uint64_t)v4, v5, type metadata accessor for SubscriptionClientRequest, (unint64_t *)&qword_254075ED0, (uint64_t)&protocol conformance descriptor for SubscriptionClientRequest);

}

- (ISOXpcSubscriptionClientRequest)init
{
  ISOXpcSubscriptionClientRequest *result;

  result = (ISOXpcSubscriptionClientRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_228C28A54((uint64_t)self + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto, type metadata accessor for SubscriptionClientRequest);
}

@end
