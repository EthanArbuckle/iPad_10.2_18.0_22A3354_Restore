@implementation PXPeopleDetailSettingsPersonSuggestionDataSource

- (PXPeopleDetailSettingsPersonSuggestionDataSource)initWithTitle:(id)a3 personSuggestions:(id)a4
{
  id v7;
  id v8;
  PXPeopleDetailSettingsPersonSuggestionDataSource *v9;
  PXPeopleDetailSettingsPersonSuggestionDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsPersonSuggestionDataSource;
  v9 = -[PXPeopleDetailSettingsPersonSuggestionDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_personSuggestions, a4);
  }

  return v10;
}

- (BOOL)hasMoreDetails
{
  return 1;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_personSuggestions, "count");
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
  void *v15;
  PXPeopleFaceCropFetchOptions *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  -[NSArray objectAtIndex:](self->_personSuggestions, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [PXPeopleFaceCropFetchOptions alloc];
  objc_msgSend(v12, "person");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyFace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v13, "initWithPerson:face:targetSize:displayScale:", v14, v15, width, height, a5);

  -[PXPeopleFaceCropFetchOptions setCropFactor:](v16, "setCropFactor:", 0);
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v16, "setCornerStyle:", 0);
  -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v16, "setShouldCacheResult:", 0);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __103__PXPeopleDetailSettingsPersonSuggestionDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
  v19[3] = &unk_1E5147AB8;
  v20 = v11;
  v18 = v11;
  objc_msgSend(v17, "requestFaceCropForOptions:resultHandler:", v16, v19);

}

- (id)personNameAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_personSuggestions, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)faceCount:(int64_t)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSArray objectAtIndex:](self->_personSuggestions, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "faceCount");

  return v5;
}

- (int64_t)verifyTypeAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)action
{
  return 2;
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_personSuggestions, "objectAtIndex:", a3);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)personSuggestions
{
  return self->_personSuggestions;
}

- (void)setPersonSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_personSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSuggestions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __103__PXPeopleDetailSettingsPersonSuggestionDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8 && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "CGRectValue");
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

  }
}

@end
