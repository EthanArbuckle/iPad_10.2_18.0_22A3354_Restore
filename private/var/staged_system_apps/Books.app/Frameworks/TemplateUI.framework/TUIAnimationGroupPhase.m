@implementation TUIAnimationGroupPhase

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimationGroupPhase *v4;
  NSArray *v5;
  NSArray *animations;

  v4 = -[TUIAnimationGroupPhase init](+[TUIAnimationGroupPhase allocWithZone:](TUIAnimationGroupPhase, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = (NSArray *)-[NSArray copy](self->_animations, "copy");
    animations = v4->_animations;
    v4->_animations = v5;

    v4->_delay = self->_delay;
    v4->_duration = self->_duration;
    v4->_options = self->_options;
  }
  return v4;
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
  NSArray *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

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

  objc_msgSend(v3, "addObject:", CFSTR(" animations: { "));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = self->_animations;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if ((v15 & 1) != 0)
          objc_msgSend(v3, "addObject:", CFSTR(", "));
        objc_msgSend(v3, "addObject:", CFSTR("<"));
        v19 = (objc_class *)objc_opt_class(v18);
        v20 = NSStringFromClass(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_msgSend(v3, "addObject:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p>"), v18));
        objc_msgSend(v3, "addObject:", v22);

        v15 = 1;
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);

    objc_msgSend(v3, "addObject:", CFSTR(" "));
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", CFSTR("}>"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", &stru_243BF0));

  return v23;
}

- (NSArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
