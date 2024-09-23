@implementation SUICDictationWaveView

- (SUICDictationWaveView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SUICDictationWaveView *v7;
  SUICDictationWaveView *v8;
  SUICAudioLevelSmoother *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  SUICAudioLevelSmoother *smoother;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)SUICDictationWaveView;
  v7 = -[SUICDictationWaveView initWithFrame:](&v17, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_cachedFrame.origin.x = x;
    v7->_cachedFrame.origin.y = y;
    v7->_cachedFrame.size.width = width;
    v7->_cachedFrame.size.height = height;
    v9 = [SUICAudioLevelSmoother alloc];
    LODWORD(v10) = -1032847360;
    LODWORD(v11) = 1051931443;
    LODWORD(v12) = 1063675494;
    LODWORD(v13) = -10.0;
    v14 = -[SUICAudioLevelSmoother initWithMinimumPower:maximumPower:historyLength:attackSpeed:decaySpeed:](v9, "initWithMinimumPower:maximumPower:historyLength:attackSpeed:decaySpeed:", 5, v10, v13, v11, v12);
    smoother = v8->_smoother;
    v8->_smoother = (SUICAudioLevelSmoother *)v14;

    v8->_initialOffset = (float)((float)((float)rand() * 4.6566e-10) * 600.0) + -300.0;
    -[SUICDictationWaveView _resetPips](v8, "_resetPips");
  }
  return v8;
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
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)SUICDictationWaveView;
  -[SUICDictationWaveView layoutSubviews](&v11, sel_layoutSubviews);
  -[SUICDictationWaveView frame](self, "frame");
  v12.origin.x = v3;
  v12.origin.y = v4;
  v12.size.width = v5;
  v12.size.height = v6;
  if (!CGRectEqualToRect(self->_cachedFrame, v12))
  {
    -[SUICDictationWaveView frame](self, "frame");
    self->_cachedFrame.origin.x = v7;
    self->_cachedFrame.origin.y = v8;
    self->_cachedFrame.size.width = v9;
    self->_cachedFrame.size.height = v10;
    -[SUICDictationWaveView _resetPips](self, "_resetPips");
    -[SUICDictationWaveView _showPipsWithoutIntroAnimation](self, "_showPipsWithoutIntroAnimation");
  }
}

- (void)_showPipsWithoutIntroAnimation
{
  NSMutableArray *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_pipLayers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v2);
        LODWORD(v4) = 1.0;
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setOpacity:", v4, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updatePipColor
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_pipLayers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setBackgroundColor:", -[UIColor CGColor](self->_pipColor, "CGColor", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_resetPips
{
  -[SUICDictationWaveView _removeAllPips](self, "_removeAllPips");
  -[SUICDictationWaveView _addNewPips](self, "_addNewPips");
}

