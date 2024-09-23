@implementation _PNPPencilMovieView

- (_PNPPencilMovieView)initWithDeviceType:(int64_t)a3
{
  _PNPPencilMovieView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PNPPencilMovieView;
  result = -[_PNPPencilMovieView init](&v5, sel_init);
  if (result)
    result->_deviceType = a3;
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (double)_playbackRate
{
  return 1.0;
}

- (void)_playbackEnded
{
  AVPlayer *player;
  AVPlayer *v4;
  double v5;
  __int128 v6;
  uint64_t v7;

  if (self->_repeat)
  {
    player = self->_player;
    v6 = *MEMORY[0x24BDC0D88];
    v7 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    -[AVPlayer seekToTime:](player, "seekToTime:", &v6);
    v4 = self->_player;
    objc_msgSend((id)objc_opt_class(), "_playbackRate");
    *(float *)&v5 = v5;
    -[AVPlayer setRate:](v4, "setRate:", v5);
  }
}

- (void)teardown
{
  id v2;

  -[_PNPPencilMovieView _playerLayer](self, "_playerLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlayer:", 0);

}

- (id)assetName
{
  if (self->_deviceType == 4)
    return CFSTR("apple_pencil-B532");
  else
    return CFSTR("apple_pencil_2");
}

- (void)prepare
{
  void *v3;
  void *v4;
  void *v5;
  AVPlayer *v6;
  AVPlayer *player;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AVPlayer *v12;
  double v13;
  id v14;

  self->_repeat = 1;
  -[_PNPPencilMovieView _applyFilterToLayer](self, "_applyFilterToLayer");
  if (!self->_player)
  {
    -[_PNPPencilMovieView assetName](self, "assetName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PencilPairingUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("mov"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB2610], "playerWithURL:", v5);
    v6 = (AVPlayer *)objc_claimAutoreleasedReturnValue();
    player = self->_player;
    self->_player = v6;

    -[AVPlayer setAllowsExternalPlayback:](self->_player, "setAllowsExternalPlayback:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDB1FA8];
    -[AVPlayer currentItem](self->_player, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__playbackEnded, v9, v10);

  }
  -[_PNPPencilMovieView _playerLayer](self, "_playerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlayer:", self->_player);

  v12 = self->_player;
  objc_msgSend((id)objc_opt_class(), "_playbackRate");
  *(float *)&v13 = v13;
  -[AVPlayer setRate:](v12, "setRate:", v13);
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCategory:error:", *MEMORY[0x24BDB1598], 0);

}

- (void)_applyFilterToLayer
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  __int128 v18;
  int v19;
  float v20;
  __int128 v21;
  int v22;
  float v23;
  _BYTE v24[28];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  -[_PNPPencilMovieView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle") == 1;

  -[_PNPPencilMovieView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle") == 1)
    v6 = 0.5;
  else
    v6 = 0.19;

  if (self->_deviceType == 4)
  {
    -[_PNPPencilMovieView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceStyle") == 1)
      v8 = 1.0;
    else
      v8 = 0.98;

    -[_PNPPencilMovieView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceStyle") == 1)
      v6 = 0.5;
    else
      v6 = 0.41;

  }
  else
  {
    v8 = dbl_22ACEA350[v4];
  }
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v17 = v11;
  v18 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 4);
  v19 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 20);
  v20 = v11;
  v21 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 28);
  v22 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 44);
  v23 = v11;
  *(_OWORD *)v24 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 52);
  *(_OWORD *)&v24[12] = *(_OWORD *)(MEMORY[0x24BDE53E8] + 64);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v12, CFSTR("inputColorMatrix"));

  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59A0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("inputAmount"));

  -[_PNPPencilMovieView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFilters:", v16);

}

- (void)completeRevolutionWithCompletionBlock:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  -[AVPlayer currentItem](self->_player, "currentItem");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayer rate](self->_player, "rate");
  v6 = (void *)v15[5];
  if (v6)
  {
    v7 = v5;
    objc_msgSend(v6, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend((id)v15[5], "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke;
      v10[3] = &unk_24F4E5A40;
      v12 = &v14;
      v13 = v7;
      v11 = v4;
      objc_msgSend(v9, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24F4F64A8, v10);

    }
  }
  _Block_object_dispose(&v14, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
}

@end
