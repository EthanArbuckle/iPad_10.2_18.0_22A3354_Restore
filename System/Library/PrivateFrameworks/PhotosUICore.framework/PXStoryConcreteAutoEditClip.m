@implementation PXStoryConcreteAutoEditClip

- (PXStoryConcreteAutoEditClip)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteAutoEditClip.m"), 26, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteAutoEditClip init]");

  abort();
}

- (PXStoryConcreteAutoEditClip)initWithDisplayAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PXStoryConcreteAutoEditClip *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXStoryConcreteAutoEditClip initWithDisplayAssets:](self, "initWithDisplayAssets:", v6, v9, v10);
  return v7;
}

- (PXStoryConcreteAutoEditClip)initWithDisplayAssets:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteAutoEditClip.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayAssets.count != 0"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteAutoEditClip;
  v6 = -[PXStoryConcreteAutoEditClip init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    v9 = MEMORY[0x1E0D759A0];
    v10 = *MEMORY[0x1E0D759A0];
    *(_OWORD *)(v6 + 184) = *(_OWORD *)(MEMORY[0x1E0D759A0] + 16);
    v11 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v6 + 200) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v6 + 216) = v11;
    *((_QWORD *)v6 + 29) = *(_QWORD *)(v9 + 64);
    *(_OWORD *)(v6 + 168) = v10;
    *((_QWORD *)v6 + 2) = 0;
    *((_QWORD *)v6 + 3) = 0x3FF0000000000000;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((_OWORD *)v6 + 9) = 0u;
    *((_QWORD *)v6 + 20) = 0;
    *((_QWORD *)v6 + 5) = 0;
    *((_QWORD *)v6 + 6) = 0;
  }

  return (PXStoryConcreteAutoEditClip *)v6;
}

- (id)description
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  Float64 Seconds;
  Float64 v14;
  Float64 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unsigned int v22;
  void *v23;
  void *v24;
  _BYTE v26[49];
  _BYTE v27[32];
  __int128 v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime time;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = self->_displayAssets;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v8), "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  -[PXStoryConcreteAutoEditClip playbackStyle](self, "playbackStyle");
  PFDisplayAssetPlaybackStyleDescription();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditClip durationInfo](self, "durationInfo");
  time = v33;
  Seconds = CMTimeGetSeconds(&time);
  -[PXStoryConcreteAutoEditClip durationInfo](self, "durationInfo");
  v32 = v31;
  v14 = CMTimeGetSeconds(&v32);
  -[PXStoryConcreteAutoEditClip durationInfo](self, "durationInfo");
  v30 = v29;
  v15 = CMTimeGetSeconds(&v30);
  -[PXStoryConcreteAutoEditClip durationMultiplier](self, "durationMultiplier");
  v17 = v16;
  -[PXStoryConcreteAutoEditClip motionInfo](self, "motionInfo");
  PXStoryAutoEditClipMotionInfoDescription(&v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditClip transitionInfo](self, "transitionInfo");
  PXStoryAutoEditClipTransitionInfoDescription((uint64_t)v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditClip audioInfo](self, "audioInfo");
  PXStoryClipAudioInfoDescription((uint64_t)v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PXStoryConcreteAutoEditClip moduleInfo](self, "moduleInfo");
  PXStoryAutoEditClipModuleInfoDescription(v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@:%p assetUUIDs=%@, playbackStyle=%@, minDuration=%.2fs, idealDuration=%.2fs, maxDuration=%.2fs, multiplier=%.2f, motion=%@, transition=%@, audio=%@, module=%@>"), v11, self, v3, v12, *(_QWORD *)&Seconds, *(_QWORD *)&v14, *(_QWORD *)&v15, v17, v18, v19, v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSArray)displayAssets
{
  return self->_displayAssets;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- ($19C3178046A4CD95E25554FCB23DE520)durationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].var1.var3;
  v4 = *(_OWORD *)&self[3].var0.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var2.var1;
  *(_OWORD *)&retstr->var2.var0 = v4;
  retstr->var2.var3 = self[3].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  return self;
}

- (void)setDurationInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_durationInfo.minimumDuration.value = *(_OWORD *)&a3->var0.var0;
  v3 = *(_OWORD *)&a3->var0.var3;
  v4 = *(_OWORD *)&a3->var1.var1;
  v5 = *(_OWORD *)&a3->var2.var0;
  self->_durationInfo.maximumDuration.epoch = a3->var2.var3;
  *(_OWORD *)&self->_durationInfo.maximumDuration.value = v5;
  *(_OWORD *)&self->_durationInfo.preferredDuration.timescale = v4;
  *(_OWORD *)&self->_durationInfo.minimumDuration.epoch = v3;
}

