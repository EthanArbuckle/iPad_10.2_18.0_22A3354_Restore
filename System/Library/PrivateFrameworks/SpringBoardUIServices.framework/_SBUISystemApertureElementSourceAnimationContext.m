@implementation _SBUISystemApertureElementSourceAnimationContext

- (BOOL)hasTransientLocalResizeAction
{
  return -[NSMutableSet bs_containsObjectPassingTest:](self->_sceneResizeActions, "bs_containsObjectPassingTest:", &__block_literal_global_35);
}

- (void)addSceneResizeAction:(id)a3
{
  id v4;
  NSMutableSet *sceneResizeActions;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  sceneResizeActions = self->_sceneResizeActions;
  v8 = v4;
  if (!sceneResizeActions)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sceneResizeActions;
    self->_sceneResizeActions = v6;

    v4 = v8;
    sceneResizeActions = self->_sceneResizeActions;
  }
  -[NSMutableSet addObject:](sceneResizeActions, "addObject:", v4);

}

- (void)removeSceneResizeAction:(id)a3
{
  NSMutableSet *sceneResizeActions;
  id v5;

  v5 = a3;
  -[NSMutableSet removeObject:](self->_sceneResizeActions, "removeObject:");
  if (!-[NSMutableSet count](self->_sceneResizeActions, "count"))
  {
    sceneResizeActions = self->_sceneResizeActions;
    self->_sceneResizeActions = 0;

  }
  if ((objc_msgSend(v5, "isTransientLocal") & 1) == 0)
    -[_SBUISystemApertureElementSourceAnimationContext disableSkippingSceneResizeActions](self, "disableSkippingSceneResizeActions");

}

- (void)noteIsExpectingRemoteSceneResizeAction
{
  self->_canSkipRemoteSceneResizeActions = 1;
}

- (void)disableSkippingSceneResizeActions
{
  self->_canSkipRemoteSceneResizeActions = 0;
}

- (BOOL)hasPendingCoordinatedAnimations
{
  return -[NSMutableArray count](self->_pendingCoordinatedAnimations, "count") != 0;
}

- (void)addPendingAnimation:(id)a3
{
  id v4;
  NSMutableArray *pendingCoordinatedAnimations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  pendingCoordinatedAnimations = self->_pendingCoordinatedAnimations;
  v9 = v4;
  if (!pendingCoordinatedAnimations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pendingCoordinatedAnimations;
    self->_pendingCoordinatedAnimations = v6;

    pendingCoordinatedAnimations = self->_pendingCoordinatedAnimations;
  }
  v8 = (void *)MEMORY[0x1A85A1798]();
  -[NSMutableArray addObject:](pendingCoordinatedAnimations, "addObject:", v8);

}

- (void)performPendingCoordinatedAnimations
{
  void *v3;
  NSMutableArray *pendingCoordinatedAnimations;
  id v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_pendingCoordinatedAnimations, "copy");
  if (objc_msgSend(v3, "count"))
  {
    pendingCoordinatedAnimations = self->_pendingCoordinatedAnimations;
    self->_pendingCoordinatedAnimations = 0;

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)canSkipRemoteSceneResizeActions
{
  return self->_canSkipRemoteSceneResizeActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCoordinatedAnimations, 0);
  objc_storeStrong((id *)&self->_sceneResizeActions, 0);
}

@end
