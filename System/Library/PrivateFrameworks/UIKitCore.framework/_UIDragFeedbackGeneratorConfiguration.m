@implementation _UIDragFeedbackGeneratorConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidTargetUpdatedFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_targetUpdatedFeedback, 0);
  objc_storeStrong((id *)&self->_interactionUpdatedFeedback, 0);
  objc_storeStrong((id *)&self->_interactionProgressingFeedback, 0);
}

- (int64_t)requiredSupportLevel
{
  return 2;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("default"), &__block_literal_global_185);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  result = -[_UIFeedbackGeneratorConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 17) = *(_QWORD *)&self->_progressingFeedbackDelay;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  if (-[_UIFeedbackGeneratorConfiguration isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_progressingFeedbackDelay == v4[17];
  else
    v5 = 0;

  return v5;
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorUserInteractionDrivenConfiguration feedbackKeyPaths](&v9, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_interactionProgressingFeedback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_interactionUpdatedFeedback);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_targetUpdatedFeedback);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](&v6, sel_hidFeedbackPatternNameKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hidTargetUpdatedFeedbackPatternName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  -[_UIDragFeedbackGeneratorConfiguration targetUpdatedFeedback](self, "targetUpdatedFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    -[_UIDragFeedbackGeneratorConfiguration hidTargetUpdatedFeedbackPatternName](self, "hidTargetUpdatedFeedbackPatternName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v11, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIDragFeedbackGeneratorConfiguration;
    -[_UIFeedbackGeneratorConfiguration _alternateFeedback:forDevice:senderID:](&v14, sel__alternateFeedback_forDevice_senderID_, v8, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)setInteractionProgressingFeedback:(id)a3
{
  _UIFeedbackContinuousPlayable *v4;
  _UIFeedbackContinuousPlayable *interactionProgressingFeedback;

  v4 = (_UIFeedbackContinuousPlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  interactionProgressingFeedback = self->_interactionProgressingFeedback;
  self->_interactionProgressingFeedback = v4;

}

- (_UIFeedbackContinuousPlayable)interactionProgressingFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_interactionProgressingFeedback;
}

- (void)setInteractionUpdatedFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *interactionUpdatedFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  interactionUpdatedFeedback = self->_interactionUpdatedFeedback;
  self->_interactionUpdatedFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)interactionUpdatedFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_interactionUpdatedFeedback;
}

- (void)setTargetUpdatedFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *targetUpdatedFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  targetUpdatedFeedback = self->_targetUpdatedFeedback;
  self->_targetUpdatedFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)targetUpdatedFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_targetUpdatedFeedback;
}

- (void)setProgressingFeedbackDelay:(double)a3
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  self->_progressingFeedbackDelay = a3;
}

- (double)progressingFeedbackDelay
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_progressingFeedbackDelay;
}

- (NSString)hidTargetUpdatedFeedbackPatternName
{
  return self->_hidTargetUpdatedFeedbackPatternName;
}

- (void)setHidTargetUpdatedFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidTargetUpdatedFeedbackPatternName, a3);
}

@end
