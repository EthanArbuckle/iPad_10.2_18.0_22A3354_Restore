@implementation PXPhotosDetailsHeaderPlaceholderView

- (PXPhotosDetailsHeaderPlaceholderView)initWithRegionOfInterest:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char *v14;
  PXBasicUIViewTileAnimator *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  PXUIImageTile *v33;
  void *v34;
  void *v35;
  PXImageRequester *v36;
  void *v37;
  void *v38;
  PXImageRequester *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  PXTitleSubtitleUILabelTile *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  objc_super v86;

  v4 = a3;
  objc_msgSend(v4, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rectInCoordinateSpace:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v86.receiver = self;
  v86.super_class = (Class)PXPhotosDetailsHeaderPlaceholderView;
  v14 = -[PXPhotosDetailsHeaderPlaceholderView initWithFrame:](&v86, sel_initWithFrame_, v7, v9, v11, v13);
  if (v14)
  {
    v15 = objc_alloc_init(PXBasicUIViewTileAnimator);
    v16 = (void *)*((_QWORD *)v14 + 52);
    *((_QWORD *)v14 + 52) = v15;

    objc_msgSend(v14, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = *(_QWORD *)off_1E50B8948;
    PXRectGetCenter();
    *((_QWORD *)v14 + 53) = v18;
    *((_QWORD *)v14 + 54) = v20;
    *((_QWORD *)v14 + 55) = v22;
    *((_QWORD *)v14 + 56) = v24;
    *((_QWORD *)v14 + 57) = v26;
    *((_QWORD *)v14 + 58) = v27;
    *((_QWORD *)v14 + 59) = v22;
    *((_QWORD *)v14 + 60) = v24;
    v28 = MEMORY[0x1E0C9BAA8];
    v82 = *MEMORY[0x1E0C9BAA8];
    v83 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v14 + 488) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v14 + 504) = v83;
    v81 = *(_OWORD *)(v28 + 32);
    *(_OWORD *)(v14 + 520) = v81;
    *((_QWORD *)v14 + 68) = 0;
    *((_QWORD *)v14 + 69) = 0;
    *((_QWORD *)v14 + 67) = 0x3FF0000000000000;
    *((_QWORD *)v14 + 70) = v22;
    *((_QWORD *)v14 + 71) = v24;
    v79 = *((_OWORD *)off_1E50B86D0 + 1);
    v80 = *(_OWORD *)off_1E50B86D0;
    *((_OWORD *)v14 + 37) = v79;
    *((_OWORD *)v14 + 36) = v80;
    *((_QWORD *)v14 + 76) = v25;
    objc_msgSend(v4, "imageContentsRect");
    *((_QWORD *)v14 + 72) = v29;
    *((_QWORD *)v14 + 73) = v30;
    *((_QWORD *)v14 + 74) = v31;
    *((_QWORD *)v14 + 75) = v32;
    v33 = objc_alloc_init(PXUIImageTile);
    v34 = (void *)*((_QWORD *)v14 + 77);
    *((_QWORD *)v14 + 77) = v33;

    objc_msgSend(v4, "imageRequester");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = [PXImageRequester alloc];
    objc_msgSend(v35, "mediaProvider");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "asset");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PXImageRequester initWithMediaProvider:asset:](v36, "initWithMediaProvider:asset:", v37, v38);

    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __65__PXPhotosDetailsHeaderPlaceholderView_initWithRegionOfInterest___block_invoke;
    v84[3] = &unk_1E5124B18;
    v85 = v35;
    v40 = v35;
    -[PXImageRequester performChanges:](v39, "performChanges:", v84);
    objc_msgSend(*((id *)v14 + 77), "setImageRequester:", v39);
    objc_msgSend(v4, "imageViewSpec");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "copy");

    objc_msgSend(v42, "setCornerRadius:", 0.0);
    objc_msgSend(v42, "overlaySpecs");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.649999976);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setBackgroundColor:", v45);

    +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v42);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)v14 + 78);
    *((_QWORD *)v14 + 78) = v46;

    objc_msgSend(v14, "_layoutImageTile");
    objc_msgSend(v14, "bounds");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    PXRectGetCenter();
    *((_QWORD *)v14 + 103) = v49;
    *((_QWORD *)v14 + 104) = v51;
    *((_QWORD *)v14 + 105) = v53;
    *((_QWORD *)v14 + 106) = v55;
    *((_QWORD *)v14 + 107) = v56;
    *((_QWORD *)v14 + 108) = v57;
    *((_QWORD *)v14 + 109) = v53;
    *((_QWORD *)v14 + 110) = v55;
    *(_OWORD *)(v14 + 888) = v82;
    *(_OWORD *)(v14 + 904) = v83;
    *(_OWORD *)(v14 + 920) = v81;
    *((_QWORD *)v14 + 118) = 0;
    *((_QWORD *)v14 + 119) = 0;
    *((_QWORD *)v14 + 117) = 0x3FF0000000000000;
    *((_QWORD *)v14 + 120) = v53;
    *((_QWORD *)v14 + 121) = v55;
    *((_OWORD *)v14 + 62) = v79;
    *((_OWORD *)v14 + 61) = v80;
    *((_QWORD *)v14 + 126) = v25;
    v58 = *(_OWORD *)(v14 + 824);
    v59 = *(_OWORD *)(v14 + 840);
    v60 = *(_OWORD *)(v14 + 872);
    *(_OWORD *)(v14 + 664) = *(_OWORD *)(v14 + 856);
    *(_OWORD *)(v14 + 680) = v60;
    *(_OWORD *)(v14 + 632) = v58;
    *(_OWORD *)(v14 + 648) = v59;
    v61 = *(_OWORD *)(v14 + 888);
    v62 = *(_OWORD *)(v14 + 904);
    v63 = *(_OWORD *)(v14 + 936);
    *(_OWORD *)(v14 + 728) = *(_OWORD *)(v14 + 920);
    *(_OWORD *)(v14 + 744) = v63;
    *(_OWORD *)(v14 + 696) = v61;
    *(_OWORD *)(v14 + 712) = v62;
    v64 = *(_OWORD *)(v14 + 968);
    v66 = *(_OWORD *)(v14 + 984);
    v65 = *(_OWORD *)(v14 + 1000);
    *(_OWORD *)(v14 + 760) = *(_OWORD *)(v14 + 952);
    *(_OWORD *)(v14 + 776) = v64;
    *(_OWORD *)(v14 + 792) = v66;
    *(_OWORD *)(v14 + 808) = v65;
    v67 = objc_alloc_init(PXTitleSubtitleUILabelTile);
    v68 = (void *)*((_QWORD *)v14 + 127);
    *((_QWORD *)v14 + 127) = v67;

    v69 = (void *)*((_QWORD *)v14 + 127);
    objc_msgSend(v4, "title");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setTitle:", v70);

    v71 = (void *)*((_QWORD *)v14 + 127);
    objc_msgSend(v4, "subtitle");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setSubtitle:", v72);

    objc_msgSend(*((id *)v14 + 127), "setRendersTextAsynchronously:", 0);
    objc_msgSend(v4, "textViewSpec");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v73);
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)*((_QWORD *)v14 + 128);
    *((_QWORD *)v14 + 128) = v74;

    objc_msgSend(v14, "_layoutTextTile");
    v76 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v77 = (void *)*((_QWORD *)v14 + 129);
    *((_QWORD *)v14 + 129) = v76;

    objc_msgSend(*((id *)v14 + 129), "setText:", CFSTR("L"));
    objc_msgSend(*((id *)v14 + 129), "sizeToFit");
    objc_msgSend(*((id *)v14 + 129), "setHidden:", 1);
    objc_msgSend(v14, "addSubview:", *((_QWORD *)v14 + 129));
    objc_msgSend(v14, "_layoutLabelForLastBaselineLayout");

  }
  return (PXPhotosDetailsHeaderPlaceholderView *)v14;
}

