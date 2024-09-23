@implementation SFMagicHead

- (SFMagicHead)initWithNode:(id)a3 slotNode:(id)a4 containerRadius:(double)a5 delegate:(id)a6 settings:(id)a7
{
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  SFMagicHead *v17;
  void *v18;
  void *p_node;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  SFMagicHead *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  NSArray *progressKeyPaths;
  id v33;
  uint64_t v34;
  UIView *contentView;
  void *v36;
  UIView *v37;
  UIView *imageSlotView;
  int v39;
  void *v40;
  SFMagicHeadShadowView *v41;
  uint64_t v42;
  SFMagicHeadShadowView *shadowView;
  void *v44;
  SFPersonImageView *v45;
  SFPersonImageView *imageView;
  SFCircleProgressView *v47;
  uint64_t v48;
  SFCircleProgressView *circleProgressView;
  void *v50;
  id *v52;
  _QWORD v53[4];
  id v54;
  int v55;
  id location;
  objc_super v57;
  CGRect v58;
  CGRect v59;

  v13 = (unint64_t)a3;
  v14 = (unint64_t)a4;
  v15 = a6;
  v16 = a7;
  if (v13 | v14)
  {
    v57.receiver = self;
    v57.super_class = (Class)SFMagicHead;
    v17 = -[SFMagicHead initWithFrame:](&v57, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHead setBackgroundColor:](v17, "setBackgroundColor:", v18);

      v17->_isMagicHead = v14 != 0;
      p_node = &v17->_node;
      objc_storeStrong((id *)&v17->_node, a3);
      objc_storeStrong((id *)&v17->_slotNode, a4);
      v52 = (id *)&v17->_node;
      -[SFAirDropNode nodeIdentifier](v17->_node, "nodeIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
      {
        v22 = 0;
        v23 = (void *)v20;
      }
      else
      {
        objc_msgSend((id)v14, "identifier");
        v25 = objc_claimAutoreleasedReturnValue();
        p_node = (void *)v25;
        if (v25)
        {
          v22 = 0;
          v23 = (void *)v25;
        }
        else
        {
          v23 = (void *)objc_opt_new();
          v22 = 1;
        }
      }
      objc_storeStrong((id *)&v17->_nodeIdentifier, v23);
      if (v22)

      if (!v21)
      v17->_containerRadius = a5;
      objc_storeWeak((id *)&v17->_delegate, v15);
      v26 = v16;
      if (!v16)
      {
        objc_msgSend(MEMORY[0x24BE901B8], "rootSettings");
        p_node = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_node, "magicHeadSettings");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&v17->_settings, v26);
      if (!v16)
      {

      }
      v17->_pointedAt = 1;
      if (v17->_isMagicHead)
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_referenceBounds");
        if (v28 >= 414.0)
        {
          objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "userInterfaceIdiom");

          if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            v29 = 62.0;
          else
            v29 = 66.0;
        }
        else
        {
          v29 = 62.0;
        }

      }
      else
      {
        v29 = 128.0;
      }
      -[SFMagicHead setBounds:](v17, "setBounds:", 0.0, 0.0, v29, v29);
      progressKeyPaths = v17->_progressKeyPaths;
      v17->_progressKeyPaths = (NSArray *)&unk_24CE21E50;

      v33 = objc_alloc(MEMORY[0x24BEBDB00]);
      -[SFMagicHead bounds](v17, "bounds");
      v34 = objc_msgSend(v33, "initWithFrame:");
      contentView = v17->_contentView;
      v17->_contentView = (UIView *)v34;

      -[UIView setClipsToBounds:](v17->_contentView, "setClipsToBounds:", 0);
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v17->_contentView, "setBackgroundColor:", v36);

      -[SFMagicHead addSubview:](v17, "addSubview:", v17->_contentView);
      if (v17->_isMagicHead)
      {
        v37 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
        imageSlotView = v17->_imageSlotView;
        v17->_imageSlotView = v37;

        -[UIView bounds](v17->_contentView, "bounds");
        -[UIView setFrame:](v17->_imageSlotView, "setFrame:");
        v39 = -[UIAirDropNode avatarImageSlotID](v17->_slotNode, "avatarImageSlotID");
        location = 0;
        objc_initWeak(&location, v17);
        v40 = (void *)*MEMORY[0x24BEBDF78];
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __71__SFMagicHead_initWithNode_slotNode_containerRadius_delegate_settings___block_invoke;
        v53[3] = &unk_24CE0FD28;
        objc_copyWeak(&v54, &location);
        v55 = v39;
        objc_msgSend(v40, "_performBlockAfterCATransactionCommits:", v53);
        -[UIView addSubview:](v17->_contentView, "addSubview:", v17->_imageSlotView);
        objc_destroyWeak(&v54);
        objc_destroyWeak(&location);
      }
      else
      {
        v41 = [SFMagicHeadShadowView alloc];
        -[UIView bounds](v17->_contentView, "bounds");
        v42 = -[SFMagicHeadShadowView initWithFrame:](v41, "initWithFrame:");
        shadowView = v17->_shadowView;
        v17->_shadowView = (SFMagicHeadShadowView *)v42;

        -[SFMagicHeadShadowView setClipsToBounds:](v17->_shadowView, "setClipsToBounds:", 0);
        -[UIView addSubview:](v17->_contentView, "addSubview:", v17->_shadowView);
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:", objc_msgSend(*v52, "displayIcon"));
        v45 = -[SFPersonImageView initWithImage:isSquare:]([SFPersonImageView alloc], "initWithImage:isSquare:", v44, objc_msgSend(*v52, "isClassroom"));
        imageView = v17->_imageView;
        v17->_imageView = v45;

        -[SFMagicHeadSettings tapDarkeningAlpha](v17->_settings, "tapDarkeningAlpha");
        -[SFPersonImageView setHighlightDarkeningAlpha:](v17->_imageView, "setHighlightDarkeningAlpha:");
        -[SFMagicHeadShadowView bounds](v17->_shadowView, "bounds");
        -[SFPersonImageView setFrame:](v17->_imageView, "setFrame:");
        -[SFMagicHeadShadowView addSubview:](v17->_shadowView, "addSubview:", v17->_imageView);

      }
      v47 = [SFCircleProgressView alloc];
      -[UIView bounds](v17->_contentView, "bounds");
      v59 = CGRectInset(v58, -9.0, -9.0);
      v48 = -[SFCircleProgressView initWithFrame:](v47, "initWithFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
      circleProgressView = v17->_circleProgressView;
      v17->_circleProgressView = (SFCircleProgressView *)v48;

      -[SFCircleProgressView setProgressLineWidth:](v17->_circleProgressView, "setProgressLineWidth:", 3.0);
      -[SFCircleProgressView setShowProgressTray:](v17->_circleProgressView, "setShowProgressTray:", 1);
      -[SFCircleProgressView setAlpha:](v17->_circleProgressView, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCircleProgressView setBackgroundColor:](v17->_circleProgressView, "setBackgroundColor:", v50);

      -[UIView addSubview:](v17->_contentView, "addSubview:", v17->_circleProgressView);
      -[SFMagicHead setCellState:animated:silent:](v17, "setCellState:animated:silent:", 0, 0, 1);
    }
    self = v17;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __71__SFMagicHead_initWithNode_slotNode_containerRadius_delegate_settings___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDE5658], "objectForSlot:", *(unsigned int *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BDE5C88];
    objc_msgSend(WeakRetained, "imageSlotView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentsGravity:", v3);

    objc_msgSend(WeakRetained, "imageSlotView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContents:", v2);

    objc_msgSend(WeakRetained, "imageSlotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[SFMagicHead setProgress:](self, "setProgress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SFMagicHead;
  -[SFMagicHead dealloc](&v3, sel_dealloc);
}

