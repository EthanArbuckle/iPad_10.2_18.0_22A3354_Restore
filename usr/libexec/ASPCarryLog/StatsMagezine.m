@implementation StatsMagezine

- (StatsMagezine)initWithNandDriver:(id)a3
{
  id v5;
  StatsMagezine *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *statsDictDict;
  StatsMagezine *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)StatsMagezine;
  v6 = -[StatsMagezine init](&v11, "init");
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    statsDictDict = v6->_statsDictDict;
    v6->_statsDictDict = v7;

    objc_storeStrong((id *)&v6->_nandDriver, a3);
    v9 = v6;
  }

  return v6;
}

- (void)_lazyLoadStatsDict:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  if (!v7)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[StatsMagezine nandDriver](self, "nandDriver"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nandStats_get_hoursAgo:", v3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
}

- (float)_getStatsVal:(int64_t)a3 :(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  float v13;
  float v14;

  -[StatsMagezine _lazyLoadStatsDict:](self, "_lazyLoadStatsDict:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  v12 = objc_opt_class(NSNumber);
  v13 = 0.0;
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    objc_msgSend(v11, "floatValue");
    v13 = v14;
  }

  return v13;
}

- (float)_getStatsVal:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(int64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  float v18;
  void *v19;
  void *v20;
  uint64_t v21;
  float v22;

  -[StatsMagezine _lazyLoadStatsDict:](self, "_lazyLoadStatsDict:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

  v16 = objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v15, v16);
  v18 = 0.0;
  if (a4 <= a5 && (isKindOfClass & 1) != 0)
  {
    v19 = 0;
    while (1)
    {
      v20 = v19;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", a4));

      v21 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v19, v21) & 1) == 0)
        break;
      objc_msgSend(v19, "floatValue");
      v18 = v18 + v22;
      if (++a4 > a5)
        goto LABEL_8;
    }
    v18 = 0.0;
LABEL_8:

  }
  return v18;
}

- (float)getStatsDelta:(int64_t)a3 :(unsigned int)a4
{
  float v7;
  float v8;
  float v9;

  -[StatsMagezine _getStatsVal::](self, "_getStatsVal::", a3, 0);
  v8 = v7;
  if (a4)
  {
    -[StatsMagezine _getStatsVal::](self, "_getStatsVal::", a3, a4);
    return v8 - v9;
  }
  return v8;
}

- (float)getStatsDeltaForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(unsigned int)a6
{
  uint64_t v7;
  uint64_t v8;
  float v11;
  float v12;
  float v13;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  -[StatsMagezine _getStatsVal:startIdx:endIdx::](self, "_getStatsVal:startIdx:endIdx::", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
  v12 = v11;
  if (a6)
  {
    -[StatsMagezine _getStatsVal:startIdx:endIdx::](self, "_getStatsVal:startIdx:endIdx::", a3, v8, v7, a6);
    return v12 - v13;
  }
  return v12;
}

- (BOOL)doesStatIdExistOnDevice:(int64_t)a3 timeAgo:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;

  v4 = *(_QWORD *)&a4;
  -[StatsMagezine _lazyLoadStatsDict:](self, "_lazyLoadStatsDict:", *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
  v12 = objc_opt_class(NSNumber);
  isKindOfClass = objc_opt_isKindOfClass(v11, v12);

  return isKindOfClass & 1;
}

- (BOOL)doesStatIdExistOnDeviceForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 timeAgo:(unsigned int)a6
{
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (a4 <= a5)
  {
    v8 = *(_QWORD *)&a6;
    -[StatsMagezine _lazyLoadStatsDict:](self, "_lazyLoadStatsDict:", *(_QWORD *)&a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));

    v16 = objc_opt_class(NSArray);
    v6 = (objc_opt_isKindOfClass(v7, v16) & 1) != 0 && (unint64_t)objc_msgSend(v7, "count") > a5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  return v6;
}

- (NSMutableDictionary)statsDictDict
{
  return self->_statsDictDict;
}

- (void)setStatsDictDict:(id)a3
{
  objc_storeStrong((id *)&self->_statsDictDict, a3);
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
  objc_storeStrong((id *)&self->_nandDriver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nandDriver, 0);
  objc_storeStrong((id *)&self->_statsDictDict, 0);
}

@end
