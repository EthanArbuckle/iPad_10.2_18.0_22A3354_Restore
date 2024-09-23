@implementation BKTOCImageCache2

- (BOOL)entryForRequest:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cacheKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCImageCache2 objectForKey:](self, "objectForKey:", v4));
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

@end
