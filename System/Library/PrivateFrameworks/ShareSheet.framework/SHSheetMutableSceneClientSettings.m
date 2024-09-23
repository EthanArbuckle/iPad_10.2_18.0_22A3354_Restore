@implementation SHSheetMutableSceneClientSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SHSheetSceneClientSettings alloc], "initWithSettings:", self);
}

@end
