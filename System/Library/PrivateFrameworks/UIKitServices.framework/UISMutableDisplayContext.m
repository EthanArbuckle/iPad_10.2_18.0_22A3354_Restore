@implementation UISMutableDisplayContext

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UISDisplayContext _initWithDisplayContext:]([UISDisplayContext alloc], "_initWithDisplayContext:", self);
}

- (void)setUserInterfaceStyle:(unint64_t)a3
{
  self->super._userInterfaceStyle = a3;
}

- (void)setArtworkSubtype:(unint64_t)a3
{
  self->super._artworkSubtype = a3;
}

- (void)setExclusionArea:(id)a3
{
  UISDisplayShape *v4;
  UISDisplayShape *exclusionArea;

  v4 = (UISDisplayShape *)objc_msgSend(a3, "copy");
  exclusionArea = self->super._exclusionArea;
  self->super._exclusionArea = v4;

}

- (void)setDisplayEdgeInfo:(id)a3
{
  UISApplicationSupportDisplayEdgeInfo *v4;
  UISApplicationSupportDisplayEdgeInfo *displayEdgeInfo;

  v4 = (UISApplicationSupportDisplayEdgeInfo *)objc_msgSend(a3, "copy");
  displayEdgeInfo = self->super._displayEdgeInfo;
  self->super._displayEdgeInfo = v4;

}

- (void)setDisplayConfiguration:(id)a3
{
  FBSDisplayConfiguration *v4;
  FBSDisplayConfiguration *displayConfiguration;

  v4 = (FBSDisplayConfiguration *)objc_msgSend(a3, "copy");
  displayConfiguration = self->super._displayConfiguration;
  self->super._displayConfiguration = v4;

}

@end
