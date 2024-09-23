@implementation MTPodcastUpdateAverageCalculator

- (void)unsafeSetUpdateAverageWithPodcast:(id)a3 on:(id)a4
{
  id v6;
  id v7;
  MTPodcastUpdateAverageCalculator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9244B44(v6, v7);

}

- (MTPodcastUpdateAverageCalculator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PodcastUpdateAverageCalculator();
  return -[MTPodcastUpdateAverageCalculator init](&v3, sel_init);
}

@end
