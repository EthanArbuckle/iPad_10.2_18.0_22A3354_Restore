@implementation PGPhotoKitMemoryTrigger

- (PGPhotoKitMemoryTrigger)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v7;
  PGPhotoKitMemoryTrigger *v8;
  PGPhotoKitMemoryTrigger *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGPhotoKitMemoryTrigger;
  v8 = -[PGMemoryTrigger initWithLoggingConnection:](&v11, sel_initWithLoggingConnection_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_photoLibrary, a4);

  return v9;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
