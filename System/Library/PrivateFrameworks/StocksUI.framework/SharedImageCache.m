@implementation SharedImageCache

- (id)fetchImageForKey:(id)a3
{
  void *v3;

  sub_1DC408A4C();
  swift_retain();
  v3 = (void *)sub_1DC404900();
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5
{
  id v6;

  sub_1DC408A4C();
  v6 = a3;
  swift_retain();
  sub_1DC4048F4();

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cache:(id)a3 forKey:(id)a4
{
  id v5;

  sub_1DC408A4C();
  v5 = a3;
  swift_retain();
  sub_1DC4048F4();

  swift_release();
  swift_bridgeObjectRelease();
}

@end
