@implementation WFTTSPause

- (WFTTSPause)initWithSeconds:(double)a3
{
  WFTTSPause *v5;
  uint64_t v6;
  NSNumber *seconds;
  WFTTSPause *v8;
  void *v11;
  objc_super v12;

  if (a3 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTTSString.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("seconds"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFTTSPause;
  v5 = -[WFTTSPause init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    seconds = v5->_seconds;
    v5->_seconds = (NSNumber *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFTTSPause seconds](self, "seconds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seconds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTTSPause;
  -[WFTTSPause description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTTSPause seconds](self, "seconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": seconds %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSNumber)seconds
{
  return self->_seconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seconds, 0);
}

+ (id)parseAnnotationString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  double v10;

  v10 = 0.0;
  v4 = (objc_class *)MEMORY[0x1E0CB3900];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  v7 = 0;
  if (objc_msgSend(v6, "scanString:intoString:", CFSTR("pauseForSeconds:"), 0))
  {
    if (objc_msgSend(v6, "scanDouble:", &v10) && objc_msgSend(v6, "isAtEnd"))
    {
      v8 = objc_alloc((Class)a1);
      v7 = (void *)objc_msgSend(v8, "initWithSeconds:", v10);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end
