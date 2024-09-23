@implementation PKRemoteDataAccessor

- (id)content
{
  void *v2;

  if (self->_library)
  {
    -[PKPassLibrary contentForUniqueID:](self->_library, "contentForUniqueID:", self->_objectUniqueID);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7
{
  void *v7;

  if (self->_library)
  {
    -[PKPassLibrary imageSetForUniqueID:ofType:displayProfile:suffix:](self->_library, "imageSetForUniqueID:ofType:displayProfile:suffix:", self->_objectUniqueID, a3, a6, a5, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (PKRemoteDataAccessor)initWithLibrary:(id)a3 objectUniqueID:(id)a4
{
  id v7;
  id v8;
  PKRemoteDataAccessor *v9;
  PKRemoteDataAccessor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteDataAccessor;
  v9 = -[PKRemoteDataAccessor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_objectUniqueID, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectUniqueID, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8
{
  id v12;
  void (**v13)(id, _QWORD);
  PKPassLibrary *library;
  id v15;

  v15 = a5;
  v12 = a6;
  v13 = (void (**)(id, _QWORD))a8;
  library = self->_library;
  if (library)
  {
    -[PKPassLibrary fetchImageSetForUniqueID:ofType:displayProfile:suffix:withCompletion:](library, "fetchImageSetForUniqueID:ofType:displayProfile:suffix:withCompletion:", self->_objectUniqueID, a3, v12, v15, v13);
  }
  else if (v13)
  {
    v13[2](v13, 0);
  }

}

- (PKRemoteDataAccessor)init
{

  return 0;
}

- (void)revocationStatusWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)noteShared
{
  -[PKPassLibrary noteObjectSharedWithUniqueID:](self->_library, "noteObjectSharedWithUniqueID:", self->_objectUniqueID);
}

- (void)updateSettings:(unint64_t)a3
{
  -[PKPassLibrary updateSettings:forObjectWithUniqueID:](self->_library, "updateSettings:forObjectWithUniqueID:", a3, self->_objectUniqueID);
}

- (void)requestUpdateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  PKPassLibrary *library;
  void (**v6)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  library = self->_library;
  if (library)
  {
    v6 = v4;
    -[PKPassLibrary requestUpdateOfObjectWithUniqueIdentifier:completion:](library, "requestUpdateOfObjectWithUniqueIdentifier:completion:", self->_objectUniqueID);
LABEL_5:
    v4 = v6;
    goto LABEL_6;
  }
  if (v4)
  {
    v6 = v4;
    v4[2](v4, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)contentWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  PKPassLibrary *library;
  void (**v6)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  library = self->_library;
  if (library)
  {
    v6 = v4;
    -[PKPassLibrary fetchContentForUniqueID:withCompletion:](library, "fetchContentForUniqueID:withCompletion:", self->_objectUniqueID);
LABEL_5:
    v4 = v6;
    goto LABEL_6;
  }
  if (v4)
  {
    v6 = v4;
    v4[2](v4, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)cachedImageSetForType:(int64_t)a3 withDisplayProfile:(id)a4 displayTraits:(id)a5
{
  void *v5;

  if (self->_library)
  {
    -[PKPassLibrary cachedImageSetForUniqueID:type:withDisplayProfile:displayTraits:](self->_library, "cachedImageSetForUniqueID:type:withDisplayProfile:displayTraits:", self->_objectUniqueID, a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  return -[PKPassLibrary dataForBundleResourceNamed:withExtension:objectUniqueIdentifier:](self->_library, "dataForBundleResourceNamed:withExtension:objectUniqueIdentifier:", a3, a4, self->_objectUniqueID);
}

- (id)dataForBundleResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKRemoteDataAccessor dataForBundleResourceNamed:withExtension:](self, "dataForBundleResourceNamed:withExtension:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataForBundleResources:(id)a3
{
  return -[PKPassLibrary dataForBundleResources:objectUniqueIdentifier:](self->_library, "dataForBundleResources:objectUniqueIdentifier:", a3, self->_objectUniqueID);
}

- (id)archiveData
{
  return -[PKPassLibrary archiveForObjectWithUniqueID:](self->_library, "archiveForObjectWithUniqueID:", self->_objectUniqueID);
}

- (id)displayProfileOfType:(int64_t)a3
{
  return 0;
}

- (id)passLocalizedStringForKey:(id)a3
{
  return -[PKPassLibrary passLocalizedStringForKey:uniqueID:](self->_library, "passLocalizedStringForKey:uniqueID:", a3, self->_objectUniqueID);
}

- (PKPassLibrary)library
{
  return self->_library;
}

- (NSString)objectUniqueID
{
  return self->_objectUniqueID;
}

@end
