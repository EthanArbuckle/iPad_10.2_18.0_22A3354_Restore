@implementation PXPhotosDetailsHeaderTileLayout

- (PXPhotosDetailsHeaderTileLayout)initWithSpec:(id)a3
{
  id v5;
  PXPhotosDetailsHeaderTileLayout *v6;
  PXPhotosDetailsHeaderTileLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsHeaderTileLayout;
  v6 = -[PXTilingLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spec, a3);
    v7->_useTitledPlayButton = 0;
    if (objc_msgSend(v5, "userInterfaceIdiom") == 5)
      v7->_useTitledPlayButton = 1;
  }

  return v7;
}

- (PXPhotosDetailsHeaderTileLayout)init
{
  return -[PXPhotosDetailsHeaderTileLayout initWithSpec:](self, "initWithSpec:", 0);
}

- (void)setReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v7 = v6;
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosDetailsHeaderTileLayout;
  -[PXTilingLayout setReferenceSize:](&v11, sel_setReferenceSize_, width, height);
  if (width != v7 || height != v9)
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
}

- (CGRect)contentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)previewRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  _OWORD v7[5];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  CGRect result;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  -[PXPhotosDetailsHeaderTileLayout tileIdentifierForTileKind:](self, "tileIdentifierForTileKind:", 1);
  v7[2] = v11;
  v7[3] = v12;
  v7[4] = v13;
  v8 = v14;
  v7[0] = v9;
  v7[1] = v10;
  -[PXPhotosDetailsHeaderTileLayout _rectForTileWithIdentifier:](self, "_rectForTileWithIdentifier:", v7);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $6D29B0F93B77A700D2888F4C8ED19EE2 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->contentsRectForAspectRatio = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->titleFontName = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->playButtonSize = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setSpec:(id)a3
{
  PXPhotosDetailsHeaderSpec *v5;
  PXTilingLayoutInvalidationContext *v6;
  PXPhotosDetailsHeaderSpec *v7;

  v5 = (PXPhotosDetailsHeaderSpec *)a3;
  if (self->_spec != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    v6 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v6, "invalidateAllTiles");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v6);

    v5 = v7;
  }

}

