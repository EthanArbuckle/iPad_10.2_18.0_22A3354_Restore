@implementation PUParallaxVideoLayerView

- (PUParallaxVideoLayerView)initWithParallaxVideoLayer:(id)a3
{
  id v5;
  PUParallaxVideoLayerView *v6;
  PUParallaxVideoLayerView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUParallaxVideoLayerView;
  v6 = -[PUParallaxVideoLayerView init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parallaxVideoLayer, a3);
    -[PUParallaxVideoLayerView _updateParallaxVideoLayerProperties](v7, "_updateParallaxVideoLayerProperties");
  }

  return v7;
}

- (AVPlayer)player
{
  void *v2;
  void *v3;
  void *v4;

  -[PUParallaxVideoLayerView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayer *)v4;
}

- (void)setParallaxVideoLayer:(id)a3
{
  PFParallaxVideoLayer *v5;
  PFParallaxVideoLayer *v6;
  char v7;
  PFParallaxVideoLayer *v8;

  v8 = (PFParallaxVideoLayer *)a3;
  v5 = self->_parallaxVideoLayer;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFParallaxVideoLayer isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_parallaxVideoLayer, a3);
      -[PUParallaxVideoLayerView _updateParallaxVideoLayerProperties](self, "_updateParallaxVideoLayerProperties");
    }
  }

}

- (void)_updateParallaxVideoLayerProperties
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PUParallaxVideoLayerView *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  -[PUParallaxVideoLayerView parallaxVideoLayer](self, "parallaxVideoLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "video");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__30006;
  v11[4] = __Block_byref_object_dispose__30007;
  -[PUParallaxVideoLayerView player](self, "player");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PUParallaxVideoLayerView__updateParallaxVideoLayerProperties__block_invoke;
  v7[3] = &unk_1E58AAD18;
  v10 = v11;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

  _Block_object_dispose(v11, 8);
}

- (void)setCurrentLayoutInfo:(id)a3
{
  PUParallaxLayerLayoutInfo *v5;
  PUParallaxLayerLayoutInfo *v6;
  BOOL v7;
  PUParallaxLayerLayoutInfo *v8;

  v8 = (PUParallaxLayerLayoutInfo *)a3;
  v5 = self->_currentLayoutInfo;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PUParallaxLayerLayoutInfo isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLayoutInfo, a3);
      -[PUParallaxVideoLayerView _layoutWithCurrentLayoutInfo](self, "_layoutWithCurrentLayoutInfo");
    }
  }

}

- (void)_layoutWithCurrentLayoutInfo
{
  void *v3;
  void *v4;
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
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double x;
  double y;
  double width;
  double height;
  void *v26;
  _OWORD v27[6];
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;

  -[PUParallaxVideoLayerView currentLayoutInfo](self, "currentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "containerFrame");
    -[PUParallaxVideoLayerView parallaxVideoLayer](self, "parallaxVideoLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, "viewFrameForLayerFrame:", v7, v9, v11, v13);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v4, "additionalContentTransform");
    v29.origin.x = v15;
    v29.origin.y = v17;
    v29.size.width = v19;
    v29.size.height = v21;
    v30 = CGRectApplyAffineTransform(v29, &v28);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    -[PUParallaxVideoLayerView contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", x, y, width, height);

    objc_msgSend(v4, "additionalTransform");
    v27[0] = v27[3];
    v27[1] = v27[4];
    v27[2] = v27[5];
    -[PUParallaxVideoLayerView setTransform:](self, "setTransform:", v27);
    PXRectWithSize();
    -[PUParallaxVideoLayerView setBounds:](self, "setBounds:");
    PXRectGetCenter();
    -[PUParallaxVideoLayerView setCenter:](self, "setCenter:");
  }

}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGAffineTransform v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v3 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PUParallaxVideoLayerView;
  -[PUParallaxVideoLayerView snapshotViewAfterScreenUpdates:](&v28, sel_snapshotViewAfterScreenUpdates_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxVideoLayerView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", v7);
  -[PUParallaxVideoLayerView currentLayoutInfo](self, "currentLayoutInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxVideoLayerView parallaxVideoLayer](self, "parallaxVideoLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v8, "viewFrameForLayerFrame:", v11, v13, v15, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  if (v8)
    objc_msgSend(v8, "additionalContentTransform");
  else
    memset(&v27, 0, sizeof(v27));
  v29.origin.x = v19;
  v29.origin.y = v21;
  v29.size.width = v23;
  v29.size.height = v25;
  v30 = CGRectApplyAffineTransform(v29, &v27);
  objc_msgSend(v7, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);

  return v5;
}

- (PUParallaxLayerLayoutInfo)currentLayoutInfo
{
  return self->_currentLayoutInfo;
}

- (PFParallaxVideoLayer)parallaxVideoLayer
{
  return self->_parallaxVideoLayer;
}

- (PUParallaxVideoLayerContentView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_parallaxVideoLayer, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfo, 0);
}

uint64_t __63__PUParallaxVideoLayerView__updateParallaxVideoLayerProperties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  PUParallaxVideoLayerContentView *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 != v4)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 432))
    {
      v5 = [PUParallaxVideoLayerContentView alloc];
      v6 = -[PUParallaxVideoLayerContentView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 432);
      *(_QWORD *)(v7 + 432) = v6;

      objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 432));
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setMuted:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setActionAtItemEnd:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPreventsDisplaySleepDuringVideoPlayback:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAllowsExternalPlayback:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_setDisallowsVideoLayerDisplayCompositing:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_setParticipatesInAudioSession:", 0);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 40), "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_playerLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPlayer:", v12);

    }
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "replaceCurrentItemWithPlayerItem:", v15);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_layoutWithCurrentLayoutInfo");
}

@end
