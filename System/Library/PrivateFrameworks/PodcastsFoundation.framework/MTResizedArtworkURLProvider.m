@implementation MTResizedArtworkURLProvider

+ (MTResizedArtworkURLProvider)sharedInstance
{
  if (qword_1EEAB6CD8 != -1)
    swift_once();
  swift_beginAccess();
  return (MTResizedArtworkURLProvider *)(id)qword_1EEAB87E8;
}

+ (void)setSharedInstance:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EEAB6CD8;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1EEAB87E8;
  qword_1EEAB87E8 = (uint64_t)v4;

}

- (id)resizedArtworkURLString:(id)a3 withDimension:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTResizedArtworkURLProvider *v9;
  void *v10;

  v6 = sub_1A93F8040();
  v8 = v7;
  v9 = self;
  sub_1A91607F8(v6, v8, a4);

  swift_bridgeObjectRelease();
  v10 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return v10;
}

- (MTResizedArtworkURLProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ResizedArtworkURLProvider();
  return -[MTResizedArtworkURLProvider init](&v3, sel_init);
}

@end
