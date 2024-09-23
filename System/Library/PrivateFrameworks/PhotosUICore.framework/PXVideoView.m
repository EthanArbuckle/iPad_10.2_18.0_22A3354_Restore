@implementation PXVideoView

- (PXVideoView)init
{
  PXVideoView *v2;
  void *v3;
  uint64_t v5;
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXVideoView;
  v2 = -[PXVideoView init](&v8, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v5 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v6, &location);
    -[PXVideoView playerLayer](v2, "playerLayer", v5, 3221225472, __19__PXVideoView_init__block_invoke, &unk_1E5148D30);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReadyForDisplayChangeHandler:", &v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setVideoGravity:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PXVideoView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVideoGravity:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (NSString)videoGravity
{
  void *v2;
  void *v3;

  -[PXVideoView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoGravity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ISWrappedAVPlayer)player
{
  return self->_player;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXVideoView playerLayer](self, "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deferredDealloc");

  v4.receiver = self;
  v4.super_class = (Class)PXVideoView;
  -[PXVideoView dealloc](&v4, sel_dealloc);
}

- (void)setPlayer:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_player, a3);
  -[PXVideoView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachToPlayerLayerIfNeeded:", v5);

  v6 = v8;
  if (!v8)
  {
    -[PXVideoView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWrappedPlayer:", 0);

    v6 = 0;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.readinessDidChange = objc_opt_respondsToSelector() & 1;
  }

}

- (BOOL)videoIsReadyForDisplay
{
  void *v2;
  char v3;

  -[PXVideoView playerLayer](self, "playerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReadyForDisplay");

  return v3;
}

- (void)_layerReadyForDisplayDidChange
{
  px_dispatch_on_main_queue();
}

- (BOOL)toneMapToStandardDynamicRange
{
  void *v2;
  char v3;

  -[PXVideoView playerLayer](self, "playerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "toneMapToStandardDynamicRange");

  return v3;
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXVideoView playerLayer](self, "playerLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToneMapToStandardDynamicRange:", v3);

}

- (PXVideoViewDelegate)delegate
{
  return (PXVideoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)kvoProxyIdentifier
{
  return self->_kvoProxyIdentifier;
}

- (void)setKvoProxyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvoProxyIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_player, 0);
}

void __45__PXVideoView__layerReadyForDisplayDidChange__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  void *v4;
  int v5;
  BOOL v6;
  dispatch_time_t v7;
  id v8;
  _QWORD block[5];

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[424])
  {
    v3 = objc_msgSend(v2, "videoIsReadyForDisplay");
    +[PXWorkaroundSettings sharedInstance](PXWorkaroundSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldWorkAround92398340");

    if (v3)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoViewReadinessDidChange:", *(_QWORD *)(a1 + 32));

    }
    else
    {
      v7 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__PXVideoView__layerReadyForDisplayDidChange__block_invoke_2;
      block[3] = &unk_1E5149198;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    }
  }
}

void __45__PXVideoView__layerReadyForDisplayDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoViewReadinessDidChange:", *(_QWORD *)(a1 + 32));

}

void __19__PXVideoView_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layerReadyForDisplayDidChange");

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
