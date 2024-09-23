@implementation _UIEstimatedTouchRecord

- (_UIEstimatedTouchRecord)initWithLiveTouch:(id)a3 freezeTouch:(id)a4 contextID:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIEstimatedTouchRecord *v12;
  _UIEstimatedTouchRecord *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIEstimatedTouchRecord;
  v12 = -[_UIEstimatedTouchRecord init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_liveTouch, a3);
    objc_storeStrong((id *)&v13->_frozenTouch, a4);
    objc_storeStrong((id *)&v13->_contextID, a5);
    *(_BYTE *)&v13->_stateFlags = *(_BYTE *)&v13->_stateFlags & 0xFE | objc_msgSend(v10, "estimatedPropertiesExpectingUpdates") & 1;
    *(_BYTE *)&v13->_stateFlags = (objc_msgSend(v10, "estimatedPropertiesExpectingUpdates") >> 1) & 8 | *(_BYTE *)&v13->_stateFlags & 0xF7;
  }

  return v13;
}

- (void)addTouchable:(id)a3
{
  id v4;
  NSMutableArray *touchables;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  touchables = self->_touchables;
  v8 = v4;
  if (!touchables)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_touchables;
    self->_touchables = v6;

    v4 = v8;
    touchables = self->_touchables;
  }
  -[NSMutableArray addObject:](touchables, "addObject:", v4);

}

- (void)removeTouchable:(id)a3
{
  -[NSMutableArray removeObject:](self->_touchables, "removeObject:", a3);
}

- (BOOL)hasRemainingUpdates
{
  char stateFlags;
  int v3;
  BOOL v4;

  stateFlags = (char)self->_stateFlags;
  v3 = stateFlags & 3;
  v4 = (stateFlags & 8) != 0 && (stateFlags & 0x10) == 0;
  return v3 == 1 || v4;
}

- (void)_dispatchWithCurrentUpdates
{
  void *v3;
  char stateFlags;
  UITouch *liveTouch;
  double updatedPressure;
  double maxObservedPressure;
  UITouch *v8;
  UITouch *v9;
  UITouch *v10;
  UITouch *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[UITouch _clone](self->_liveTouch, "_clone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITouch _clonePropertiesToTouch:](self->_frozenTouch, "_clonePropertiesToTouch:", self->_liveTouch);
  stateFlags = (char)self->_stateFlags;
  liveTouch = self->_liveTouch;
  if ((stateFlags & 2) != 0)
  {
    if (liveTouch)
    {
      updatedPressure = self->_updatedPressure;
      maxObservedPressure = liveTouch->_maxObservedPressure;
      if (maxObservedPressure < updatedPressure)
        maxObservedPressure = self->_updatedPressure;
      liveTouch->_previousPressure = liveTouch->_pressure;
      liveTouch->_pressure = updatedPressure;
      liveTouch->_maxObservedPressure = maxObservedPressure;
      v8 = self->_liveTouch;
      if (v8 && (v8->_hasForceUpdate = 1, (v9 = self->_liveTouch) != 0))
      {
        v9->_needsForceUpdate = ((*(_BYTE *)&self->_stateFlags >> 2) & 1) == 0;
        liveTouch = self->_liveTouch;
      }
      else
      {
        liveTouch = 0;
      }
    }
    stateFlags = (char)self->_stateFlags;
  }
  if ((stateFlags & 0x10) != 0)
  {
    -[UITouch _setRollAngle:resetPrevious:]((uint64_t)liveTouch, 0, self->_updatedRollAngle);
    v10 = self->_liveTouch;
    if (v10 && (v10->_hasRollUpdate = 1, (v11 = self->_liveTouch) != 0))
    {
      v11->_needsRollUpdate = ((*(_BYTE *)&self->_stateFlags >> 5) & 1) == 0;
      liveTouch = self->_liveTouch;
    }
    else
    {
      liveTouch = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", liveTouch);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_touchables;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "touchesEstimatedPropertiesUpdated:", v12, (_QWORD)v18);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  objc_msgSend(v3, "_clonePropertiesToTouch:", self->_liveTouch);
}

- (void)dispatchUpdateWithPressure:(double)a3 stillEstimated:(BOOL)a4
{
  char stateFlags;
  char v6;
  char v7;

  stateFlags = (char)self->_stateFlags;
  self->_updatedPressure = a3;
  v6 = stateFlags & 0xF9;
  if (a4)
    v7 = 6;
  else
    v7 = 2;
  *(_BYTE *)&self->_stateFlags = v7 | v6;
  if (!-[_UIEstimatedTouchRecord hasRemainingUpdates](self, "hasRemainingUpdates"))
    -[_UIEstimatedTouchRecord _dispatchWithCurrentUpdates](self, "_dispatchWithCurrentUpdates");
}

- (void)dispatchUpdateWithRollAngle:(double)a3 stillEstimated:(BOOL)a4
{
  char stateFlags;
  char v6;
  char v7;

  stateFlags = (char)self->_stateFlags;
  self->_updatedRollAngle = a3;
  v6 = stateFlags & 0xCF;
  if (a4)
    v7 = 48;
  else
    v7 = 16;
  *(_BYTE *)&self->_stateFlags = v7 | v6;
  if (!-[_UIEstimatedTouchRecord hasRemainingUpdates](self, "hasRemainingUpdates"))
    -[_UIEstimatedTouchRecord _dispatchWithCurrentUpdates](self, "_dispatchWithCurrentUpdates");
}

- (UITouch)liveTouch
{
  return self->_liveTouch;
}

- (UITouch)frozenTouch
{
  return self->_frozenTouch;
}

- (NSArray)touchables
{
  return &self->_touchables->super;
}

- (NSNumber)contextID
{
  return self->_contextID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_frozenTouch, 0);
  objc_storeStrong((id *)&self->_liveTouch, 0);
  objc_storeStrong((id *)&self->_touchables, 0);
}

@end
