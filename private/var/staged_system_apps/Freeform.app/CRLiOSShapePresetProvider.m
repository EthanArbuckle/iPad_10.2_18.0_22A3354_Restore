@implementation CRLiOSShapePresetProvider

- (CRLiOSShapePresetProvider)initWithShapeCollectionDataSource:(id)a3 searchResultsCollection:(id)a4
{
  id v7;
  id v8;
  CRLiOSShapePresetProvider *v9;
  CRLiOSShapePresetProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapePresetProvider;
  v9 = -[CRLiOSShapePresetProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shapeCollectionDataSource, a3);
    objc_storeStrong((id *)&v10->_searchResultsCollection, a4);
  }

  return v10;
}

- (BOOL)contextIsLowContrast:(id)a3 forBackgroundColor:(id)a4
{
  return 0;
}

- (id)p_localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4 isUserDefinedShape:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_shapeAtIndexPath:context:](self, "p_shapeAtIndexPath:context:", a3, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  if (objc_msgSend(v8, "isSearching"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_searchResultsCollection](self, "p_searchResultsCollection"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNameForShape:", v9));

    v10 = (void *)v12;
  }
  v13 = objc_msgSend(v8, "pageIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
  v15 = objc_msgSend(v14, "indexOfUserDefinedLibraryCategory");

  if (a5)
    *a5 = v13 == v15;
  if (!objc_msgSend(v10, "length") && v13 == v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(+[CRLiOSShapePresetProvider p_placeholderLocalizedString](CRLiOSShapePresetProvider, "p_placeholderLocalizedString"));

    v10 = (void *)v16;
  }

  return v10;
}

- (id)localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  return -[CRLiOSShapePresetProvider p_localizedNameForPresetAtIndexPath:context:isUserDefinedShape:](self, "p_localizedNameForPresetAtIndexPath:context:isUserDefinedShape:", a3, a4, 0);
}

- (BOOL)isDefaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  char v8;

  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_localizedNameForPresetAtIndexPath:context:isUserDefinedShape:](self, "p_localizedNameForPresetAtIndexPath:context:isUserDefinedShape:", a3, a4, &v8));
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSShapePresetProvider p_placeholderLocalizedString](CRLiOSShapePresetProvider, "p_placeholderLocalizedString"));
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)defaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend(a4, "pageIndex", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
  v7 = objc_msgSend(v6, "indexOfUserDefinedLibraryCategory");

  if (v5 == v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSShapePresetProvider p_placeholderLocalizedString](CRLiOSShapePresetProvider, "p_placeholderLocalizedString"));
  else
    v8 = 0;
  return v8;
}

- (id)localizedAccessibilityNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_shapeAtIndexPath:context:](self, "p_shapeAtIndexPath:context:", a3, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityName"));
  if (!objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(v6, "pageIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
    v11 = objc_msgSend(v10, "indexOfUserDefinedLibraryCategory");

    if (v9 == v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Shape"), 0, 0));

      v8 = (void *)v13;
    }
  }

  return v8;
}

- (BOOL)shouldWaitBeforeDeliveringSwatchesInContext:(id)a3
{
  return 1;
}

- (BOOL)suppressesAnimation
{
  return 1;
}

- (UIEdgeInsets)swatchInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwatchCache swatchCache](CRLSwatchCache, "swatchCache"));
  objc_msgSend(v2, "shapeSwatchInset");
  v4 = v3;
  v6 = v5;

  v7 = v6;
  v8 = v4;
  v9 = v6;
  v10 = v4;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (id)swatchOperationWithSize:(CGSize)a3 atIndexPath:(id)a4 context:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  CRLSwatchRenderingContext *v19;
  CRLShapeRenderingOperation *v20;
  double v21;
  double v22;
  void *v23;
  CRLShapeRenderingOperation *v24;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_shapeAtIndexPath:context:](self, "p_shapeAtIndexPath:context:", a4, v9));
  v11 = (unint64_t)objc_msgSend(v10, "shapeType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
  if (v11 > 0x14 || ((1 << v11) & 0x1D8006) == 0)
    v14 = 0.0;
  else
    v14 = 45.0;
  v15 = objc_msgSend(v9, "isInDarkContainer");
  v16 = objc_msgSend(v9, "isInTranslucentContainer");
  v17 = 2;
  if (v16)
    v17 = 3;
  if (v15)
    v18 = v17;
  else
    v18 = v16;
  v19 = objc_alloc_init(CRLSwatchRenderingContext);
  -[CRLSwatchRenderingContext setBackgroundAppearance:](v19, "setBackgroundAppearance:", v18);
  -[CRLSwatchRenderingContext setWantsToRenderHighContrastBackground:](v19, "setWantsToRenderHighContrastBackground:", 0);
  v20 = [CRLShapeRenderingOperation alloc];
  +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathSourceWithSize:", width, height));
  v24 = -[CRLShapeRenderingOperation initWithImageSize:imageScale:shapeType:shapePathSource:angle:editingCoordinator:swatchCacheRenderingContext:](v20, "initWithImageSize:imageScale:shapeType:shapePathSource:angle:editingCoordinator:swatchCacheRenderingContext:", v11, v23, v12, v19, width, height, v22, v14);

  return v24;
}

- (id)p_shapeAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v6, "isSearching") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_searchResultsCollection](self, "p_searchResultsCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shapeAtIndexPath:", v7));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetProvider p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
    v10 = objc_msgSend(v7, "row");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shapeAtIndex:categoryIndex:", v10, objc_msgSend(v6, "pageIndex")));
  }

  return v9;
}

+ (id)p_placeholderLocalizedString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Shape"), 0, 0));

  return v3;
}

- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource
{
  return self->_shapeCollectionDataSource;
}

- (void)setP_shapeCollectionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_shapeCollectionDataSource, a3);
}

- (CRLShapeSearchResultsCollection)p_searchResultsCollection
{
  return self->_searchResultsCollection;
}

- (void)setP_searchResultsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsCollection, 0);
  objc_storeStrong((id *)&self->_shapeCollectionDataSource, 0);
}

@end
