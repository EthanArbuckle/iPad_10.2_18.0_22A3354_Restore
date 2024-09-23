@implementation TKVibrationRecorderProgressDotImageView

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[TKVibrationRecorderProgressDotImageView accessibilityValue](self, "accessibilityValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  return (id)TLLocalizedString();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  TLLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("VIBRATION_RECORDER_PROGRESS_DOT_VALUE_FORMAT"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[TKVibrationRecorderProgressDotImageView timeInterval](self, "timeInterval");
    +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderProgressDotImageView duration](self, "duration");
    +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v3, v5, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderProgressDotImageView previousPauseTimeInterval](self, "previousPauseTimeInterval");
    if (v7 > 0.0)
    {
      v8 = v7;
      TLLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(CFSTR("VIBRATION_RECORDER_PROGRESS_DOT_PREVIOUS_PAUSE_FORMAT"), "isEqualToString:", v9) & 1) == 0)
      {
        +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKVibrationRecorderProgressDotImageView previousPauseDuration](self, "previousPauseDuration");
        +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v4, v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v13;
      }

    }
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  objc_super v5;
  CGRect v6;

  -[TKVibrationRecorderProgressDotImageView accessibilityFrameAdditionalHeight](self, "accessibilityFrameAdditionalHeight");
  v4 = v3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderProgressDotImageView;
  -[TKVibrationRecorderProgressDotImageView accessibilityFrame](&v5, sel_accessibilityFrame);
  return CGRectInset(v6, 0.0, v4 * -0.5);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderProgressDotImageView;
  return -[TKVibrationRecorderProgressDotImageView accessibilityTraits](&v3, sel_accessibilityTraits) & ~*MEMORY[0x24BDF73C8];
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)previousPauseTimeInterval
{
  return self->_previousPauseTimeInterval;
}

- (void)setPreviousPauseTimeInterval:(double)a3
{
  self->_previousPauseTimeInterval = a3;
}

- (double)previousPauseDuration
{
  return self->_previousPauseDuration;
}

- (void)setPreviousPauseDuration:(double)a3
{
  self->_previousPauseDuration = a3;
}

- (double)accessibilityFrameAdditionalHeight
{
  return self->_accessibilityFrameAdditionalHeight;
}

- (void)setAccessibilityFrameAdditionalHeight:(double)a3
{
  self->_accessibilityFrameAdditionalHeight = a3;
}

@end
