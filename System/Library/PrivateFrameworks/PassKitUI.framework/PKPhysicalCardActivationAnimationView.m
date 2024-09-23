@implementation PKPhysicalCardActivationAnimationView

- (PKPhysicalCardActivationAnimationView)initWithFrame:(CGRect)a3
{
  PKPhysicalCardActivationAnimationView *v3;
  int IsAvailable;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  AVPlayerItem *playerItem;
  void *v13;
  id *p_player;
  double v15;
  uint64_t v16;
  AVPlayerLayer *playerLayer;
  void *v18;
  id v19;
  uint64_t v20;
  UILabel *nameOnCardLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PKPhysicalCardActivationAnimationView;
  v3 = -[PKPhysicalCardActivationAnimationView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3)
    return v3;
  IsAvailable = PKPearlIsAvailable();
  PKPassKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (IsAvailable)
    v7 = CFSTR("PhysicalCardActivationFaceID");
  else
    v7 = CFSTR("PhysicalCardActivationTouchID");
  objc_msgSend(v5, "URLForResource:withExtension:", v7, CFSTR("mov"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_9:
    v10 = 0;
    v11 = 1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_10:
  objc_storeStrong((id *)&v3->_playerItem, v10);
  if ((v11 & 1) == 0)

  playerItem = v3->_playerItem;
  if (playerItem)
  {
    objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", v3->_playerItem);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  p_player = (id *)&v3->_player;
  objc_storeStrong((id *)&v3->_player, v13);
  if (playerItem)

  LODWORD(v15) = 0;
  objc_msgSend(*p_player, "setVolume:", v15);
  objc_msgSend(*p_player, "setMuted:", 1);
  objc_msgSend(*p_player, "setAllowsExternalPlayback:", 0);
  if (*p_player)
  {
    objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:");
    v16 = objc_claimAutoreleasedReturnValue();
    playerLayer = v3->_playerLayer;
    v3->_playerLayer = (AVPlayerLayer *)v16;

    -[PKPhysicalCardActivationAnimationView layer](v3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v3->_playerLayer);

  }
  v19 = objc_alloc(MEMORY[0x1E0DC3990]);
  v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  nameOnCardLabel = v3->_nameOnCardLabel;
  v3->_nameOnCardLabel = (UILabel *)v20;

  v22 = v3->_nameOnCardLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v22, "setTextColor:", v23);

  v24 = v3->_nameOnCardLabel;
  PKRoundedSystemFontOfSizeAndWeight(10.0, *MEMORY[0x1E0DC1420]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v24, "setFont:", v25);

  -[UILabel setAdjustsFontSizeToFitWidth:](v3->_nameOnCardLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](v3->_nameOnCardLabel, "setMinimumScaleFactor:", 0.2);

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPhysicalCardActivationAnimationView _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicalCardActivationAnimationView;
  -[PKPhysicalCardActivationAnimationView dealloc](&v3, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = result.width / 1.02272;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKPhysicalCardActivationAnimationView;
  -[PKPhysicalCardActivationAnimationView layoutSubviews](&v20, sel_layoutSubviews);
  -[PKPhysicalCardActivationAnimationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[UILabel superview](self->_nameOnCardLabel, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UILabel font](self->_nameOnCardLabel, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineHeight");
    v14 = v13;

    PKFloatRoundToPixel();
    v16 = v15;
    PKFloatRoundToPixel();
    v18 = v17 - v14;
    PKFloatRoundToPixel();
    -[UILabel setFrame:](self->_nameOnCardLabel, "setFrame:", v16, v18, v19 - v16, v14);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &PlayerKVOContext)
  {
    if (!self->_invalidated && -[AVPlayerItem status](self->_playerItem, "status") == AVPlayerItemStatusReadyToPlay)
      -[AVPlayer play](self->_player, "play");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPhysicalCardActivationAnimationView;
    -[PKPhysicalCardActivationAnimationView observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)startAnimation
{
  void *v3;

  if (!self->_invalidated && !self->_playerStarted && self->_playerItem)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didFinishPlaying, *MEMORY[0x1E0C8AC48], self->_playerItem);

    self->_playerStarted = 1;
    -[AVPlayerItem addObserver:forKeyPath:options:context:](self->_playerItem, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, &PlayerKVOContext);
    if (-[AVPlayerItem status](self->_playerItem, "status") == AVPlayerItemStatusReadyToPlay)
      -[AVPlayer play](self->_player, "play");
  }
}

- (void)setNameOnCard:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *nameOnCard;
  UILabel *nameOnCardLabel;
  void *v12;
  NSString *v13;

  v4 = a3;
  v5 = self->_nameOnCard;
  v6 = (NSString *)v4;
  v13 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v13;
      if (v7)
        goto LABEL_15;
    }
    else
    {

      v8 = v13;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    nameOnCard = self->_nameOnCard;
    self->_nameOnCard = v9;

    nameOnCardLabel = self->_nameOnCardLabel;
    if (self->_nameOnCard)
    {
      -[UILabel superview](nameOnCardLabel, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        -[PKPhysicalCardActivationAnimationView addSubview:](self, "addSubview:", self->_nameOnCardLabel);
      -[UILabel setText:](self->_nameOnCardLabel, "setText:", self->_nameOnCard);
    }
    else
    {
      -[UILabel setText:](nameOnCardLabel, "setText:", 0);
      -[UILabel removeFromSuperview](self->_nameOnCardLabel, "removeFromSuperview");
    }
    -[PKPhysicalCardActivationAnimationView setNeedsLayout](self, "setNeedsLayout");
  }
  v8 = v13;
LABEL_15:

}

- (void)_invalidate
{
  AVPlayer *player;
  AVPlayerLayer *playerLayer;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKPhysicalCardActivationAnimationView _removePlayerItem](self, "_removePlayerItem");
    player = self->_player;
    self->_player = 0;

    -[AVPlayerLayer setPlayer:](self->_playerLayer, "setPlayer:", 0);
    -[AVPlayerLayer removeFromSuperlayer](self->_playerLayer, "removeFromSuperlayer");
    playerLayer = self->_playerLayer;
    self->_playerLayer = 0;

  }
}

- (void)_didFinishPlaying
{
  AVPlayerItem *v3;
  AVPlayerItem *playerItem;
  AVPlayer *player;
  CMTime v6;

  if (self->_playerItem)
  {
    -[AVPlayer currentItem](self->_player, "currentItem");
    v3 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
    playerItem = self->_playerItem;

    if (v3 == playerItem)
    {
      player = self->_player;
      CMTimeMake(&v6, 0, 1);
      -[AVPlayer seekToTime:](player, "seekToTime:", &v6);
      -[AVPlayer play](self->_player, "play");
    }
  }
}

- (void)_removePlayerItem
{
  AVPlayerItem *playerItem;

  if (self->_playerItem)
  {
    if (self->_playerStarted)
    {
      -[AVPlayer pause](self->_player, "pause");
      -[AVPlayerItem removeObserver:forKeyPath:context:](self->_playerItem, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &PlayerKVOContext);
    }
    -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_player, "replaceCurrentItemWithPlayerItem:", 0);
    playerItem = self->_playerItem;
    self->_playerItem = 0;

  }
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_nameOnCardLabel, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
}

@end
