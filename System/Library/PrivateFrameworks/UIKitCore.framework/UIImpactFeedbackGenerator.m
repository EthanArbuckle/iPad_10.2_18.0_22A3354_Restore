@implementation UIImpactFeedbackGenerator

- (UIImpactFeedbackGenerator)initWithStyle:(UIImpactFeedbackStyle)style
{
  return -[UIImpactFeedbackGenerator initWithStyle:view:](self, "initWithStyle:view:", style, 0);
}

- (void)impactOccurred
{
  -[UIImpactFeedbackGenerator __impactOccurredWithIntensity:atLocation:](self, 1.0);
}

- (id)_stats_key
{
  return CFSTR("impact");
}

- (UIImpactFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  UIImpactFeedbackGenerator *v9;
  UIImpactFeedbackGenerator *v10;
  objc_super v12;

  v6 = a4;
  switch(a3)
  {
    case 0:
      +[_UIImpactFeedbackGeneratorConfiguration lightConfiguration](_UIImpactFeedbackGeneratorConfiguration, "lightConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      +[_UIImpactFeedbackGeneratorConfiguration defaultConfiguration](_UIImpactFeedbackGeneratorConfiguration, "defaultConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      +[_UIImpactFeedbackGeneratorConfiguration strongConfiguration](_UIImpactFeedbackGeneratorConfiguration, "strongConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      +[_UIImpactFeedbackGeneratorConfiguration softConfiguration](_UIImpactFeedbackGeneratorConfiguration, "softConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      +[_UIImpactFeedbackGeneratorConfiguration rigidConfiguration](_UIImpactFeedbackGeneratorConfiguration, "rigidConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIImpactFeedbackGenerator;
  v9 = -[UIFeedbackGenerator initWithConfiguration:view:](&v12, sel_initWithConfiguration_view_, v8, v6);
  v10 = v9;
  if (v9)
    v9->_style = a3;

  return v10;
}

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (UIImpactFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  void *v6;
  UIImpactFeedbackGenerator *v7;

  _viewFromCoordinateSpace(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIImpactFeedbackGenerator initWithStyle:view:](self, "initWithStyle:view:", a3, v6);

  return v7;
}

+ (UIImpactFeedbackGenerator)feedbackGeneratorWithStyle:(int64_t)a3 forView:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:view:", a3, v6);

  return (UIImpactFeedbackGenerator *)v7;
}

- (void)__impactOccurredWithIntensity:(void *)a1 atLocation:(double)a2
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  if (a1)
  {
    objc_msgSend(a1, "_clientDidUpdateGeneratorWithSelector:", sel___impactOccurredWithIntensity_atLocation_);
    objc_msgSend(a1, "_impactConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v13 = (id)objc_msgSend(v5, "copy");

      v6 = 1.0;
      if (a2 <= 1.0)
        v6 = a2;
      v7 = fmax(v6, 0.0);
      objc_msgSend(v13, "hapticParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "volume");
      *(float *)&v7 = v7 * v9;
      objc_msgSend(v13, "hapticParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = LODWORD(v7);
      objc_msgSend(v10, "setVolume:", v11);

      objc_msgSend(a1, "_impactConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minimumInterval");
      objc_msgSend(a1, "_playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:", v13, &__impactOccurredWithIntensity_atLocation____lastTime, 0);

    }
  }
}

- (void)_impactOccurredWithIntensity:(double)a3
{
  -[UIImpactFeedbackGenerator __impactOccurredWithIntensity:atLocation:](self, a3);
}

- (void)impactOccurredAtLocation:(CGPoint)a3
{
  -[UIImpactFeedbackGenerator __impactOccurredWithIntensity:atLocation:](self, 1.0);
}

- (void)impactOccurredWithIntensity:(CGFloat)intensity
{
  double v3;

  v3 = fmax(intensity, 0.0);
  if (v3 > 1.0)
    v3 = 1.0;
  -[UIImpactFeedbackGenerator __impactOccurredWithIntensity:atLocation:](self, v3);
}

- (id)_ui_descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIImpactFeedbackGenerator;
  -[UIFeedbackGenerator _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImpactFeedbackGenerator _styleString](self, "_styleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("style"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_styleString
{
  unint64_t style;

  style = self->_style;
  if (style > 2)
    return CFSTR("Unknown");
  else
    return off_1E16C5020[style];
}

@end