- (void)setHighlighted:(BOOL)a3
{
  -[SFPersonImageView setHighlighted:](self->_imageView, "setHighlighted:", a3);
}

- (BOOL)highlighted
{
  return -[SFPersonImageView isHighlighted](self->_imageView, "isHighlighted");
}

- (void)setSize:(int64_t)a3
{
  CGFloat v4;
  UIView *contentView;
  CGAffineTransform v6;
  CGAffineTransform v7;

  self->_size = a3;
  if ((unint64_t)(a3 - 1) > 2)
    v4 = 0.00000011920929;
  else
    v4 = dbl_2127A2C10[a3 - 1];
  -[SFMagicHeadShadowView setVisible:](self->_shadowView, "setVisible:", a3 != 1);
  CGAffineTransformMakeScale(&v7, v4, v4);
  contentView = self->_contentView;
  v6 = v7;
  -[UIView setTransform:](contentView, "setTransform:", &v6);
}

- (void)setPosition:(int64_t)a3
{
  -[SFMagicHead setPosition:withOffset:](self, "setPosition:withOffset:", a3, 0.0);
}

- (void)setPositionDegreeOffsetWithOffset:(double)a3
{
  -[SFMagicHead setPosition:withOffset:](self, "setPosition:withOffset:", 2, a3);
}

