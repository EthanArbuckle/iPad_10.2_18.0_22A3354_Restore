@implementation UIPreviewInteractionAllowedToBeginForView

void ___UIPreviewInteractionAllowedToBeginForView_block_invoke()
{
  id v0;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1180 = objc_msgSend(v0, "_supportsForceTouch");

}

@end
