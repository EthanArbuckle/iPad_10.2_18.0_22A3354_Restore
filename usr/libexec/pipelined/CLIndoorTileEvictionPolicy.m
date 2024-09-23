@implementation CLIndoorTileEvictionPolicy

- (CLIndoorTileEvictionPolicy)init
{
  CLIndoorTileEvictionPolicy *v2;
  CLIndoorTileEvictionPolicy *v3;
  OS_xpc_object *activity;
  CLIndoorTileEvictionPolicy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLIndoorTileEvictionPolicy;
  v2 = -[CLIndoorTileEvictionPolicy init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_forceClean = 0;
    activity = v2->_activity;
    v2->_maxModifiedAge = 604800.0;
    v2->_activity = 0;

    v5 = v3;
  }

  return v3;
}

- (BOOL)tileLastModified:(double)a3 needsEvictionAt:(double)a4
{
  NSObject *v7;
  double v8;
  double maxModifiedAge;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  _BOOL4 v20;

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_1003FBEF0);
    v7 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_3;
LABEL_5:
    v8 = a4 - a3;
    return v8 >= self->_maxModifiedAge;
  }
  v7 = qword_100417F00;
  if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
    goto LABEL_5;
LABEL_3:
  v8 = a4 - a3;
  maxModifiedAge = self->_maxModifiedAge;
  v11 = 134350080;
  v12 = a4;
  v13 = 2050;
  v14 = a3;
  v15 = 2050;
  v16 = a4 - a3;
  v17 = 2050;
  v18 = maxModifiedAge;
  v19 = 1024;
  v20 = a4 - a3 >= maxModifiedAge;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "@EvictCheck, modified, %{public}.1f, %{public}.1f, ages, %{public}.1f, %{public}.1f, evict, %d", (uint8_t *)&v11, 0x30u);
  return v8 >= self->_maxModifiedAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorTileEvictionPolicy)initWithCoder:(id)a3
{
  id v4;
  CLIndoorTileEvictionPolicy *v5;
  double v6;
  OS_xpc_object *activity;
  CLIndoorTileEvictionPolicy *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLIndoorTileEvictionPolicy;
  v5 = -[CLIndoorTileEvictionPolicy init](&v10, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_maxModifiedAge"));
    v5->_maxModifiedAge = v6;
    v5->_forceClean = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_forceClean"));
    activity = v5->_activity;
    v5->_activity = 0;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_maxModifiedAge"), self->_maxModifiedAge);
  v4 = 0.0;
  if (self->_forceClean)
    v4 = 1.0;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_forceClean"), v4);

}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_forceClean)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_activity)
    v2 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CLIndoorTileEvictionPolicy[maxModifiedAge=%lfs,forceClean=%@,xpc_activity=%@]"), *(_QWORD *)&self->_maxModifiedAge, v3, v2);
}

- (double)maxModifiedAge
{
  return self->_maxModifiedAge;
}

- (void)setMaxModifiedAge:(double)a3
{
  self->_maxModifiedAge = a3;
}

- (BOOL)forceClean
{
  return self->_forceClean;
}

- (void)setForceClean:(BOOL)a3
{
  self->_forceClean = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

@end
