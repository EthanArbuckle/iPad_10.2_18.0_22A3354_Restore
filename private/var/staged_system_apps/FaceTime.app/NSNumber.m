@implementation NSNumber

+ (NSNumber)numberWithCGFloat:(double)a3
{
  return (NSNumber *)objc_msgSend(objc_alloc((Class)a1), "initWithCGFloat:", a3);
}

- (NSNumber)initWithCGFloat:(double)a3
{
  return -[NSNumber initWithDouble:](self, "initWithDouble:", a3);
}

@end