- (double)durationMultiplier
{
  return self->_durationMultiplier;
}

- (void)setDurationMultiplier:(double)a3
{
  self->_durationMultiplier = a3;
}

- ($DD059F4CECBB3D9089CC1CCE969C159D)motionInfo
{
  *($6C83F11C3A900281C56806D6FC71BA3F *)retstr = *($6C83F11C3A900281C56806D6FC71BA3F *)((char *)self + 56);
  return self;
}

- (void)setMotionInfo:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_motionInfo.settings.pan.relativeMotion = a3->var1.var0.var1;
  *(_OWORD *)&self->_motionInfo.style = v3;
}

- ($CB94F14F4A03AD88347CF1141E14C943)transitionInfo
{
  $68806D11CD65D8BE2A2DEF98801EDCF4 v3;

  v3 = *($68806D11CD65D8BE2A2DEF98801EDCF4 *)&self[3].var0;
  *($68806D11CD65D8BE2A2DEF98801EDCF4 *)&retstr->var0 = self[2].var2;
  retstr->var2 = v3;
  return self;
}

- (void)setTransitionInfo:(id *)a3
{
  $68806D11CD65D8BE2A2DEF98801EDCF4 var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_transitionInfo.kind = *(_OWORD *)&a3->var0;
  self->_transitionInfo.settings = ($E27F71463A882F773E6B3BC4CFCF9BBF)var2;
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[2].var4;
  retstr->var6 = self[2].var6;
  return self;
}

- (void)setAudioInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  v5 = *(_OWORD *)&a3->var4;
  self->_audioInfo.fadeOut = a3->var6;
  *(_OWORD *)&self->_audioInfo.volume = v4;
  *(_OWORD *)&self->_audioInfo.LCutLength = v5;
  *(_OWORD *)&self->_audioInfo.mode = v3;
}

- ($61DF9F24A7329A1BB61181F7D05C320D)moduleInfo
{
  uint64_t v2;
  int64_t moduleType;
  $61DF9F24A7329A1BB61181F7D05C320D result;

  v2 = *(_QWORD *)&self->_moduleInfo.isStart;
  moduleType = self->_moduleInfo.moduleType;
  result.var1 = v2;
  result.var2 = BYTE1(v2);
  result.var0 = moduleType;
  return result;
}

- (void)setModuleInfo:(id)a3
{
  self->_moduleInfo = ($A022BD108C6CC09BC304A9CB5E73F3A4)a3;
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

+ (id)composedClipWithClips:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PXStoryConcreteAutoEditClip *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[3];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v9), "displayAssets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v7);
  }

  v11 = -[PXStoryConcreteAutoEditClip initWithDisplayAssets:]([PXStoryConcreteAutoEditClip alloc], "initWithDisplayAssets:", v4);
  objc_msgSend(v5, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteAutoEditClip setPlaybackStyle:](v11, "setPlaybackStyle:", objc_msgSend(v12, "playbackStyle"));
  if (v12)
  {
    objc_msgSend(v12, "durationInfo");
    v32 = v37;
    v33 = v38;
    v34 = v39;
    v30 = v35;
    v31 = v36;
    -[PXStoryConcreteAutoEditClip setDurationInfo:](v11, "setDurationInfo:", &v30);
    objc_msgSend(v12, "motionInfo");
    v26 = v28;
    v27 = v29;
    -[PXStoryConcreteAutoEditClip setMotionInfo:](v11, "setMotionInfo:", &v26);
    objc_msgSend(v12, "transitionInfo");
    v22 = v24;
    v23 = v25;
    -[PXStoryConcreteAutoEditClip setTransitionInfo:](v11, "setTransitionInfo:", &v22);
    objc_msgSend(v12, "audioInfo");
  }
  else
  {
    v39 = 0;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0;
    -[PXStoryConcreteAutoEditClip setDurationInfo:](v11, "setDurationInfo:", &v30);
    v28 = 0uLL;
    v29 = 0;
    v27 = 0;
    v26 = 0uLL;
    -[PXStoryConcreteAutoEditClip setMotionInfo:](v11, "setMotionInfo:", &v26);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PXStoryConcreteAutoEditClip setTransitionInfo:](v11, "setTransitionInfo:", &v22);
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
  }
  v16[0] = v18;
  v16[1] = v19;
  v16[2] = v20;
  v17 = v21;
  -[PXStoryConcreteAutoEditClip setAudioInfo:](v11, "setAudioInfo:", v16);
  v13 = objc_msgSend(v12, "moduleInfo");
  -[PXStoryConcreteAutoEditClip setModuleInfo:](v11, "setModuleInfo:", v13, v14);

  return v11;
}

@end
