@implementation FMTableViewCellImageContainer.MaskingContext

- (BOOL)isEqual:(id)a3
{
  _TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext *v5;
  uint64_t v6;
  _TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100284088((uint64_t)v10);

  sub_10005D03C((uint64_t)v10);
  return v8;
}

- (int64_t)hash
{
  return sub_100284218();
}

- (_TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext)init
{
  _TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext *result;

  result = (_TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext *)_swift_stdlib_reportUnimplementedInitializer("FindMy.MaskingContext", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
