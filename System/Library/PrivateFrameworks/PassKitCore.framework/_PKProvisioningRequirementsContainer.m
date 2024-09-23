@implementation _PKProvisioningRequirementsContainer

- (NSString)provisioningSID
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1903D05A4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setProvisioningSID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1903D05C8();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)containerMinus:(id)a3
{
  id v4;
  _PKProvisioningRequirementsContainer *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_18FE0D7A0((uint64_t)v4);

  return v6;
}

- (BOOL)containsNotManagedAccount
{
  _PKProvisioningRequirementsContainer *v2;
  char v3;

  v2 = self;
  v3 = sub_18FE0D950();

  return v3 & 1;
}

- (id)displayableError
{
  _PKProvisioningRequirementsContainer *v2;
  id v3;

  v2 = self;
  v3 = sub_18FE0DAF0();

  return v3;
}

- (_PKProvisioningRequirementsContainer)initWithCoder:(id)a3
{
  return (_PKProvisioningRequirementsContainer *)ProvisioningRequirementsContainer.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _PKProvisioningRequirementsContainer *v5;

  v4 = a3;
  v5 = self;
  sub_18FE0E674(v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PKProvisioningRequirementsContainer)init
{
  _PKProvisioningRequirementsContainer *result;

  result = (_PKProvisioningRequirementsContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
