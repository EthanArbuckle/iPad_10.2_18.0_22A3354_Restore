@implementation PXPeopleDetailSettingsFaceDataSource

- (PXPeopleDetailSettingsFaceDataSource)initWithTitle:(id)a3 faces:(id)a4
{
  id v7;
  id v8;
  PXPeopleDetailSettingsFaceDataSource *v9;
  PXPeopleDetailSettingsFaceDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsFaceDataSource;
  v9 = -[PXPeopleDetailSettingsFaceDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_faces, a4);
  }

  return v10;
}

- (BOOL)hasMoreDetails
{
  return 0;
}

- (unint64_t)numberOfItems
{
  return -[PHFetchResult count](self->_faces, "count");
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
  PXPeopleFaceCropFetchOptions *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];

  height = a4.height;
  width = a4.width;
  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  -[PHFetchResult objectAtIndex:](self->_faces, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v12, "detectionType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIncludedDetectionTypes:", v16);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonWithFace:options:", v12, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:face:targetSize:displayScale:", v18, v12, width, height, a5);
  -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v19, "setShouldCacheResult:", 0);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __91__PXPeopleDetailSettingsFaceDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
  v22[3] = &unk_1E5147AB8;
  v23 = v11;
  v21 = v11;
  objc_msgSend(v20, "requestFaceCropForOptions:resultHandler:", v19, v22);

}

- (int64_t)action
{
  return 0;
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return -[PHFetchResult objectAtIndex:](self->_faces, "objectAtIndex:", a3);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PHFetchResult)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
  objc_storeStrong((id *)&self->_faces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __91__PXPeopleDetailSettingsFaceDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
