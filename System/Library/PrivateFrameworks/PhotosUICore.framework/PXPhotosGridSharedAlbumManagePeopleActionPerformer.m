@implementation PXPhotosGridSharedAlbumManagePeopleActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsSharedAlbumOptionsManagePeople"), CFSTR("PhotosUICore"));
}

- (id)activitySystemImageName
{
  return CFSTR("person.crop.circle.badge.checkmark");
}

@end