- (void)setStyle:(int64_t)a3
{
  PXTilingLayoutInvalidationContext *v4;

  if (self->_style != a3)
  {
    self->_style = a3;
    v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PXTilingLayoutInvalidationContext invalidateContentBounds](v4, "invalidateContentBounds");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  void (**v14)(void *, _OWORD *);
  _OWORD v15[5];
  uint64_t v16;
  _OWORD v17[5];
  uint64_t v18;
  _OWORD v19[5];
  uint64_t v20;
  _OWORD v21[5];
  uint64_t v22;
  _QWORD aBlock[5];
  id v24;
  _QWORD *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  _QWORD v30[3];
  char v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PXPhotosDetailsHeaderTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5140468;
  v25 = v30;
  aBlock[4] = self;
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  v13 = v12;
  v24 = v13;
  v14 = (void (**)(void *, _OWORD *))_Block_copy(aBlock);
  v22 = 0;
  v21[0] = xmmword_1A7BAEB50;
  memset(&v21[1], 0, 64);
  v14[2](v14, v21);
  v20 = 0;
  memset(&v19[1], 0, 64);
  v19[0] = vdupq_n_s64(1uLL);
  v14[2](v14, v19);
  v18 = 0;
  memset(&v17[1], 0, 64);
  v17[0] = xmmword_1A7BA05F0;
  v14[2](v14, v17);
  v16 = 0;
  memset(&v15[1], 0, 64);
  v15[0] = xmmword_1A7BA0600;
  v14[2](v14, v15);

  _Block_object_dispose(v30, 8);
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  __int128 v11;
  __int128 v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  __int128 v28;
  CGPoint v29;
  __int128 v30;
  __int128 v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unint64_t v46;
  CGRect v47;

  v11 = *(_OWORD *)&a6->index[5];
  v43 = *(_OWORD *)&a6->index[3];
  v44 = v11;
  v45 = *(_OWORD *)&a6->index[7];
  v46 = a6->index[9];
  v12 = *(_OWORD *)&a6->index[1];
  v41 = *(_OWORD *)&a6->length;
  v42 = v12;
  v13 = -[PXPhotosDetailsHeaderTileLayout tileKindForTileIdentifier:](self, "tileKindForTileIdentifier:", &v41);
  v14 = -[PXPhotosDetailsHeaderTileLayout style](self, "style");
  v15 = -[PXPhotosDetailsHeaderTileLayout style](self, "style");
  if (!v13 && v14)
    return 0;
  v16 = v13 == 3 || v13 == 1;
  if (v16 && v15 != 1)
    return 0;
  v17 = *(_OWORD *)&a6->index[5];
  v43 = *(_OWORD *)&a6->index[3];
  v44 = v17;
  v45 = *(_OWORD *)&a6->index[7];
  v46 = a6->index[9];
  v18 = *(_OWORD *)&a6->index[1];
  v41 = *(_OWORD *)&a6->length;
  v42 = v18;
  -[PXPhotosDetailsHeaderTileLayout _rectForTileWithIdentifier:](self, "_rectForTileWithIdentifier:", &v41);
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  if (CGRectIsNull(v47))
    return 0;
  if (a3)
  {
    v24 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
    PXRectGetCenter();
    a3->frame.origin.x = x;
    a3->frame.origin.y = y;
    a3->frame.size.width = width;
    a3->frame.size.height = height;
    a3->center.x = v25;
    a3->center.y = v26;
    a3->size.width = width;
    a3->size.height = height;
    v27 = MEMORY[0x1E0C9BAA8];
    v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a3->transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a3->transform.c = v28;
    *(_OWORD *)&a3->transform.tx = *(_OWORD *)(v27 + 32);
    a3->zPosition = 0.0;
    *(_QWORD *)&a3->hidden = 0;
    a3->alpha = 1.0;
    a3->contentSize.width = width;
    a3->contentSize.height = height;
    v29 = *(CGPoint *)off_1E50B86D0;
    a3->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    a3->contentsRect.origin = v29;
    a3->coordinateSpaceIdentifier = v24;
    v30 = *(_OWORD *)&a6->index[5];
    v43 = *(_OWORD *)&a6->index[3];
    v44 = v30;
    v45 = *(_OWORD *)&a6->index[7];
    v46 = a6->index[9];
    v31 = *(_OWORD *)&a6->index[1];
    v41 = *(_OWORD *)&a6->length;
    v42 = v31;
    -[PXPhotosDetailsHeaderTileLayout _zPositionForTileWithIdentifier:](self, "_zPositionForTileWithIdentifier:", &v41);
    a3->zPosition = v32;
    if (v13 == 1)
    {
      PXSizeGetAspectRatio();
      -[PXPhotosDetailsHeaderTileLayout _contentsRectForAspectRatio:](self, "_contentsRectForAspectRatio:");
      a3->contentsRect.origin.x = v33;
      a3->contentsRect.origin.y = v34;
      a3->contentsRect.size.width = v35;
      a3->contentsRect.size.height = v36;
    }
  }
  if (a4)
    *a4 = 0;
  if (a5)
  {
    v37 = *(_OWORD *)&a6->index[5];
    v43 = *(_OWORD *)&a6->index[3];
    v44 = v37;
    v45 = *(_OWORD *)&a6->index[7];
    v46 = a6->index[9];
    v38 = *(_OWORD *)&a6->index[1];
    v41 = *(_OWORD *)&a6->length;
    v42 = v38;
    -[PXPhotosDetailsHeaderTileLayout _viewSpecForTileWithIdentifier:boundingSize:](self, "_viewSpecForTileWithIdentifier:boundingSize:", &v41, width, height);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v39);
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v40;

  }
  return 1;
}

