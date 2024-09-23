@implementation PXSharedAlbumsPresentSpatialMediaDataLossAlertIfNeededForAssets

unint64_t __PXSharedAlbumsPresentSpatialMediaDataLossAlertIfNeededForAssets_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unint64_t IsSpatial;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IsSpatial = ((unint64_t)objc_msgSend(v2, "mediaSubtypes") >> 10) & 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      IsSpatial = _mediaSourceIsSpatial(v2);
    else
      IsSpatial = 0;
  }

  return IsSpatial;
}

@end
