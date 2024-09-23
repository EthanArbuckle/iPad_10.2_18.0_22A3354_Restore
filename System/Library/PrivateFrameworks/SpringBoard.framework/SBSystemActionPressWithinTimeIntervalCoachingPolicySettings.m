@implementation SBSystemActionPressWithinTimeIntervalCoachingPolicySettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionPressWithinTimeIntervalCoachingPolicySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBSystemActionPressWithinTimeIntervalCoachingPolicySettings setPresentationThresholdForActionsWithStatefulPreviews:](self, "setPresentationThresholdForActionsWithStatefulPreviews:", 2);
  -[SBSystemActionPressWithinTimeIntervalCoachingPolicySettings setPresentationThresholdForActionsWithStatelessPreviews:](self, "setPresentationThresholdForActionsWithStatelessPreviews:", 1);
  -[SBSystemActionPressWithinTimeIntervalCoachingPolicySettings setTimeInterval:](self, "setTimeInterval:", 5.0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Actions With Stateful Previews"), CFSTR("presentationThresholdForActionsWithStatefulPreviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E91CDF90, &unk_1E91CDFA8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Actions With Stateless Previews"), CFSTR("presentationThresholdForActionsWithStatelessPreviews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleValues:titles:", &unk_1E91CDF90, &unk_1E91CDFA8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v7, CFSTR("Number of Presses to Present Coaching"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Time Interval"), CFSTR("timeInterval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", 1.0, 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v12, CFSTR("Timing"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  v18[0] = v8;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Track Previews Policy"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)presentationThresholdForActionsWithStatefulPreviews
{
  return self->_presentationThresholdForActionsWithStatefulPreviews;
}

- (void)setPresentationThresholdForActionsWithStatefulPreviews:(unint64_t)a3
{
  self->_presentationThresholdForActionsWithStatefulPreviews = a3;
}

- (unint64_t)presentationThresholdForActionsWithStatelessPreviews
{
  return self->_presentationThresholdForActionsWithStatelessPreviews;
}

- (void)setPresentationThresholdForActionsWithStatelessPreviews:(unint64_t)a3
{
  self->_presentationThresholdForActionsWithStatelessPreviews = a3;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

@end
