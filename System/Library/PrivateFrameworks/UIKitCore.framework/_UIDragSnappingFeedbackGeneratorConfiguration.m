@implementation _UIDragSnappingFeedbackGeneratorConfiguration

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("snapping"), &__block_literal_global_128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidObjectSnappedFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_objectSnappedFeedback, 0);
}

- (id)feedbackKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIDragSnappingFeedbackGeneratorConfiguration;
  -[_UIDragFeedbackGeneratorConfiguration feedbackKeyPaths](&v7, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_objectSnappedFeedback);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hidFeedbackPatternNameKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDragSnappingFeedbackGeneratorConfiguration;
  -[_UIDragFeedbackGeneratorConfiguration hidFeedbackPatternNameKeyPaths](&v6, sel_hidFeedbackPatternNameKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hidObjectSnappedFeedbackPatternName);
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
  -[_UIDragSnappingFeedbackGeneratorConfiguration objectSnappedFeedback](self, "objectSnappedFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    -[_UIDragSnappingFeedbackGeneratorConfiguration hidObjectSnappedFeedbackPatternName](self, "hidObjectSnappedFeedbackPatternName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFeedbackBackBoardHIDPattern feedbackPatternWithName:deviceType:senderID:](_UIFeedbackBackBoardHIDPattern, "feedbackPatternWithName:deviceType:senderID:", v11, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIDragSnappingFeedbackGeneratorConfiguration;
    -[_UIDragFeedbackGeneratorConfiguration _alternateFeedback:forDevice:senderID:](&v14, sel__alternateFeedback_forDevice_senderID_, v8, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)setObjectSnappedFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *objectSnappedFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  objectSnappedFeedback = self->_objectSnappedFeedback;
  self->_objectSnappedFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)objectSnappedFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_objectSnappedFeedback;
}

- (NSString)hidObjectSnappedFeedbackPatternName
{
  return self->_hidObjectSnappedFeedbackPatternName;
}

- (void)setHidObjectSnappedFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidObjectSnappedFeedbackPatternName, a3);
}

@end
