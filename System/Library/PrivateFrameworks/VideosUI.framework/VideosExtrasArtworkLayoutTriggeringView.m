@implementation VideosExtrasArtworkLayoutTriggeringView

- (void)_imageDidChange
{
  id v2;

  -[VideosExtrasArtworkLayoutTriggeringView superview](self, "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

@end
