@implementation PXSharedLibraryFaceTileImageProvider

- (PXSharedLibraryFaceTileImageProvider)init
{
  PXSharedLibraryFaceTileImageProvider *v2;
  PXSharedLibraryFaceTileImageProviderModel *v3;
  PXSharedLibraryFaceTileImageProviderModel *providerModel;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryFaceTileImageProvider;
  v2 = -[PXSharedLibraryFaceTileImageProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXSharedLibraryFaceTileImageProviderModel);
    providerModel = v2->_providerModel;
    v2->_providerModel = v3;

    -[PXSharedLibraryFaceTileImageProviderModel registerChangeObserver:context:](v2->_providerModel, "registerChangeObserver:context:", v2, PXSharedLibraryFaceTileImageProviderModelObservationContext);
  }
  return v2;
}

- (void)setCombinedImage:(id)a3
{
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;
  char v7;
  UIImage *v8;
  UIImage *combinedImage;
  _QWORD v10[5];

  v4 = (UIImage *)a3;
  v5 = self->_combinedImage;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIImage isEqual:](v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = (UIImage *)-[UIImage copy](v4, "copy");
      combinedImage = self->_combinedImage;
      self->_combinedImage = v8;

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __57__PXSharedLibraryFaceTileImageProvider_setCombinedImage___block_invoke;
      v10[3] = &unk_1E51479C8;
      v10[4] = self;
      -[PXSharedLibraryFaceTileImageProvider performChanges:](self, "performChanges:", v10);
    }
  }

}

- (void)_setMeContact:(id)a3
{
  CNContact *v5;
  CNContact *v6;
  char v7;
  CNContact *v8;

  v8 = (CNContact *)a3;
  v5 = self->_meContact;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[CNContact isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_meContact, a3);
      -[PXSharedLibraryFaceTileImageProvider _updateCombinedImage](self, "_updateCombinedImage");
    }
  }

}

- (void)_updateIncludeMeContact
{
  CNContact *meContact;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[PXSharedLibraryFaceTileImageProviderModel includeMeContact](self->_providerModel, "includeMeContact"))
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__PXSharedLibraryFaceTileImageProvider__updateIncludeMeContact__block_invoke;
    v4[3] = &unk_1E51178B0;
    objc_copyWeak(&v5, &location);
    +[PXActivityUtilities requestMeContactWithCompletion:](PXActivityUtilities, "requestMeContactWithCompletion:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    meContact = self->_meContact;
    self->_meContact = 0;

  }
}

- (void)_updateContext
{
  double v3;
  double v4;
  _BOOL8 v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  PXFaceTileImageCombinerContext *v15;
  PXFaceTileImageCombinerContext *context;
  id v17;

  -[PXSharedLibraryFaceTileImageProviderModel displayScale](self->_providerModel, "displayScale");
  v4 = v3;
  v5 = -[PXSharedLibraryFaceTileImageProviderModel isRTL](self->_providerModel, "isRTL");
  v6 = -[PXSharedLibraryFaceTileImageProviderModel isAscending](self->_providerModel, "isAscending");
  -[PXSharedLibraryFaceTileImageProviderModel imageDiameter](self->_providerModel, "imageDiameter");
  v8 = v7;
  -[PXSharedLibraryFaceTileImageProviderModel imageOffset](self->_providerModel, "imageOffset");
  v10 = v9;
  -[PXSharedLibraryFaceTileImageProviderModel backgroundColor](self->_providerModel, "backgroundColor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryFaceTileImageProviderModel borderColor](self->_providerModel, "borderColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryFaceTileImageProviderModel borderWidth](self->_providerModel, "borderWidth");
  if (v4 <= 0.0 || v17 == 0 || v11 == 0)
    v15 = 0;
  else
    v15 = -[PXFaceTileImageCombinerContext initWithDisplayScale:isRTL:isAscending:imageSize:imageOffset:backgroundColor:borderColor:borderWidth:]([PXFaceTileImageCombinerContext alloc], "initWithDisplayScale:isRTL:isAscending:imageSize:imageOffset:backgroundColor:borderColor:borderWidth:", v5, v6, v17, v11, v4, v8, round(v8 * v10), v12);
  context = self->_context;
  self->_context = v15;

}

