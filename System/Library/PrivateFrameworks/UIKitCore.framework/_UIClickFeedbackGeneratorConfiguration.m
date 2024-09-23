@implementation _UIClickFeedbackGeneratorConfiguration

- (int64_t)requiredSupportLevel
{
  return 1;
}

- (_UIFeedbackDiscretePlayable)clickDownPattern
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[_UIFeedbackPattern feedbackPattern](_UIFeedbackPattern, "feedbackPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setCategory:", 0x1E1721EC0);
  -[_UIClickFeedbackGeneratorConfiguration clickDownFeedback](self, "clickDownFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIClickFeedbackGeneratorConfiguration clickDownFeedback](self, "clickDownFeedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addFeedback:atTime:", v5, 0.0);

  }
  -[_UIClickFeedbackGeneratorConfiguration clickDownAudioFeedback](self, "clickDownAudioFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIClickFeedbackGeneratorConfiguration clickDownAudioFeedback](self, "clickDownAudioFeedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addFeedback:atTime:", v7, 0.0);

  }
  return (_UIFeedbackDiscretePlayable *)v3;
}

- (_UIFeedbackDiscretePlayable)clickUpPattern
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[_UIFeedbackPattern feedbackPattern](_UIFeedbackPattern, "feedbackPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setCategory:", 0x1E1721EC0);
  -[_UIClickFeedbackGeneratorConfiguration clickUpFeedback](self, "clickUpFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIClickFeedbackGeneratorConfiguration clickUpFeedback](self, "clickUpFeedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addFeedback:atTime:", v5, 0.0);

  }
  -[_UIClickFeedbackGeneratorConfiguration clickUpAudioFeedback](self, "clickUpAudioFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIClickFeedbackGeneratorConfiguration clickUpAudioFeedback](self, "clickUpAudioFeedback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addFeedback:atTime:", v7, 0.0);

  }
  return (_UIFeedbackDiscretePlayable *)v3;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("default"), &__block_literal_global_184);
}

- (id)feedbackKeyPaths
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
  v8.super_class = (Class)_UIClickFeedbackGeneratorConfiguration;
  -[_UIFeedbackGeneratorUserInteractionDrivenConfiguration feedbackKeyPaths](&v8, sel_feedbackKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clickDownPattern);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_clickUpPattern);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setclickDownFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *clickDownFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  clickDownFeedback = self->_clickDownFeedback;
  self->_clickDownFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)clickDownFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_clickDownFeedback;
}

- (void)setClickDownAudioFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *clickDownAudioFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  clickDownAudioFeedback = self->_clickDownAudioFeedback;
  self->_clickDownAudioFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)clickDownAudioFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_clickDownAudioFeedback;
}

- (void)setClickUpFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *clickUpFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  clickUpFeedback = self->_clickUpFeedback;
  self->_clickUpFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)clickUpFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_clickUpFeedback;
}

- (void)setClickUpAudioFeedback:(id)a3
{
  _UIFeedbackDiscretePlayable *v4;
  _UIFeedbackDiscretePlayable *clickUpAudioFeedback;

  v4 = (_UIFeedbackDiscretePlayable *)a3;
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  clickUpAudioFeedback = self->_clickUpAudioFeedback;
  self->_clickUpAudioFeedback = v4;

}

- (_UIFeedbackDiscretePlayable)clickUpAudioFeedback
{
  -[_UIFeedbackGeneratorConfiguration _setupIfNecessary](self, "_setupIfNecessary");
  return self->_clickUpAudioFeedback;
}

- (void)setClickDownFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_clickDownFeedback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickUpAudioFeedback, 0);
  objc_storeStrong((id *)&self->_clickUpFeedback, 0);
  objc_storeStrong((id *)&self->_clickDownAudioFeedback, 0);
  objc_storeStrong((id *)&self->_clickDownFeedback, 0);
}

@end
