@implementation PXPeopleStripCollectionViewCell

- (PXPeopleStripCollectionViewCell)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleStripCollectionViewCell;
  return -[PXPeopleStripCollectionViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleStripCollectionViewCell;
  -[PXPeopleStripCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PXPeopleStripCollectionViewCell bounds](self, "bounds");
  v5 = CGRectIntegral(v4);
  -[PXPeopleStripCollectionViewCell _layoutAvatarViewsInFrame:](self, "_layoutAvatarViewsInFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleStripCollectionViewCell;
  -[PXPeopleStripCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PXPeopleStripCollectionViewCell setPeople:](self, "setPeople:", 0);
  -[PXPeopleStripCollectionViewCell setGroupAvatarViews:](self, "setGroupAvatarViews:", 0);
  -[PXPeopleStripCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 0.0);

  objc_msgSend(v3, "setClipsToBounds:", 0);
}

- (void)setGroupAvatarViews:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSArray *groupAvatarViews;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_groupAvatarViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9++), "removeFromSuperview");
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  -[PXPeopleStripCollectionViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSArray reverseObjectEnumerator](v4, "reverseObjectEnumerator", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "addSubview:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

  if (-[NSArray count](v4, "count") > 1)
  {
    objc_msgSend(v10, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerRadius:", 10.0);

    objc_msgSend(v10, "setClipsToBounds:", 1);
  }
  else
  {
    objc_msgSend(v10, "frame");
    v17 = v16 * 0.5;
    objc_msgSend(v10, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", v17);

  }
  groupAvatarViews = self->_groupAvatarViews;
  self->_groupAvatarViews = v4;

}

- (void)setPeople:(id)a3
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  PXFocusableUIImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  PXPeopleFaceCropFetchOptions *v27;
  void *v28;
  double v29;
  PXPeopleFaceCropFetchOptions *v30;
  void *v31;
  void *v32;
  PXFocusableUIImageView *v33;
  id v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  PXFocusableUIImageView *v40;
  id v41;
  id v42[2];
  id location[2];

  v5 = a3;
  objc_storeStrong((id *)&self->_people, a3);
  v38 = v5;
  v6 = objc_msgSend(v5, "count");
  if (v6 >= 9)
    v7 = 9;
  else
    v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleStripCollectionViewCell bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[PXPeopleStripCollectionViewCell tag](self, "tag");
  if (v7)
  {
    v17 = 0;
    v18 = (void *)(v16 + 1);
    if (v13 >= v15)
      v19 = v15;
    else
      v19 = v13;
    v20 = 72 * v7 - 72;
    v36 = (char *)&yFactors + v20;
    v35 = (char *)&xFactors + v20;
    do
    {
      v21 = -[PXFocusableUIImageView initWithFrame:]([PXFocusableUIImageView alloc], "initWithFrame:", v9, v11, v13, v15);
      -[PXFocusableUIImageView setOpaque:](v21, "setOpaque:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFocusableUIImageView setBackgroundColor:](v21, "setBackgroundColor:", v22);

      -[PXFocusableUIImageView setContentMode:](v21, "setContentMode:", 2);
      -[PXFocusableUIImageView setClipsToBounds:](v21, "setClipsToBounds:", 1);
      -[PXFocusableUIImageView setAllowsFocus:](v21, "setAllowsFocus:", 0);
      if (v7 == 1)
      {
        -[PXFocusableUIImageView layer](v21, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCornerRadius:", v13 * 0.5);

      }
      objc_msgSend(v37, "addObject:", v21);
      -[PXPeopleStripCollectionViewCell setTag:](self, "setTag:", v18);
      objc_msgSend(v38, "objectAtIndexedSubscript:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v19 * *(double *)&v35[8 * v17];
      v26 = v19 * *(double *)&v36[8 * v17];
      v27 = [PXPeopleFaceCropFetchOptions alloc];
      -[PXPeopleStripCollectionViewCell traitCollection](self, "traitCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "displayScale");
      v30 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v27, "initWithPerson:targetSize:displayScale:", v24, v25, v26, v29);

      +[PXPeopleSocialGroupViewGenerator indexesThatNeedPortraitCropsForNumberOfFaces:](PXPeopleSocialGroupViewGenerator, "indexesThatNeedPortraitCropsForNumberOfFaces:", v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "containsIndex:", v17))
        -[PXPeopleFaceCropFetchOptions setCropFactor:](v30, "setCropFactor:", 3);
      if (v7 != 1)
        -[PXPeopleFaceCropFetchOptions setCornerStyle:](v30, "setCornerStyle:", 0);
      objc_initWeak(location, self);
      +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __45__PXPeopleStripCollectionViewCell_setPeople___block_invoke;
      v39[3] = &unk_1E512B528;
      objc_copyWeak(v42, location);
      v42[1] = v18;
      v33 = v21;
      v40 = v33;
      v34 = v24;
      v41 = v34;
      objc_msgSend(v32, "requestFaceCropForOptions:resultHandler:", v30, v39);

      objc_destroyWeak(v42);
      objc_destroyWeak(location);

      ++v17;
    }
    while (v7 != v17);
  }
  -[PXPeopleStripCollectionViewCell setGroupAvatarViews:](self, "setGroupAvatarViews:", v37);
  -[PXPeopleStripCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_layoutAvatarViewsInFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MinY;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  void *v67;
  id v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXPeopleStripCollectionViewCell groupAvatarViews](self, "groupAvatarViews");
  v68 = (id)objc_claimAutoreleasedReturnValue();
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = width;
  v69.size.height = height;
  MinX = CGRectGetMinX(v69);
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  MinY = CGRectGetMinY(v70);
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  v9 = CGRectGetWidth(v71);
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  CGRectGetWidth(v72);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  PXFloatFloorToPixel();
  v12 = v11;

  switch(objc_msgSend(v68, "count"))
  {
    case 1:
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFrame:", MinX, MinY, v9, v9);
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCornerRadius:", v9 * 0.5);

      goto LABEL_14;
    case 2:
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFrame:", 0.0, 0.0, v12 + -0.5, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v12 + 0.5;
      v17 = 0.0;
      v18 = v13;
      v19 = v12 + -0.5;
      goto LABEL_12;
    case 3:
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v12 + -0.5;
      objc_msgSend(v20, "setFrame:", 0.0, 0.0, v12 + -0.5, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v12 + 0.5;
      objc_msgSend(v22, "setFrame:", v23, 0.0, v21, v21);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v13;
      v16 = v23;
      v17 = v23;
      v19 = v21;
      v24 = v21;
      goto LABEL_13;
    case 4:
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12 + -0.5;
      objc_msgSend(v25, "setFrame:", 0.0, 0.0, v12 + -0.5, v12 + -0.5);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v12 + 0.5;
      objc_msgSend(v26, "setFrame:", v27, 0.0, v9, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setFrame:", 0.0, v27, v9, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v13;
      v16 = v27;
      goto LABEL_7;
    case 5:
      v29 = (v9 + -1.0 + v9 + -1.0) / 3.0;
      v9 = (v9 + -2.0) / 3.0;
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", 0.0, 0.0, v12 + -0.5, v29);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "setFrame:", v12 + 0.5, 0.0, v12 + -0.5, v29);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v29 + 1.0;
      objc_msgSend(v32, "setFrame:", 0.0, v29 + 1.0, v9, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "setFrame:", v9 + 1.0, v29 + 1.0, v9, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v9 + 1.0 + v9 + 1.0;
      v18 = v13;
LABEL_7:
      v17 = v27;
      v19 = v9;
      goto LABEL_12;
    case 6:
      v34 = (v9 + -1.0 + v9 + -1.0) / 3.0;
      v35 = (v34 + -1.0) * 0.5;
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFrame:", 0.0, 0.0, v34, v34);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v34 + 1.0;
      objc_msgSend(v37, "setFrame:", v38, 0.0, v35, v35);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "setFrame:", v38, v35 + 1.0, v35, v35);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "setFrame:", 0.0, v38, v35, v35);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "setFrame:", v35 + 1.0, v38, v35, v35);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v35 + 1.0 + v35 + 1.0;
      v18 = v13;
      v17 = v16;
      goto LABEL_10;
    case 7:
      v42 = (v9 + -2.0 + v9 + -2.0) / 3.0;
      v35 = (v9 + -2.0) / 3.0;
      v43 = (v42 + -1.0) * 0.5;
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFrame:", 0.0, 0.0, v35, v42);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "setFrame:", v35 + 1.0, 0.0, v35, v42);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "setFrame:", (v9 + v9) / 3.0 + 0.5, 0.0, v35, v43);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "setFrame:", (v9 + v9) / 3.0 + 0.5, v43 + 1.0, v35, v43);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 4);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = v42 + 1.0;
      objc_msgSend(v48, "setFrame:", 0.0, v49, v35, v35);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 5);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "setFrame:", v35 + 1.0, v49, v35, v35);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v35 + 1.0 + v35 + 1.0;
      v18 = v13;
      v17 = v49;
LABEL_10:
      v19 = v35;
      v24 = v35;
      goto LABEL_13;
    case 8:
      v51 = (v9 + -1.0 + v9 + -1.0) / 3.0;
      v52 = (v9 + -2.0) / 3.0;
      v53 = (v51 + -1.0) * 0.5;
      v9 = (v9 + -1.0) / 3.0;
      objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setFrame:", 0.0, 0.0, v52, v51);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = v52 + 1.0;
      objc_msgSend(v55, "setFrame:", v52 + 1.0, 0.0, v52, v53);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "setFrame:", v56 + v56, 0.0, v52, v53);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 3);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "setFrame:", v52 + 1.0, v53 + 1.0, v52, v53);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 4);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v59, "setFrame:", v56 + v56, v53 + 1.0, v52, v53);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 5);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = v51 + 1.0;
      objc_msgSend(v60, "setFrame:", 0.0, v61, v52, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 6);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "setFrame:", v52 + 1.0, v61, v52, v9);
      objc_msgSend(v68, "objectAtIndexedSubscript:", 7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v13;
      v16 = v56 + v56;
      v17 = v61;
      v19 = v52;
LABEL_12:
      v24 = v9;
LABEL_13:
      objc_msgSend(v18, "setFrame:", v16, v17, v19, v24);
      goto LABEL_14;
    case 9:
      v63 = 0;
      v64 = 0;
      v13 = 0;
      do
      {
        v65 = 0;
        v66 = (double)(int)v64;
        do
        {
          v67 = v13;
          objc_msgSend(v68, "objectAtIndexedSubscript:", v63 + v65, v66);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "setFrame:", ((v9 + -2.0) / 3.0 + 1.0) * (double)(int)v64, ((v9 + -2.0) / 3.0 + 1.0) * (double)(int)v65++, (v9 + -2.0) / 3.0, (v9 + -2.0) / 3.0);
        }
        while (v65 != 3);
        ++v64;
        v63 += 3;
      }
      while (v64 != 3);
