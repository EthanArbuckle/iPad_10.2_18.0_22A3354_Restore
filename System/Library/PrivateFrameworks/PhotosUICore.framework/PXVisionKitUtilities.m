@implementation PXVisionKitUtilities

+ (void)ensureVisionKitResourcesArePurgedWhenAppIsHidden
{
  id v2;

  if ((byte_1EE930FB0 & 1) == 0)
  {
    byte_1EE930FB0 = 1;
    v2 = objc_msgSend((id)objc_opt_self(), sel_sharedState);
    PXApplicationState.registerVisibilityChangeHandler(identifier:handler:)(0xD000000000000021, 0x80000001A7C69990, (uint64_t)sub_1A721A9E0, 0);

  }
}

- (PXVisionKitUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisionKitUtilities();
  return -[PXVisionKitUtilities init](&v3, sel_init);
}

@end
