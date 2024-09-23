@implementation PXPeopleSwiftUtilities

+ (id)fetchAllSocialGroupDetailedDebugDescriptionFor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  sub_1A687D9C0(v3);

  v4 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v4;
}

+ (int64_t)currentSortOrderFor:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  int64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, sel_px_localDefaults);
  v5 = objc_msgSend(v4, sel_numberForKey_, CFSTR("PXPeopleHomeSortingType"));
  if (v5)
  {
    v6 = v5;
    v7 = sub_1A687DF20((unint64_t)objc_msgSend(v5, sel_integerValue));

    v3 = v4;
    v4 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)setWithSortOrder:(int64_t)a3 to:(id)a4
{
  id v5;

  v5 = a4;
  sub_1A687E2D4(a3, v5);

}

+ (int64_t)sortOrderFor:(int64_t)a3
{
  return sub_1A687DF20(a3);
}

+ (int64_t)rawValueFor:(int64_t)a3
{
  return sub_1A687E138(a3);
}

+ (id)fetchAddPeopleCandidatesIn:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = sub_1A687E420(v3);
  v6 = v5;
  v8 = v7;

  return v4;
}

@end
