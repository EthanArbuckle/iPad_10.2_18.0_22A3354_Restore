@implementation PXPlacesMapThumbnailLocationCurator

- (PXPlacesMapThumbnailLocationCurator)init
{
  return -[PXPlacesMapThumbnailLocationCurator initWithLocationCuratorClass:curatedThumbnailsLimit:](self, "initWithLocationCuratorClass:curatedThumbnailsLimit:", objc_opt_class(), objc_msgSend(MEMORY[0x1E0D77E98], "fetchLimit"));
}

- (PXPlacesMapThumbnailLocationCurator)initWithLocationCuratorClass:(Class)a3 curatedThumbnailsLimit:(unint64_t)a4
{
  PXPlacesMapThumbnailLocationCurator *v6;
  PXPlacesMapThumbnailLocationCurator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPlacesMapThumbnailLocationCurator;
  v6 = -[PXPlacesMapThumbnailLocationCurator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationCuratorClass, a3);
    v7->_curatedThumbnailsLimit = a4;
  }
  return v7;
}

- (id)curatedGeotaggableFromSet:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapThumbnailLocationCurator.m"), 62, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("geotaggableSet.array"), v27, v28);

    }
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "px_descriptionForAssertionMessage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapThumbnailLocationCurator.m"), 68, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assets.firstObject"), v31, v32);

      }
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sortedArrayUsingDescriptors:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[PXPlacesMapThumbnailLocationCurator curatedThumbnailsLimit](self, "curatedThumbnailsLimit");
      v11 = v9;
      v12 = v11;
      if (v10 && objc_msgSend(v11, "count") > v10)
      {
        objc_msgSend(v12, "subarrayWithRange:", 0, v10);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v12;
      }
      v15 = v13;

      PXMap();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C99E60];
      -[objc_class requiredFetchPropertySets](-[PXPlacesMapThumbnailLocationCurator locationCuratorClass](self, "locationCuratorClass"), "requiredFetchPropertySets");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_alloc(MEMORY[0x1E0CD1620]);
      objc_msgSend(v6, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v16, v21, *MEMORY[0x1E0CD1B90], v19, 0, 0);

      -[objc_class representativeAssetsForMapDisplayFromAssets:](-[PXPlacesMapThumbnailLocationCurator locationCuratorClass](self, "locationCuratorClass"), "representativeAssetsForMapDisplayFromAssets:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (Class)locationCuratorClass
{
  return self->_locationCuratorClass;
}

- (unint64_t)curatedThumbnailsLimit
{
  return self->_curatedThumbnailsLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCuratorClass, 0);
}

uint64_t __65__PXPlacesMapThumbnailLocationCurator_curatedGeotaggableFromSet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

@end
