@implementation RefinementsViewModelFactory

+ (id)barViewModelWith:(id)a3
{
  return sub_10011A63C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_100118458);
}

+ (id)refinementsViewModelWithGroup:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "resultRefinementView");
  if (v5)
  {
    v6 = v5;
    swift_getObjCClassMetadata(a1);
    v7 = sub_10011922C(v6);

  }
  else
  {

    v7 = 0;
  }
  return v7;
}

+ (id)refinementsViewModelWithRefinementView:(id)a3
{
  return sub_10011A63C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_10011922C);
}

+ (id)multiSelectRefinementsViewModelWith:(id)a3 tappedAtIndex:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)sub_10011B1D8(v5, a4);

  return v6;
}

+ (id)openOptionsRefinementsViewModelWith:(id)a3 tappedAtIndex:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = sub_10011B9B4(v5, a4);

  return v6;
}

- (_TtC4Maps27RefinementsViewModelFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RefinementsViewModelFactory();
  return -[RefinementsViewModelFactory init](&v3, "init");
}

@end
