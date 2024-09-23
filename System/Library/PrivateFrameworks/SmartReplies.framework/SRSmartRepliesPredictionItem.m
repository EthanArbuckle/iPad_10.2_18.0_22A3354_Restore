@implementation SRSmartRepliesPredictionItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC12SmartReplies28SRSmartRepliesPredictionItem *v5;

  v4 = a3;
  v5 = self;
  SRSmartRepliesPredictionItem.encode(with:)((NSCoder)v4);

}

- (_TtC12SmartReplies28SRSmartRepliesPredictionItem)initWithCoder:(id)a3
{
  return (_TtC12SmartReplies28SRSmartRepliesPredictionItem *)SRSmartRepliesPredictionItem.init(coder:)(a3);
}

- (_TtC12SmartReplies28SRSmartRepliesPredictionItem)init
{
  _TtC12SmartReplies28SRSmartRepliesPredictionItem *result;

  result = (_TtC12SmartReplies28SRSmartRepliesPredictionItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
