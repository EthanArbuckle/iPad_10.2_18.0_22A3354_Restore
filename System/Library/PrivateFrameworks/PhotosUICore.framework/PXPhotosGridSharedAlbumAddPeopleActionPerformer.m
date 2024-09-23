@implementation PXPhotosGridSharedAlbumAddPeopleActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsSharedAlbumOptionsAddPeople"), CFSTR("PhotosUICore"));
}

- (id)activitySystemImageName
{
  return CFSTR("person.crop.circle.badge.plus");
}

@end
