@implementation PXPhotosMapControllerAccessor

- (PXPhotosMapControllerAccessor)initWithMapController:(id)a3 traitCollection:(id)a4 mapViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotosMapControllerAccessor *v12;
  PXPhotosMapControllerAccessor *v13;
  PXPlacesUtils *v14;
  uint64_t v15;
  PKExtendedTraitCollection *pkExtendedTraitCollection;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosMapControllerAccessor;
  v12 = -[PXPhotosMapControllerAccessor init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapController, a3);
    v14 = objc_alloc_init(PXPlacesUtils);
    -[PXPlacesUtils pkExtendedTraitCollectionFromPXExtendedTraitCollection:](v14, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", v10);
    v15 = objc_claimAutoreleasedReturnValue();
    pkExtendedTraitCollection = v13->_pkExtendedTraitCollection;
    v13->_pkExtendedTraitCollection = (PKExtendedTraitCollection *)v15;

    objc_storeStrong((id *)&v13->_mapViewController, a5);
  }

  return v13;
}

- (PXPlacesMapController)mapController
{
  return self->_mapController;
}

- (PKExtendedTraitCollection)pk_extendedTraitCollection
{
  return self->_pkExtendedTraitCollection;
}

- (PXPlacesMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewController, 0);
  objc_storeStrong((id *)&self->_pkExtendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_mapController, 0);
}

@end
