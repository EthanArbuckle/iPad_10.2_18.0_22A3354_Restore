@implementation _UIEdgeFeedbackGeneratorConfiguration

- (int64_t)_defaultAxis
{
  return self->_defaultAxis;
}

+ (id)_zoomConfiguration
{
  void *v2;

  objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("zoom"), &__block_literal_global_163_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequiredPeripheralSupportLevel:", 1);
  return v2;
}

+ (id)sliderConfiguration
{
  void *v2;

  objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("slider"), &__block_literal_global_186);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setDefaultAxis:", 1);
  objc_msgSend(v2, "setMinDistanceFromEdge:", 20.0);
  objc_msgSend(v2, "setRequiredPeripheralSupportLevel:", 1);
  return v2;
}

- (void)setMinDistanceFromEdge:(double)a3
{
  self->_minDistanceFromEdge = a3;
}

- (void)_setDefaultAxis:(int64_t)a3
{
  self->_defaultAxis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, 0);
  objc_storeStrong(&self->_animatingMaximumExtentFeedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_animatingMaximumExtentFeedback, 0);
  objc_storeStrong(&self->_animatingThresholdFeedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_animatingThresholdFeedback, 0);
  objc_storeStrong(&self->_userInteractingReleaseFeedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_userInteractingReleaseFeedback, 0);
  objc_storeStrong(&self->_userInteractingBeyondEdgeFeedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_userInteractingBeyondEdgeFeedback, 0);
  objc_storeStrong(&self->_userInteractingThresholdFeedbackUpdateBlock, 0);
  objc_storeStrong((id *)&self->_userInteractingThresholdFeedback, 0);
}

- (int64_t)requiredSupportLevel
{
  return 2;
}

+ (id)verticalScrollConfiguration
{
  return (id)objc_msgSend(a1, "_scrollConfigurationWithAxis:", 2);
}

+ (id)horizontalScrollConfiguration
{
  return (id)objc_msgSend(a1, "_scrollConfigurationWithAxis:", 1);
}

+ (id)swipePresentationConfiguration
{
  void *v2;

  objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("swipePresentation"), &__block_literal_global_158_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setDefaultAxis:", 2);
  objc_msgSend(v2, "setMinDistanceFromEdge:", 100.0);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIEdgeFeedbackGeneratorConfiguration;
  v4 = -[_UIFeedbackGeneratorConfiguration copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = objc_msgSend(self->_userInteractingThresholdFeedbackUpdateBlock, "copy");
  v6 = (void *)v4[15];
  v4[15] = v5;

  v7 = objc_msgSend(self->_userInteractingBeyondEdgeFeedbackUpdateBlock, "copy");
  v8 = (void *)v4[17];
  v4[17] = v7;

  v9 = objc_msgSend(self->_userInteractingReleaseFeedbackUpdateBlock, "copy");
  v10 = (void *)v4[19];
  v4[19] = v9;

  v11 = objc_msgSend(self->_animatingThresholdFeedbackUpdateBlock, "copy");
  v12 = (void *)v4[21];
  v4[21] = v11;

  v13 = objc_msgSend(self->_animatingMaximumExtentFeedbackUpdateBlock, "copy");
  v14 = (void *)v4[23];
  v4[23] = v13;

  return v4;
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_UIEdgeFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorUserInteractionDrivenConfiguration feedbackKeyPaths](&v11, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userInteractingThresholdFeedback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  NSStringFromSelector(sel_userInteractingBeyondEdgeFeedback);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  NSStringFromSelector(sel_userInteractingReleaseFeedback);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  NSStringFromSelector(sel_animatingThresholdFeedback);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  NSStringFromSelector(sel_animatingMaximumExtentFeedback);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIEdgeFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](&v6, sel_hidFeedbackPatternNameKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hidFeedbackPatternName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  if (v8
    && (-[_UIEdgeFeedbackGeneratorConfiguration hidFeedbackPatternName](self, "hidFeedbackPatternName"),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v9, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_UIEdgeFeedbackGeneratorConfiguration;
    -[_UIFeedbackGeneratorConfiguration _alternateFeedback:forDevice:senderID:](&v13, sel__alternateFeedback_forDevice_senderID_, v8, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)setUserInteractingThresholdFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *userInteractingThresholdFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  userInteractingThresholdFeedback = self->_userInteractingThresholdFeedback;
  self->_userInteractingThresholdFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)userInteractingThresholdFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_userInteractingThresholdFeedback;
}

- (void)setUserInteractingThresholdFeedbackUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  id userInteractingThresholdFeedbackUpdateBlock;

  v4 = a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  v5 = _Block_copy(v4);

  userInteractingThresholdFeedbackUpdateBlock = self->_userInteractingThresholdFeedbackUpdateBlock;
  self->_userInteractingThresholdFeedbackUpdateBlock = v5;

}

- (id)userInteractingThresholdFeedbackUpdateBlock
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return _Block_copy(self->_userInteractingThresholdFeedbackUpdateBlock);
}

