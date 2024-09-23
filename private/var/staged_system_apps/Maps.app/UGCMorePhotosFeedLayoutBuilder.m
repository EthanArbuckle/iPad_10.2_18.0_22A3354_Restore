@implementation UGCMorePhotosFeedLayoutBuilder

+ (id)thumbnailGalleryLayoutForTraitCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];

  v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  objc_msgSend(v4, "setContentInsetsReference:", 1);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009A4C90;
  v7[3] = &unk_1011DD978;
  v7[4] = a1;
  v5 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:configuration:", v7, v4);

  return v5;
}

+ (id)_thumbnailGalleryLayoutForTraitCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = (char *)objc_msgSend(v6, "orientation");

  if (v5 == (id)5)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_thumbnailGalleryLayoutForMacOS"));
  }
  else if (v5 == (id)1)
  {
    if ((unint64_t)(v7 - 1) > 1)
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_thumbnailGalleryLayoutForPadLandscape"));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_thumbnailGalleryLayoutForPadPortrait"));
  }
  else if (v5 || objc_msgSend(v4, "verticalSizeClass") != (id)1)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_thumbnailGalleryLayoutForPhonePortrait"));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_thumbnailGalleryLayoutForPhoneLandscape"));
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)_thumbnailGalleryLayoutForPadPortrait
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
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
  void *v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[4];
  _QWORD v34[2];

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.75, 1.0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v29));
  objc_msgSend(v2, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 1.0, 0.333333343));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v30));
  objc_msgSend(v28, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.25, 1.0));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:repeatingSubitem:count:", v18, v28, 3));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 1.0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v27));
  objc_msgSend(v23, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.75));
  v34[0] = v26;
  v34[1] = v2;
  v22 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v25, v3));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.25, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v24));
  objc_msgSend(v4, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v24));
  objc_msgSend(v21, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.25));
  v33[0] = v4;
  v33[1] = v4;
  v33[2] = v4;
  v33[3] = v21;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v19, v5));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.75));
  v6 = objc_msgSend(v2, "copy");
  objc_msgSend(v6, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v30));
  objc_msgSend(v7, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:repeatingSubitem:count:", v18, v7, 3));
  v32[0] = v6;
  v32[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v16, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 2.75));
  v31[0] = v23;
  v31[1] = v20;
  v31[2] = v17;
  v31[3] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v11, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v13));
  return v14;
}

+ (id)_thumbnailGalleryLayoutForPhoneLandscape
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  _QWORD v38[4];
  _QWORD v39[2];
  _QWORD v40[6];
  _QWORD v41[2];
  _QWORD v42[2];

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.666666687, 1.0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v37));
  objc_msgSend(v2, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 1.0, 0.5));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v36));
  objc_msgSend(v33, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.5, 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v35));
  objc_msgSend(v3, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 1.0, 0.5));
  v30 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v34, v3, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:", 2.0));
  v32 = v4;
  objc_msgSend(v4, "setInterItemSpacing:", v5);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.333333343, 1.0));
  v42[0] = v33;
  v42[1] = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v31, v6));

  objc_msgSend(v3, "setContentInsets:", 0.0, 0.0, 0.0, 2.0);
  v8 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.333333343));
  v9 = v2;
  v28 = v2;
  v41[0] = v2;
  v41[1] = v7;
  v26 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
  v24 = (void *)v8;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v8, v10));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.166666672, 1.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v29));
  objc_msgSend(v11, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v12, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.166666672));
  v40[0] = v11;
  v40[1] = v11;
  v40[2] = v11;
  v40[3] = v11;
  v40[4] = v11;
  v40[5] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v25, v13));

  v15 = objc_msgSend(v9, "copy");
  objc_msgSend(v15, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v16 = objc_msgSend(v7, "copy");
  objc_msgSend(v16, "setContentInsets:", 0.0, 0.0, 0.0, 2.0);
  v39[0] = v16;
  v39[1] = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v8, v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 3.0));
  v38[0] = v27;
  v38[1] = v14;
  v38[2] = v18;
  v38[3] = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v19, v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v21));
  return v22;
}

+ (id)_thumbnailGalleryLayoutForPhonePortrait
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  _QWORD v35[4];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[2];

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.666666687, 1.0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v34));
  objc_msgSend(v2, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 1.0, 0.5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v33));
  objc_msgSend(v3, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.333333343, 1.0));
  v25 = v3;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:repeatingSubitem:count:", v21, v3, 2));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 1.0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v32));
  objc_msgSend(v27, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.666666687));
  v38[0] = v31;
  v38[1] = v2;
  v4 = v2;
  v28 = v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v30, v5));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", 0.333333343, 1.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v29));
  objc_msgSend(v6, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v29));
  objc_msgSend(v26, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v22 = v6;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.333333343));
  v37[0] = v6;
  v37[1] = v6;
  v37[2] = v26;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3));
  v8 = objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v23, v7));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 0.666666687));
  v9 = objc_msgSend(v4, "copy");
  objc_msgSend(v9, "setContentInsets:", 0.0, 0.0, 2.0, 2.0);
  v10 = objc_msgSend(v3, "copy");
  objc_msgSend(v10, "setContentInsets:", 0.0, 0.0, 2.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:repeatingSubitem:count:", v21, v10, 2));
  v36[0] = v9;
  v36[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:subitems:", v20, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeightUsingWidth:", 1.0, 2.66666675));
  v35[0] = v27;
  v35[1] = v24;
  v35[2] = v8;
  v35[3] = v13;
  v15 = (void *)v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v14, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v17));
  return v18;
}

+ (id)_loadingSection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize layoutSizeWithFractionalWidth:height:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:height:", 1.0, 50.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v2));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitems:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitems:", v2, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v5));
  return v6;
}

@end
