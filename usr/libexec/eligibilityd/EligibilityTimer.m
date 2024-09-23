@implementation EligibilityTimer

- (EligibilityTimer)initWithSeconds:(unint64_t)a3
{
  EligibilityTimer *v4;
  EligibilityTimer *v5;
  NSDate *timeStart;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EligibilityTimer;
  v4 = -[EligibilityTimer init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    timeStart = v4->_timeStart;
    v4->_loadedTimeInSeconds = a3;
    v4->_timeStart = 0;

    v5->_enabled = 0;
  }
  return v5;
}

- (void)setDurationWithSeconds:(unint64_t)a3
{
  self->_loadedTimeInSeconds = a3;
}

- (void)enable
{
  -[EligibilityTimer setEnabled:](self, "setEnabled:", 1);
}

- (void)resume
{
  void *v3;
  id v4;

  if (-[EligibilityTimer enabled](self, "enabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));

    if (!v3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[EligibilityTimer setTimeStart:](self, "setTimeStart:", v4);

    }
  }
}

- (void)reset
{
  -[EligibilityTimer setTimeStart:](self, "setTimeStart:", 0);
  -[EligibilityTimer setEnabled:](self, "setEnabled:", 0);
}

- (BOOL)hasExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  if (!-[EligibilityTimer enabled](self, "enabled"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v6 = -v5 >= (double)-[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isActive
{
  void *v3;
  unsigned int v4;

  if (-[EligibilityTimer enabled](self, "enabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
    if (v3)
      v4 = !-[EligibilityTimer hasExpired](self, "hasExpired");
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds")));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("loadedTimeInSeconds"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("timeStart"));

  objc_msgSend(v6, "encodeBool:forKey:", -[EligibilityTimer enabled](self, "enabled"), CFSTR("enabled"));
}

- (EligibilityTimer)initWithCoder:(id)a3
{
  id v4;
  EligibilityTimer *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSDate *timeStart;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EligibilityTimer;
  v5 = -[EligibilityTimer init](&v12, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("loadedTimeInSeconds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_loadedTimeInSeconds = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("timeStart"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    timeStart = v5->_timeStart;
    v5->_timeStart = (NSDate *)v9;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setLoadedTimeInSeconds:", -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTimeStart:", v7);

  objc_msgSend(v5, "setEnabled:", -[EligibilityTimer enabled](self, "enabled"));
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5 ^ -[EligibilityTimer enabled](self, "enabled");
}

- (BOOL)isEqual:(id)a3
{
  EligibilityTimer *v4;
  uint64_t v5;
  EligibilityTimer *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  id v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;

  v4 = (EligibilityTimer *)a3;
  v18.receiver = self;
  v18.super_class = (Class)EligibilityTimer;
  if (-[EligibilityTimer isEqual:](&v18, "isEqual:", v4))
  {
    if (v4 == self)
    {
      v14 = 1;
      goto LABEL_18;
    }
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
      if (v7 == (id)-[EligibilityTimer loadedTimeInSeconds](v6, "loadedTimeInSeconds"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](v6, "timeStart"));
        v10 = sub_1000163A4(v8, v9);

        if ((v10 & 1) != 0)
        {
          v11 = -[EligibilityTimer enabled](self, "enabled");
          if (v11 == -[EligibilityTimer enabled](v6, "enabled"))
          {
            v14 = 1;
            goto LABEL_17;
          }
          v12 = sub_10000C5FC();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "-[EligibilityTimer isEqual:]";
            v21 = 2080;
            v22 = "enabled";
LABEL_15:
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
          }
        }
        else
        {
          v16 = sub_10000C5FC();
          v13 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "-[EligibilityTimer isEqual:]";
            v21 = 2080;
            v22 = "timeStart";
            goto LABEL_15;
          }
        }
      }
      else
      {
        v15 = sub_10000C5FC();
        v13 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[EligibilityTimer isEqual:]";
          v21 = 2080;
          v22 = "loadedTimeInSeconds";
          goto LABEL_15;
        }
      }

      v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  v3 = -[EligibilityTimer loadedTimeInSeconds](self, "loadedTimeInSeconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityTimer timeStart](self, "timeStart"));
  v5 = -[EligibilityTimer enabled](self, "enabled");
  v6 = CFSTR("N");
  if (v5)
    v6 = CFSTR("Y");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Timer loadedTime: %lu(seconds), timeStart: %@, enabled: %@>"), v3, v4, v6));

  return v7;
}

- (unint64_t)loadedTimeInSeconds
{
  return self->_loadedTimeInSeconds;
}

- (void)setLoadedTimeInSeconds:(unint64_t)a3
{
  self->_loadedTimeInSeconds = a3;
}

- (NSDate)timeStart
{
  return self->_timeStart;
}

- (void)setTimeStart:(id)a3
{
  objc_storeStrong((id *)&self->_timeStart, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStart, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
