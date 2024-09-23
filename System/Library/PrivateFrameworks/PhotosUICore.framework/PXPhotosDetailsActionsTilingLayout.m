@implementation PXPhotosDetailsActionsTilingLayout

- (PXPhotosDetailsActionsTilingLayout)initWithNumberOfItems:(int64_t)a3
{
  PXPhotosDetailsActionsTilingLayout *v4;
  PXPhotosDetailsActionsTilingLayout *v5;
  int64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotosDetailsActionsTilingLayout;
  v4 = -[PXTilingLayout init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_numberOfItems = a3;
    if (a3 > 0)
      v6 = a3 + 1;
    else
      v6 = 0;
    v4->__numberOfSeparators = v6;
    v4->_dataSourceIdentifier = sub_1A7ADF414();
    v5->_separatorHeight = 1.0;
    v5->_shouldShowSeparators = 0;
    v5->_rowHeight = 42.0;
    v5->_interItemSpacing = 8.0;
  }
  return v5;
}

- (void)prepareLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXPhotosDetailsActionsTilingLayout;
  -[PXTilingLayout prepareLayout](&v2, sel_prepareLayout);
}

- (CGRect)contentBounds
{
  uint64_t v3;
  double v4;
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
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = -[PXPhotosDetailsActionsTilingLayout numberOfItems](self, "numberOfItems");
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v5 = v4;
  v6 = (double)-[PXPhotosDetailsActionsTilingLayout _numberOfSeparators](self, "_numberOfSeparators");
  -[PXPhotosDetailsActionsTilingLayout separatorHeight](self, "separatorHeight");
  if (v7 * v6 == 0.0)
    v8 = 0.0;
  else
    v8 = (double)-[PXPhotosDetailsActionsTilingLayout shouldShowSeparators](self, "shouldShowSeparators");
  -[PXPhotosDetailsActionsTilingLayout interItemSpacing](self, "interItemSpacing");
  v10 = v9 * (double)(v3 - 1);
  -[PXPhotosDetailsActionsTilingLayout rowHeight](self, "rowHeight");
  v12 = v10 + v8 + (double)v3 * v11;
  -[PXTilingLayout contentInset](self, "contentInset");
  v14 = v13;
  -[PXTilingLayout contentInset](self, "contentInset");
  v16 = v12 + v14 + v15;
  v17 = 0.0;
  v18 = 0.0;
  v19 = v5;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  int64_t dataSourceIdentifier;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void (*v19)(_QWORD *, __int128 *, __int128 *, uint64_t, id, char *);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void (*v25)(_QWORD *, __int128 *, __int128 *, uint64_t, id, char *);
  _QWORD *v26;
  int64x2_t v27;
  int64x2_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  int64x2_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  int64_t v43;
  uint64_t v44;
  int64x2_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  id v49;
  char v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  int64x2_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v26 = a5;
  dataSourceIdentifier = self->_dataSourceIdentifier;
  v7 = *((_OWORD *)off_1E50B8940 + 9);
  v60 = *((_OWORD *)off_1E50B8940 + 8);
  v61 = v7;
  v8 = *((_OWORD *)off_1E50B8940 + 11);
  v62 = *((_OWORD *)off_1E50B8940 + 10);
  v63 = v8;
  v9 = *((_OWORD *)off_1E50B8940 + 5);
  v56 = *((_OWORD *)off_1E50B8940 + 4);
  v57 = v9;
  v10 = *((_OWORD *)off_1E50B8940 + 7);
  v58 = *((_OWORD *)off_1E50B8940 + 6);
  v59 = v10;
  v11 = *((_OWORD *)off_1E50B8940 + 1);
  v52 = *(_OWORD *)off_1E50B8940;
  v53 = v11;
  v12 = *((_OWORD *)off_1E50B8940 + 3);
  v54 = *((int64x2_t *)off_1E50B8940 + 2);
  v55 = v12;
  v51 = 0;
  v50 = 0;
  v13 = 0;
  if (-[PXPhotosDetailsActionsTilingLayout shouldShowSeparators](self, "shouldShowSeparators"))
  {
    v14 = -[PXPhotosDetailsActionsTilingLayout _numberOfSeparators](self, "_numberOfSeparators");
    if (v14 < 1)
    {
      v13 = 0;
    }
    else
    {
      v15 = v14;
      v13 = 0;
      v16 = 1;
      v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v17 = v13;
        v49 = 0;
        v30 = xmmword_1A7C0C410;
        *(_QWORD *)&v31 = dataSourceIdentifier;
        *((_QWORD *)&v31 + 1) = v16 - 1;
        v32 = v27;
        v33 = 0u;
        v34 = 0u;
        *(_QWORD *)&v35 = 0;
        v18 = -[PXPhotosDetailsActionsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v52, &v51, &v49, &v30);
        v13 = v49;

        if (v18)
        {
          v19 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, char *))v26[2];
          v43 = dataSourceIdentifier;
          v44 = v16 - 1;
          v45 = v27;
          v46 = 0u;
          v47 = 0u;
          v48 = 0;
          v38 = v60;
          v39 = v61;
          v40 = v62;
          v41 = v63;
          v42 = xmmword_1A7C0C410;
          v34 = v56;
          v35 = v57;
          v36 = v58;
          v37 = v59;
          v30 = v52;
          v31 = v53;
          v32 = v54;
          v33 = v55;
          v19(v26, &v42, &v30, v51, v13, &v50);
        }
        if (v16 >= v15)
          break;
        ++v16;
      }
      while (!v50);
    }
  }
  v20 = -[PXPhotosDetailsActionsTilingLayout numberOfItems](self, "numberOfItems");
  if (v20 >= 1 && !v50)
  {
    v21 = v20;
    v22 = 1;
    v28 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    do
    {
      v23 = v13;
      v66 = 0;
      v64 = 0u;
      v65 = 0u;
      v29 = 0;
      v30 = xmmword_1A7C0C420;
      *(_QWORD *)&v31 = dataSourceIdentifier;
      *((_QWORD *)&v31 + 1) = v22 - 1;
      v32 = v28;
      v33 = 0u;
      v34 = 0u;
      *(_QWORD *)&v35 = 0;
      v24 = -[PXPhotosDetailsActionsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v52, &v51, &v29, &v30);
      v13 = v29;

      if (v24)
      {
        v25 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, char *))v26[2];
        v43 = dataSourceIdentifier;
        v44 = v22 - 1;
        v45 = v28;
        v46 = v64;
        v47 = v65;
        v48 = v66;
        v38 = v60;
        v39 = v61;
        v40 = v62;
        v41 = v63;
        v42 = xmmword_1A7C0C420;
        v34 = v56;
        v35 = v57;
        v36 = v58;
        v37 = v59;
        v30 = v52;
        v31 = v53;
        v32 = v54;
        v33 = v55;
        v25(v26, &v42, &v30, v51, v13, &v50);
      }
      if (v22 >= v21)
        break;
      ++v22;
    }
    while (!v50);
  }

}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  unint64_t v6;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  uint64_t v25;
  __int128 v26;
  CGPoint v27;
  void *v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  _OWORD v34[5];
  unint64_t v35;

  if (a6->length - 3 > 2)
    return 0;
  v6 = a6->index[1];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 != self->_dataSourceIdentifier)
    return 0;
  v11 = a6->index[0];
  v12 = a6->index[2];
  if (v11 == 6200435)
  {
    -[PXPhotosDetailsActionsTilingLayout _frameForSeparatorAtIndex:](self, "_frameForSeparatorAtIndex:", v12);
  }
  else
  {
    if (v11 != 6200434)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_OWORD *)&a6->index[5];
      v34[2] = *(_OWORD *)&a6->index[3];
      v34[3] = v31;
      v34[4] = *(_OWORD *)&a6->index[7];
      v35 = a6->index[9];
      v32 = *(_OWORD *)&a6->index[1];
      v34[0] = *(_OWORD *)&a6->length;
      v34[1] = v32;
      PXTileIdentifierDescription((unint64_t *)v34);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsActionsTilingLayout.m"), 101, CFSTR("Unexpected tile kind:%@"), v33);

      abort();
    }
    -[PXPhotosDetailsActionsTilingLayout _frameForItemAtIndex:](self, "_frameForItemAtIndex:", v12);
  }
  v18 = v13;
  v19 = v14;
  v20 = v15;
  v21 = v16;
  if (a3)
  {
    v22 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
    PXRectGetCenter();
    a3->frame.origin.x = v18;
    a3->frame.origin.y = v19;
    a3->frame.size.width = v20;
    a3->frame.size.height = v21;
    a3->center.x = v23;
    a3->center.y = v24;
    a3->size.width = v20;
    a3->size.height = v21;
    v25 = MEMORY[0x1E0C9BAA8];
    v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a3->transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a3->transform.c = v26;
    *(_OWORD *)&a3->transform.tx = *(_OWORD *)(v25 + 32);
    a3->zPosition = 0.0;
    *(_QWORD *)&a3->hidden = 0;
    a3->alpha = 1.0;
    a3->contentSize.width = v20;
    a3->contentSize.height = v21;
    v27 = *(CGPoint *)off_1E50B86D0;
    a3->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    a3->contentsRect.origin = v27;
    a3->coordinateSpaceIdentifier = v22;
  }
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  return 1;
}

