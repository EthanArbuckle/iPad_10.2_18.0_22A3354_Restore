@implementation ICNoteSearchCollectionView

- (id)createLayout
{
  void ***v2;
  id v3;
  id v4;
  void **v6;
  uint64_t v7;
  id (*v8)(uint64_t, uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_10009EDF0;
  v9 = &unk_1005520C8;
  objc_copyWeak(&v10, &location);
  v2 = objc_retainBlock(&v6);
  v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v4 = objc_msgSend(v3, "initWithSectionProvider:", v2, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

- (int64_t)keyboardDismissMode
{
  return 1;
}

- (void)setHeaderOfSectionLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView headerLayoutItemWithEstimatedHeight:](self, "headerLayoutItemWithEstimatedHeight:", 50.0));
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision")
    && !-[ICNoteBrowseCollectionView noteContainerViewMode](self, "noteContainerViewMode"))
  {
    objc_msgSend(v4, "contentInsets");
    objc_msgSend(v5, "setContentInsets:");
  }
  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  objc_msgSend(v4, "setBoundarySupplementaryItems:", v6);

}

- (int64_t)noteListSectionHeaderModeForSectionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  int64_t v9;
  objc_super v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  if (v8 == CFSTR("ICNoteSearchDataSourceSuggestionsSectionIdentifier"))
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICNoteSearchCollectionView;
    v9 = -[ICNoteBrowseCollectionView noteListSectionHeaderModeForSectionIndex:](&v11, "noteListSectionHeaderModeForSectionIndex:", a3);
  }

  return v9;
}

- (id)attachmentSectionForLayoutEnvironment:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  +[ICSearchAttachmentResultsCollectionViewCell itemSize](ICSearchAttachmentResultsCollectionViewCell, "itemSize");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "container"));

  objc_msgSend(v7, "effectiveContentSize");
  v9 = v8;

  v10 = fmax(ceil(v9 / 450.0), 1.0);
  v11 = 16.0 / v9;
  if ((unint64_t)v10 <= 1)
    v11 = 0.0;
  v12 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0 / (double)(unint64_t)v10 - v11));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v6));
  v39 = (void *)v12;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", v6));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v14, v15));
  v41 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v16, v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing flexibleSpacing:](NSCollectionLayoutSpacing, "flexibleSpacing:", 16.0));
  objc_msgSend(v18, "setInterItemSpacing:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v18));
  objc_msgSend(v20, "setInterGroupSpacing:", 16.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseCollectionView headerLayoutItemWithEstimatedHeight:](self, "headerLayoutItemWithEstimatedHeight:", 50.0));
  v40 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
  objc_msgSend(v20, "setBoundarySupplementaryItems:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
  v24 = objc_msgSend(v23, "behavior");

  if (v24 != (id)1)
  {
    objc_msgSend(v20, "contentInsets");
    v26 = v25;
    v28 = v27;
    -[ICNoteSearchCollectionView directionalLayoutMargins](self, "directionalLayoutMargins");
    v30 = v29;
    -[ICNoteSearchCollectionView ic_directionalSafeAreaInsets](self, "ic_directionalSafeAreaInsets");
    v32 = v30 - v31;
    -[ICNoteSearchCollectionView directionalLayoutMargins](self, "directionalLayoutMargins");
    v34 = v33;
    -[ICNoteSearchCollectionView ic_directionalSafeAreaInsets](self, "ic_directionalSafeAreaInsets");
    objc_msgSend(v20, "setContentInsets:", v26, v32, v28, v34 - v35);
  }

  return v20;
}

@end
