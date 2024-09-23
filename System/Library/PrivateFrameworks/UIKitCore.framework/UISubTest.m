@implementation UISubTest

- (void)startWithFrameCount:(id)a3
{
  NSNumber *v5;
  NSNumber *startTime;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v5;

  if (v7)
    objc_storeStrong((id *)&self->_startFrame, a3);

}

- (NSNumber)startTime
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_data, "setObject:forKey:", a3, a4);
}

- (UISubTest)initWithName:(id)a3 metrics:(id)a4
{
  id v7;
  id v8;
  UISubTest *v9;
  UISubTest *v10;
  NSMutableArray *v11;
  NSMutableArray *time;
  NSMutableArray *v13;
  NSMutableArray *fps;
  NSMutableDictionary *v15;
  NSMutableDictionary *data;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UISubTest;
  v9 = -[UISubTest init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testName, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    time = v10->_time;
    v10->_time = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fps = v10->_fps;
    v10->_fps = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    data = v10->_data;
    v10->_data = v15;

    if (objc_msgSend(v8, "count"))
    {
      v10->_showTime = objc_msgSend(v8, "containsObject:", CFSTR("time"));
      v10->_showFps = objc_msgSend(v8, "containsObject:", CFSTR("fps"));
    }
    else
    {
      NSLog(CFSTR("No metrics, no results!"));
    }
  }

  return v10;
}

- (void)stopWithFrameCount:(id)a3
{
  id v4;
  double Current;
  double v6;
  double v7;
  NSMutableArray *time;
  void *v9;
  int v11;
  unsigned int v12;
  NSMutableArray *fps;
  void *v14;
  id v15;

  v4 = a3;
  if (self->_startTime)
  {
    v15 = v4;
    Current = CFAbsoluteTimeGetCurrent();
    -[NSNumber doubleValue](self->_startTime, "doubleValue");
    v7 = Current - v6;
    time = self->_time;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](time, "addObject:", v9);

    v4 = v15;
    if (v7 != 0.0 && self->_startFrame != 0)
    {
      v11 = objc_msgSend(v15, "unsignedIntValue");
      v12 = -[NSNumber unsignedIntValue](self->_startFrame, "unsignedIntValue");
      fps = self->_fps;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(v11 - v12) / v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](fps, "addObject:", v14);

      v4 = v15;
    }
  }

}

- (id)getObjectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_data, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_fps, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_startFrame, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

- (id)outputData
{
  id v3;
  unint64_t v4;
  NSMutableArray *time;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_showTime)
  {
    v4 = -[NSMutableArray count](self->_time, "count");
    time = self->_time;
    if (v4 < 2)
    {
      if (-[NSMutableArray count](time, "count"))
      {
        -[NSMutableArray objectAtIndex:](self->_time, "objectAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:time"), self->_testName);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setValue:forKey:", v14, v15);

      }
      else
      {
        NSLog(CFSTR("No Time Data for %@!"), self->_testName);
      }
    }
    else
    {
      -[NSMutableArray valueForKeyPath:](time, "valueForKeyPath:", CFSTR("@avg.doubleValue"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("time:mean"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v6, v7);

      -[NSMutableArray valueForKeyPath:](self->_time, "valueForKeyPath:", CFSTR("@max.doubleValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("time:max"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v8, v9);

      -[NSMutableArray valueForKeyPath:](self->_time, "valueForKeyPath:", CFSTR("@min.doubleValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("time:min"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v10, v11);

      -[NSMutableArray objectAtIndex:](self->_time, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("time:first"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v12, v13);

    }
  }
  if (self->_showFps)
  {
    if ((unint64_t)-[NSMutableArray count](self->_fps, "count") < 2)
    {
      if (!-[NSMutableArray count](self->_fps, "count"))
      {
        NSLog(CFSTR("No FPS Data for %@!"), self->_testName);
        return v3;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:fps%@"), self->_testName, CFSTR("Units"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", CFSTR("fps"), v28);

      -[NSMutableArray objectAtIndex:](self->_fps, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:fps"), self->_testName);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v16, v29);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("fps:mean"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("Units"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", CFSTR("fps"), v17);

      -[NSMutableArray valueForKeyPath:](self->_fps, "valueForKeyPath:", CFSTR("@avg.doubleValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v18, v16);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("fps:max"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("Units"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", CFSTR("fps"), v20);

      -[NSMutableArray valueForKeyPath:](self->_fps, "valueForKeyPath:", CFSTR("@max.doubleValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v21, v19);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("fps:min"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingString:", CFSTR("Units"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", CFSTR("fps"), v23);

      -[NSMutableArray valueForKeyPath:](self->_fps, "valueForKeyPath:", CFSTR("@min.doubleValue"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v24, v22);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sub:%@:%@"), self->_testName, CFSTR("fps:first"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingString:", CFSTR("Units"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", CFSTR("fps"), v26);

      -[NSMutableArray objectAtIndex:](self->_fps, "objectAtIndex:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v27, v25);

    }
  }
  return v3;
}

@end
