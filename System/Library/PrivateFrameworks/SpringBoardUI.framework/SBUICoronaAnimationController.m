@implementation SBUICoronaAnimationController

+ (id)animationSettingsForTransitionToStyle:(int64_t)a3
{
  _QWORD *v3;
  void *v4;
  void *v5;

  v3 = (_QWORD *)MEMORY[0x24BDE5D18];
  if (a3 == 2)
    v3 = (_QWORD *)MEMORY[0x24BDE5D28];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:timingFunction:", v4, 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addParticipant:(id)a3
{
  id v4;
  NSHashTable *participants;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    participants = self->_participants;
    v8 = v4;
    if (!participants)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_participants;
      self->_participants = v6;

      participants = self->_participants;
    }
    -[NSHashTable addObject:](participants, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeParticipant:(id)a3
{
  NSHashTable *participants;

  if (a3)
  {
    participants = self->_participants;
    if (participants)
      -[NSHashTable removeObject:](participants, "removeObject:");
  }
}

- (id)_configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle:(int64_t)a3
{
  UIViewPropertyAnimator *propertyAnimator;
  uint64_t v5;
  id v6;
  void *v7;
  UIViewPropertyAnimator *v8;
  UIViewPropertyAnimator *v9;
  UIViewPropertyAnimator *v10;
  _QWORD v12[4];
  id v13;
  id location;

  propertyAnimator = self->_propertyAnimator;
  if (!propertyAnimator)
  {
    if (a3 == 2)
      v5 = 2;
    else
      v5 = 1;
    v6 = objc_alloc(MEMORY[0x24BDF6FA8]);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69A0]), "initWithAnimationCurve:", v5);
    v8 = (UIViewPropertyAnimator *)objc_msgSend(v6, "initWithDuration:timingParameters:", v7, 0.5);
    v9 = self->_propertyAnimator;
    self->_propertyAnimator = v8;

    objc_initWeak(&location, self);
    v10 = self->_propertyAnimator;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __100__SBUICoronaAnimationController__configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle___block_invoke;
    v12[3] = &unk_24D4D07C8;
    objc_copyWeak(&v13, &location);
    -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    propertyAnimator = self->_propertyAnimator;
  }
  return propertyAnimator;
}

void __100__SBUICoronaAnimationController__configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPropertyAnimator:", 0);

}

- (void)coronaDidChange:(int64_t)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = -[SBUICoronaAnimationController _configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle:](self, "_configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle:", a3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_participants;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "coronaAnimationController:willAnimateCoronaTransitionWithAnimator:", self, self->_propertyAnimator, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[UIViewPropertyAnimator startAnimation](self->_propertyAnimator, "startAnimation");
}

- (UIViewPropertyAnimator)_propertyAnimator
{
  return self->_propertyAnimator;
}

- (void)_setPropertyAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
