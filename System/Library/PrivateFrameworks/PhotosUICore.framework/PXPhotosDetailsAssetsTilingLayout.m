@implementation PXPhotosDetailsAssetsTilingLayout

- (void)prepareLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
  -[PXTilingLayout prepareLayout](&v2, sel_prepareLayout);
}

- (void)setPlaceholderMode:(int64_t)a3
{
  PXTilingLayoutInvalidationContext *v4;

  if (self->_placeholderMode != a3)
  {
    self->_placeholderMode = a3;
    v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PXTilingLayoutInvalidationContext invalidateContentBounds](v4, "invalidateContentBounds");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (UIEdgeInsets)contentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  UIEdgeInsets result;

  v16.receiver = self;
  v16.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
  -[PXTilingLayout contentInset](&v16, sel_contentInset);
  v4 = v3;
  v6 = v5;
  -[PXPhotosDetailsAssetsTilingLayout spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentGuideInsets");
  v9 = v8;
  v11 = v10;

  v12 = v4;
  v13 = v9;
  v14 = v6;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGRect)contentBounds
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect result;
  CGRect v18;

  if (-[PXPhotosDetailsAssetsTilingLayout placeholderMode](self, "placeholderMode"))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[PXPhotosDetailsAssetsTilingLayout _placeholderFrame](self, "_placeholderFrame");
    v18.origin.x = v7;
    v18.origin.y = v8;
    v18.size.width = v9;
    v18.size.height = v10;
    v16.origin.x = v3;
    v16.origin.y = v4;
    v16.size.width = v5;
    v16.size.height = v6;
    CGRectUnion(v16, v18);
    -[PXPhotosDetailsAssetsTilingLayout contentInset](self, "contentInset");
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
    -[PXEngineDrivenAssetsTilingLayout contentBounds](&v15, sel_contentBounds);
  }
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void (*v20)(_QWORD *, _QWORD *, __int128 *, uint64_t, uint64_t, char *);
  __int128 v21;
  __int128 v22;
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
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  objc_super v54;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v54.receiver = self;
  v54.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
  -[PXEngineDrivenAssetsTilingLayout enumerateTilesInRect:withOptions:usingBlock:](&v54, sel_enumerateTilesInRect_withOptions_usingBlock_, a4, v11, x, y, width, height);
  v12 = -[PXPhotosDetailsAssetsTilingLayout placeholderMode](self, "placeholderMode");
  if ((unint64_t)(v12 - 1) <= 1)
  {
    v53 = 0;
    if (v12 == 1)
      v13 = 32100;
    else
      v13 = 32101;
    v14 = *((_OWORD *)off_1E50B8940 + 9);
    v49 = *((_OWORD *)off_1E50B8940 + 8);
    v50 = v14;
    v15 = *((_OWORD *)off_1E50B8940 + 11);
    v51 = *((_OWORD *)off_1E50B8940 + 10);
    v52 = v15;
    v16 = *((_OWORD *)off_1E50B8940 + 5);
    v45 = *((_OWORD *)off_1E50B8940 + 4);
    v46 = v16;
    v17 = *((_OWORD *)off_1E50B8940 + 7);
    v47 = *((_OWORD *)off_1E50B8940 + 6);
    v48 = v17;
    v18 = *((_OWORD *)off_1E50B8940 + 1);
    v41 = *(_OWORD *)off_1E50B8940;
    v42 = v18;
    v19 = *((_OWORD *)off_1E50B8940 + 3);
    v43 = *((_OWORD *)off_1E50B8940 + 2);
    v44 = v19;
    v39 = 0;
    v40 = 0;
    *(_QWORD *)&v21 = 1;
    *((_QWORD *)&v21 + 1) = v13;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    *(_QWORD *)&v26 = 0;
    if (-[PXPhotosDetailsAssetsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v41, &v40, &v39, &v21))
    {
      v20 = (void (*)(_QWORD *, _QWORD *, __int128 *, uint64_t, uint64_t, char *))v11[2];
      v33[0] = 1;
      v33[1] = v13;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0;
      v29 = v49;
      v30 = v50;
      v31 = v51;
      v32 = v52;
      v25 = v45;
      v26 = v46;
      v27 = v47;
      v28 = v48;
      v21 = v41;
      v22 = v42;
      v23 = v43;
      v24 = v44;
      v20(v11, v33, &v21, v40, v39, &v53);
    }
  }

}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  int64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  CGPoint v30;
  __int128 v31;
  __int128 v32;
  _OWORD v34[5];
  unint64_t v35;
  objc_super v36;
  __int128 v37;
  CGFloat v38;
  CGFloat v39;

  if (a6->length == 1 && a6->index[0] >> 1 == 16050)
  {
    v10 = -[PXPhotosDetailsAssetsTilingLayout placeholderMode](self, "placeholderMode");
    if (v10)
    {
      -[PXPhotosDetailsAssetsTilingLayout _placeholderFrame](self, "_placeholderFrame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v19 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
      PXRectGetCenter();
      v21 = v20;
      v23 = v22;
      -[PXPhotosDetailsAssetsTilingLayout spec](self, "spec");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = xmmword_1A7C0C6F0;
      v38 = v16;
      v39 = v18;
      objc_msgSend(v24, "viewSpecWithDescriptor:", &v37);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (a3)
      {
        a3->frame.origin.x = v12;
        a3->frame.origin.y = v14;
        a3->frame.size.width = v16;
        a3->frame.size.height = v18;
        a3->center.x = v21;
        a3->center.y = v23;
        a3->size.width = v16;
        a3->size.height = v18;
        v28 = MEMORY[0x1E0C9BAA8];
        v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&a3->transform.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&a3->transform.c = v29;
        *(_OWORD *)&a3->transform.tx = *(_OWORD *)(v28 + 32);
        a3->zPosition = 0.0;
        *(_QWORD *)&a3->hidden = 0;
        a3->alpha = 1.0;
        a3->contentSize.width = v16;
        a3->contentSize.height = v18;
        v30 = *(CGPoint *)off_1E50B86D0;
        a3->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
        a3->contentsRect.origin = v30;
        a3->coordinateSpaceIdentifier = v19;
      }
      if (a4)
        *a4 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v26);

      LOBYTE(v10) = 1;
    }
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)PXPhotosDetailsAssetsTilingLayout;
    v31 = *(_OWORD *)&a6->index[5];
    v34[2] = *(_OWORD *)&a6->index[3];
    v34[3] = v31;
    v34[4] = *(_OWORD *)&a6->index[7];
    v35 = a6->index[9];
    v32 = *(_OWORD *)&a6->index[1];
    v34[0] = *(_OWORD *)&a6->length;
    v34[1] = v32;
    LOBYTE(v10) = -[PXEngineDrivenAssetsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](&v36, sel_getGeometry_group_userData_forTileWithIdentifier_, a3, a4, a5, v34);
  }
  return v10;
}

- (CGRect)_placeholderFrame
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[PXEngineDrivenAssetsTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "contentRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  if (v10 == 0.0)
  {
    -[PXTilingLayout referenceSize](self, "referenceSize");
    v10 = v11;
  }
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetsWidgetPlaceholderAspectRatio");
  v14 = v10 * v13;

  v15 = v6;
  v16 = v8;
  v17 = v10;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (PXPhotosDetailsAssetsSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (int64_t)placeholderMode
{
  return self->_placeholderMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