- (void)setUserInteractingBeyondEdgeFeedback:(id)a3
{
  _UIFeedbackContinuousPlayable *v4;
  _UIFeedbackContinuousPlayable *userInteractingBeyondEdgeFeedback;

  v4 = (_UIFeedbackContinuousPlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  userInteractingBeyondEdgeFeedback = self->_userInteractingBeyondEdgeFeedback;
  self->_userInteractingBeyondEdgeFeedback = v4;

}

- (_UIFeedbackContinuousPlayable)userInteractingBeyondEdgeFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_userInteractingBeyondEdgeFeedback;
}

- (void)setUserInteractingBeyondEdgeFeedbackUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  id userInteractingBeyondEdgeFeedbackUpdateBlock;

  v4 = a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  v5 = _Block_copy(v4);

  userInteractingBeyondEdgeFeedbackUpdateBlock = self->_userInteractingBeyondEdgeFeedbackUpdateBlock;
  self->_userInteractingBeyondEdgeFeedbackUpdateBlock = v5;

}

- (id)userInteractingBeyondEdgeFeedbackUpdateBlock
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return _Block_copy(self->_userInteractingBeyondEdgeFeedbackUpdateBlock);
}

- (void)setUserInteractingReleaseFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *userInteractingReleaseFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  userInteractingReleaseFeedback = self->_userInteractingReleaseFeedback;
  self->_userInteractingReleaseFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)userInteractingReleaseFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_userInteractingReleaseFeedback;
}

- (void)setUserInteractingReleaseFeedbackUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  id userInteractingReleaseFeedbackUpdateBlock;

  v4 = a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  v5 = _Block_copy(v4);

  userInteractingReleaseFeedbackUpdateBlock = self->_userInteractingReleaseFeedbackUpdateBlock;
  self->_userInteractingReleaseFeedbackUpdateBlock = v5;

}

- (id)userInteractingReleaseFeedbackUpdateBlock
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return _Block_copy(self->_userInteractingReleaseFeedbackUpdateBlock);
}

- (void)setAnimatingThresholdFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *animatingThresholdFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  animatingThresholdFeedback = self->_animatingThresholdFeedback;
  self->_animatingThresholdFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)animatingThresholdFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_animatingThresholdFeedback;
}

- (void)setAnimatingThresholdFeedbackUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  id animatingThresholdFeedbackUpdateBlock;

  v4 = a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  v5 = _Block_copy(v4);

  animatingThresholdFeedbackUpdateBlock = self->_animatingThresholdFeedbackUpdateBlock;
  self->_animatingThresholdFeedbackUpdateBlock = v5;

}

- (id)animatingThresholdFeedbackUpdateBlock
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return _Block_copy(self->_animatingThresholdFeedbackUpdateBlock);
}

- (void)setAnimatingMaximumExtentFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *animatingMaximumExtentFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  animatingMaximumExtentFeedback = self->_animatingMaximumExtentFeedback;
  self->_animatingMaximumExtentFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)animatingMaximumExtentFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_animatingMaximumExtentFeedback;
}

- (void)setAnimatingMaximumExtentFeedbackUpdateBlock:(id)a3
{
  id v4;
  void *v5;
  id animatingMaximumExtentFeedbackUpdateBlock;

  v4 = a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  v5 = _Block_copy(v4);

  animatingMaximumExtentFeedbackUpdateBlock = self->_animatingMaximumExtentFeedbackUpdateBlock;
  self->_animatingMaximumExtentFeedbackUpdateBlock = v5;

}

- (id)animatingMaximumExtentFeedbackUpdateBlock
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return _Block_copy(self->_animatingMaximumExtentFeedbackUpdateBlock);
}

- (NSString)hidFeedbackPatternName
{
  return self->_hidFeedbackPatternName;
}

- (void)setHidFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidFeedbackPatternName, a3);
}

- (double)minDistanceFromEdge
{
  return self->_minDistanceFromEdge;
}

@end
