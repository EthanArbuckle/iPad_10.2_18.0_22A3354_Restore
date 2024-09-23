@implementation ArtworkLoader

- (void)imageRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  swift_retain();
  sub_1A6A5C(v6, a4, 0);

  swift_release(self);
}

- (void)imageRequest:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  swift_retain();
  sub_1A6A5C(v6, 0, (uint64_t)a4);

  swift_release(self);
}

@end