- (id)viewForLastBaselineLayout
{
  return self->_labelForLastBaselineLayout;
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGSize v11;
  PXTileGeometry initialTextTileGeometry;
  PXTileGeometry v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXPhotosDetailsHeaderPlaceholderView;
  -[PXPhotosDetailsHeaderPlaceholderView layoutSubviews](&v14, sel_layoutSubviews);
  -[PXPhotosDetailsHeaderPlaceholderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  self->_imageTileGeometry.frame.origin.x = v7;
  self->_imageTileGeometry.frame.origin.y = v8;
  self->_imageTileGeometry.frame.size.width = v3;
  self->_imageTileGeometry.frame.size.height = v5;
  PXRectGetCenter();
  self->_imageTileGeometry.center.x = v9;
  self->_imageTileGeometry.center.y = v10;
  self->_imageTileGeometry.size.width = v4;
  self->_imageTileGeometry.size.height = v6;
  self->_imageTileGeometry.contentSize.width = v4;
  self->_imageTileGeometry.contentSize.height = v6;
  v11 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  self->_imageTileGeometry.contentsRect.origin = *(CGPoint *)off_1E50B86D0;
  self->_imageTileGeometry.contentsRect.size = v11;
  -[PXPhotosDetailsHeaderPlaceholderView _layoutImageTile](self, "_layoutImageTile");
  PXSizeGetAspectRatio();
  PXRectWithAspectRatioFittingRect();
  PXAffineTransformMakeFromRects();
  PXAffineTransformOffsetFixpoint();
  initialTextTileGeometry = self->_initialTextTileGeometry;
  PXTileGeometryApplyAffineTransform();
  self->_textTileGeometry = v13;
  -[PXPhotosDetailsHeaderPlaceholderView _layoutTextTile](self, "_layoutTextTile", *(_OWORD *)&v13.frame.origin, *(_OWORD *)&v13.frame.size, *(_OWORD *)&v13.center, *(_OWORD *)&initialTextTileGeometry.frame.origin, *(_OWORD *)&initialTextTileGeometry.frame.size, *(_OWORD *)&initialTextTileGeometry.center, *(_OWORD *)&initialTextTileGeometry.size, *(_OWORD *)&initialTextTileGeometry.transform.a, *(_OWORD *)&initialTextTileGeometry.transform.c, *(_OWORD *)&initialTextTileGeometry.transform.tx, *(_OWORD *)&initialTextTileGeometry.alpha, *(_OWORD *)&initialTextTileGeometry.hidden, *(_OWORD *)&initialTextTileGeometry.contentSize.height, *(_OWORD *)&initialTextTileGeometry.contentsRect.origin.y, *(_OWORD *)&initialTextTileGeometry.contentsRect.size.height);
  -[PXPhotosDetailsHeaderPlaceholderView _layoutLabelForLastBaselineLayout](self, "_layoutLabelForLastBaselineLayout");
}

- (void)_layoutImageTile
{
  PXUIImageTile *imageTile;
  PXBasicTileUserData *imageTileUserData;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGSize size;
  CGSize v9;
  _OWORD v10[12];

  imageTile = self->_imageTile;
  imageTileUserData = self->_imageTileUserData;
  v4 = *(_OWORD *)&self->_imageTileGeometry.contentSize.height;
  v10[8] = *(_OWORD *)&self->_imageTileGeometry.hidden;
  v10[9] = v4;
  v5 = *(_OWORD *)&self->_imageTileGeometry.contentsRect.size.height;
  v10[10] = *(_OWORD *)&self->_imageTileGeometry.contentsRect.origin.y;
  v10[11] = v5;
  v6 = *(_OWORD *)&self->_imageTileGeometry.transform.c;
  v10[4] = *(_OWORD *)&self->_imageTileGeometry.transform.a;
  v10[5] = v6;
  v7 = *(_OWORD *)&self->_imageTileGeometry.alpha;
  v10[6] = *(_OWORD *)&self->_imageTileGeometry.transform.tx;
  v10[7] = v7;
  size = self->_imageTileGeometry.frame.size;
  v10[0] = self->_imageTileGeometry.frame.origin;
  v10[1] = size;
  v9 = self->_imageTileGeometry.size;
  v10[2] = self->_imageTileGeometry.center;
  v10[3] = v9;
  -[PXPhotosDetailsHeaderPlaceholderView _layoutTile:withGeometry:userData:](self, "_layoutTile:withGeometry:userData:", imageTile, v10, imageTileUserData);
}

- (void)_layoutTextTile
{
  PXTitleSubtitleUILabelTile *textTile;
  PXBasicTileUserData *textTileUserData;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGSize size;
  CGSize v9;
  _OWORD v10[12];

  textTile = self->_textTile;
  textTileUserData = self->_textTileUserData;
  v4 = *(_OWORD *)&self->_textTileGeometry.contentSize.height;
  v10[8] = *(_OWORD *)&self->_textTileGeometry.hidden;
  v10[9] = v4;
  v5 = *(_OWORD *)&self->_textTileGeometry.contentsRect.size.height;
  v10[10] = *(_OWORD *)&self->_textTileGeometry.contentsRect.origin.y;
  v10[11] = v5;
  v6 = *(_OWORD *)&self->_textTileGeometry.transform.c;
  v10[4] = *(_OWORD *)&self->_textTileGeometry.transform.a;
  v10[5] = v6;
  v7 = *(_OWORD *)&self->_textTileGeometry.alpha;
  v10[6] = *(_OWORD *)&self->_textTileGeometry.transform.tx;
  v10[7] = v7;
  size = self->_textTileGeometry.frame.size;
  v10[0] = self->_textTileGeometry.frame.origin;
  v10[1] = size;
  v9 = self->_textTileGeometry.size;
  v10[2] = self->_textTileGeometry.center;
  v10[3] = v9;
  -[PXPhotosDetailsHeaderPlaceholderView _layoutTile:withGeometry:userData:](self, "_layoutTile:withGeometry:userData:", textTile, v10, textTileUserData);
}

- (void)_layoutTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PXPhotosDetailsHeaderPlaceholderView *v11;
  PXBasicUIViewTileAnimator *tileAnimator;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGSize size;
  CGSize v18;
  _OWORD v19[12];

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (PXPhotosDetailsHeaderPlaceholderView *)objc_claimAutoreleasedReturnValue();

  if (v11 != self)
    -[PXPhotosDetailsHeaderPlaceholderView addSubview:](self, "addSubview:", v10);
  tileAnimator = self->_tileAnimator;
  v13 = *(_OWORD *)&a4->contentSize.height;
  v19[8] = *(_OWORD *)&a4->hidden;
  v19[9] = v13;
  v14 = *(_OWORD *)&a4->contentsRect.size.height;
  v19[10] = *(_OWORD *)&a4->contentsRect.origin.y;
  v19[11] = v14;
  v15 = *(_OWORD *)&a4->transform.c;
  v19[4] = *(_OWORD *)&a4->transform.a;
  v19[5] = v15;
  v16 = *(_OWORD *)&a4->alpha;
  v19[6] = *(_OWORD *)&a4->transform.tx;
  v19[7] = v16;
  size = a4->frame.size;
  v19[0] = a4->frame.origin;
  v19[1] = size;
  v18 = a4->size;
  v19[2] = a4->center;
  v19[3] = v18;
  -[PXBasicUIViewTileAnimator animateTile:toGeometry:userData:withOptions:completionHandler:](tileAnimator, "animateTile:toGeometry:userData:withOptions:completionHandler:", v8, v19, v9, 0, &__block_literal_global_3636);

}

