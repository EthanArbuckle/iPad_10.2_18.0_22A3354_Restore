@implementation SiriTTSBaseRequest

- (NSURL)outputPath
{
  return (NSURL *)sub_19AD6F738((uint64_t)self, (uint64_t)a2, &qword_1ED05B3D0, sub_19AD6F008, (uint64_t)MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFE38]);
}

- (void)setOutputPath:(id)a3
{
  sub_19AD6F800(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED05B3D0, (void (*)(uint64_t))MEMORY[0x1E0CAFF00], (uint64_t)MEMORY[0x1E0CAFFF8], sub_19AD6F084);
}

- (NSString)sandboxToken
{
  return (NSString *)sub_19AD73998((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD6F5C0);
}

- (void)setSandboxToken:(id)a3
{
  sub_19AD73A24(self, (uint64_t)a2, (uint64_t)a3);
}

- (NSUUID)logLinkId
{
  return (NSUUID *)sub_19AD6F738((uint64_t)self, (uint64_t)a2, &qword_1ED05A930, sub_19AD6F644, (uint64_t)MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0930]);
}

- (void)setLogLinkId:(id)a3
{
  sub_19AD6F800(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED05A930, (void (*)(uint64_t))MEMORY[0x1E0CB0958], (uint64_t)MEMORY[0x1E0CB0998], sub_19AD6F67C);
}

- (NSUUID)interactionLinkId
{
  return (NSUUID *)sub_19AD6F738((uint64_t)self, (uint64_t)a2, &qword_1ED05A930, sub_19AD6F7C8, (uint64_t)MEMORY[0x1E0CB0998], (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0930]);
}

- (void)setInteractionLinkId:(id)a3
{
  sub_19AD6F800(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED05A930, (void (*)(uint64_t))MEMORY[0x1E0CB0958], (uint64_t)MEMORY[0x1E0CB0998], sub_19AD6F898);
}

- (id)didReportInstrument
{
  return sub_19AD6C3E0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_19AD6F9A0, (uint64_t)sub_19AD6C46C, (uint64_t)&block_descriptor_1);
}

- (void)setDidReportInstrument:(id)a3
{
  void *v4;
  uint64_t v5;
  SiriTTSBaseRequest *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_19AD77DFC;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19AD6FACC((uint64_t)v4, v5);

}

- (SiriTTSBaseRequest)init
{
  return (SiriTTSBaseRequest *)sub_19AD6FC48();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSBaseRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19AD6FD4C(v4);

}

- (SiriTTSBaseRequest)initWithCoder:(id)a3
{
  return (SiriTTSBaseRequest *)BaseRequest.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD7078C);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_203((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_accessoryId);
  sub_19AD567C8((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_outputPath, &qword_1ED05B3D0);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_203((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_logLinkId);
  OUTLINED_FUNCTION_203((uint64_t)self + OBJC_IVAR___SiriTTSBaseRequest_interactionLinkId);
  sub_19AD75C30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSBaseRequest_didReportInstrument));
}

@end
