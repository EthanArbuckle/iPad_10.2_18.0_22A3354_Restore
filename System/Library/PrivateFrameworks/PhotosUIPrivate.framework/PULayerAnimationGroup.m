@implementation PULayerAnimationGroup

- (PULayerAnimationGroup)init
{
  return -[PULayerAnimationGroup initWithReferenceLayer:](self, "initWithReferenceLayer:", 0);
}

- (PULayerAnimationGroup)initWithReferenceLayer:(id)a3
{
  id v6;
  PULayerAnimationGroup *v7;
  PULayerAnimationGroup *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULayerAnimationGroup.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referenceLayer != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PULayerAnimationGroup;
  v7 = -[PUTimedAnimationGroup init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_referenceLayer, a3);
    -[PULayerAnimationGroup currentTime](v8, "currentTime");
    -[PUTimedAnimationGroup setBeginTime:](v8, "setBeginTime:");
  }

  return v8;
}

- (double)currentTime
{
  void *v2;
  double v3;
  double v4;

  -[PULayerAnimationGroup referenceLayer](self, "referenceLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;

  return v4;
}

- (void)updateAnimations
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PULayerAnimationGroup;
  -[PUTimedAnimationGroup updateAnimations](&v22, sel_updateAnimations);
  v3 = -[PUAnimationGroup isPaused](self, "isPaused");
  -[PUTimedAnimationGroup elapsedTime](self, "elapsedTime");
  v5 = v4;
  -[PUTimedAnimationGroup beginTime](self, "beginTime");
  v7 = v6;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PUAnimationGroup subAnimationGroups](self, "subAnimationGroups", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v3)
          {
            LODWORD(v14) = 0;
            v15 = 0.0;
            v16 = v13;
            v17 = v5;
          }
          else
          {
            LODWORD(v14) = 1.0;
            v17 = 0.0;
            v16 = v13;
            v15 = v7;
          }
          objc_msgSend(v16, "setSpeed:timeOffset:beginTime:", v14, v17, v15);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

}

- (CALayer)referenceLayer
{
  return self->_referenceLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceLayer, 0);
}

@end
