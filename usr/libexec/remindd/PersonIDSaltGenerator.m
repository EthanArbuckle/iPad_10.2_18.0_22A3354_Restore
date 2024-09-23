@implementation PersonIDSaltGenerator

+ (id)randomSalt
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSData rem_dataWithRandomBytesWithLength:](NSData, "rem_dataWithRandomBytesWithLength:", 16));
}

@end
