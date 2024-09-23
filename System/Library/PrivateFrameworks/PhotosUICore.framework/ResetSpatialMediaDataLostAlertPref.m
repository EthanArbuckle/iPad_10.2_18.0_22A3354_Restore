@implementation ResetSpatialMediaDataLostAlertPref

uint64_t ___ResetSpatialMediaDataLostAlertPref_block_invoke()
{
  PXPreferencesSetBool(CFSTR("HasShownSharedAlbumsSpatialMediaDataLossAlert"), 0);
  return 1;
}

@end