- (void)_layoutLabelForLastBaselineLayout
{
  double v3;
  double MinY;
  double v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[7];
  CGRect v10;

  v3 = *MEMORY[0x1E0C9D538];
  -[PXTitleSubtitleUILabelTile view](self->_textTile, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  MinY = CGRectGetMinY(v10);
  -[PXTitleSubtitleUILabelTile lastBaseline](self->_textTile, "lastBaseline");
  -[PXPhotosDetailsHeaderPlaceholderView convertPoint:fromView:](self, "convertPoint:fromView:", v8, v3, MinY + v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PXPhotosDetailsHeaderPlaceholderView__layoutLabelForLastBaselineLayout__block_invoke;
  v9[3] = &unk_1E5116828;
  v9[4] = self;
  v9[5] = v6;
  v9[6] = v7;
  +[PXViewLayoutHelper performLayoutWithinView:usingBlock:](PXViewLayoutHelper, "performLayoutWithinView:usingBlock:", self, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelForLastBaselineLayout, 0);
  objc_storeStrong((id *)&self->_textTileUserData, 0);
  objc_storeStrong((id *)&self->_textTile, 0);
  objc_storeStrong((id *)&self->_imageTileUserData, 0);
  objc_storeStrong((id *)&self->_imageTile, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
}

void __73__PXPhotosDetailsHeaderPlaceholderView__layoutLabelForLastBaselineLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  int64x2_t v8;
  int64x2_t v9;
  int64x2_t v10;

  v3 = a2;
  v9 = vdupq_n_s64(0x7FF8000000000000uLL);
  v10 = v9;
  objc_msgSend(v3, "leadingOfView:", *(_QWORD *)(a1 + 32), *(_OWORD *)&v9, *(_OWORD *)&v9, *(_OWORD *)&v9, *(_OWORD *)&v9);
  objc_msgSend(v3, "trailingOfView:", *(_QWORD *)(a1 + 32), v4);
  v9.i64[1] = v5;
  *(_QWORD *)&v7 = *(_QWORD *)(a1 + 48);
  v8 = vdupq_n_s64(0x7FF0000000000000uLL);
  objc_msgSend(v3, "layoutView:withAttributes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032), &v6);

}

uint64_t __65__PXPhotosDetailsHeaderPlaceholderView_initWithRegionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handlePreloadedImageRequester:", *(_QWORD *)(a1 + 32));
}

@end
