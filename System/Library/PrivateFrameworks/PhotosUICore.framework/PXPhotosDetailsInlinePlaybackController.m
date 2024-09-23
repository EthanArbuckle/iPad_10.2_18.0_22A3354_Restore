@implementation PXPhotosDetailsInlinePlaybackController

- (PXPhotosDetailsInlinePlaybackController)initWithTilingController:(id)a3
{
  id v5;
  PXPhotosDetailsInlinePlaybackController *v6;
  PXPhotosDetailsInlinePlaybackController *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *recordCreationQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDetailsInlinePlaybackController;
  v6 = -[PXGridInlinePlaybackController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tilingController, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.photos.details.PlaybackRecordCreation", v9);
    recordCreationQueue = v7->_recordCreationQueue;
    v7->_recordCreationQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (PXPhotosDetailsInlinePlaybackController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsInlinePlaybackController.m"), 51, CFSTR("%s is not available as initializer"), "-[PXPhotosDetailsInlinePlaybackController init]");

  abort();
}

- (BOOL)_isRecognizedTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->index[0] - 6332439 < 3;
}

- (PXTileIdentifier)_currentTileIdentifierForRecord:(SEL)a3
{
  id v6;
  void *v7;
  unint64_t *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  PXTileIdentifier *result;
  _OWORD v21[5];
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;

  v6 = a4;
  v7 = v6;
  *(_OWORD *)&retstr->length = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  retstr->index[9] = 0;
  if (v6)
  {
    objc_msgSend(v6, "tileIdentifier");
    v8 = &retstr->index[1];
    if (!retstr->length)
      v8 = (unint64_t *)off_1E50B7E98;
  }
  else
  {
    v8 = (unint64_t *)off_1E50B7E98;
  }
  v9 = *v8;
  -[PXPhotosDetailsInlinePlaybackController tilingController](self, "tilingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == *(_QWORD *)off_1E50B7E98
    || (objc_msgSend(v11, "dataSource"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "identifier"),
        v12,
        v13 != v9))
  {
    -[PXPhotosDetailsInlinePlaybackController tilingController](self, "tilingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "geometryReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v14, "tileIdentifierForTile:", v15);
    }
    else
    {
      v28 = 0;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
    }
    v16 = v26;
    *(_OWORD *)&retstr->index[3] = v25;
    *(_OWORD *)&retstr->index[5] = v16;
    *(_OWORD *)&retstr->index[7] = v27;
    retstr->index[9] = v28;
    v17 = v24;
    *(_OWORD *)&retstr->length = v23;
    *(_OWORD *)&retstr->index[1] = v17;

    v18 = *(_OWORD *)&retstr->index[5];
    v21[2] = *(_OWORD *)&retstr->index[3];
    v21[3] = v18;
    v21[4] = *(_OWORD *)&retstr->index[7];
    v22 = retstr->index[9];
    v19 = *(_OWORD *)&retstr->index[1];
    v21[0] = *(_OWORD *)&retstr->length;
    v21[1] = v19;
    objc_msgSend(v7, "setTileIdentifier:", v21);
  }

  return result;
}

