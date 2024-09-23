@implementation SHSheetSceneClientSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([SHSheetMutableSceneClientSettings alloc], "initWithSettings:", self);
}

@end
