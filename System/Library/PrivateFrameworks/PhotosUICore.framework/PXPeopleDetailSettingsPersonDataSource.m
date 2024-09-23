@implementation PXPeopleDetailSettingsPersonDataSource

- (PXPeopleDetailSettingsPersonDataSource)initWithTitle:(id)a3 persons:(id)a4
{
  id v7;
  id v8;
  PXPeopleDetailSettingsPersonDataSource *v9;
  PXPeopleDetailSettingsPersonDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsPersonDataSource;
  v9 = -[PXPeopleDetailSettingsPersonDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_persons, a4);
  }

  return v10;
}

- (BOOL)hasMoreDetails
{
  return 1;
}

- (unint64_t)numberOfItems
{
  return -[PHFetchResult count](self->_persons, "count");
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
  PXPeopleFaceCropFetchOptions *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  -[PHFetchResult objectAtIndex:](self->_persons, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, width, height, a5);
  -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v13, "setShouldCacheResult:", 0);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__PXPeopleDetailSettingsPersonDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
  v16[3] = &unk_1E5147AB8;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "requestFaceCropForOptions:resultHandler:", v13, v16);

}

- (id)personNameAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PHFetchResult objectAtIndex:](self->_persons, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "localIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

- (unint64_t)faceCount:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[PHFetchResult objectAtIndex:](self->_persons, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "faceCount");

  return v4;
}

- (int64_t)verifyTypeAtIndex:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PHFetchResult objectAtIndex:](self->_persons, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verifiedType");

  return v4;
}

- (int64_t)action
{
  return 1;
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return -[PHFetchResult objectAtIndex:](self->_persons, "objectAtIndex:", a3);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PHFetchResult)persons
{
  return self->_persons;
}

- (void)setPersons:(id)a3
{
  objc_storeStrong((id *)&self->_persons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __93__PXPeopleDetailSettingsPersonDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
