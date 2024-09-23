@implementation TUIAnimationRenderModelStep

- (TUIAnimationRenderModelStep)initWithStepStartTime:(double)a3 duration:(double)a4 renderModel:(id)a5 animatedKeyPaths:(id)a6
{
  id v11;
  id v12;
  TUIAnimationRenderModelStep *v13;
  TUIAnimationRenderModelStep *v14;
  NSArray *v15;
  NSArray *keyPaths;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUIAnimationRenderModelStep;
  v13 = -[TUIAnimationRenderModelStep init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    v13->_stepStartTime = a3;
    v13->_stepDuration = a4;
    objc_storeStrong((id *)&v13->_renderModel, a5);
    v15 = (NSArray *)objc_msgSend(v12, "copy");
    keyPaths = v14->_keyPaths;
    v14->_keyPaths = v15;

  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUIAnimationRenderModelStep initWithStepStartTime:duration:renderModel:animatedKeyPaths:](+[TUIAnimationRenderModelStep allocWithZone:](TUIAnimationRenderModelStep, "allocWithZone:", a3), "initWithStepStartTime:duration:renderModel:animatedKeyPaths:", self->_renderModel, self->_keyPaths, self->_stepStartTime, self->_stepDuration);
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  TUIRenderModelAnimatable *renderModel;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  CGAffineTransform transform;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "addObject:", CFSTR("<"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" startTime: %g"), *(_QWORD *)&self->_stepStartTime));
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" duration: %g"), *(_QWORD *)&self->_stepDuration));
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(v3, "addObject:", CFSTR(" keyPaths: "));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = self->_keyPaths;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v15);
        if ((v13 & 1) != 0)
          objc_msgSend(v3, "addObject:", CFSTR(", "));
        objc_msgSend(v3, "addObject:", v16);
        objc_msgSend(v3, "addObject:", CFSTR(" = "));
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("alpha")))
        {
          -[TUIRenderModelAnimatable alpha](self->_renderModel, "alpha");
          v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%g"), v17));
        }
        else
        {
          if (!objc_msgSend(v16, "isEqualToString:", CFSTR("transform")))
            goto LABEL_16;
          renderModel = self->_renderModel;
          if (renderModel)
            -[TUIRenderModelAnimatable transform](renderModel, "transform");
          else
            memset(&transform, 0, sizeof(transform));
          v20 = NSStringFromCGAffineTransform(&transform);
          v18 = objc_claimAutoreleasedReturnValue(v20);
        }
        v21 = (void *)v18;
        objc_msgSend(v3, "addObject:", v18);

LABEL_16:
        v15 = (char *)v15 + 1;
        v13 = 1;
      }
      while (v12 != v15);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" renderModel: %p"), self->_renderModel));
  objc_msgSend(v3, "addObject:", v22);

  objc_msgSend(v3, "addObject:", CFSTR(">"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", &stru_243BF0));

  return v23;
}

- (double)stepStartTime
{
  return self->_stepStartTime;
}

- (double)stepDuration
{
  return self->_stepDuration;
}

- (TUIRenderModelAnimatable)renderModel
{
  return self->_renderModel;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
