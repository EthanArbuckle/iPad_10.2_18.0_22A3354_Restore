@implementation SXIssueCoverLayoutAttributesFactory

- (id)createAttributesWithIssueCover:(id)a3 options:(id)a4
{
  id v4;
  SXIssueCoverLayoutAttributes *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a4;
  v5 = [SXIssueCoverLayoutAttributes alloc];
  objc_msgSend(v4, "boundingWidth");
  v7 = v6;
  objc_msgSend(v4, "boundingWidth");
  v9 = v8;

  return -[SXIssueCoverLayoutAttributes initWithFrame:](v5, "initWithFrame:", 0.0, 0.0, v7, v9 / 0.75);
}

@end
