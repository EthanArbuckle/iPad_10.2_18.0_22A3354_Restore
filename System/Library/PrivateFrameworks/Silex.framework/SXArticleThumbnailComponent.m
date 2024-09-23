@implementation SXArticleThumbnailComponent

+ (id)typeString
{
  return CFSTR("article_thumbnail");
}

- (BOOL)requiresLinkedContent
{
  return 1;
}

@end
