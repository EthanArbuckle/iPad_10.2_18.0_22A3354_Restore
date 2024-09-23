@implementation _UILegibilitySettingsProvider

- (id)settings
{
  return -[_UILegibilitySettings initWithStyle:contentColor:]([_UILegibilitySettings alloc], "initWithStyle:contentColor:", -[_UILegibilitySettingsProvider currentStyle](self, "currentStyle"), -[_UILegibilitySettingsProvider contentColor](self, "contentColor"));
}

- (int64_t)currentStyle
{
  return self->_currentStyle;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)clearContentColorAccumulator
{
  -[_UILegibilitySettingsProvider setAccumulatorIsPrimed:](self, "setAccumulatorIsPrimed:", 0);
  -[_UILegibilitySettingsProvider setAccumulatedBrightness:](self, "setAccumulatedBrightness:", 0.0);
  -[_UILegibilitySettingsProvider setAccumulatedLuminance:](self, "setAccumulatedLuminance:", 0.0);
  -[_UILegibilitySettingsProvider setAccumulatedSaturation:](self, "setAccumulatedSaturation:", 0.0);
  -[_UILegibilitySettingsProvider setAccumulatedContrast:](self, "setAccumulatedContrast:", 0.0);
  -[_UILegibilitySettingsProvider setHasContrast:](self, "setHasContrast:", 0);
  -[_UILegibilitySettingsProvider setContentColor:](self, "setContentColor:", 0);
  -[_UILegibilitySettingsProvider setNextChangeBarrier:](self, "setNextChangeBarrier:", 0.0);
}

- (void)setAccumulatorIsPrimed:(BOOL)a3
{
  self->_accumulatorIsPrimed = a3;
}

