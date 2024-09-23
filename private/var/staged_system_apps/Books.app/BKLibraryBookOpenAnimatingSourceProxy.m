@implementation BKLibraryBookOpenAnimatingSourceProxy

- (BKLibraryBookOpenAnimatingSourceProxy)initWithLibraryAsset:(id)a3 coverHost:(id)a4
{
  id v7;
  id v8;
  BKLibraryBookOpenAnimatingSourceProxy *v9;
  BKLibraryBookOpenAnimatingSourceProxy *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookOpenAnimatingSourceProxy;
  v9 = -[BKLibraryBookOpenAnimatingSourceProxy init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryAsset, a3);
    objc_storeStrong((id *)&v10->_coverHost, a4);
  }

  return v10;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy libraryAsset](self, "libraryAsset"));
  v5 = objc_msgSend(v3, "coverAnimationSourceUseLargeCoverForLibraryAsset:", v4);

  return v5;
}

- (id)coverAnimationSourceImage
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy libraryAsset](self, "libraryAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverImageForLibraryAsset:", v4));

  return v5;
}

- (id)coverAnimationSourceView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy libraryAsset](self, "libraryAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverAnimationSourceViewForLibraryAsset:", v4));

  return v5;
}

- (int64_t)coverAnimationSourceAlignment
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v3 = objc_msgSend(v2, "coverAnimationSourceAlignment");

  return (int64_t)v3;
}

- (CGRect)coverAnimationSourceFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy libraryAsset](self, "libraryAsset"));
  objc_msgSend(v3, "coverRectForLibraryAsset:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)coverAnimationSourceReferenceView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy libraryAsset](self, "libraryAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverAnimationSourceReferenceViewForLibraryAsset:", v4));

  return v5;
}

- (void)coverAnimationSourcePrepare
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy libraryAsset](self, "libraryAsset"));
  objc_msgSend(v4, "coverAnimationSourcePrepareForLibraryAsset:", v3);

}

- (void)coverAnimationSourceFinalize
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy coverHost](self, "coverHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookOpenAnimatingSourceProxy libraryAsset](self, "libraryAsset"));
  objc_msgSend(v4, "coverAnimationSourceFinalizeForLibraryAsset:", v3);

}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (void)setLibraryAsset:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAsset, a3);
}

- (BKLibraryBookOpenCoverHosting)coverHost
{
  return self->_coverHost;
}

- (void)setCoverHost:(id)a3
{
  objc_storeStrong((id *)&self->_coverHost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverHost, 0);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
}

@end