- (void)_removeAllPips
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_pipLayers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeFromSuperlayer", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_addNewPips
{
  NSMutableArray *v3;
  NSMutableArray *pipLayers;
  unint64_t v5;
  void *v6;
  double v7;
  void *v8;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pipLayers = self->_pipLayers;
  self->_pipLayers = v3;

  if (-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = 0;
      objc_msgSend(v6, "setOpacity:", v7);
      objc_msgSend(v6, "setBackgroundColor:", -[UIColor CGColor](self->_pipColor, "CGColor"));
      -[SUICDictationWaveView _startingFrameForPipAtIndex:](self, "_startingFrameForPipAtIndex:", v5);
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[SUICDictationWaveView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSublayer:", v6);

      -[NSMutableArray addObject:](self->_pipLayers, "addObject:", v6);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      ++v5;
    }
    while (-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") > v5);
  }
}

- (void)_startIntroAnimation
{
  self->_numberOfFrames = 0.0;
}

- (double)_intervalForEachPipAnimation
{
  return (float)(0.25 / (float)(-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") >> 1));
}

- (void)_animateInPipsBetweenLeftIndex:(unint64_t)a3 rightIndex:(unint64_t)a4
{
  unint64_t v7;
  void *v8;
  double v9;

  if (a3 <= a4 && -[NSMutableArray count](self->_pipLayers, "count") > a4)
  {
    v7 = a3;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_pipLayers, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      LODWORD(v9) = 1.0;
      objc_msgSend(v8, "setOpacity:", v9);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      ++v7;
    }
    while (v7 <= a4);
    -[SUICDictationWaveView _heightForIntroAnimationPips](self, "_heightForIntroAnimationPips");
    -[SUICDictationWaveView _updatePipHeightAtIndex:withHeight:](self, "_updatePipHeightAtIndex:withHeight:", a3);
    -[SUICDictationWaveView _heightForIntroAnimationPips](self, "_heightForIntroAnimationPips");
    -[SUICDictationWaveView _updatePipHeightAtIndex:withHeight:](self, "_updatePipHeightAtIndex:withHeight:", a4);
  }
}

- (void)_introAnimationTick
{
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (float)(self->_numberOfFrames / self->_framesPerSecond);
  -[SUICDictationWaveView _intervalForEachPipAnimation](self, "_intervalForEachPipAnimation");
  *(float *)&v4 = v3 / v4;
  v5 = vcvtms_u32_f32(*(float *)&v4);
  v6 = -[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") >> 1;
  if (v6 >= v5)
    -[SUICDictationWaveView _animateInPipsBetweenLeftIndex:rightIndex:](self, "_animateInPipsBetweenLeftIndex:rightIndex:", v6 - v5, v6 + v5 + (-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") & 1) - 1);
}

- (void)_updatePipHeightAtIndex:(unint64_t)a3 withHeight:(double)a4
{
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  id v12;
  CGRect v13;

  if (-[NSMutableArray count](self->_pipLayers, "count") > a3)
  {
    -[NSMutableArray objectAtIndex:](self->_pipLayers, "objectAtIndex:", a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[SUICDictationWaveView _originXForPipAtIndex:](self, "_originXForPipAtIndex:", a3);
    v8 = v7;
    -[SUICDictationWaveView frame](self, "frame");
    v9 = (CGRectGetHeight(v13) - a4) * 0.5;
    -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
    objc_msgSend(v12, "setCornerRadius:", v10 * 0.5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
    objc_msgSend(v12, "setFrame:", v8, v9, v11, a4);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (void)_updatePipHeights
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (-[NSMutableArray count](self->_pipLayers, "count"))
  {
    v3 = 0;
    do
    {
      -[SUICDictationWaveView _maximumPipHeight](self, "_maximumPipHeight");
      v5 = v4;
      -[SUICDictationWaveView _minimumPipHeight](self, "_minimumPipHeight");
      v7 = v5 - v6;
      -[SUICDictationWaveView _heightMultiplierForPipIndex:](self, "_heightMultiplierForPipIndex:", v3);
      v9 = v7 * v8;
      -[SUICDictationWaveView _minimumPipHeight](self, "_minimumPipHeight");
      v11 = v10 + v9;
      -[SUICDictationWaveView _minimumPipHeight](self, "_minimumPipHeight");
      if (v12 >= v11)
        v11 = v12;
      -[SUICDictationWaveView _maximumPipHeight](self, "_maximumPipHeight");
      if (v13 >= v11)
        v13 = v11;
      -[SUICDictationWaveView _updatePipHeightAtIndex:withHeight:](self, "_updatePipHeightAtIndex:withHeight:", v3++, v13);
    }
    while (-[NSMutableArray count](self->_pipLayers, "count") > v3);
  }
}

- (void)setPipColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_pipColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pipColor, a3);
    -[SUICDictationWaveView _updatePipColor](self, "_updatePipColor");
    v5 = v6;
  }

}

- (void)setPowerLevel:(float)a3
{
  float v4;
  double v5;
  float v6;
  float v7;

  if (a3 < -96.0)
    a3 = -96.0;
  v4 = fminf(a3, 0.0);
  *(float *)&v5 = v4;
  -[SUICAudioLevelSmoother smoothedLevelForMicPower:](self->_smoother, "smoothedLevelForMicPower:", v5);
  v7 = (float)(v6 * 0.95) + 0.05;
  if (self->_linearPowerLevel != v7)
  {
    self->_linearPowerLevel = v7;
    self->_powerLevel = v4;
  }
}

- (void)setAudioPowerLevelDataSource:(id)a3
{
  SUICAudioPowerLevelDataSource *v5;
  void *v6;
  void *v7;
  CADisplayLink *v8;
  CADisplayLink *v9;
  CADisplayLink *v10;
  CADisplayLink *displayLink;
  CADisplayLink *v12;
  CADisplayLink *v13;
  CADisplayLink *v14;
  void *v15;
  SUICAudioPowerLevelDataSource *v16;

  v5 = (SUICAudioPowerLevelDataSource *)a3;
  if (self->_audioPowerLevelDataSource != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_audioPowerLevelDataSource, a3);
    if (self->_audioPowerLevelDataSource)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "_carScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v8 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      self->_framesPerSecond = (float)-[CADisplayLink maximumFramesPerSecond](v9, "maximumFramesPerSecond");
      -[CADisplayLink displayLinkWithTarget:selector:](v9, "displayLinkWithTarget:selector:", self, sel__tick_);
      v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v10;

      v12 = self->_displayLink;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__tick_);
        v13 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
        v14 = self->_displayLink;
        self->_displayLink = v13;

        v12 = self->_displayLink;
      }
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0C99748]);

    }
    else
    {
      -[CADisplayLink invalidate](self->_displayLink, "invalidate");
      v9 = self->_displayLink;
      self->_displayLink = 0;
    }

    v5 = v16;
  }

}

