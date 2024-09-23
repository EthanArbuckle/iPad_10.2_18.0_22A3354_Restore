@implementation FRRingBuffer

- (FRRingBuffer)initWithCapacity:(unint64_t)a3
{
  FRRingBuffer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FRRingBuffer;
  v4 = -[FRRingBuffer init](&v6, "init");
  if (v4)
  {
    if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100082F3C();
    -[FRRingBuffer setCapacity:](v4, "setCapacity:", a3);
  }
  return v4;
}

- (FRRingBuffer)initWithCapacity:(unint64_t)a3 dictionary:(id)a4
{
  id v6;
  FRRingBuffer *v7;
  uint64_t v8;
  FRRingBuffer *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v6 = a4;
  v7 = -[FRRingBuffer initWithCapacity:](self, "initWithCapacity:", a3);
  v9 = v7;
  if (v6 && v7)
  {
    v10 = objc_opt_class(NSArray, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Values")));
    v12 = FCDynamicCast(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000831EC();
    v14 = objc_msgSend(v13, "mutableCopy");
    -[FRRingBuffer setValues:](v9, "setValues:", v14);

    v16 = objc_opt_class(NSNumber, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Position")));
    v18 = FCDynamicCast(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (!v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100083140();
    -[FRRingBuffer setPosition:](v9, "setPosition:", objc_msgSend(v19, "integerValue"));
    v21 = objc_opt_class(NSNumber, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Min")));
    v23 = FCDynamicCast(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (!v24 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100083094();
    objc_msgSend(v24, "doubleValue");
    -[FRRingBuffer setMin:](v9, "setMin:");
    v26 = objc_opt_class(NSNumber, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Max")));
    v28 = FCDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (!v29 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100082FE8();
    objc_msgSend(v29, "doubleValue");
    -[FRRingBuffer setMax:](v9, "setMax:");

  }
  return v9;
}

- (NSMutableArray)values
{
  NSMutableArray *values;
  NSMutableArray *v4;
  unint64_t v5;

  values = self->_values;
  if (!values)
  {
    v4 = objc_opt_new(NSMutableArray);
    -[FRRingBuffer setValues:](self, "setValues:", v4);

    if (-[FRRingBuffer capacity](self, "capacity"))
    {
      v5 = 0;
      do
        -[NSMutableArray setObject:atIndexedSubscript:](self->_values, "setObject:atIndexedSubscript:", &off_1000E4B68, v5++);
      while (-[FRRingBuffer capacity](self, "capacity") > v5);
    }
    -[FRRingBuffer setMin:](self, "setMin:", 1.79769313e308);
    -[FRRingBuffer setMax:](self, "setMax:", -1.79769313e308);
    -[FRRingBuffer setPosition:](self, "setPosition:", 0);
    values = self->_values;
  }
  return values;
}

- (void)insertValue:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRRingBuffer values](self, "values"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", -[FRRingBuffer position](self, "position")));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRRingBuffer values](self, "values"));
  objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, -[FRRingBuffer position](self, "position"));

  v11 = -[FRRingBuffer position](self, "position") + 1;
  v12 = -[FRRingBuffer capacity](self, "capacity");
  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;
  -[FRRingBuffer setPosition:](self, "setPosition:", v11 % v13);
  -[FRRingBuffer min](self, "min");
  if (v8 == -1.79769313e308)
    goto LABEL_5;
  if (v8 != v14)
  {
    -[FRRingBuffer max](self, "max");
    if (v8 != v16)
    {
      -[FRRingBuffer min](self, "min");
LABEL_5:
      if (v14 > a3)
        -[FRRingBuffer setMin:](self, "setMin:", a3);
      -[FRRingBuffer max](self, "max");
      if (v15 < a3)
        -[FRRingBuffer setMax:](self, "setMax:", a3);
      return;
    }
  }
  *(_OWORD *)&self->_min = xmmword_1000D0EB0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRRingBuffer values](self, "values", 0));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "doubleValue");
        v23 = fmin(self->_min, v22);
        v24 = fmax(self->_max, v22);
        self->_min = v23;
        self->_max = v24;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }

}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v9[0] = CFSTR("Values");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRRingBuffer values](self, "values"));
  v10[0] = v3;
  v9[1] = CFSTR("Position");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FRRingBuffer position](self, "position")));
  v10[1] = v4;
  v9[2] = CFSTR("Min");
  -[FRRingBuffer min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v10[2] = v5;
  v9[3] = CFSTR("Max");
  -[FRRingBuffer max](self, "max");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  return (NSDictionary *)v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRRingBuffer values](self, "values"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FRRingBuffer position](self, "position")));
  -[FRRingBuffer min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[FRRingBuffer max](self, "max");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ring Buffer with Values : %@\nPosition : %@\nMin : %@\nMax : %@\n"), v3, v4, v5, v6));

  return v7;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
