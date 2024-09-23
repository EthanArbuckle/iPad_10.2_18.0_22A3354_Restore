@implementation TUIAnimation

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimation *v4;
  TUIAnimation *v5;
  __int128 v6;
  __int128 v7;
  NSArray *v8;
  NSArray *steps;
  TUIAnimationStep *v10;
  TUIAnimationStep *from;
  TUIAnimationStep *v12;
  TUIAnimationStep *to;

  v4 = -[TUIAnimation init](+[TUIAnimation allocWithZone:](TUIAnimation, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->_delay = self->_delay;
    v4->_duration = self->_duration;
    v4->_options = self->_options;
    v6 = *(_OWORD *)&self->_timing.mass;
    v7 = *(_OWORD *)&self->_timing.damping;
    v4->_timing.initialVelocity.dy = self->_timing.initialVelocity.dy;
    *(_OWORD *)&v4->_timing.damping = v7;
    *(_OWORD *)&v4->_timing.mass = v6;
    v8 = (NSArray *)-[NSArray copy](self->_steps, "copy");
    steps = v5->_steps;
    v5->_steps = v8;

    v10 = (TUIAnimationStep *)-[TUIAnimationStep copy](self->_from, "copy");
    from = v5->_from;
    v5->_from = v10;

    v12 = (TUIAnimationStep *)-[TUIAnimationStep copy](self->_to, "copy");
    to = v5->_to;
    v5->_to = v12;

  }
  return v5;
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
  void *v10;
  void *v11;
  float64x2_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  id v20;
  id v21;
  char v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  float64x2_t v33[2];
  CGFloat dy;
  _BYTE v35[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "addObject:", CFSTR("<"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" delay: %g"), *(_QWORD *)&self->_delay));
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" duration: %g"), *(_QWORD *)&self->_duration));
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" options: %@"), v10));
  objc_msgSend(v3, "addObject:", v11);

  objc_msgSend(v3, "addObject:", CFSTR(" timing: "));
  v12 = *(float64x2_t *)&self->_timing.damping;
  v33[0] = *(float64x2_t *)&self->_timing.mass;
  v33[1] = v12;
  dy = self->_timing.initialVelocity.dy;
  v13 = NSStringFromTUISpringTimingParameters(v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v3, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationStep description](self->_from, "description"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" from: %@"), v15));
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationStep description](self->_to, "description"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" to: %@"), v17));
  objc_msgSend(v3, "addObject:", v18);

  objc_msgSend(v3, "addObject:", CFSTR(" steps: { "));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = self->_steps;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if ((v22 & 1) != 0)
          objc_msgSend(v3, "addObject:", CFSTR(", "));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
        objc_msgSend(v3, "addObject:", v26);

        v22 = 1;
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v21);

    objc_msgSend(v3, "addObject:", CFSTR(" "));
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", CFSTR("}>"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", &stru_243BF0));

  return v27;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- ($4AC7F32B1C626A3A04933030E84D26E0)timing
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var3.dy;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var3.dy = self[2].var1;
  return self;
}

- (void)setTiming:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->_timing.initialVelocity.dy = a3->var3.dy;
  *(_OWORD *)&self->_timing.damping = v4;
  *(_OWORD *)&self->_timing.mass = v3;
}

- (NSArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIAnimationStep)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TUIAnimationStep)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

- (id)generateRenderModelsFromSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  TUIAnimationRenderModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v18[2];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimation steps](self, "steps"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimation _animationRenderModelForStep:sourceRenderModel:](self, "_animationRenderModelForStep:sourceRenderModel:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10), v4));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  v12 = objc_alloc_init(TUIAnimationRenderModel);
  -[TUIAnimation delay](self, "delay");
  -[TUIAnimationRenderModel setDelay:](v12, "setDelay:");
  -[TUIAnimation duration](self, "duration");
  -[TUIAnimationRenderModel setDuration:](v12, "setDuration:");
  -[TUIAnimationRenderModel setOptions:](v12, "setOptions:", -[TUIAnimationRenderModel options](v12, "options") | -[TUIAnimation options](self, "options"));
  -[TUIAnimation timing](self, "timing");
  v18[0] = v20;
  v18[1] = v21;
  v19 = v22;
  -[TUIAnimationRenderModel setTiming:](v12, "setTiming:", v18);
  -[TUIAnimationRenderModel setModels:](v12, "setModels:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimation from](self, "from"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimation _animationRenderModelForStep:sourceRenderModel:](self, "_animationRenderModelForStep:sourceRenderModel:", v13, v4));
  -[TUIAnimationRenderModel setFrom:](v12, "setFrom:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimation to](self, "to"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimation _animationRenderModelForStep:sourceRenderModel:](self, "_animationRenderModelForStep:sourceRenderModel:", v15, v4));
  -[TUIAnimationRenderModel setTo:](v12, "setTo:", v16);

  return v12;
}

- (id)_animationRenderModelForStep:(id)a3 sourceRenderModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  TUIAnimationRenderModelStep *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  TUIAnimationRenderModelStep *v30;
  id v32;
  id v33;
  CGAffineTransform v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;
  CGAffineTransform v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "values"));
    v8 = v6;
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (objc_msgSend(v9, "count"))
    {
      v33 = v5;
      v11 = objc_msgSend(v10, "copyWithZone:", 0);
      v32 = v10;

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyEnumerator"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v17));
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("alpha")))
            {
              v19 = objc_opt_class(NSNumber);
              v20 = TUIDynamicCast(v19, v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
              v22 = v21;
              if (v21)
              {
                objc_msgSend(v21, "doubleValue");
                objc_msgSend(v11, "setAlpha:");
              }

            }
            else if (objc_msgSend(v17, "isEqualToString:", CFSTR("transform")))
            {
              memset(&v38, 0, sizeof(v38));
              if (v18)
                objc_msgSend(v18, "CGAffineTransformValue");
              if (v11)
                objc_msgSend(v11, "transform");
              else
                memset(&t1, 0, sizeof(t1));
              t2 = v38;
              CGAffineTransformConcat(&v37, &t1, &t2);
              v34 = v37;
              objc_msgSend(v11, "setTransform:", &v34);
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v14);
      }

      v5 = v33;
      v10 = v32;
    }

    v23 = [TUIAnimationRenderModelStep alloc];
    objc_msgSend(v5, "startTime");
    v25 = v24;
    objc_msgSend(v5, "duration");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "values"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allKeys"));
    v30 = -[TUIAnimationRenderModelStep initWithStepStartTime:duration:renderModel:animatedKeyPaths:](v23, "initWithStepStartTime:duration:renderModel:animatedKeyPaths:", v11, v29, v25, v27);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

@end
