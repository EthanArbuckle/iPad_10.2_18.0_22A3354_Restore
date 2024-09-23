@implementation SBSystemActionTrackPreviewsCoachingPolicySettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionTrackPreviewsCoachingPolicySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBSystemActionTrackPreviewsCoachingPolicySettings setPresentationThresholdForActionsWithStatefulPreviews:](self, "setPresentationThresholdForActionsWithStatefulPreviews:", 2);
  -[SBSystemActionTrackPreviewsCoachingPolicySettings setPresentationThresholdForActionsWithStatelessPreviews:](self, "setPresentationThresholdForActionsWithStatelessPreviews:", 1);
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
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Actions With Stateful Previews"), CFSTR("presentationThresholdForActionsWithStatefulPreviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E91CEA10, &unk_1E91CEA28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Actions With Stateless Previews"), CFSTR("presentationThresholdForActionsWithStatelessPreviews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "possibleValues:titles:", &unk_1E91CEA10, &unk_1E91CEA28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v7, CFSTR("Number of Presses to Present Coaching"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83070];
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moduleWithTitle:contents:", CFSTR("Track Previews Policy"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

@end
