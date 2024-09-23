@implementation TSDAudioRep

- (TSDAudioRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSDAudioRep *v4;
  TSDAudioRep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDAudioRep;
  v4 = -[TSDRep initWithLayout:canvas:](&v7, sel_initWithLayout_canvas_, a3, a4);
  v5 = v4;
  if (v4 && !-[TSDAudioRep movieInfo](v4, "movieInfo"))
  {

    return 0;
  }
  return v5;
}

- (TSDMovieInfo)movieInfo
{
  objc_opt_class();
  -[TSDRep info](self, "info");
  return (TSDMovieInfo *)TSUDynamicCast();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDAudioRep;
  -[TSDMediaRep dealloc](&v3, sel_dealloc);
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canResetMediaSize
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (BOOL)p_shouldShowPlayPauseLayers
{
  return 1;
}

- (void)willUpdateLayer:(id)a3
{
  TSKAVPlayerController *v5;
  CALayer *v6;

  if (-[TSDAudioRep p_shouldShowPlayPauseLayers](self, "p_shouldShowPlayPauseLayers"))
  {
    if (!self->mPlayerController)
    {
      v5 = (TSKAVPlayerController *)(id)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      self->mPlayerController = v5;
      -[TSKAVPlayerController setBounds:](v5, "setBounds:", TSDRectWithSize());
      objc_msgSend(a3, "contentsScale");
      -[TSKAVPlayerController setContentsScale:](self->mPlayerController, "setContentsScale:");
      objc_msgSend(a3, "addSublayer:", self->mPlayerController);
    }
    if (!self->mPlayPauseButtonLayer)
    {
      v6 = (CALayer *)(id)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      self->mPlayPauseButtonLayer = v6;
      -[CALayer setBounds:](v6, "setBounds:", TSDRectWithSize());
      objc_msgSend(a3, "position");
      -[CALayer setPosition:](self->mPlayPauseButtonLayer, "setPosition:");
      objc_msgSend(a3, "contentsScale");
      -[CALayer setContentsScale:](self->mPlayPauseButtonLayer, "setContentsScale:");
      objc_msgSend(a3, "addSublayer:", self->mPlayPauseButtonLayer);
    }
    -[TSDAudioRep p_updateButtonForPlaying:pressed:](self, "p_updateButtonForPlaying:pressed:", -[TSDAudioRep p_isPlaying](self, "p_isPlaying"), 0);
  }
}

- (void)becameSelected
{
  objc_msgSend(*(id *)&self->mDynamicVolume, "setSelected:", 1);
  if (-[TSDAudioRep p_shouldPlayerControllerExistThroughoutSelection](self, "p_shouldPlayerControllerExistThroughoutSelection"))
  {
    -[TSDAudioRep p_setupPlayerControllerIfNecessary](self, "p_setupPlayerControllerIfNecessary");
  }
}

- (void)becameNotSelected
{
  objc_super v3;

  objc_msgSend(*(id *)&self->mDynamicVolume, "setSelected:", 0);
  -[TSDAudioRep p_teardownPlayerController](self, "p_teardownPlayerController");
  v3.receiver = self;
  v3.super_class = (Class)TSDAudioRep;
  -[TSDRep becameNotSelected](&v3, sel_becameNotSelected);
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDAudioRep;
  -[TSDRep willBeRemoved](&v3, sel_willBeRemoved);
  objc_msgSend(*(id *)&self->mDynamicVolume, "setSelected:", 0);
  -[TSDAudioRep p_teardownPlayerController](self, "p_teardownPlayerController");
}

- (void)willBeginReadMode
{
  if (-[TSDAudioRep p_isPlaying](self, "p_isPlaying"))
    -[TSKAVPlayerController setPlaying:](-[TSDAudioRep playerController](self, "playerController"), "setPlaying:", 0);
}

- (BOOL)hitPlayPauseButtonWithPoint:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v6 = -[TSDAudioRep p_shouldShowPlayPauseLayers](self, "p_shouldShowPlayPauseLayers");
  if (v6)
  {
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsPoint:", x, y);
    -[TSKAVPlayerController convertPoint:fromLayer:](self->mPlayerController, "convertPoint:fromLayer:", objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasView"), "layer"), v7, v8);
    v10 = v9;
    v12 = v11;
    -[TSKAVPlayerController bounds](self->mPlayerController, "bounds");
    v14.x = v10;
    v14.y = v12;
    LOBYTE(v6) = CGRectContainsPoint(v15, v14);
  }
  return v6;
}

- (void)updatePlayButtonForPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[TSDAudioRep p_shouldShowPlayPauseLayers](self, "p_shouldShowPlayPauseLayers"))
    -[TSDAudioRep p_updateButtonForPlaying:pressed:](self, "p_updateButtonForPlaying:pressed:", -[TSDAudioRep p_isPlaying](self, "p_isPlaying"), -[TSDAudioRep hitPlayPauseButtonWithPoint:](self, "hitPlayPauseButtonWithPoint:", x, y));
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  TSDInteractiveCanvasController *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  objc_super v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v19.receiver = self;
  v19.super_class = (Class)TSDAudioRep;
  v6 = -[TSDRep hitRepChrome:](&v19, sel_hitRepChrome_);
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    v7 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
    objc_msgSend(*(id *)&self->mDynamicVolume, "hudFrame");
    -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](v7, "convertBoundsToUnscaledRect:");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    v20.x = v16;
    v20.y = v17;
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    if (CGRectContainsPoint(v21, v20))
      return self;
  }
  return v6;
}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 0;
}

