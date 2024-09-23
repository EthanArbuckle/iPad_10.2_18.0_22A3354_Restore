@implementation BKAudiobookPlugin

- (id)supportedUrlSchemes
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("audiobook"), CFSTR("file"), 0);
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  BKMLAudiobookHelper *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BKMLAudiobookHelper initWithAssetUrl:options:]([BKMLAudiobookHelper alloc], "initWithAssetUrl:options:", v6, v5);

  return v7;
}

@end
