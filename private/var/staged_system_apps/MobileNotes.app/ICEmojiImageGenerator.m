@implementation ICEmojiImageGenerator

- (id)generateEmojiImageAsset:(id)a3 description:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ICEmojiImageGenerator *v12;
  id v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  v13 = _s11MobileNotes19EmojiImageGeneratorC08generatecD5Asset_11descriptionSo07NSEmojidG0CSgSS_SStF_0(v6, v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
  return v13;
}

- (ICEmojiImageGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[ICEmojiImageGenerator init](&v3, "init");
}

@end
