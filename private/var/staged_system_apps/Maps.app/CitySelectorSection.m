@implementation CitySelectorSection

- (CitySelectorSection)initWithSectionKind:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5
{
  id v7;
  CitySelectorSection *v8;
  CitySelectorSection *v9;
  objc_super v11;

  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CitySelectorSection;
  v8 = -[CitySelectorSection init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_kind = a3;
    -[CitySelectorSection setupConfiguration](v8, "setupConfiguration");
    -[CitySelectorSection initializeSizeControllerUsingTraitEnvironment:](v9, "initializeSizeControllerUsingTraitEnvironment:", v7);
  }

  return v9;
}

- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  void *v4;
  id v7;
  int64_t v8;
  uint64_t v9;

  v7 = a3;
  v8 = -[CitySelectorSection kind](self, "kind");
  if (v8 == 1)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CitySelectorSection layoutSectionForWorldwideUsingTraitsEnvironment:usingWidth:](self, "layoutSectionForWorldwideUsingTraitsEnvironment:usingWidth:", v7, a4));
    goto LABEL_5;
  }
  if (!v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CitySelectorSection layoutSectionForCompactCollectionsUsingTraitsEnvironment:usingWidth:](self, "layoutSectionForCompactCollectionsUsingTraitsEnvironment:usingWidth:", v7, a4));
LABEL_5:
    v4 = (void *)v9;
  }

  return v4;
}

- (void)setupConfiguration
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];

  v3 = -[CitySelectorSection kind](self, "kind");
  v4 = CFSTR("Worldwide");
  v5 = CFSTR("CompactCollection");
  v6 = 2;
  if (v3)
  {
    v5 = 0;
    v6 = (uint64_t)CFSTR("Worldwide");
    v7 = CFSTR("Worldwide");
  }
  else
  {
    v7 = 0;
  }
  if (v3 == 1)
  {
    v8 = 1;
  }
  else
  {
    v4 = v5;
    v8 = v6;
  }
  v10[0] = v8;
  v10[1] = v4;
  if (v3 == 1)
    v9 = 1;
  else
    v9 = (uint64_t)v7;
  v10[2] = 0;
  v10[3] = v9;
  if (self)
    -[CitySelectorSection setConfiguration:](self, "setConfiguration:", v10);
}

- (void)initializeSizeControllerUsingTraitEnvironment:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  id v6;
  MKPlaceCompactCollectionSizeController *v7;
  MKPlaceCompactCollectionSizeController *sizeController;

  v4 = self->_kind == 1;
  if (self->_kind == 1)
    v5 = 1;
  else
    v5 = 2;
  v6 = a3;
  v7 = (MKPlaceCompactCollectionSizeController *)objc_msgSend(objc_alloc((Class)MKPlaceCompactCollectionSizeController), "initWithCollectionsConfiguration:usingTraitCollections:inContext:", v4, v5, v6, 0);

  sizeController = self->_sizeController;
  self->_sizeController = v7;

}

- (id)layoutSectionForCompactCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;

  v39 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorSection sizeController](self, "sizeController"));
  objc_msgSend(v6, "sizeForCollectionWithMaxCollectionsWidth:", a4);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorSection sizeController](self, "sizeController"));
  objc_msgSend(v11, "sectionInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v8));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v10));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v20, v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 260.0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v25, v24));

  -[CitySelectorSection configuration](self, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitem:count:", v26, v23, v40));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorSection sizeController](self, "sizeController"));
  objc_msgSend(v28, "minimumInterItemSpacing");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
  objc_msgSend(v27, "setInterItemSpacing:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v27));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorSection sizeController](self, "sizeController"));
  objc_msgSend(v31, "minimumInterItemSpacing");
  objc_msgSend(v30, "setInterGroupSpacing:");

  objc_msgSend(v30, "setContentInsets:", v13, v15, v17, v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", 40.0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v32, v33));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesGenericSectionHeader reuseIdentifier](GuidesGenericSectionHeader, "reuseIdentifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:](NSCollectionLayoutBoundarySupplementaryItem, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v34, v35, 1));

  v42 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  objc_msgSend(v30, "setBoundarySupplementaryItems:", v37);

  return v30;
}

- (id)layoutSectionForWorldwideUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorSection sizeController](self, "sizeController"));
  objc_msgSend(v7, "sectionInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = ceil((a4 - (v11 + v15)) * 0.437317784);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v16));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v17, v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:", v16));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v22, v21));

  -[CitySelectorSection configuration](self, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitem:count:", v23, v20, v30));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorSection sizeController](self, "sizeController"));
  objc_msgSend(v25, "minimumInterItemSpacing");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:"));
  objc_msgSend(v24, "setInterItemSpacing:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v24));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorSection sizeController](self, "sizeController"));
  objc_msgSend(v28, "minimumInterItemSpacing");
  objc_msgSend(v27, "setInterGroupSpacing:");

  objc_msgSend(v27, "setContentInsets:", v9, v11, v13, v15);
  return v27;
}

- ($F604286BD1E4CBBF10F21E9B2637A591)configuration
{
  NSString *sectionIdentifier;
  $F604286BD1E4CBBF10F21E9B2637A591 *result;

  sectionIdentifier = self->_configuration.sectionIdentifier;
  retstr->var0 = self->_configuration.rowCount;
  result = sectionIdentifier;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->_configuration.cellKind;
  return result;
}

- (void)setConfiguration:(id *)a3
{
  NSString *var1;
  NSString *sectionIdentifier;

  self->_configuration.rowCount = a3->var0;
  var1 = (NSString *)a3->var1;
  a3->var1 = 0;
  sectionIdentifier = self->_configuration.sectionIdentifier;
  self->_configuration.sectionIdentifier = var1;

  *(_OWORD *)&self->_configuration.cellKind = *(_OWORD *)&a3->var2;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitle, a3);
}

- (MKPlaceCompactCollectionSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_sizeController, a3);
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

  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end
