@implementation UGCUserUploadedPhotoDataProvider

- (UGCUserUploadedPhotoDataProvider)initWithLookupResult:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  UGCUserUploadedPhotoDataProvider *v9;
  UGCUserUploadedPhotoDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCUserUploadedPhotoDataProvider;
  v9 = -[UGCUserUploadedPhotoDataProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lookupResult, a3);
    -[UGCPhotoViewerDataProvider setDelegate:](v10, "setDelegate:", v8);
    -[UGCUserUploadedPhotoDataProvider _setupPhotos](v10, "_setupPhotos");
  }

  return v10;
}

- (BOOL)hasDataToShow
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserUploadedPhotoDataProvider photoList](self, "photoList"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasReachedTotalCount
{
  return 1;
}

- (void)fetchNextBatchRequestIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->_hasNotifiedDelegate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataProvider delegate](self, "delegate"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoViewerDataProvider delegate](self, "delegate"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserUploadedPhotoDataProvider photoList](self, "photoList"));
      objc_msgSend(v4, "photoViewerDataProvider:didUpdateWithPhotos:", self, v5);

      self->_hasNotifiedDelegate = 1;
    }
  }
}

- (void)_setupPhotos
{
  void *v3;
  void *v4;
  id v5;
  Result *v6;
  Result *userSubmittedPhotosResult;
  Result *v8;
  Result *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSubmissionLookupResult previousSubmission](self->_lookupResult, "previousSubmission"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "images"));
  v5 = sub_10039DCD4(v4, &stru_1011E2CF0);
  v10 = (id)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v10, "count"))
  {
    v6 = (Result *)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v10));
    userSubmittedPhotosResult = self->_userSubmittedPhotosResult;
    self->_userSubmittedPhotosResult = v6;
  }
  else
  {
    userSubmittedPhotosResult = (Result *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, 0));
    v8 = (Result *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", userSubmittedPhotosResult));
    v9 = self->_userSubmittedPhotosResult;
    self->_userSubmittedPhotosResult = v8;

  }
}

- (NSArray)attributionNames
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)photoList
{
  Result *userSubmittedPhotosResult;
  id v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100B14470;
  v11 = sub_100B14480;
  v12 = 0;
  userSubmittedPhotosResult = self->_userSubmittedPhotosResult;
  v5[4] = &v7;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B14488;
  v6[3] = &unk_1011B57F0;
  v6[4] = &v7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B14498;
  v5[3] = &unk_1011B17D0;
  -[Result withValue:orError:](userSubmittedPhotosResult, "withValue:orError:", v6, v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v3;
}

- (UGCPhotoAlbumCategory)albumCategory
{
  UGCPhotoAlbumCategory *v2;
  void *v3;
  void *v4;
  UGCPhotoAlbumCategory *v5;

  v2 = [UGCPhotoAlbumCategory alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Your Photos Header [UGC]"), CFSTR("localized string not found"), 0));
  v5 = -[UGCPhotoAlbumCategory initWithTitle:categoryType:](v2, "initWithTitle:categoryType:", v4, 2);

  return v5;
}

- (BOOL)isAllowedToShowAddPhotoCallToAction
{
  return 1;
}

- (unint64_t)totalNumberOfPhotos
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCUserUploadedPhotoDataProvider photoList](self, "photoList"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)indexOfTappedPhoto
{
  return self->_indexOfTappedPhoto;
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  self->_indexOfTappedPhoto = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSubmittedPhotosResult, 0);
  objc_storeStrong((id *)&self->_lookupResult, 0);
}

@end
