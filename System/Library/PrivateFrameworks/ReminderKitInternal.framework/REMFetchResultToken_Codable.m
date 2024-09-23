@implementation REMFetchResultToken_Codable

- (REMFetchResultToken_Codable)initWithPersistentHistoryTokens:(id)a3
{
  objc_class *ObjectType;
  void *v5;
  REMFetchResultToken_Codable *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A444AA40(0, &qword_1ED2402E0);
  sub_1A4690708();
  v5 = (void *)sub_1A46906F0();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[REMFetchResultToken initWithPersistentHistoryTokens:](&v8, sel_initWithPersistentHistoryTokens_, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