LABEL_14:

      break;
    default:
      break;
  }

}

- (id)focusEffect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  -[PXPeopleStripCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");
  v6 = v5;
  objc_msgSend(v4, "cornerCurve");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXFocusInfo focusInfoWithView:cornerRadius:cornerCurve:](PXFocusInfo, "focusInfoWithView:cornerRadius:cornerCurve:", v3, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "makeHaloEffectForSourceView:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)people
{
  return self->_people;
}

- (NSArray)groupAvatarViews
{
  return self->_groupAvatarViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupAvatarViews, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

void __45__PXPeopleStripCollectionViewCell_setPeople___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13[2];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_copyWeak(v13, (id *)(a1 + 48));
  v13[1] = *(id *)(a1 + 56);
  v7 = v6;
  v12 = *(id *)(a1 + 32);
  v8 = v5;
  px_dispatch_on_main_queue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "PXPeopleStripCollectionViewCell: error requesting face crop: %@ for person: %@", buf, 0x16u);
    }

  }
  objc_destroyWeak(v13);

}

void __45__PXPeopleStripCollectionViewCell_setPeople___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 56));
  v2 = objc_loadWeakRetained(&to);
  if (v2)
  {
    v3 = v2;
    v4 = objc_loadWeakRetained(&to);
    v5 = objc_msgSend(v4, "tag");
    v6 = *(_QWORD *)(a1 + 64);

    if (v5 == v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "CGRectValue");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(*(id *)(a1 + 40), "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContentsRect:", v9, v11, v13, v15);

      objc_msgSend(*(id *)(a1 + 40), "setImage:", *(_QWORD *)(a1 + 48));
    }
  }
  objc_destroyWeak(&to);
}

@end
