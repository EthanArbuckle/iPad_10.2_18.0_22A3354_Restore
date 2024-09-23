@implementation PUOneUpDetailsBarButtonController

- (PUOneUpDetailsBarButtonController)initWithBarButtonItem:(id)a3 browseViewModel:(id)a4
{
  return (PUOneUpDetailsBarButtonController *)sub_1AAB78CA0((uint64_t)a3, (uint64_t)a4);
}

- (void)update
{
  PUOneUpDetailsBarButtonController *v2;

  v2 = self;
  sub_1AAB78D40();

}

+ (id)defaultGlyphNameFor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  sub_1AAB793B8(v3);

  v4 = (void *)sub_1AB08D468();
  swift_bridgeObjectRelease();
  return v4;
}

- (void)currentAssetDidChange
{
  PUOneUpDetailsBarButtonController *v2;

  v2 = self;
  sub_1AAB79528();

}

- (PUOneUpDetailsBarButtonController)init
{
  sub_1AAB7956C();
}

- (void).cxx_destruct
{

}

@end
