@implementation TUIControlLayout

- (id)collectLinkEntities
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "linkEntities"));

  return v3;
}

@end
