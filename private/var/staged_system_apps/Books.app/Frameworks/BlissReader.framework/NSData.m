@implementation NSData

+ (NSData)dataWithContentsOfURL:(id)a3 drmContext:(id)a4 error:(id *)a5
{
  if (a4)
    return (NSData *)objc_msgSend(a4, "dataWithContentsOfURL:error:", a3, a5);
  else
    return +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", a3, 0, a5);
}

@end
