@implementation TSDContentAnimationGroup

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDContentAnimationGroup;
  -[TSDContentAnimationGroup dealloc](&v3, sel_dealloc);
}

- (BOOL)i_canProduceAnimation
{
  return 1;
}

- (id)i_animationWithTransformBlock:(id)a3
{
  void *v5;
  NSArray *animations;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  TSDContentAnimationGroup *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = self;
  animations = self->_animations;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(animations);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v11, "i_canProduceAnimation") & 1) == 0)
        {
          v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContentAnimationGroup i_animationWithTransformBlock:]");
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContentAnimation.m"), 168, CFSTR("group shouldn't contain animations that can't produce CAAnimations"));
        }
        v14 = objc_msgSend(v11, "i_animationWithTransformBlock:", a3);
        if (v14)
          objc_msgSend(v5, "addObject:", v14);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  v15 = (void *)objc_msgSend(MEMORY[0x24BDE5638], "animation");
  objc_msgSend(v15, "setAnimations:", v5);
  -[TSDContentAnimationGroup duration](v17, "duration");
  objc_msgSend(v15, "setDuration:");
  objc_msgSend(v15, "setTimingFunction:", -[TSDContentAnimationGroup timingFunction](v17, "timingFunction"));
  return v15;
}

- (id)i_endLocation
{
  NSArray *animations;
  id result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  animations = self->_animations;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v8 != v5)
        objc_enumerationMutation(animations);
      result = (id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "i_endLocation");
      if (result)
        break;
      if (v4 == (id)++v6)
      {
        result = (id)-[NSArray countByEnumeratingWithState:objects:count:](animations, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (NSArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