- (void)_tick:(id)a3
{
  self->_numberOfFrames = self->_numberOfFrames + 1.0;
  self->_runningVolumeSum = self->_linearPowerLevel + self->_runningVolumeSum;
  -[SUICAudioPowerLevelDataSource audioPowerLevel](self->_audioPowerLevelDataSource, "audioPowerLevel", a3);
  -[SUICDictationWaveView setPowerLevel:](self, "setPowerLevel:");
  -[SUICDictationWaveView _updatePipHeights](self, "_updatePipHeights");
  -[SUICDictationWaveView _introAnimationTick](self, "_introAnimationTick");
}

- (float)_noiseForPipIndex:(unint64_t)a3
{
  float v3;

  -[SUICDictationWaveView _numberOfPips](self, "_numberOfPips");
  noise2();
  return fabsf(v3) / 0.707;
}

- (float)_smoothStepTaperForPipIndex:(unint64_t)a3
{
  float v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  float v13;

  v4 = (float)a3;
  *(float *)&v5 = (float)a3 / (float)(-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") - 1);
  LODWORD(v6) = -1102263091;
  LODWORD(v7) = 1050253722;
  -[SUICDictationWaveView _smoothStepWithLowerBound:upperBound:innerValue:](self, "_smoothStepWithLowerBound:upperBound:innerValue:", v6, v7, v5);
  v9 = v8;
  *(float *)&v10 = v4 / (float)(-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") - 1);
  LODWORD(v11) = 1060320051;
  LODWORD(v12) = 1067030938;
  -[SUICDictationWaveView _smoothStepWithLowerBound:upperBound:innerValue:](self, "_smoothStepWithLowerBound:upperBound:innerValue:", v11, v12, v10);
  return v9 - v13;
}

- (float)_smoothStepWithLowerBound:(float)a3 upperBound:(float)a4 innerValue:(float)a5
{
  float v5;
  float v6;

  v5 = (float)(a5 - a3) / (float)(a4 - a3);
  if (v5 < 0.0)
    v5 = 0.0;
  v6 = fminf(v5, 1.0);
  return (float)(v6 * v6) * (float)((float)(v6 * -2.0) + 3.0);
}

- (float)_sinusoidalTaperForPipIndex:(unint64_t)a3
{
  float v3;

  v3 = (float)((float)a3 / (float)(-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") - 1))
     * 3.14159265
     * 0.800000012
     + 0.314159244;
  return sinf(v3);
}

- (float)_heightMultiplierForPipIndex:(unint64_t)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;

  -[SUICDictationWaveView _noiseForPipIndex:](self, "_noiseForPipIndex:");
  v6 = v5;
  -[SUICDictationWaveView _sinusoidalTaperForPipIndex:](self, "_sinusoidalTaperForPipIndex:", a3);
  v8 = v7;
  -[SUICDictationWaveView _smoothStepTaperForPipIndex:](self, "_smoothStepTaperForPipIndex:", a3);
  v10 = (float)(v8 * v9) * (float)(v6 * self->_linearPowerLevel);
  if (v10 < 0.0)
    v10 = 0.0;
  return fminf(v10, 1.0);
}

- (unint64_t)_numberOfPips
{
  double Width;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  -[SUICDictationWaveView frame](self, "frame");
  Width = CGRectGetWidth(v8);
  -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
  v5 = Width - v4;
  -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
  return vcvtmd_u64_f64(v5 / (v6 + v6));
}

- (double)_pipWidth
{
  return 2.0;
}

- (double)_maximumPipHeight
{
  CGRect v3;

  -[SUICDictationWaveView frame](self, "frame");
  return CGRectGetHeight(v3) + -20.0;
}

- (double)_leftMargin
{
  double Width;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  -[SUICDictationWaveView frame](self, "frame");
  Width = CGRectGetWidth(v8);
  -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
  v5 = Width + v4 * (double)-[SUICDictationWaveView _numberOfPips](self, "_numberOfPips") * -2.0;
  -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
  return floor((v6 + v5) * 0.5);
}

- (double)_originXForPipAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[SUICDictationWaveView _leftMargin](self, "_leftMargin");
  v6 = v5;
  -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
  return v6 + (v7 + v7) * (double)a3;
}

- (CGRect)_startingFrameForPipAtIndex:(unint64_t)a3
{
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
  CGRect v15;
  CGRect result;

  -[SUICDictationWaveView _pipWidth](self, "_pipWidth");
  v6 = v5;
  -[SUICDictationWaveView _minimumPipHeight](self, "_minimumPipHeight");
  v8 = v7;
  -[SUICDictationWaveView _originXForPipAtIndex:](self, "_originXForPipAtIndex:", a3);
  v10 = v9;
  -[SUICDictationWaveView frame](self, "frame");
  v11 = (CGRectGetHeight(v15) - v8) * 0.5;
  v12 = v10;
  v13 = v6;
  v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (double)_heightForIntroAnimationPips
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[SUICDictationWaveView _smoothStepTaperForPipIndex:](self, "_smoothStepTaperForPipIndex:", 0);
  v4 = v3;
  -[SUICDictationWaveView _sinusoidalTaperForPipIndex:](self, "_sinusoidalTaperForPipIndex:", 0);
  v6 = v4 * v5;
  -[SUICDictationWaveView _maximumPipHeight](self, "_maximumPipHeight");
  v8 = v7;
  -[SUICDictationWaveView _minimumPipHeight](self, "_minimumPipHeight");
  v10 = (v8 - v9) * v6;
  -[SUICDictationWaveView _minimumPipHeight](self, "_minimumPipHeight");
  return v11 + v10;
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipLayers, 0);
  objc_storeStrong((id *)&self->_smoother, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_audioPowerLevelDataSource, 0);
  objc_storeStrong((id *)&self->_pipColor, 0);
}

@end
