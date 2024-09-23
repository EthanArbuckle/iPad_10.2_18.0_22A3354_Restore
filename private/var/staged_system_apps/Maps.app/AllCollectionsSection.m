@implementation AllCollectionsSection

- (AllCollectionsSection)initWithSectionIndex:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5
{
  id v7;
  AllCollectionsSection *v8;
  AllCollectionsSection *v9;
  MKPlaceCollectionsSizeController *v10;
  MKPlaceCollectionsSizeController *collectionsSizeController;
  CollectionsFilterSizeController *v12;
  CollectionsFilterSizeController *filtersSizeController;
  AllCollectionsSection *v14;
  objc_super v16;

  v7 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AllCollectionsSection;
  v8 = -[AllCollectionsSection init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)a3 > 1)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v8->_kind = a3;
    -[AllCollectionsSection setupConfiguration](v8, "setupConfiguration");
    v10 = (MKPlaceCollectionsSizeController *)objc_msgSend(objc_alloc((Class)MKPlaceCollectionsSizeController), "initWithDefaultCollectionsConfigurationUsingTraitCollections:inContext:", v7, 5);
    collectionsSizeController = v9->_collectionsSizeController;
    v9->_collectionsSizeController = v10;

    v12 = -[CollectionsFilterSizeController initWithCollectionsFilterDisplayStyle:inContext:]([CollectionsFilterSizeController alloc], "initWithCollectionsFilterDisplayStyle:inContext:", 0, 1);
    filtersSizeController = v9->_filtersSizeController;
    v9->_filtersSizeController = v12;

  }
  v14 = v9;
LABEL_6:

  return v14;
}

- (void)setupConfiguration
{
  int64x2_t v2;
  int64_t kind;
  const __CFString *v4;
  _QWORD v5[2];
  int64x2_t v6;

  kind = self->_kind;
  if (kind == 1)
  {
    v2 = (int64x2_t)1uLL;
    v4 = CFSTR("LoadingSection");
  }
  else if (kind)
  {
    v4 = 0;
  }
  else
  {
    v2 = vdupq_n_s64(1uLL);
    v2.i64[0] = 0;
    v4 = CFSTR("CollectionsSection");
  }
  v5[0] = 1;
  v5[1] = v4;
  v6 = v2;
  -[AllCollectionsSection setConfiguration:](self, "setConfiguration:", v5);
}

- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  void *v4;
  id v7;
  int64_t v8;
  uint64_t v9;

  v7 = a3;
  v8 = -[AllCollectionsSection kind](self, "kind");
  if (v8 == 1)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[AllCollectionsSection layoutSectionForLoadingUsingTraitEnvironment:](self, "layoutSectionForLoadingUsingTraitEnvironment:", v7));
    goto LABEL_5;
  }
  if (!v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[AllCollectionsSection layoutSectionForCollectionsUsingTraitsEnvironment:usingWidth:](self, "layoutSectionForCollectionsUsingTraitsEnvironment:usingWidth:", v7, a4));
LABEL_5:
    v4 = (void *)v9;
  }

  return v4;
}

- (id)layoutSectionForCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v7, "sizeForCollectionWithMaxCollectionsWidth:", a4);
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v12, "sectionInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v9));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v11));
  v23 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v21, v22));

  v45 = (void *)v23;
  v24 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v23));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 260.0));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v26, v25));

  v44 = (void *)v24;
  v48 = v24;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v27, v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsSection collectionsSizeController](self, "collectionsSizeController"));
  objc_msgSend(v31, "minimumInterItemSpacing");
  objc_msgSend(v30, "setInterGroupSpacing:");

  objc_msgSend(v30, "setContentInsets:", v14, v16, v18, v20);
  v32 = sub_1002A8AA0(v6);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  if (v32 == 5)
  {
    +[CollectionsFilterMenu defaultHeightForDisplayStyle:inContext:](CollectionsFilterMenu, "defaultHeightForDisplayStyle:inContext:", 1, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v33, v34));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterMenu reuseIdentifier](CollectionsFilterMenu, "reuseIdentifier"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v35, v36, 1));

    v47 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
    objc_msgSend(v30, "setBoundarySupplementaryItems:", v38);

  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsSection filtersSizeController](self, "filtersSizeController"));
    objc_msgSend(v39, "defaultHeight");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v33, v40));

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCarouselView reuseIdentifier](CollectionsFilterCarouselView, "reuseIdentifier"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v35, v41, 1));

    v46 = v37;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    objc_msgSend(v30, "setBoundarySupplementaryItems:", v42);

    objc_msgSend(v30, "setSupplementariesFollowContentInsets:", 0);
  }

  return v30;
}

- (id)layoutSectionForLoadingUsingTraitEnvironment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", a3, 1.0, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v3));
  objc_msgSend(v4, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 100.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v6, v5));

  v12 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v7, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v9));
  return v10;
}

- ($F604286BD1E4CBBF10F21E9B2637A591)configuration
{
  NSString *sectionIdentifier;
  $F604286BD1E4CBBF10F21E9B2637A591 *result;

  sectionIdentifier = self->_configuration.sectionIdentifier;
  retstr->var0 = self->_configuration.columnCount;
  result = sectionIdentifier;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->_configuration.cellKind;
  return result;
}

- (void)setConfiguration:(id *)a3
{
  NSString *var1;
  NSString *sectionIdentifier;

  self->_configuration.columnCount = a3->var0;
  var1 = (NSString *)a3->var1;
  a3->var1 = 0;
  sectionIdentifier = self->_configuration.sectionIdentifier;
  self->_configuration.sectionIdentifier = var1;

  *(_OWORD *)&self->_configuration.cellKind = *(_OWORD *)&a3->var2;
}

- (MKPlaceCollectionsSizeController)collectionsSizeController
{
  return self->_collectionsSizeController;
}

- (void)setCollectionsSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsSizeController, a3);
}

- (CollectionsFilterSizeController)filtersSizeController
{
  return self->_filtersSizeController;
}

- (void)setFiltersSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_filtersSizeController, a3);
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_filtersSizeController, 0);
  objc_storeStrong((id *)&self->_collectionsSizeController, 0);
}

@end
