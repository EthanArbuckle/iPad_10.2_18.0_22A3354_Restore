@implementation MTAppCoreSpotlightEntityAnnotator

- (id)annotateItem:(id)a3 withManagedObject:(id)a4
{
  id v6;
  id v7;
  MTAppCoreSpotlightEntityAnnotator *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (id)sub_100318E60((uint64_t)v6, v7);

  return v9;
}

- (id)annotateItem:(id)a3 withPlayerItem:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  MTAppCoreSpotlightEntityAnnotator *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v18;

  v7 = type metadata accessor for EpisodeEntity(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v12, "episode");
  if (v14)
  {
    v15 = v14;
    EpisodeEntity.init(model:)(v15);
    v16 = sub_100026844(&qword_1005637D0, (uint64_t (*)(uint64_t))&type metadata accessor for EpisodeEntity, (uint64_t)&protocol conformance descriptor for EpisodeEntity);
    CSSearchableItem.associate<A>(appEntity:priority:)(v10, 0, v7, v16);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  return v11;
}

- (MTAppCoreSpotlightEntityAnnotator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppCoreSpotlightEntityAnnotator();
  return -[MTAppCoreSpotlightEntityAnnotator init](&v3, "init");
}

@end
