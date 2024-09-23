@implementation TUIAnimationRenderModel

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimationRenderModel *v4;
  TUIAnimationRenderModel *v5;
  __int128 v6;
  __int128 v7;
  NSArray *v8;
  NSArray *models;
  TUIAnimationRenderModelStep *v10;
  TUIAnimationRenderModelStep *from;
  TUIAnimationRenderModelStep *v12;
  TUIAnimationRenderModelStep *to;

  v4 = -[TUIAnimationRenderModel init](+[TUIAnimationRenderModel allocWithZone:](TUIAnimationRenderModel, "allocWithZone:", a3), "init");
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
    v8 = (NSArray *)-[NSArray copy](self->_models, "copy");
    models = v5->_models;
    v5->_models = v8;

    v10 = (TUIAnimationRenderModelStep *)-[TUIAnimationRenderModelStep copy](self->_from, "copy");
    from = v5->_from;
    v5->_from = v10;

    v12 = (TUIAnimationRenderModelStep *)-[TUIAnimationRenderModelStep copy](self->_to, "copy");
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
  __int128 v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *models;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  float64x2_t *v26;
  float64x2_t v27;
  __int128 v28;
  CGFloat dy;

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

  v12 = *(_OWORD *)&self->_timing.damping;
  v27 = *(float64x2_t *)&self->_timing.mass;
  v28 = v12;
  dy = self->_timing.initialVelocity.dy;
  v13 = NSStringFromTUISpringTimingParameters(&v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" timing: %@"), v14));
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationRenderModelStep description](self->_from, "description"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" from: %@"), v16));
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationRenderModelStep description](self->_to, "description"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" to: %@"), v18));
  objc_msgSend(v3, "addObject:", v19);

  objc_msgSend(v3, "addObject:", CFSTR(" models: { "));
  v27.f64[0] = 0.0;
  *(_QWORD *)&v27.f64[1] = &v27;
  *(_QWORD *)&v28 = 0x2020000000;
  BYTE8(v28) = 0;
  models = self->_models;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_16B9F0;
  v24[3] = &unk_243120;
  v26 = &v27;
  v21 = v3;
  v25 = v21;
  -[NSArray enumerateObjectsUsingBlock:](models, "enumerateObjectsUsingBlock:", v24);
  if (*(_BYTE *)(*(_QWORD *)&v27.f64[1] + 24))
    objc_msgSend(v21, "addObject:", CFSTR(" "));
  objc_msgSend(v21, "addObject:", CFSTR("}>"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", &stru_243BF0));

  _Block_object_dispose(&v27, 8);
  return v22;
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

- (NSArray)models
{
  return self->_models;
}

- (void)setModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIAnimationRenderModelStep)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TUIAnimationRenderModelStep)to
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
  objc_storeStrong((id *)&self->_models, 0);
}

@end