- (void)setPosition:(int64_t)a3 withOffset:(double)a4
{
  double v5;
  float v6;
  float v7;
  double v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  self->_position = a3;
  self->_degreeOffset = a4;
  v5 = 0.0;
  if (self->_position != 1)
    v5 = -self->_containerRadius;
  v6 = a4;
  v7 = v6 * 0.0174532925;
  v8 = v7;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeRotation(&v17, v7);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, 0.0, v5);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeRotation(&v15, -v8);
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  t1 = v17;
  *(_OWORD *)&t2.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)&v14.tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  t2 = v16;
  v11 = v14;
  CGAffineTransformConcat(&t1, &t2, &v11);
  v14 = t1;
  t2 = v15;
  v11 = t1;
  CGAffineTransformConcat(&t1, &t2, &v11);
  v14 = t1;
  v10 = t1;
  -[SFMagicHead setTransform:](self, "setTransform:", &v10);
}

- (void)resetTransferState
{
  id v3;

  -[SFMagicHead setCellState:animated:silent:](self, "setCellState:animated:silent:", 0, 1, 1);
  -[SFMagicHead delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "magicHead:requestingSubtitleTextChangeForState:", self, self->_cellState);

}

- (void)userDidSelect
{
  -[SFMagicHead resetTransferState](self, "resetTransferState");
  -[SFMagicHead setCellState:animated:silent:](self, "setCellState:animated:silent:", 2, 1, 0);
}

- (void)userDidCancel
{
  id v3;

  if ((self->_cellState | 2) != 6)
  {
    -[NSProgress cancel](self->_progress, "cancel");
    -[SFMagicHead setCellState:animated:silent:](self, "setCellState:animated:silent:", 0, 1, 1);
    -[SFMagicHead delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "magicHead:requestingSubtitleTextChangeForState:", self, self->_cellState);

  }
}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_progress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_progress = &self->_progress;
  if (self->_progress != v5)
  {
    v7 = v5;
    -[SFMagicHead removeObserverOfValuesForKeyPaths:ofObject:](self, "removeObserverOfValuesForKeyPaths:ofObject:", self->_progressKeyPaths);
    objc_storeStrong((id *)&self->_progress, a3);
    -[SFMagicHead addObserverOfValuesForKeyPaths:ofObject:](self, "addObserverOfValuesForKeyPaths:ofObject:", self->_progressKeyPaths, *p_progress);
    -[SFMagicHead triggerKVOForKeyPaths:ofObject:](self, "triggerKVOForKeyPaths:ofObject:", self->_progressKeyPaths, *p_progress);
    v5 = v7;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v11, "isEqual:", self->_progress))
    {
      -[SFMagicHead handleKVOUpdateForProgress:keyPath:](self, "handleKVOUpdateForProgress:keyPath:", self->_progress, v10);
    }
    else
    {
      airdrop_ui_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SFMagicHead observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)self, (uint64_t)v10, v14);

    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SFMagicHead_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24CE0FBA0;
    block[4] = self;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = a6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __62__SFMagicHead_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)addObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 0, 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

