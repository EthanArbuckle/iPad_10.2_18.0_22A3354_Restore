@implementation FMFFence

- (double)latitude
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence location](self, "location"));
  objc_msgSend(v2, "coordinate");
  v4 = v3;

  return v4;
}

- (double)longitude
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence location](self, "location"));
  objc_msgSend(v2, "coordinate");
  v4 = v3;

  return v4;
}

- (double)radius
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence location](self, "location"));
  objc_msgSend(v2, "horizontalAccuracy");
  v4 = v3;

  return v4;
}

@end
