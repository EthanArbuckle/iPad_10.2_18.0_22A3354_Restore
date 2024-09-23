@implementation _UIFluidSliderFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIFluidSliderFeedbackGenerator)initWithView:(id)a3
{
  id v4;
  void *v5;
  _UIFluidSliderFeedbackGenerator *v6;
  objc_super v8;

  v4 = a3;
  +[_UIFluidSliderFeedbackConfiguration defaultConfiguration](_UIFluidSliderFeedbackConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_UIFluidSliderFeedbackGenerator;
  v6 = -[UIFeedbackGenerator initWithConfiguration:view:](&v8, sel_initWithConfiguration_view_, v5, v4);

  return v6;
}

- (BOOL)playFeedback:(int64_t)a3 forValue:(double)a4 atLocation:(CGPoint)a5
{
  double y;
  double x;
  void *v8;
  uint64_t v9;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;

  y = a5.y;
  x = a5.x;
  switch(a3)
  {
    case 0:
      -[_UIFluidSliderFeedbackGenerator _sliderConfig](self, "_sliderConfig", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minEdgeFeedback");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      if (!-[_UIFluidSliderFeedbackGenerator _canPlayDetentOnCurrentDevice](self, "_canPlayDetentOnCurrentDevice"))
        return 1;
      -[_UIFluidSliderFeedbackGenerator _sliderConfig](self, "_sliderConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "detentFeedback");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = a4 * 0.5 + (1.0 - a4) * 0.15;
      objc_msgSend(v13, "hapticParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v15 = v14;
      objc_msgSend(v8, "setVolume:", v15);
LABEL_10:

      if (!v13)
        return 1;
      -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v13, x, y);
      goto LABEL_12;
    case 2:
      if (!self)
        return 0;
      -[_UIFluidSliderFeedbackGenerator _sliderConfig](self, "_sliderConfig", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectionFeedback");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFeedbackGenerator _playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:](self, "_playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:", v16, &_playSelectionFeedbackAtLocation____lastTime, 1, 0.04, x, y);

LABEL_12:
      return 1;
    case 3:
      -[_UIFluidSliderFeedbackGenerator _sliderConfig](self, "_sliderConfig", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "maxEdgeFeedback");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = (void *)v9;
      goto LABEL_10;
    default:
      return 1;
  }
}

- (BOOL)_canPlayDetentOnCurrentDevice
{
  return MGIsDeviceOneOfType() ^ 1;
}

@end