- (double)_contentWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PXPhotosDetailsActionsTilingLayout contentBounds](self, "contentBounds");
  v4 = v3;
  -[PXTilingLayout contentInset](self, "contentInset");
  v6 = v4 - v5;
  -[PXTilingLayout contentInset](self, "contentInset");
  return v6 - v7;
}

- (CGRect)_frameForItemAtIndex:(int64_t)a3
{
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  if (a3)
  {
    -[PXPhotosDetailsActionsTilingLayout interItemSpacing](self, "interItemSpacing");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }
  -[PXTilingLayout contentInset](self, "contentInset");
  v8 = v7;
  -[PXTilingLayout contentInset](self, "contentInset");
  v10 = v9;
  -[PXPhotosDetailsActionsTilingLayout separatorHeight](self, "separatorHeight");
  v12 = v6 + v10 + v11;
  -[PXPhotosDetailsActionsTilingLayout rowHeight](self, "rowHeight");
  v14 = v13;
  -[PXPhotosDetailsActionsTilingLayout separatorHeight](self, "separatorHeight");
  v16 = v12 + (v14 + v15) * (double)a3;
  -[PXPhotosDetailsActionsTilingLayout _contentWidth](self, "_contentWidth");
  v18 = v17;
  -[PXPhotosDetailsActionsTilingLayout rowHeight](self, "rowHeight");
  v20 = v19;
  v21 = v8;
  v22 = v16;
  v23 = v18;
  result.size.height = v20;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_frameForSeparatorAtIndex:(int64_t)a3
{
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[PXPhotosDetailsActionsTilingLayout separatorHeight](self, "separatorHeight");
  v6 = v5;
  -[PXPhotosDetailsActionsTilingLayout rowHeight](self, "rowHeight");
  v8 = v7;
  -[PXTilingLayout contentInset](self, "contentInset");
  v10 = v9;
  -[PXTilingLayout contentInset](self, "contentInset");
  v12 = v11;
  -[PXPhotosDetailsActionsTilingLayout _contentWidth](self, "_contentWidth");
  v14 = v13;
  -[PXPhotosDetailsActionsTilingLayout separatorHeight](self, "separatorHeight");
  v16 = v15;
  if (!-[PXPhotosDetailsActionsTilingLayout shouldInsetAllSeparators](self, "shouldInsetAllSeparators"))
  {
    -[PXTilingLayout contentInset](self, "contentInset");
    v14 = v14 + v17;
    if (!a3 || -[PXPhotosDetailsActionsTilingLayout numberOfItems](self, "numberOfItems") == a3)
    {
      -[PXTilingLayout contentInset](self, "contentInset");
      v10 = v10 - v18;
      -[PXTilingLayout contentInset](self, "contentInset");
      v14 = v14 + v19;
    }
  }
  v20 = (v6 + v8) * (double)a3 + v12;
  v21 = v10;
  v22 = v14;
  v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (double)separatorHeight
{
  return self->_separatorHeight;
}

- (void)setSeparatorHeight:(double)a3
{
  self->_separatorHeight = a3;
}

- (BOOL)shouldShowSeparators
{
  return self->_shouldShowSeparators;
}

- (void)setShouldShowSeparators:(BOOL)a3
{
  self->_shouldShowSeparators = a3;
}

- (BOOL)shouldInsetAllSeparators
{
  return self->_shouldInsetAllSeparators;
}

- (void)setShouldInsetAllSeparators:(BOOL)a3
{
  self->_shouldInsetAllSeparators = a3;
}

- (int64_t)_numberOfSeparators
{
  return self->__numberOfSeparators;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

@end
