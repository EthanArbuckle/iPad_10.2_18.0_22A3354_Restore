@implementation PGSocialGroupsPromoter

+ (id)promoteSocialGroupsInGraph:(id)a3 photoLibrary:(id)a4 maxNumberOfElectedSocialGroups:(int64_t)a5 progressReporter:(id)a6 persistGroups:(BOOL)a7 error:(id *)a8
{
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD *v16;

  swift_getObjCClassMetadata();
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = static SocialGroupsPromoter.promoteSocialGroups(in:photoLibrary:maxNumberOfElectedSocialGroups:progressReporter:persistGroups:)(v13, v14, a5, (uint64_t)v15, a7);

  return v16;
}

+ (id)ingestUserVerifiedSocialGroupsFromPhotoLibrary:(id)a3 intoGraph:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  swift_getObjCClassMetadata();
  v9 = a3;
  v10 = a4;
  v11 = a5;
  static SocialGroupsPromoter.ingestUserVerifiedSocialGroups(from:into:progressReporter:)(v9, v10);

  v12 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return v12;
}

- (PGSocialGroupsPromoter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGSocialGroupsPromoter init](&v3, sel_init);
}

@end
