@implementation PGMemoryCurationSession

- (PGMemoryCurationSession)initWithCurationManager:(id)a3 photoLibrary:(id)a4 curationContext:(id)a5 locationHelper:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGMemoryCurationSession *v15;
  PGMemoryCurationSession *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGMemoryCurationSession;
  v15 = -[PGMemoryCurationSession init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_curationManager, a3);
    objc_storeWeak((id *)&v16->_photoLibrary, v12);
    objc_storeStrong((id *)&v16->_curationContext, a5);
    objc_storeStrong((id *)&v16->_locationHelper, a6);
  }

  return v16;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (PGGraphLocationHelper)locationHelper
{
  return self->_locationHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_curationManager, 0);
}

@end
