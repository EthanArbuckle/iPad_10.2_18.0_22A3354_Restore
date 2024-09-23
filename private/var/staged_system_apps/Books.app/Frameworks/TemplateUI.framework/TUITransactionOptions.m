@implementation TUITransactionOptions

- (TUITransactionOptions)initWithOther:(id)a3
{
  id v4;
  TUITransactionOptions *v5;
  double v6;
  double v7;
  void *v8;
  NSString *v9;
  NSString *identifier;
  void *v11;
  UITimingCurveProvider *v12;
  UITimingCurveProvider *timingProvider;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUITransactionOptions;
  v5 = -[TUITransactionOptions init](&v15, "init");
  if (v5)
  {
    v5->_animate = objc_msgSend(v4, "animate");
    objc_msgSend(v4, "duration");
    v5->_duration = v6;
    objc_msgSend(v4, "syncTimeout");
    v5->_syncTimeout = v7;
    v5->_flags = (unint64_t)objc_msgSend(v4, "flags");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v9 = (NSString *)objc_msgSend(v8, "copy");
    identifier = v5->_identifier;
    v5->_identifier = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timingProvider"));
    v12 = (UITimingCurveProvider *)objc_msgSend(v11, "copyWithZone:", 0);
    timingProvider = v5->_timingProvider;
    v5->_timingProvider = v12;

  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUITransactionOptions initWithOther:](+[TUIMutableTransactionOptions allocWithZone:](TUIMutableTransactionOptions, "allocWithZone:", a3), "initWithOther:", self);
}

+ (id)defaultImplicitOptions
{
  TUIMutableTransactionOptions *v2;
  id v3;

  v2 = objc_alloc_init(TUIMutableTransactionOptions);
  -[TUITransactionOptions setDuration:](v2, "setDuration:", 0.25);
  -[TUITransactionOptions setAnimate:](v2, "setAnimate:", 1);
  v3 = -[TUIMutableTransactionOptions copy](v2, "copy");

  return v3;
}

+ (id)noAnimationOptions
{
  return objc_alloc_init(TUITransactionOptions);
}

- (BOOL)isCompatibleWithOptions:(id)a3
{
  id v4;
  int animate;
  double duration;
  double v7;
  UITimingCurveProvider *timingProvider;
  UITimingCurveProvider *v9;
  UITimingCurveProvider *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = a3;
  animate = self->_animate;
  if (animate == objc_msgSend(v4, "animate")
    && (duration = self->_duration, objc_msgSend(v4, "duration"), duration == v7))
  {
    timingProvider = self->_timingProvider;
    v9 = (UITimingCurveProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timingProvider"));
    if (timingProvider == v9)
    {
      v12 = 1;
    }
    else
    {
      v10 = self->_timingProvider;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timingProvider"));
      v12 = -[UITimingCurveProvider isEqual:](v10, "isEqual:", v11);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  NSMutableString *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("<%@"), v7);

  if (self->_identifier)
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" id=%@"), self->_identifier);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" animate=%lu"), self->_animate);
  if (self->_animate)
  {
    if (self->_duration == 0.25
      || (-[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" duration=%g"), *(_QWORD *)&self->_duration),
          self->_animate))
    {
      if (self->_timingProvider)
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" timingProvider=%@"), self->_timingProvider);
    }
  }
  if (self->_flags)
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" flags=%lu"), self->_flags);
  if (self->_syncTimeout != 0.0)
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" syncTimeout=%g"), *(_QWORD *)&self->_syncTimeout);
  -[NSMutableString appendString:](v3, "appendString:", CFSTR(">"));
  v8 = -[NSMutableString copy](v3, "copy");

  return v8;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_animate = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)syncTimeout
{
  return self->_syncTimeout;
}

- (void)setSyncTimeout:(double)a3
{
  self->_syncTimeout = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UITimingCurveProvider)timingProvider
{
  return self->_timingProvider;
}

- (void)setTimingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_timingProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
