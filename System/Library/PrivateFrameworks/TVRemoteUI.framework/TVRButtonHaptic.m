@implementation TVRButtonHaptic

+ (id)hapticForView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v11[3];

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = v4;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = 0;
  v11[2] = 0;
  v11[0] = 11;
  v8 = objc_msgSend(v7, "isOperatingSystemAtLeastVersion:", v11);

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB98]), "initWithStyle:", 0);
    objc_msgSend(v9, "_setOutputMode:", 5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBDC20], "buttonBehaviorWithStyle:coordinateSpace:", 0, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v5, "setBehavior:", v9);
  return v5;
}

- (void)userInteractionBegan
{
  -[UIFeedbackGeneratorUserInteractionDriven userInteractionStarted](self->_behavior, "userInteractionStarted");
}

- (void)userInteractionEnded
{
  -[UIFeedbackGeneratorUserInteractionDriven userInteractionEnded](self->_behavior, "userInteractionEnded");
}

- (void)userInteractionCancelled
{
  -[UIFeedbackGeneratorUserInteractionDriven userInteractionCancelled](self->_behavior, "userInteractionCancelled");
}

- (UIFeedbackGeneratorUserInteractionDriven)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
