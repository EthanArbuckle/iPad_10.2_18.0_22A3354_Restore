@implementation _UIFluidSliderFeedbackConfiguration

+ (id)defaultConfiguration
{
  void *v2;

  objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("default"), &__block_literal_global_510);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequiredPeripheralSupportLevel:", 1);
  return v2;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIFluidSliderFeedbackConfiguration;
  -[_UIFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](&v8, sel_hidFeedbackPatternNameKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hidEdgeFeedbackPatternName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_hidDetentFeedbackPatternName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  -[_UIFluidSliderFeedbackConfiguration detentFeedback](self, "detentFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v9))
  {

  }
  else
  {
    -[_UIFluidSliderFeedbackConfiguration selectionFeedback](self, "selectionFeedback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (!v11)
    {
      -[_UIFluidSliderFeedbackConfiguration hidEdgeFeedbackPatternName](self, "hidEdgeFeedbackPatternName");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  -[_UIFluidSliderFeedbackConfiguration hidDetentFeedbackPatternName](self, "hidDetentFeedbackPatternName");
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = (void *)v12;
  +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v12, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setmaxEdgeFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *maxEdgeFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  maxEdgeFeedback = self->_maxEdgeFeedback;
  self->_maxEdgeFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)maxEdgeFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_maxEdgeFeedback;
}

- (void)setdetentFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *detentFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  detentFeedback = self->_detentFeedback;
  self->_detentFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)detentFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_detentFeedback;
}

- (void)setselectionFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *selectionFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  selectionFeedback = self->_selectionFeedback;
  self->_selectionFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)selectionFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_selectionFeedback;
}

- (void)setminEdgeFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *minEdgeFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  minEdgeFeedback = self->_minEdgeFeedback;
  self->_minEdgeFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)minEdgeFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_minEdgeFeedback;
}

- (NSString)hidEdgeFeedbackPatternName
{
  return self->_hidEdgeFeedbackPatternName;
}

- (void)setHidEdgeFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidEdgeFeedbackPatternName, a3);
}

- (NSString)hidDetentFeedbackPatternName
{
  return self->_hidDetentFeedbackPatternName;
}

- (void)setHidDetentFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidDetentFeedbackPatternName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidDetentFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_hidEdgeFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_minEdgeFeedback, 0);
  objc_storeStrong((id *)&self->_selectionFeedback, 0);
  objc_storeStrong((id *)&self->_detentFeedback, 0);
  objc_storeStrong((id *)&self->_maxEdgeFeedback, 0);
}

@end