- (BOOL)accumulateChangesToContentColor:(id)a3 contrast:(double)a4
{
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  double v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  -[_UILegibilitySettingsProvider setContentColor:](self, "setContentColor:");
  if (CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(a3, "CGColor")) == 2)
  {
    v46 = 0.0;
    v7 = objc_msgSend(a3, "getWhite:alpha:", &v46, 0);
    v8 = 0.0;
    if (v7)
      v9 = v46;
    else
      v9 = 0.0;
    v10 = v9;
  }
  else
  {
    v45 = 0.0;
    v46 = 0.0;
    v44 = 0.0;
    v10 = 0.0;
    if (objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v46, &v45, &v44, 0))
    {
      v9 = v44;
      v8 = v45;
      v11 = v46;
      v12 = v45 > 0.00000011920929 || v46 > 0.00000011920929;
      v7 = v44 > 0.00000011920929 || v12;
    }
    else
    {
      v7 = 0;
      v9 = 0.0;
      v8 = 0.0;
    }
    v42 = 0.0;
    v43 = 0.0;
    v41 = 0.0;
    if (objc_msgSend(a3, "getRed:green:blue:alpha:", &v43, &v42, &v41, 0, v11))
    {
      v10 = v43 * 0.2126 + v42 * 0.7152 + v41 * 0.0722;
      v13 = v43 > 0.00000011920929;
      if (v42 > 0.00000011920929)
        v13 = 1;
      if (v41 > 0.00000011920929)
        v13 = 1;
      v7 |= v13;
    }
  }
  -[_UILegibilitySettingsProvider setMostRecentBrightness:](self, "setMostRecentBrightness:", v9);
  -[_UILegibilitySettingsProvider setMostRecentContrast:](self, "setMostRecentContrast:", a4);
  -[_UILegibilitySettingsProvider setMostRecentLuminance:](self, "setMostRecentLuminance:", v10);
  -[_UILegibilitySettingsProvider setMostRecentSaturation:](self, "setMostRecentSaturation:", v8);
  v14 = CACurrentMediaTime();
  v15 = -1.0;
  if (a4 == -1.0 || (v16 = -[_UILegibilitySettingsProvider hasContrast](self, "hasContrast"), v15 = a4, !v16))
    -[_UILegibilitySettingsProvider setAccumulatedContrast:](self, "setAccumulatedContrast:", v15);
  v17 = -1.0;
  -[_UILegibilitySettingsProvider setHasContrast:](self, "setHasContrast:", a4 != -1.0, v15);
  if (-[_UILegibilitySettingsProvider accumulatorIsPrimed](self, "accumulatorIsPrimed"))
  {
    -[_UILegibilitySettingsProvider accumulatedBrightness](self, "accumulatedBrightness");
    -[_UILegibilitySettingsProvider setAccumulatedBrightness:](self, "setAccumulatedBrightness:", v9 * 0.4 + v18 * 0.6);
    if (-[_UILegibilitySettingsProvider hasContrast](self, "hasContrast"))
    {
      -[_UILegibilitySettingsProvider accumulatedContrast](self, "accumulatedContrast");
      v17 = a4 * 0.4 + v19 * 0.6;
    }
    -[_UILegibilitySettingsProvider setAccumulatedContrast:](self, "setAccumulatedContrast:", v17);
    -[_UILegibilitySettingsProvider accumulatedLuminance](self, "accumulatedLuminance");
    -[_UILegibilitySettingsProvider setAccumulatedLuminance:](self, "setAccumulatedLuminance:", v10 * 0.4 + v20 * 0.6);
    -[_UILegibilitySettingsProvider accumulatedSaturation](self, "accumulatedSaturation");
    -[_UILegibilitySettingsProvider setAccumulatedSaturation:](self, "setAccumulatedSaturation:", v8 * 0.4 + v21 * 0.6);
    -[_UILegibilitySettingsProvider accumulatedBrightness](self, "accumulatedBrightness");
    v23 = v22;
    -[_UILegibilitySettingsProvider accumulatedContrast](self, "accumulatedContrast");
    v25 = v24;
    -[_UILegibilitySettingsProvider accumulatedLuminance](self, "accumulatedLuminance");
    v27 = v26;
    -[_UILegibilitySettingsProvider accumulatedSaturation](self, "accumulatedSaturation");
    v29 = v25 != -1.0;
    if (v25 >= 0.09)
      v29 = 0;
    if (v23 <= 0.8)
      v29 = 0;
    v30 = 2;
    if (v27 <= 0.86 && !v29)
    {
      if (v28 >= 0.1 || v23 + 0.1 - v28 + 0.1 - v28 <= 0.92)
        v30 = 1;
      else
        v30 = 2;
    }
    if (-[_UILegibilitySettingsProvider currentStyle](self, "currentStyle") == v30)
      return 0;
    -[_UILegibilitySettingsProvider nextChangeBarrier](self, "nextChangeBarrier");
    if (v14 - v39 <= 0.0)
      return 0;
  }
  else
  {
    -[_UILegibilitySettingsProvider setAccumulatedBrightness:](self, "setAccumulatedBrightness:", v9);
    -[_UILegibilitySettingsProvider setAccumulatedLuminance:](self, "setAccumulatedLuminance:", v10);
    -[_UILegibilitySettingsProvider setAccumulatedSaturation:](self, "setAccumulatedSaturation:", v8);
    if (v7)
      -[_UILegibilitySettingsProvider setAccumulatorIsPrimed:](self, "setAccumulatorIsPrimed:", 1);
    -[_UILegibilitySettingsProvider accumulatedBrightness](self, "accumulatedBrightness");
    v32 = v31;
    -[_UILegibilitySettingsProvider accumulatedContrast](self, "accumulatedContrast");
    v34 = v33;
    -[_UILegibilitySettingsProvider accumulatedLuminance](self, "accumulatedLuminance");
    v36 = v35;
    -[_UILegibilitySettingsProvider accumulatedSaturation](self, "accumulatedSaturation");
    v38 = v34 != -1.0;
    if (v34 >= 0.09)
      v38 = 0;
    if (v32 <= 0.8)
      v38 = 0;
    v30 = 2;
    if (v36 <= 0.86 && !v38)
    {
      if (v37 >= 0.1 || v32 + 0.1 - v37 + 0.1 - v37 <= 0.92)
        v30 = 1;
      else
        v30 = 2;
    }
  }
  -[_UILegibilitySettingsProvider setCurrentStyle:](self, "setCurrentStyle:", v30);
  -[_UILegibilitySettingsProvider setNextChangeBarrier:](self, "setNextChangeBarrier:", v14 + 0.75);
  return 1;
}

