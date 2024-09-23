@implementation PUParallaxLayerStackView

- (void)setViewModel:(id)a3
{
  PUParallaxLayerStackViewModel *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (PUParallaxLayerStackViewModel *)a3;
  if (self->_viewModel != v5)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PUParallaxLayerStackView _updateContainerFrame](self, "_updateContainerFrame");
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[PUParallaxLayerStackView subviews](self, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "removeFromSuperview");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }

    -[PUParallaxLayerStackViewModel viewManager](v5, "viewManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackViewModel currentLayerStack](v5, "currentLayerStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasMainLayers");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v12;
    objc_msgSend(v12, "layers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v11, "viewForLayer:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 && (objc_msgSend(v19, "isBackfill") & 1) != 0)
            v21 = 1;
          else
            v21 = objc_msgSend(v19, "isDebug");
          objc_msgSend(v20, "setHidden:", v21);
          -[PUParallaxLayerStackView addSubview:](self, "addSubview:", v20);
          objc_msgSend(v19, "zPosition");
          v23 = v22;
          objc_msgSend(v20, "layer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setZPosition:", v23);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v16);
    }

  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUParallaxLayerStackView;
  -[PUParallaxLayerStackView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUParallaxLayerStackView _updateContainerFrame](self, "_updateContainerFrame");
}

- (void)_updateContainerFrame
{
  void *v3;
  _QWORD v4[5];

  -[PUParallaxLayerStackView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PUParallaxLayerStackView__updateContainerFrame__block_invoke;
  v4[3] = &unk_1E58AB148;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (CGPoint)motionVector
{
  double x;
  double y;
  CGPoint result;

  x = self->_motionVector.x;
  y = self->_motionVector.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMotionVector:(CGPoint)a3
{
  self->_motionVector = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __49__PUParallaxLayerStackView__updateContainerFrame__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bounds");
  PXRectWithOriginAndSize();
  objc_msgSend(v3, "setContainerFrame:");

}

@end
