@implementation TFDiagnosticData

- (TFDiagnosticData)init
{
  DiagnosticData.init()();
}

- (void).cxx_destruct
{
  sub_190AEF3F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TFDiagnosticData_data), *(_QWORD *)&self->data[OBJC_IVAR___TFDiagnosticData_data]);
  swift_bridgeObjectRelease();
}

@end