- (void)removeObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(v7, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

- (void)triggerKVOForKeyPaths:(id)a3 ofObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v6);
          -[SFMagicHead observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7, 0, 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

- (void)handleKVOUpdateForProgress:(id)a3 keyPath:(id)a4
{
  id v5;
  _BOOL4 stateBeingRestored;
  _BOOL8 v7;
  id WeakRetained;
  SFMagicHead *v9;
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  SFCircleProgressView *circleProgressView;
  _BOOL8 v14;
  SFMagicHead *v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a4;
  stateBeingRestored = self->_stateBeingRestored;
  v7 = !self->_stateBeingRestored;
  v18 = v5;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("userInfo.sendState")))
  {
    switch(-[NSProgress sf_transferState](self->_progress, "sf_transferState"))
    {
      case 0:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "magicHeadDidStartTransferForHead:", self);

        v9 = self;
        v10 = 2;
        v11 = v7;
        v12 = stateBeingRestored;
        goto LABEL_10;
      case 1:
        v12 = stateBeingRestored;
        v9 = self;
        v10 = 1;
        goto LABEL_9;
      case 2:
        v12 = stateBeingRestored;
        v9 = self;
        v10 = 2;
        goto LABEL_9;
      case 3:
        v12 = stateBeingRestored;
        v9 = self;
        v10 = 3;
LABEL_9:
        v11 = v7;
LABEL_10:
        -[SFMagicHead setCellState:animated:silent:](v9, "setCellState:animated:silent:", v10, v11, v12);
        break;
      case 4:
        v14 = stateBeingRestored;
        v15 = self;
        v16 = 5;
        goto LABEL_13;
      case 5:
        v14 = stateBeingRestored;
        v15 = self;
        v16 = 6;
LABEL_13:
        -[SFMagicHead setCellState:animated:silent:](v15, "setCellState:animated:silent:", v16, v7, v14);
        -[SFCircleProgressView setProgress:animated:completion:](self->_circleProgressView, "setProgress:animated:completion:", v7, 0, 0.0);
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v17, "magicHeadDidTerminateTransferForHead:", self);
        goto LABEL_15;
      case 6:
        -[SFMagicHead setCellState:animated:silent:](self, "setCellState:animated:silent:", 4, v7, stateBeingRestored);
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v17, "magicHeadDidFinishTransferForHead:", self);
LABEL_15:

        break;
      default:
        break;
    }
  }
  else if (objc_msgSend(v18, "isEqualToString:", CFSTR("fractionCompleted")))
  {
    circleProgressView = self->_circleProgressView;
    -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
    -[SFCircleProgressView setProgress:animated:completion:](circleProgressView, "setProgress:animated:completion:", v7, 0);
  }

}

