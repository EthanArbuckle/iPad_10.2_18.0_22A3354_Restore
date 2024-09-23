@implementation PXPeopleDetailSettingsKeyFacesDataSource

- (PXPeopleDetailSettingsKeyFacesDataSource)initWithTitle:(id)a3 keyFaces:(id)a4 qualityProperty:(id)a5 photoLibrary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXPeopleDetailSettingsKeyFacesDataSource *v15;
  PXPeopleDetailSettingsKeyFacesDataSource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleDetailSettingsKeyFacesDataSource;
  v15 = -[PXPeopleDetailSettingsKeyFacesDataSource init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_keyFaces, a4);
    objc_storeStrong((id *)&v16->_qualityProperty, a5);
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
  }

  return v16;
}

- (BOOL)hasMoreDetails
{
  return 1;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_keyFaces, "count");
}

- (NSString)title
{
  return self->_title;
}

- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PXPeopleFaceCropFetchOptions *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];

  height = a4.height;
  width = a4.width;
  v28[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  -[NSArray objectAtIndex:](self->_keyFaces, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("localIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDetailSettingsKeyFacesDataSource photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIncludedDetectionTypes:", v17);

    v18 = (void *)MEMORY[0x1E0CD1528];
    v28[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchFacesWithLocalIdentifiers:options:", v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonWithFace:options:", v21, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:face:targetSize:displayScale:", v23, v21, width, height, a5);
    -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v24, "setShouldCacheResult:", 0);
    +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __95__PXPeopleDetailSettingsKeyFacesDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
    v26[3] = &unk_1E5147AB8;
    v27 = v11;
    objc_msgSend(v25, "requestFaceCropForOptions:resultHandler:", v24, v26);

  }
}

- (id)personNameAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSArray objectAtIndex:](self->_keyFaces, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[PXPeopleDetailSettingsKeyFacesDataSource qualityProperty](self, "qualityProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Quality %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)faceCount:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndex:](self->_keyFaces, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)verifyTypeAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)action
{
  return 0;
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_keyFaces, "objectAtIndex:", a3);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)keyFaces
{
  return self->_keyFaces;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)qualityProperty
{
  return self->_qualityProperty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualityProperty, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_keyFaces, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __95__PXPeopleDetailSettingsKeyFacesDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = a2;
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "CGRectValue");
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

  }
}

@end