- (void)checkOutTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *recordCreationQueue;
  __int128 v15;
  __int128 v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;
  _OWORD location[5];
  unint64_t v32;

  v7 = *(_OWORD *)&a4->index[5];
  location[2] = *(_OWORD *)&a4->index[3];
  location[3] = v7;
  location[4] = *(_OWORD *)&a4->index[7];
  v32 = a4->index[9];
  v8 = *(_OWORD *)&a4->index[1];
  location[0] = *(_OWORD *)&a4->length;
  location[1] = v8;
  if (-[PXPhotosDetailsInlinePlaybackController _isRecognizedTileIdentifier:](self, "_isRecognizedTileIdentifier:", location))
  {
    v9 = a3;
    objc_msgSend(v9, "imageRequester");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageRequester");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    recordCreationQueue = self->_recordCreationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke;
    block[3] = &unk_1E51421C0;
    objc_copyWeak(&v24, (id *)location);
    v21 = v11;
    v22 = v13;
    v23 = v9;
    v15 = *(_OWORD *)&a4->index[5];
    v27 = *(_OWORD *)&a4->index[3];
    v28 = v15;
    v29 = *(_OWORD *)&a4->index[7];
    v30 = a4->index[9];
    v16 = *(_OWORD *)&a4->index[1];
    v25 = *(_OWORD *)&a4->length;
    v26 = v16;
    v17 = v9;
    v18 = v13;
    v19 = v11;
    dispatch_async(recordCreationQueue, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  __int128 v6;
  __int128 v7;
  void *v8;
  void *v9;
  NSObject *recordCreationQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;

  v6 = *(_OWORD *)&a4->index[5];
  v17 = *(_OWORD *)&a4->index[3];
  v18 = v6;
  v19 = *(_OWORD *)&a4->index[7];
  v20 = a4->index[9];
  v7 = *(_OWORD *)&a4->index[1];
  *(_OWORD *)location = *(_OWORD *)&a4->length;
  v16 = v7;
  if (-[PXPhotosDetailsInlinePlaybackController _isRecognizedTileIdentifier:](self, "_isRecognizedTileIdentifier:", location))
  {
    objc_msgSend(a3, "imageRequester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXGridInlinePlaybackController willCheckInPlaybackRecordForDisplayAsset:](self, "willCheckInPlaybackRecordForDisplayAsset:", v9);
    objc_initWeak(location, self);
    recordCreationQueue = self->_recordCreationQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__PXPhotosDetailsInlinePlaybackController_checkInTile_withIdentifier___block_invoke;
    v12[3] = &unk_1E5147280;
    objc_copyWeak(&v14, location);
    v13 = v9;
    v11 = v9;
    dispatch_async(recordCreationQueue, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (BOOL)shouldEnablePlayback
{
  void *v3;
  void *v4;
  char v5;

  -[PXPhotosDetailsInlinePlaybackController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPhotosDetailsInlinePlaybackController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldEnablePlaybackForController:", self);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v7;
  id v8;
  id v9;
  _PXDetailsPlaybackRecord *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PXGridInlinePlaybackRecord initWithDisplayAsset:mediaProvider:geometryReference:]([_PXDetailsPlaybackRecord alloc], "initWithDisplayAsset:mediaProvider:geometryReference:", v9, v8, v7);

  return v10;
}

- (CGRect)currentVisibleRect
{
  void *v2;
  void *v3;
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
  CGRect result;

  -[PXPhotosDetailsInlinePlaybackController tilingController](self, "tilingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)currentHoveredDisplayAsset
{
  return 0;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  CGRect result;

  v5 = a3;
  -[PXPhotosDetailsInlinePlaybackController tilingController](self, "tilingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[PXPhotosDetailsInlinePlaybackController _currentTileIdentifierForRecord:](self, "_currentTileIdentifierForRecord:", v5);

  v9 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);

  v12 = v9;
  v13 = v8;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)canPlayAsset:(id)a3
{
  void *v3;
  char v4;
  BOOL v5;

  switch(objc_msgSend(a3, "playbackStyle"))
  {
    case 2:
      +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "allowAnimatedImagePlayback");
      goto LABEL_7;
    case 3:
      +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "allowLivePhotoPlayback");
      goto LABEL_7;
    case 4:
      +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "allowVideoPlayback");
      goto LABEL_7;
    case 5:
      +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "allowLoopingVideoPlayback");
LABEL_7:
      v5 = v4;

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (PXPhotosDetailsInlinePlaybackControllerDelegate)delegate
{
  return (PXPhotosDetailsInlinePlaybackControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong((id *)&self->_recordCreationQueue, 0);
}

void __70__PXPhotosDetailsInlinePlaybackController_checkInTile_withIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "checkInPlaybackRecordForDisplayAsset:", *(_QWORD *)(a1 + 32));

}

void __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke_2;
  v9[3] = &__block_descriptor_120_e34_v16__0___PXDetailsPlaybackRecord_8l;
  v5 = *(_OWORD *)(a1 + 112);
  v12 = *(_OWORD *)(a1 + 96);
  v13 = v5;
  v14 = *(_OWORD *)(a1 + 128);
  v15 = *(_QWORD *)(a1 + 144);
  v6 = *(_OWORD *)(a1 + 80);
  v10 = *(_OWORD *)(a1 + 64);
  v11 = v6;
  v7 = (id)objc_msgSend(WeakRetained, "checkOutPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:configurationBlock:", v2, v3, v4, v9);

}

uint64_t __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];
  uint64_t v6;

  v2 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v2;
  v5[4] = *(_OWORD *)(a1 + 96);
  v6 = *(_QWORD *)(a1 + 112);
  v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return objc_msgSend(a2, "setTileIdentifier:", v5);
}

@end