- (BOOL)p_isPlaying
{
  CGFloat height;

  height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0)
    LOBYTE(height) = objc_msgSend(*(id *)&height, "isPlaying");
  return LOBYTE(height);
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDAudioRep;
  -[TSDMediaRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if (*(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height)
  {
    switch(a3)
    {
      case 532:
        -[TSDAudioRep p_teardownPlayerController](self, "p_teardownPlayerController");
        -[TSDAudioRep p_setupPlayerControllerIfNecessary](self, "p_setupPlayerControllerIfNecessary");
        break;
      case 534:
        -[TSDAudioRep p_updateStartTime](self, "p_updateStartTime");
        break;
      case 535:
        -[TSDAudioRep p_updateEndTime](self, "p_updateEndTime");
        break;
      case 537:
        -[TSDAudioRep p_updateRepeatMode](self, "p_updateRepeatMode");
        break;
      case 538:
        -[TSDAudioRep p_updateVolume](self, "p_updateVolume");
        break;
      default:
        return;
    }
  }
}

- (void)p_updateRepeatMode
{
  objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "setRepeatMode:", TSKPlayerRepeatModeForMovieLoopOption(-[TSDMovieInfo loopOption](-[TSDAudioRep movieInfo](self, "movieInfo"), "loopOption")));
}

- (void)p_updateVolume
{
  -[TSDAudioRep volume](self, "volume");
  objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "setVolume:");
}

- (void)p_updateStartTime
{
  -[TSDMovieInfo startTime](-[TSDAudioRep movieInfo](self, "movieInfo"), "startTime");
  objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "setStartTime:");
}

- (void)p_updateEndTime
{
  -[TSDMovieInfo endTime](-[TSDAudioRep movieInfo](self, "movieInfo"), "endTime");
  objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "setEndTime:");
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)shouldShowDragHUD
{
  return 0;
}

- (BOOL)shouldShowSizesInRulers
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[TSDRep isLocked](self, "isLocked");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDAudioRep;
    LOBYTE(v3) = -[TSDStyledRep shouldShowSelectionHighlight](&v5, sel_shouldShowSelectionHighlight);
  }
  return v3;
}

- (BOOL)p_isEditingAnimations
{
  TSDInteractiveCanvasController *v2;

  v2 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasController isEditingAnimations](v2, "isEditingAnimations");
  else
    return 0;
}

