@implementation PXPhotosFileProviderTypeIdentifierForDownscalingAssetWithTypeIdentifier

void __PXPhotosFileProviderTypeIdentifierForDownscalingAssetWithTypeIdentifier_block_invoke()
{
  CFArrayRef v0;
  void *v1;

  v0 = CGImageDestinationCopyTypeIdentifiers();
  v1 = (void *)PXPhotosFileProviderTypeIdentifierForDownscalingAssetWithTypeIdentifier_supportedImageDestinationTypeIdentifiers;
  PXPhotosFileProviderTypeIdentifierForDownscalingAssetWithTypeIdentifier_supportedImageDestinationTypeIdentifiers = (uint64_t)v0;

}

@end
