@implementation CHActivitySharingAvatarProvider

+ (id)fetchAvatarImageForFriend:(id)a3 diameter:(double)a4
{
  id v6;
  id v7;

  swift_getObjCClassMetadata(a1);
  v6 = a3;
  v7 = sub_1004B1860(v6, a4);

  return v7;
}

- (CHActivitySharingAvatarProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivitySharingAvatarProvider();
  return -[CHActivitySharingAvatarProvider init](&v3, "init");
}

@end
