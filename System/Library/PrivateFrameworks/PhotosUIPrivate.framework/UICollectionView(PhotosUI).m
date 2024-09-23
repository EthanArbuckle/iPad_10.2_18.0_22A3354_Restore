@implementation UICollectionView(PhotosUI)

- (uint64_t)pu_scrollToRect:()PhotosUI atScrollPosition:animated:
{
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double MaxX;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double MidY;
  double v38;
  double MaxY;
  double MidX;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  objc_msgSend(a1, "bounds");
  v16 = v15;
  v18 = v17;
  v44 = v19;
  v45 = v20;
  objc_msgSend(a1, "contentInset");
  v23 = v22;
  v42 = v25;
  v43 = v24;
  if ((a7 & 8) != 0)
  {
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    v31 = CGRectGetMinX(v47) - v23;
  }
  else
  {
    v26 = v21;
    v27 = a2;
    v28 = a3;
    v29 = a4;
    v30 = a5;
    if ((a7 & 0x20) != 0)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v27);
      v48.origin.x = v16;
      v48.origin.y = v18;
      v48.size.width = v44;
      v48.size.height = v45;
      v31 = MaxX - (CGRectGetWidth(v48) - v26);
    }
    else
    {
      MidX = CGRectGetMidX(*(CGRect *)&v27);
      v46.origin.x = v16;
      v46.origin.y = v18;
      v46.size.width = v44;
      v46.size.height = v45;
      v31 = MidX + (v23 + CGRectGetWidth(v46) - v26) * -0.5;
    }
  }
  v33 = a2;
  v34 = a3;
  v35 = a4;
  v36 = a5;
  if ((a7 & 1) != 0)
  {
    v38 = CGRectGetMinY(*(CGRect *)&v33) - v43;
  }
  else if ((a7 & 4) != 0)
  {
    MaxY = CGRectGetMaxY(*(CGRect *)&v33);
    v50.origin.x = v16;
    v50.origin.y = v18;
    v50.size.width = v44;
    v50.size.height = v45;
    v38 = MaxY - (CGRectGetHeight(v50) - v42);
  }
  else
  {
    MidY = CGRectGetMidY(*(CGRect *)&v33);
    v49.origin.x = v16;
    v49.origin.y = v18;
    v49.size.width = v44;
    v49.size.height = v45;
    v38 = MidY + (v43 + CGRectGetHeight(v49) - v42) * -0.5;
  }
  return objc_msgSend(a1, "px_scrollToContentOffset:animated:", a8, v31, v38);
}

- (uint64_t)pu_scrollToItemAtIndexPath:()PhotosUI atScrollPosition:animated:
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  return objc_msgSend(a1, "pu_scrollToRect:atScrollPosition:animated:", a4, a5, v10, v12, v14, v16);
}

- (id)next:()PhotosUI indexPathFromIndexPath:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;

  v6 = a4;
  v20 = v6;
  if (a3)
  {
    v7 = v6;
    if (a3 < 0)
      v8 = -1;
    else
      v8 = 1;
    v9 = objc_msgSend(a1, "numberOfSections", v6);
    v10 = objc_msgSend(v7, "section");
    v11 = objc_msgSend(v7, "item");
    v12 = 0;
    if ((v10 & 0x8000000000000000) == 0 && v10 < v9)
    {
      v12 = 0;
      v13 = v11 + v8;
      if (a3 >= 0)
        v14 = a3;
      else
        v14 = -a3;
      do
      {
        v15 = a1;
        v16 = objc_msgSend(a1, "numberOfItemsInSection:", v10);
        if (v13 == 0x8000000000000000)
          v13 = (v16 - 1) & (a3 >> 63);
        if ((v13 & 0x8000000000000000) == 0)
        {
          v17 = v16;
          do
          {
            if (v13 >= v17)
              break;
            if (v14 == 1)
            {
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, v10);
              v18 = objc_claimAutoreleasedReturnValue();

              v12 = (void *)v18;
            }
            if (!--v14)
              break;
            v13 += v8;
          }
          while ((v13 & 0x8000000000000000) == 0);
        }
        if (!v14)
          break;
        v10 += v8;
        if (v10 < 0)
          break;
        v13 = 0x8000000000000000;
        a1 = v15;
      }
      while (v10 < v9);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)pu_animateUpdateOfCollectionViewSubview:()PhotosUI animations:completion:
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "bounds");
  objc_msgSend(a1, "convertRect:fromView:", v8);
  objc_msgSend(a1, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  objc_msgSend(v8, "bounds");
  objc_msgSend(v11, "setFrame:");
  if (v9)
    v9[2](v9);
  objc_msgSend(v8, "addSubview:", v11);
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v14 = *MEMORY[0x1E0DC51A0];
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke;
  v21[3] = &unk_1E58ABD10;
  v22 = v11;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __92__UICollectionView_PhotosUI__pu_animateUpdateOfCollectionViewSubview_animations_completion___block_invoke_2;
  v18[3] = &unk_1E58AB7D8;
  v19 = v22;
  v20 = v10;
  v16 = v10;
  v17 = v22;
  objc_msgSend(v13, "animateWithDuration:animations:completion:", v21, v18, v14);

}

@end
