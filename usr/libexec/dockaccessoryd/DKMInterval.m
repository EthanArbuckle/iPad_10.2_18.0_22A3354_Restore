@implementation DKMInterval

+ (void)initialize
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_opt_self(DKMInterval, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = (void *)qword_100271700;
    qword_100271700 = (uint64_t)&off_100245868;

    v6 = (void *)qword_100271708;
    qword_100271708 = (uint64_t)&off_100245878;

  }
}

+ (NSNumber)negativeInfinityStart
{
  return (NSNumber *)(id)qword_100271708;
}

+ (NSNumber)positiveInfinityEnd
{
  return (NSNumber *)(id)qword_100271700;
}

+ (id)openOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DKMInterval initFromStart:toEnd:]([DKMOpenOpenInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)openClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DKMInterval initFromStart:toEnd:]([DKMOpenClosedInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)closedOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DKMInterval initFromStart:toEnd:]([DKMClosedOpenInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)closedClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DKMInterval initFromStart:toEnd:]([DKMClosedClosedInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)intervalForSingleValue:(id)a3
{
  return _objc_msgSend(a1, "closedClosedIntervalFromStart:toEnd:", a3, a3);
}

- (id)initFromStart:(id)a3 toEnd:(id)a4
{
  id v7;
  id v8;
  DKMInterval *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKMInterval;
  v9 = -[DKMInterval init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSString)standardIntervalString
{
  return 0;
}

- (NSString)negativeInfinityIntervalString
{
  return 0;
}

- (NSString)positiveInfinityIntervalString
{
  return 0;
}

- (NSString)allNumbersIntervalString
{
  return (NSString *)CFSTR("All");
}

- (id)labelString
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval start](self, "start"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval end](self, "end"));
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval start](self, "start"));
  v7 = v6;
  if (!v5)
  {
    v9 = objc_msgSend(v6, "isEqualToNumber:", qword_100271708);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval end](self, "end"));
    v11 = objc_msgSend(v10, "isEqualToNumber:", qword_100271700);

    if (v9)
    {
      if (v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval allNumbersIntervalString](self, "allNumbersIntervalString"));
        return v8;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval negativeInfinityIntervalString](self, "negativeInfinityIntervalString"));
      v13 = objc_claimAutoreleasedReturnValue(-[DKMInterval end](self, "end"));
    }
    else
    {
      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval standardIntervalString](self, "standardIntervalString"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval start](self, "start"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval end](self, "end"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@ %@"), 0, v14, v15));

        goto LABEL_11;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DKMInterval positiveInfinityIntervalString](self, "positiveInfinityIntervalString"));
      v13 = objc_claimAutoreleasedReturnValue(-[DKMInterval start](self, "start"));
    }
    v14 = (void *)v13;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13));
LABEL_11:

    return v8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));

  return v8;
}

- (id)description
{
  return -[DKMInterval labelString](self, "labelString");
}

- (NSNumber)start
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)end
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
