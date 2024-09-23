@implementation NSURLRequestHACK

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSURLRequestHACK *v4;
  void *v5;
  NSURLRequestHACK *v6;

  v4 = [NSURLRequestHACK alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequestHACK URL](self, "URL"));
  v6 = -[NSURLRequestHACK initWithURL:](v4, "initWithURL:", v5);

  return v6;
}

@end
