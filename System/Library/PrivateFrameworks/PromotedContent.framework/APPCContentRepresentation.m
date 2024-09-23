@implementation APPCContentRepresentation

- (int64_t)adType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_adType);
}

- (int64_t)privacyMarkerPosition
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_privacyMarkerPosition);
}

- (APPCTapAction)tapAction
{
  return (APPCTapAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___APPCContentRepresentation_tapAction));
}

- (CGSize)adSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_adSize);
  v3 = *(double *)&self->identifier[OBJC_IVAR___APPCContentRepresentation_adSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)id
{
  return (NSUUID *)(id)sub_1B1289644();
}

- (int64_t)desiredPosition
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentRepresentation_desiredPosition);
}

- (APPCAdPolicyData)adPolicyData
{
  return (APPCAdPolicyData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___APPCContentRepresentation_adPolicyData));
}

- (void)performActionWithCompletion:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (APPCContentRepresentation)init
{
  APPCContentRepresentation *result;

  result = (APPCContentRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___APPCContentRepresentation_id;
  v4 = sub_1B1289674();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
