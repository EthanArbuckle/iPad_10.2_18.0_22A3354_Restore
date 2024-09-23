@implementation PXPeopleMergeUtilities

+ (id)mergeAlertControllerWithNominalPeople:(id)a3 targetPerson:(id)a4 shouldHandleMergeInternally:(BOOL)a5 completion:(id)a6
{
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v8 = _Block_copy(a6);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
  v9 = sub_1A7AE3A10();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a4;
  v12 = sub_1A687CB78(v9, v11, a5, (uint64_t)sub_1A687EE8C, v10);

  swift_bridgeObjectRelease();
  swift_release();
  return v12;
}

+ (BOOL)canMergeWithPeople:(id)a3
{
  unint64_t v3;
  char v4;

  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
  v3 = sub_1A7AE3A10();
  v4 = sub_1A687D1FC(v3);
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)init
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

@end
