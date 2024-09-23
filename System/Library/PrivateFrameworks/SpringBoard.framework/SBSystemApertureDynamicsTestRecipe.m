@implementation SBSystemApertureDynamicsTestRecipe

- (id)title
{
  return CFSTR("Jindo Dynamics");
}

- (void)handleVolumeIncrease
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  SAInvalidatable *animationAssertion;
  void *v10;
  BOOL v11;
  SAInvalidatable *v12;
  SAInvalidatable *v13;
  id v14;

  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureDynamicsTestRecipe _dynamicsDescriptions](self, "_dynamicsDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", self->_activeDynamics);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  objc_msgSend(v4, "objectForKey:", CFSTR("animation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v6)
  {
    animationAssertion = self->_animationAssertion;
    if (animationAssertion)
    {
      -[SAInvalidatable invalidateWithReason:](animationAssertion, "invalidateWithReason:", CFSTR("test recipe button press"));
      v10 = self->_animationAssertion;
      self->_animationAssertion = 0;
    }
    else
    {
      objc_msgSend(v14, "_currentFirstElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applyPersistentAnimationStyle:toElement:", v8, v10);
      v12 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
      v13 = self->_animationAssertion;
      self->_animationAssertion = v12;

    }
  }
  else
  {
    objc_msgSend(v14, "_currentFirstElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 0;
    else
      v11 = v8 == 1;
    if (!v11)
      objc_msgSend(v14, "animateDiscreteAnimationStyle:toElement:", v8, v10);
  }

}

- (void)handleVolumeDecrease
{
  SAInvalidatable *animationAssertion;
  unint64_t v4;
  id v5;

  -[SAInvalidatable invalidateWithReason:](self->_animationAssertion, "invalidateWithReason:", CFSTR("test recipe switching to new animation"));
  animationAssertion = self->_animationAssertion;
  self->_animationAssertion = 0;

  v4 = self->_activeDynamics + 1;
  -[SBSystemApertureDynamicsTestRecipe _dynamicsDescriptions](self, "_dynamicsDescriptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_activeDynamics = v4 % objc_msgSend(v5, "count");

}

- (id)_dynamicsDescriptions
{
  NSArray *dynamicsDescriptions;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t j;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  dynamicsDescriptions = self->_dynamicsDescriptions;
  if (!dynamicsDescriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i != 5; ++i)
    {
      v16[1] = CFSTR("animation");
      v17[0] = CFSTR("discrete");
      v16[0] = CFSTR("type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

    }
    for (j = 1; j != 3; ++j)
    {
      v14[1] = CFSTR("animation");
      v15[0] = CFSTR("persistent");
      v14[0] = CFSTR("type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", j);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_dynamicsDescriptions;
    self->_dynamicsDescriptions = v11;

    dynamicsDescriptions = self->_dynamicsDescriptions;
  }
  return dynamicsDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationAssertion, 0);
  objc_storeStrong((id *)&self->_dynamicsDescriptions, 0);
}

@end
