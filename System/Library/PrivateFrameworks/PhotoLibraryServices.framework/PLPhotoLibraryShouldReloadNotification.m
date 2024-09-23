@implementation PLPhotoLibraryShouldReloadNotification

- (id)initNotificationWithPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
  return self;
}

- (id)name
{
  return CFSTR("PLPhotoLibraryShouldReload");
}

- (id)object
{
  return self->_photoLibrary;
}

- (id)userInfo
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
