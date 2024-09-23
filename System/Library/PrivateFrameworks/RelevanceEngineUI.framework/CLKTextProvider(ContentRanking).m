@implementation CLKTextProvider(ContentRanking)

- (id)contentEncodedString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentEncodedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