- (CGRect)_rectForTileWithIdentifier:(PXTileIdentifier *)a3
{
  __int128 v4;
  __int128 v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _OWORD v36[5];
  unint64_t v37;
  CGRect v38;
  CGRect result;

  v4 = *(_OWORD *)&a3->index[5];
  v36[2] = *(_OWORD *)&a3->index[3];
  v36[3] = v4;
  v36[4] = *(_OWORD *)&a3->index[7];
  v37 = a3->index[9];
  v5 = *(_OWORD *)&a3->index[1];
  v36[0] = *(_OWORD *)&a3->length;
  v36[1] = v5;
  v6 = -[PXPhotosDetailsHeaderTileLayout tileKindForTileIdentifier:](self, "tileKindForTileIdentifier:", v36);
  -[PXTilingLayout contentInset](self, "contentInset");
  -[PXPhotosDetailsHeaderTileLayout spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInsetEdges");
  PXEdgeInsetsForEdges();

  -[PXPhotosDetailsHeaderTileLayout contentBounds](self, "contentBounds");
  PXEdgeInsetsInsetRect();
  v10 = v9;
  v11 = v8;
  v13 = v12;
  v15 = v14;
  if (v6 < 2)
    goto LABEL_10;
  if (v6 == 2)
  {
    if (self->_useTitledPlayButton)
    {
      -[PXPhotosDetailsHeaderTileLayout _playButtonSize](self, "_playButtonSize");
      v25 = v11 - v30;
      goto LABEL_13;
    }
LABEL_10:
    v25 = v8;
    goto LABEL_13;
  }
  if (v6 == 3)
  {
    -[PXPhotosDetailsHeaderTileLayout _playButtonSize](self, "_playButtonSize");
    v35 = v16;
    v18 = v17;
    v19 = 16.0;
    v20 = 16.0;
    v21 = 16.0;
    if (-[PXFeatureSpec userInterfaceIdiom](self->_spec, "userInterfaceIdiom") == 5)
    {
      PXEdgeInsetsMake();
      PXEdgeInsetsMake();
      v21 = v22;
      v20 = v23;
      v19 = v24;
    }
    v38.origin.x = v10;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    v25 = CGRectGetMaxY(v38) - v18 - v20;
    v26 = v10;
    v27 = v11;
    v28 = v13;
    v29 = v15;
    if (self->_useTitledPlayButton)
    {
      v10 = v21 + CGRectGetMinX(*(CGRect *)&v26);
      v15 = v18;
      v13 = v35;
    }
    else
    {
      v13 = v35;
      v10 = CGRectGetMaxX(*(CGRect *)&v26) - v35 - v19;
      v15 = v18;
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D628];
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
LABEL_13:
  v31 = v10;
  v32 = v25;
  v33 = v13;
  v34 = v15;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGSize)_playButtonSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (self->_delegateRespondsTo.playButtonSize)
  {
    -[PXPhotosDetailsHeaderTileLayout delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photosDetailsHeaderTileLayoutPlayButtonSize:", self);
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    -[PXPhotosDetailsHeaderSpec playButtonSize](self->_spec, "playButtonSize");
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_viewSpecForTileWithIdentifier:(PXTileIdentifier *)a3 boundingSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  __int128 v7;
  __int128 v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;

  height = a4.height;
  width = a4.width;
  v7 = *(_OWORD *)&a3->index[5];
  v18 = *(_OWORD *)&a3->index[3];
  v19 = v7;
  v20 = *(_OWORD *)&a3->index[7];
  v21 = a3->index[9];
  v8 = *(_OWORD *)&a3->index[1];
  v16 = *(_OWORD *)&a3->length;
  v17 = v8;
  switch(-[PXPhotosDetailsHeaderTileLayout tileKindForTileIdentifier:](self, "tileKindForTileIdentifier:", &v16))
  {
    case 0:
      v9 = 0;
      v10 = 4002;
      break;
    case 1:
      v9 = 0;
      v10 = 4001;
      break;
    case 2:
      if (self->_delegateRespondsTo.titleFontName)
      {
        -[PXPhotosDetailsHeaderTileLayout delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "photosDetailsHeaderTileLayoutFontName:", self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
      v9 = PXViewSpecOptionsWithTitleFontName(0, v12);

      v10 = 4000;
      break;
    case 3:
      v9 = 0;
      v10 = 4003;
      break;
    default:
      v10 = 0;
      v9 = 0;
      break;
  }
  -[PXPhotosDetailsHeaderTileLayout spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v16 = v10;
  *((_QWORD *)&v16 + 1) = v9;
  *(CGFloat *)&v17 = width;
  *((CGFloat *)&v17 + 1) = height;
  objc_msgSend(v13, "viewSpecWithDescriptor:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)_zPositionForTileWithIdentifier:(PXTileIdentifier *)a3
{
  __int128 v3;
  __int128 v4;
  unint64_t v5;
  double result;
  _OWORD v7[5];
  unint64_t v8;

  v3 = *(_OWORD *)&a3->index[5];
  v7[2] = *(_OWORD *)&a3->index[3];
  v7[3] = v3;
  v7[4] = *(_OWORD *)&a3->index[7];
  v8 = a3->index[9];
  v4 = *(_OWORD *)&a3->index[1];
  v7[0] = *(_OWORD *)&a3->length;
  v7[1] = v4;
  v5 = -[PXPhotosDetailsHeaderTileLayout tileKindForTileIdentifier:](self, "tileKindForTileIdentifier:", v7);
  result = 0.0;
  if (v5 <= 3)
    return dbl_1A7C0B660[v5];
  return result;
}

- (id)_userDataForTileWithIdentifier:(PXTileIdentifier *)a3 inContainingRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  CGFloat v11;
  CGFloat v12;

  if (a3->index[0] == 2)
  {
    height = a4.size.height;
    width = a4.size.width;
    -[PXPhotosDetailsHeaderTileLayout spec](self, "spec", a4.origin.x, a4.origin.y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = xmmword_1A7C0C8D0;
    v11 = width;
    v12 = height;
    objc_msgSend(v6, "viewSpecWithDescriptor:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)tileKindForTileIdentifier:(PXTileIdentifier *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v6[5];
  unint64_t v7;

  v3 = *(_OWORD *)&a3->index[5];
  v6[2] = *(_OWORD *)&a3->index[3];
  v6[3] = v3;
  v6[4] = *(_OWORD *)&a3->index[7];
  v7 = a3->index[9];
  v4 = *(_OWORD *)&a3->index[1];
  v6[0] = *(_OWORD *)&a3->length;
  v6[1] = v4;
  return *((_QWORD *)v6 + *(_QWORD *)&v6[0]);
}

- (PXTileIdentifier)tileIdentifierForTileKind:(SEL)a3
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  retstr->length = 1;
  retstr->index[0] = a4;
  return self;
}

- (PXTileIdentifier)contentTileIdentifier
{
  PXTileIdentifier *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  unint64_t v12;

  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = 0u;
  result = -[PXPhotosDetailsHeaderTileLayout tileIdentifierForTileKind:](self, "tileIdentifierForTileKind:", -[PXPhotosDetailsHeaderTileLayout style](self, "style") == 1);
  v5 = v10;
  *(_OWORD *)&retstr->index[3] = v9;
  *(_OWORD *)&retstr->index[5] = v5;
  *(_OWORD *)&retstr->index[7] = v11;
  retstr->index[9] = v12;
  v6 = v8;
  *(_OWORD *)&retstr->length = v7;
  *(_OWORD *)&retstr->index[1] = v6;
  return result;
}

- (CGRect)_contentsRectForAspectRatio:(double)a3
{
  void *v5;
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
  CGRect result;

  if (self->_delegateRespondsTo.contentsRectForAspectRatio)
  {
    -[PXPhotosDetailsHeaderTileLayout delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosDetailsHeaderTileLayout:contentsRectForAspectRatio:", self, a3);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = *(double *)off_1E50B86D0;
    v9 = *((double *)off_1E50B86D0 + 1);
    v11 = *((double *)off_1E50B86D0 + 2);
    v13 = *((double *)off_1E50B86D0 + 3);
  }
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (PXPhotosDetailsHeaderSpec)spec
{
  return self->_spec;
}

- (int64_t)style
{
  return self->_style;
}

- (PXPhotosDetailsHeaderTileLayoutDelegate)delegate
{
  return (PXPhotosDetailsHeaderTileLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __79__PXPhotosDetailsHeaderTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGSize v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  CGSize v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t);
  __int128 v20;
  __int128 v21;
  CGRect v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[5];
  uint64_t v34;
  id v35;
  uint64_t v36;
  CGRect v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = *((_OWORD *)off_1E50B8940 + 9);
    v44 = *((_OWORD *)off_1E50B8940 + 8);
    v45 = v4;
    v5 = *((_OWORD *)off_1E50B8940 + 11);
    v46 = *((_OWORD *)off_1E50B8940 + 10);
    v47 = v5;
    v6 = *((_OWORD *)off_1E50B8940 + 5);
    v40 = *((_OWORD *)off_1E50B8940 + 4);
    v41 = v6;
    v7 = *((_OWORD *)off_1E50B8940 + 7);
    v42 = *((_OWORD *)off_1E50B8940 + 6);
    v43 = v7;
    v8 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
    v37.origin = *(CGPoint *)off_1E50B8940;
    v37.size = v8;
    v9 = *((_OWORD *)off_1E50B8940 + 3);
    v38 = *((_OWORD *)off_1E50B8940 + 2);
    v39 = v9;
    v35 = 0;
    v36 = 0;
    v10 = *(void **)(a1 + 32);
    v11 = *(_OWORD *)(a2 + 48);
    v23 = *(_OWORD *)(a2 + 32);
    v24 = v11;
    v25 = *(_OWORD *)(a2 + 64);
    *(_QWORD *)&v26 = *(_QWORD *)(a2 + 80);
    v12 = *(CGSize *)(a2 + 16);
    v22.origin = *(CGPoint *)a2;
    v22.size = v12;
    v13 = objc_msgSend(v10, "getGeometry:group:userData:forTileWithIdentifier:", &v37, &v36, &v35, &v22);
    v14 = v35;
    if (v13)
    {
      if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v37))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24;
        v19 = *(void (**)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t))(v17 + 16);
        v20 = *(_OWORD *)(a2 + 48);
        v33[2] = *(_OWORD *)(a2 + 32);
        v33[3] = v20;
        v33[4] = *(_OWORD *)(a2 + 64);
        v34 = *(_QWORD *)(a2 + 80);
        v21 = *(_OWORD *)(a2 + 16);
        v33[0] = *(_OWORD *)a2;
        v33[1] = v21;
        v29 = v44;
        v30 = v45;
        v31 = v46;
        v32 = v47;
        v25 = v40;
        v26 = v41;
        v27 = v42;
        v28 = v43;
        v22 = v37;
        v23 = v38;
        v24 = v39;
        v19(v17, v33, &v22, v36, v14, v18, v15, v16);
      }
    }

  }
}

@end
