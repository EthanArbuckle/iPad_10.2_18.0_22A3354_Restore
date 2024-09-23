@implementation TUIAnimationStep

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimationStep *v4;
  TUIAnimationStep *v5;
  NSDictionary *v6;
  NSDictionary *values;

  v4 = -[TUIAnimationStep init](+[TUIAnimationStep allocWithZone:](TUIAnimationStep, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->_startTime = self->_startTime;
    v4->_duration = self->_duration;
    v6 = (NSDictionary *)-[NSDictionary copy](self->_values, "copy");
    values = v5->_values;
    v5->_values = v6;

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
  NSDictionary *values;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "addObject:", CFSTR("<"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" startTime: %g"), *(_QWORD *)&self->_startTime));
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" duration: %g"), *(_QWORD *)&self->_duration));
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(v3, "addObject:", CFSTR(" values: { "));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  values = self->_values;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_75E78;
  v14[3] = &unk_23FDE0;
  v16 = &v17;
  v11 = v3;
  v15 = v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](values, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (*((_BYTE *)v18 + 24))
    objc_msgSend(v11, "addObject:", CFSTR(" "));
  objc_msgSend(v11, "addObject:", CFSTR("}>"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", &stru_243BF0));

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