- (BOOL)shouldShowKnobs
{
  return 1;
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;

  -[TSDRep layerFrameInScaledCanvasRelativeToParent](self, "layerFrameInScaledCanvasRelativeToParent");
  v9 = TSDCenterOfRect(v5, v6, v7, v8);
  v11 = TSDRectWithCenterAndSize(v9, v10, 130.0);
  v15 = TSDRoundedRect(v11, v12, v13, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = TSDCenterOfRect(v15, v16, v18, v20);
  v24 = v23;
  objc_msgSend(a3, "position");
  if (v26 != v22 || v25 != v24)
    objc_msgSend(a3, "setPosition:", v22, v24);
  objc_msgSend(a3, "bounds");
  v31.origin.x = v15;
  v31.origin.y = v17;
  v31.size.width = v19;
  v31.size.height = v21;
  if (!CGRectEqualToRect(v30, v31))
    objc_msgSend(a3, "setBounds:", v15, v17, v19, v21);
  if (-[TSDAudioRep p_shouldShowPlayPauseLayers](self, "p_shouldShowPlayPauseLayers"))
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(a3, "position");
    v29 = v28 + 31.0;
    objc_msgSend(a3, "position");
    -[TSKAVPlayerController setPosition:](self->mPlayerController, "setPosition:", v29);
    objc_msgSend(a3, "position");
    -[CALayer setPosition:](self->mPlayPauseButtonLayer, "setPosition:");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (CGRect)boundsForStandardKnobs
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
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)TSDAudioRep;
  -[TSDRep boundsForStandardKnobs](&v16, sel_boundsForStandardKnobs);
  v4 = v3;
  v6 = v5;
  -[TSDCanvas viewScale](self->super.super.super.mCanvas, "viewScale");
  v7 = *(void **)&self->mDynamicVolume;
  v9 = 1.0 / v8;
  if (v7)
  {
    objc_msgSend(v7, "hudFrame");
    v11 = v9 * v10;
    v13 = v9 * v12;
  }
  else
  {
    v11 = v9 * 130.0;
    v13 = v9 * 66.0;
    v4 = v4 + (130.0 - v9 * 130.0) * 0.5;
    v6 = v6 + (66.0 - v9 * 66.0) * 0.5;
  }
  v14 = v4;
  v15 = v6;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)providesGuidesWhileAligning
{
  return 0;
}

- (BOOL)exclusivelyProvidesGuidesWhileAligning
{
  return 1;
}

- (void)willBeginZooming
{
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setDuration:", 0.15);
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4));
  LODWORD(v5) = 0;
  objc_msgSend(v3, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[TSDRep allLayers](self, "allLayers", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        LODWORD(v8) = 0;
        objc_msgSend(v12, "setOpacity:", v8);
        objc_msgSend(v12, "addAnimation:forKey:", v3, CFSTR("fade out"));
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
}

- (void)didEndZooming
{
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setDuration:", 0.15);
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4));
  LODWORD(v5) = 1.0;
  objc_msgSend(v3, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[TSDRep allLayers](self, "allLayers", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        LODWORD(v8) = 1.0;
        objc_msgSend(v12, "setOpacity:", v8);
        objc_msgSend(v12, "addAnimation:forKey:", v3, CFSTR("fade in"));
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  -[TSDRep invalidateKnobPositions](self, "invalidateKnobPositions");
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[TSDAudioRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (id)textureWithContext:(id)a3
{
  return 0;
}

- (void)p_updateButtonForPlaying:(BOOL)a3 pressed:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;

  v4 = a4;
  v5 = a3;
  if (-[TSDAudioRep p_isEditingAnimations](self, "p_isEditingAnimations")
    && -[TSDRep isSelected](self, "isSelected")
    && v5)
  {
    v7 = CFSTR("sf_canvas_audio_animation_pause-N");
    v8 = CFSTR("sf_canvas_audio_animation_pause-P");
    goto LABEL_15;
  }
  if (-[TSDAudioRep p_isEditingAnimations](self, "p_isEditingAnimations")
    && -[TSDRep isSelected](self, "isSelected")
    && !v5)
  {
    v7 = CFSTR("sf_canvas_audio_animation_play-N");
    v8 = CFSTR("sf_canvas_audio_animation_play-P");
    goto LABEL_15;
  }
  if (-[TSDRep isSelected](self, "isSelected") && v5)
  {
    v7 = CFSTR("sf_canvas_audio_selected_pause-N");
    v8 = CFSTR("sf_canvas_audio_selected_pause-P");
    goto LABEL_15;
  }
  if (-[TSDRep isSelected](self, "isSelected") && !v5)
  {
    v7 = CFSTR("sf_canvas_audio_selected_play-N");
    v8 = CFSTR("sf_canvas_audio_selected_play-P");
LABEL_15:
    if (v4)
      v9 = v8;
    else
      v9 = v7;
    goto LABEL_18;
  }
  v10 = CFSTR("sf_canvas_audio_play-N");
  if (v4)
    v10 = CFSTR("sf_canvas_audio_play-P");
  v11 = CFSTR("sf_canvas_audio_pause-P");
  if (!v4)
    v11 = CFSTR("sf_canvas_audio_pause-N");
  if (v5)
    v9 = v11;
  else
    v9 = v10;
LABEL_18:
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CALayer setContents:](self->mPlayPauseButtonLayer, "setContents:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", v9, TSDBundle()), "CGImage"));
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (float)volume
{
  float result;

  if (BYTE4(self->mAudioImageLayer))
    return *(float *)&self->mAudioImageLayer;
  -[TSDMovieInfo volume](-[TSDAudioRep movieInfo](self, "movieInfo"), "volume");
  return result;
}

