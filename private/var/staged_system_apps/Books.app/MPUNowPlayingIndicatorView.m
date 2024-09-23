@implementation MPUNowPlayingIndicatorView

- (double)bk_width
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[MPUNowPlayingIndicatorView levelWidth](self, "levelWidth");
  v4 = v3;
  v5 = (double)(uint64_t)-[MPUNowPlayingIndicatorView numberOfLevels](self, "numberOfLevels");
  -[MPUNowPlayingIndicatorView interLevelSpacing](self, "interLevelSpacing");
  return v6 * (double)((unint64_t)-[MPUNowPlayingIndicatorView numberOfLevels](self, "numberOfLevels") - 1)
       + v4 * v5;
}

@end
