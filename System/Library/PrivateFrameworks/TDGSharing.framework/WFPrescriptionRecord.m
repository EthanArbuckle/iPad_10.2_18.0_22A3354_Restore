@implementation WFPrescriptionRecord

- (NSString)description
{
  return (NSString *)(id)sub_247CEF64C();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  WFPrescriptionRecord *v5;

  v4 = a3;
  v5 = self;
  PrescriptionRecord.encode(with:)((NSCoder)v4);

}

- (WFPrescriptionRecord)initWithCoder:(id)a3
{
  return (WFPrescriptionRecord *)PrescriptionRecord.init(coder:)(a3);
}

- (WFPrescriptionRecord)init
{
  WFPrescriptionRecord *result;

  result = (WFPrescriptionRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_247CB6504(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFPrescriptionRecord_accPayload), *(_QWORD *)&self->version[OBJC_IVAR___WFPrescriptionRecord_accPayload]);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___WFPrescriptionRecord_enrollmentDate;
  v4 = sub_247CEF508();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