- (void)_updateCombinedImage
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  PXFaceTileImageCombiner *v8;
  PXFaceTileImageCombiner *faceTileImageCombiner;
  PXFaceTileImageCombiner *v10;
  PXFaceTileImageCombinerContext *context;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_meContact
    && -[PXSharedLibraryFaceTileImageProviderModel includeMeContact](self->_providerModel, "includeMeContact"))
  {
    objc_msgSend(v3, "addObject:", self->_meContact);
  }
  -[PXSharedLibraryFaceTileImageProviderModel faceTileCombinerItems](self->_providerModel, "faceTileCombinerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = objc_msgSend(v3, "count");
  if (v5 > -[PXSharedLibraryFaceTileImageProviderModel includeMeContact](self->_providerModel, "includeMeContact")
    && self->_context)
  {
    if (v5 >= 5)
      v6 = 5;
    else
      v6 = v5;
    objc_msgSend(v3, "subarrayWithRange:", v5 - v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_faceTileImageCombiner)
    {
      v8 = objc_alloc_init(PXFaceTileImageCombiner);
      faceTileImageCombiner = self->_faceTileImageCombiner;
      self->_faceTileImageCombiner = v8;

    }
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    objc_initWeak(&location, self);
    v10 = self->_faceTileImageCombiner;
    context = self->_context;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PXSharedLibraryFaceTileImageProvider__updateCombinedImage__block_invoke;
    v13[3] = &unk_1E51178D8;
    v13[4] = &v16;
    objc_copyWeak(&v14, &location);
    -[PXFaceTileImageCombiner requestCombinedImageForItems:context:resultHandler:](v10, "requestCombinedImageForItems:context:resultHandler:", v7, context, v13);
    if (*((_BYTE *)v17 + 24))
    {
      +[PXFaceTileImageCombiner placeholderImageForNumberOfItems:context:](PXFaceTileImageCombiner, "placeholderImageForNumberOfItems:context:", objc_msgSend(v7, "count"), self->_context);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedLibraryFaceTileImageProvider setCombinedImage:](self, "setCombinedImage:", v12);

    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    -[PXSharedLibraryFaceTileImageProvider setCombinedImage:](self, "setCombinedImage:", 0);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  if ((void *)PXSharedLibraryFaceTileImageProviderModelObservationContext == a5)
  {
    v9 = v8;
    if ((v6 & 1) != 0)
    {
      -[PXSharedLibraryFaceTileImageProvider _updateIncludeMeContact](self, "_updateIncludeMeContact");
      v8 = v9;
    }
    if ((v6 & 0x1FE) != 0)
    {
      -[PXSharedLibraryFaceTileImageProvider _updateContext](self, "_updateContext");
LABEL_7:
      -[PXSharedLibraryFaceTileImageProvider _updateCombinedImage](self, "_updateCombinedImage");
      v8 = v9;
      goto LABEL_8;
    }
    if ((v6 & 0x201) != 0)
      goto LABEL_7;
  }
LABEL_8:

}

- (PXSharedLibraryFaceTileImageProviderModel)providerModel
{
  return self->_providerModel;
}

- (UIImage)combinedImage
{
  return self->_combinedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedImage, 0);
  objc_storeStrong((id *)&self->_providerModel, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_faceTileImageCombiner, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

void __60__PXSharedLibraryFaceTileImageProvider__updateCombinedImage__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v2 = (id *)(a1 + 40);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setCombinedImage:", v3);

}

void __63__PXSharedLibraryFaceTileImageProvider__updateIncludeMeContact__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setMeContact:", v3);

}

uint64_t __57__PXSharedLibraryFaceTileImageProvider_setCombinedImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

@end
