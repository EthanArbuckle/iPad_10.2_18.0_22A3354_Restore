@implementation SBEmptyWorkspaceEntity

- (BOOL)isEmptyWorkspaceEntity
{
  return 1;
}

- (BOOL)isAnalogousToEntity:(id)a3
{
  return objc_msgSend(a3, "isEmptyWorkspaceEntity");
}

@end
