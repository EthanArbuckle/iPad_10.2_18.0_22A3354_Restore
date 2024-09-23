@implementation PKProvisioningCarKeyStepTrackKeyTrackedPass

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE1C0BF0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE1C0BF0 = a3;
}

- (PKProvisioningCarKeyStepTrackKeyTrackedPass)initWithCoder:(id)a3
{
  return (PKProvisioningCarKeyStepTrackKeyTrackedPass *)ProvisioningCarKeyStepTrackKey.TrackedPass.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PKProvisioningCarKeyStepTrackKeyTrackedPass *v5;

  v4 = a3;
  v5 = self;
  sub_18FDFCA4C(v4);

}

- (PKProvisioningCarKeyStepTrackKeyTrackedPass)init
{
  PKProvisioningCarKeyStepTrackKeyTrackedPass *result;

  result = (PKProvisioningCarKeyStepTrackKeyTrackedPass *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PKProvisioningCarKeyStepTrackKeyTrackedPass_passURL;
  v4 = sub_1903D0178();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