- (void)setCellState:(int64_t)a3 animated:(BOOL)a4 silent:(BOOL)a5
{
  int64_t cellState;
  _BOOL8 v6;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  const __CFString *v12;
  NSProgress *progress;
  int v14;
  SFCircleProgressView *circleProgressView;
  double v16;
  NSObject *v17;
  unint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  SFCircleProgressView *v24;
  _QWORD v25[5];
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  cellState = self->_cellState;
  if (cellState != a3)
  {
    v6 = a4;
    v9 = a3 - 2;
    if ((unint64_t)a3 >= 2 && cellState > a3)
    {
      airdrop_ui_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_cellState;
        if (v11 > 6)
          v12 = CFSTR("?");
        else
          v12 = off_24CE0FD70[v11];
        if (v9 > 4)
          v20 = CFSTR("?");
        else
          v20 = off_24CE0FD48[v9];
        -[SFAirDropNode displayName](self->_node, "displayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412803;
        v27 = v12;
        v28 = 2112;
        v29 = v20;
        v30 = 2113;
        v31 = v21;
        _os_log_impl(&dword_212728000, v10, OS_LOG_TYPE_DEFAULT, "MagicHead: unsupported cell state transition %@ -> %@ for person %{private}@. Ignoring", buf, 0x20u);

      }
LABEL_31:

      return;
    }
    progress = self->_progress;
    if (!progress || (-[NSProgress sf_initiator](progress, "sf_initiator") & 2) != 0)
    {
      v14 = 1;
    }
    else
    {
      if ((unint64_t)(a3 - 3) >= 4 && a3)
        return;
      -[SFCircleProgressView setAlpha:](self->_circleProgressView, "setAlpha:", 0.0);
      v14 = 0;
    }
    switch(a3)
    {
      case 0:
      case 5:
      case 6:
        -[SFCircleProgressView setProgress:animated:completion:](self->_circleProgressView, "setProgress:animated:completion:", v6, 0, a5, 0.0);
        circleProgressView = self->_circleProgressView;
        v16 = 0.0;
        goto LABEL_16;
      case 1:
      case 3:
        -[SFCircleProgressView setProgress:animated:completion:](self->_circleProgressView, "setProgress:animated:completion:", v6, 0, a5, 0.0);
        if (v14)
        {
          circleProgressView = self->_circleProgressView;
          v16 = 1.0;
LABEL_16:
          -[SFCircleProgressView setAlpha:](circleProgressView, "setAlpha:", v16);
        }
        break;
      case 4:
        v24 = self->_circleProgressView;
        if (v6)
        {
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __44__SFMagicHead_setCellState_animated_silent___block_invoke;
          v25[3] = &unk_24CE0ED80;
          v25[4] = self;
          -[SFCircleProgressView animateProgressCompletedWithCompletion:](v24, "animateProgressCompletedWithCompletion:", v25, a4, a5);
        }
        else
        {
          -[SFCircleProgressView setAlpha:](v24, "setAlpha:", 0.0);
          -[SFCircleProgressView setProgress:](self->_circleProgressView, "setProgress:", 1.0);
        }
        break;
      default:
        break;
    }
    airdrop_ui_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_cellState;
      if (v18 > 6)
        v19 = CFSTR("?");
      else
        v19 = off_24CE0FD70[v18];
      if ((unint64_t)a3 > 6)
        v22 = CFSTR("?");
      else
        v22 = off_24CE0FD70[a3];
      -[SFAirDropNode displayName](self->_node, "displayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412803;
      v27 = v19;
      v28 = 2112;
      v29 = v22;
      v30 = 2113;
      v31 = v23;
      _os_log_impl(&dword_212728000, v17, OS_LOG_TYPE_DEFAULT, "MagicHead: changing cell state %@ -> %@ for person %{private}@", buf, 0x20u);

    }
    self->_cellState = a3;
    -[SFMagicHead delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject magicHead:requestingSubtitleTextChangeForState:](v10, "magicHead:requestingSubtitleTextChangeForState:", self, self->_cellState);
    goto LABEL_31;
  }
}

uint64_t __44__SFMagicHead_setCellState_animated_silent___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__SFMagicHead_setCellState_animated_silent___block_invoke_2;
  v2[3] = &unk_24CE0ED80;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v2, 0.5);
}

uint64_t __44__SFMagicHead_setCellState_animated_silent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

- (SFMagicHeadDelegate)delegate
{
  return (SFMagicHeadDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFMagicHeadSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (SFAirDropNode)node
{
  return (SFAirDropNode *)objc_getProperty(self, a2, 496, 1);
}

- (UIAirDropNode)slotNode
{
  return (UIAirDropNode *)objc_getProperty(self, a2, 504, 1);
}

- (NSUUID)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (double)degreeOffset
{
  return self->_degreeOffset;
}

- (BOOL)pointedAt
{
  return self->_pointedAt;
}

- (void)setPointedAt:(BOOL)a3
{
  self->_pointedAt = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (int64_t)position
{
  return self->_position;
}

- (BOOL)stateBeingRestored
{
  return self->_stateBeingRestored;
}

- (void)setStateBeingRestored:(BOOL)a3
{
  self->_stateBeingRestored = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (UIView)imageSlotView
{
  return self->_imageSlotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSlotView, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_slotNode, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressKeyPaths, 0);
  objc_storeStrong((id *)&self->_circleProgressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)observeValueForKeyPath:(NSObject *)a3 ofObject:change:context:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_212728000, a3, OS_LOG_TYPE_ERROR, "%@: incorrect object for keypath %@", (uint8_t *)&v7, 0x16u);

}

@end