- (void)dynamicVolumeChangeDidBegin
{
  int v3;

  -[TSDAudioRep volume](self, "volume");
  LODWORD(self->mAudioImageLayer) = v3;
  BYTE4(self->mAudioImageLayer) = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  *(float *)&self->mAudioImageLayer = a3;
  -[TSDAudioRep p_updateVolume](self, "p_updateVolume");
}

- (void)dynamicVolumeChangeDidEnd
{
  BYTE4(self->mAudioImageLayer) = 0;
}

- (BOOL)p_shouldPlayerControllerExistThroughoutSelection
{
  return 0;
}

- (void)p_setupPlayerControllerIfNecessary
{
  id v3;
  double v4;

  if (!*(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height)
  {
    v3 = objc_alloc(MEMORY[0x24BDB2610]);
    *(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height = -[TSKAVPlayerController initWithPlayer:delegate:]([TSKAVPlayerController alloc], "initWithPlayer:delegate:", (id)objc_msgSend(v3, "initWithPlayerItem:", objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", -[TSDMovieInfo makeAVAsset](-[TSDAudioRep movieInfo](self, "movieInfo"), "makeAVAsset"))), self);
    -[TSDAudioRep p_updateStartTime](self, "p_updateStartTime");
    -[TSDMovieInfo endTime](-[TSDAudioRep movieInfo](self, "movieInfo"), "endTime");
    if (v4 != 0.0)
      -[TSDAudioRep p_updateEndTime](self, "p_updateEndTime");
    -[TSDAudioRep p_updateRepeatMode](self, "p_updateRepeatMode");
    -[TSDAudioRep p_updateVolume](self, "p_updateVolume");
    objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "addObserver:forKeyPath:options:context:", self, CFSTR("playing"), 4, TSDAudioRepPlayerControllerPlayingObserverContext);
    objc_msgSend(*(id *)&self->mDynamicVolume, "setPlayerController:", *(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height);
  }
}

- (void)p_teardownPlayerController
{
  CGFloat height;

  height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0)
  {
    if (objc_msgSend(*(id *)&height, "isPlaying"))
      objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "setPlaying:", 0);
    objc_msgSend(*(id *)&self->mDynamicVolume, "setPlayerController:", 0);
    objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "removeObserver:forKeyPath:", self, CFSTR("playing"));
    objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "teardown");

    self->super.mLastPictureFrameLayerRect.size.height = 0.0;
  }
}

- (TSKAVPlayerController)playerController
{
  -[TSDAudioRep p_setupPlayerControllerIfNecessary](self, "p_setupPlayerControllerIfNecessary");
  return *(TSKAVPlayerController **)&self->super.mLastPictureFrameLayerRect.size.height;
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  -[TSDInteractiveCanvasController presentError:completionHandler:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController", a3), "presentError:completionHandler:", a4, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)TSDAudioRepPlayerControllerPlayingObserverContext == a6)
  {
    if (-[TSKAVPlayerController isPlaying](-[TSDAudioRep playerController](self, "playerController", a3, a4, a5), "isPlaying")&& !-[TSDRep isSelected](self, "isSelected"))
    {
      -[TSDCanvasEditor setSelectionToRep:](-[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor"), "setSelectionToRep:", self);
    }
    if (-[TSDAudioRep p_shouldShowPlayPauseLayers](self, "p_shouldShowPlayPauseLayers"))
      -[TSDAudioRep p_updateButtonForPlaying:pressed:](self, "p_updateButtonForPlaying:pressed:", -[TSKAVPlayerController isPlaying](-[TSDAudioRep playerController](self, "playerController"), "isPlaying"), 0);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDAudioRep;
    -[TSDAudioRep observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (TSDAudioHUDController)audioHUDController
{
  return *(TSDAudioHUDController **)&self->mDynamicVolume;
}

@end
