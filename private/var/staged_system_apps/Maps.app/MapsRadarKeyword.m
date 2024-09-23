@implementation MapsRadarKeyword

+ (MapsRadarKeyword)keywordWithName:(id)a3 number:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithName:number:", v6, a4);

  return (MapsRadarKeyword *)v7;
}

- (MapsRadarKeyword)initWithName:(id)a3 number:(unint64_t)a4
{
  id v6;
  MapsRadarKeyword *v7;
  NSString *v8;
  NSString *name;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v6 = a3;
  if (!v6)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[MapsRadarKeyword initWithName:number:]";
      v19 = 2080;
      v20 = "MapsRadarKeyword.m";
      v21 = 1024;
      v22 = 31;
      v23 = 2080;
      v24 = "name != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)MapsRadarKeyword;
  v7 = -[MapsRadarKeyword init](&v16, "init");
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = v8;

    v7->_number = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_number));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class(MapsRadarKeyword);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = -[MapsRadarKeyword number](self, "number");
    v7 = v6 == objc_msgSend(v4, "number");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  MapsRadarKeyword *v2;
  id v3;
  void ***v4;
  MapsRadarKeyword *v5;
  MapsRadarKeyword *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1006EA5AC;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarKeyword _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarKeyword performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  MapsRadarKeyword *v2;
  id v3;
  void ***v4;
  MapsRadarKeyword *v5;
  MapsRadarKeyword *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1006EA72C;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[MapsRadarKeyword _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarKeyword performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;
  id v7;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_number));
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v6, CFSTR("number"), v7);

}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)number
{
  return self->_number;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