- (void)setNextChangeBarrier:(double)a3
{
  self->_nextChangeBarrier = a3;
}

- (void)setHasContrast:(BOOL)a3
{
  self->_hasContrast = a3;
}

- (void)setContentColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setAccumulatedSaturation:(double)a3
{
  self->_accumulatedSaturation = a3;
}

- (void)setAccumulatedLuminance:(double)a3
{
  self->_accumulatedLuminance = a3;
}

- (void)setAccumulatedContrast:(double)a3
{
  self->_accumulatedContrast = a3;
}

- (void)setAccumulatedBrightness:(double)a3
{
  self->_accumulatedBrightness = a3;
}

- (void)setMostRecentSaturation:(double)a3
{
  self->_mostRecentSaturation = a3;
}

- (void)setMostRecentLuminance:(double)a3
{
  self->_mostRecentLuminance = a3;
}

- (void)setMostRecentContrast:(double)a3
{
  self->_mostRecentContrast = a3;
}

- (void)setMostRecentBrightness:(double)a3
{
  self->_mostRecentBrightness = a3;
}

- (void)setCurrentStyle:(int64_t)a3
{
  self->_currentStyle = a3;
}

- (BOOL)accumulatorIsPrimed
{
  return self->_accumulatorIsPrimed;
}

- (double)accumulatedSaturation
{
  return self->_accumulatedSaturation;
}

- (double)accumulatedLuminance
{
  return self->_accumulatedLuminance;
}

- (double)accumulatedContrast
{
  return self->_accumulatedContrast;
}

- (double)accumulatedBrightness
{
  return self->_accumulatedBrightness;
}

+ (int64_t)styleForContentColor:(id)a3
{
  return objc_msgSend(a1, "styleForContentColor:contrast:", a3, -1.0);
}

+ (int64_t)styleForContentColor:(id)a3 contrast:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;
  int64_t result;

  if (_MergedGlobals_10 != -1)
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_282);
  objc_msgSend((id)qword_1ECD78B10, "clearContentColorAccumulator");
  objc_msgSend((id)qword_1ECD78B10, "accumulateChangesToContentColor:contrast:", a3, a4);
  objc_msgSend((id)qword_1ECD78B10, "accumulatedBrightness");
  v7 = v6;
  objc_msgSend((id)qword_1ECD78B10, "accumulatedLuminance");
  v9 = v8;
  objc_msgSend((id)qword_1ECD78B10, "accumulatedSaturation");
  v12 = v7 <= 0.8 || a4 >= 0.09 || a4 == -1.0;
  result = 2;
  if (v12 && v9 <= 0.86)
  {
    if (v10 >= 0.1 || v7 + 0.1 - v10 + 0.1 - v10 <= 0.92)
      return 1;
    else
      return 2;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_contentColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilitySettingsProvider;
  -[_UILegibilitySettingsProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)accumulateChangesToContentColor:(id)a3
{
  return -[_UILegibilitySettingsProvider accumulateChangesToContentColor:contrast:](self, "accumulateChangesToContentColor:contrast:", a3, -1.0);
}

- (double)mostRecentSaturation
{
  return self->_mostRecentSaturation;
}

- (double)mostRecentBrightness
{
  return self->_mostRecentBrightness;
}

- (double)mostRecentContrast
{
  return self->_mostRecentContrast;
}

- (double)mostRecentLuminance
{
  return self->_mostRecentLuminance;
}

- (BOOL)hasContrast
{
  return self->_hasContrast;
}

- (double)nextChangeBarrier
{
  return self->_nextChangeBarrier;
}

@end
