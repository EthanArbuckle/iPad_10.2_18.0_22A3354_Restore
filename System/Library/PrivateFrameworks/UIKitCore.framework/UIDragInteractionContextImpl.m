@implementation UIDragInteractionContextImpl

- (id)animations
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  -[UIDragInteractionContextImpl animationBlocks](self, "animationBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIDragInteractionContextImpl_animations__block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

void __42__UIDragInteractionContextImpl_animations__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)completion
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  -[UIDragInteractionContextImpl completionBlocks](self, "completionBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIDragInteractionContextImpl_completion__block_invoke;
  aBlock[3] = &unk_1E16B42D0;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

void __42__UIDragInteractionContextImpl_completion__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (NSMutableArray)animationBlocks
{
  NSMutableArray *animationBlocks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  animationBlocks = self->_animationBlocks;
  if (!animationBlocks)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_animationBlocks;
    self->_animationBlocks = v4;

    animationBlocks = self->_animationBlocks;
  }
  return animationBlocks;
}

- (NSMutableArray)completionBlocks
{
  NSMutableArray *completionBlocks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  completionBlocks = self->_completionBlocks;
  if (!completionBlocks)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_completionBlocks;
    self->_completionBlocks = v4;

    completionBlocks = self->_completionBlocks;
  }
  return completionBlocks;
}

- (void)addAnimations:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id aBlock;

  aBlock = a3;
  if (!aBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragInteraction.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animations"), 0);

  }
  -[UIDragInteractionContextImpl animationBlocks](self, "animationBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "addObject:", v6);

}

- (void)addCompletion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id aBlock;

  aBlock = a3;
  if (!aBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragInteraction.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"), 0);

  }
  -[UIDragInteractionContextImpl completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "addObject:", v6);

}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (BOOL)shouldAnimateLift
{
  return self->_shouldAnimateLift;
}

- (void)setShouldAnimateLift:(BOOL)a3
{
  self->_shouldAnimateLift = a3;
}

- (void)setAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)_sessionDidBegin
{
  return self->__sessionDidBegin;
}

- (void)set_sessionDidBegin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CAPoint3D)initialLocation
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_initialLocation.x;
  y = self->_initialLocation.y;
  z = self->_initialLocation.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLocation:(CAPoint3D)a3
{
  self->_initialLocation = a3;
}

- (BOOL)isPreparedForLift
{
  return self->_preparedForLift;
}

- (void)setPreparedForLift:(BOOL)a3
{
  self->_preparedForLift = a3;
}

- (int64_t)invocationType
{
  return self->_invocationType;
}

- (void)setInvocationType:(int64_t)a3
{
  self->_invocationType = a3;
}

- (UITouch)initiationTouch
{
  return self->_initiationTouch;
}

- (void)setInitiationTouch:(id)a3
{
  objc_storeStrong((id *)&self->_initiationTouch, a3);
}

- (BOOL)hasBegunDrag
{
  return self->_hasBegunDrag;
}

- (void)setHasBegunDrag:(BOOL)a3
{
  self->_hasBegunDrag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiationTouch, 0);
  objc_storeStrong(&self->__sessionDidBegin, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_animationBlocks, 0);
}

@end
