@implementation CLHealthAssessmentChoreaDetectionService

- (CLHealthAssessmentChoreaDetectionService)init
{
  CLHealthAssessmentChoreaDetectionService *v2;
  NSNotificationCenter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLHealthAssessmentChoreaDetectionService;
  v2 = -[CLHealthAssessmentChoreaDetectionService init](&v5, "init");
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", v2, "feedTremor:", off_1022FCAF8, 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  v3 = qword_102311048;
  if (qword_102311048)
  {
    sub_10047F660((_QWORD *)(qword_102311048 + 24648));
    sub_10047F660((_QWORD *)(v3 + 24592));
    operator delete();
  }
  qword_102311048 = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLHealthAssessmentChoreaDetectionService;
  -[CLHealthAssessmentChoreaDetectionService dealloc](&v4, "dealloc");
}

- (void)feedAccelSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4;

  v4 = a3;
  sub_100A3C038((unsigned __int16 *)qword_102311048, (uint64_t *)&v4, a4);
}

- (void)feedTremor:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unsigned __int32 v7;
  __n128 v8;
  int v9;

  v4 = objc_msgSend(a3, "name");
  if (objc_msgSend(v4, "isEqual:", off_1022FCAF8))
  {
    v5 = objc_msgSend(a3, "userInfo");
    v9 = 0;
    objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("time")), "doubleValue");
    v8.n128_u64[0] = v6;
    v8.n128_u32[2] = objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score")), "intValue");
    objc_msgSend(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displacement")), "floatValue");
    v8.n128_u32[3] = v7;
    sub_100A3C5A4((_QWORD *)qword_102311048, &v8);
  }
}

- (void)onResultAvailable:(ChoreaScore *)a3
{
  double v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v7[0] = CFSTR("time");
  v8[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var0);
  v7[1] = CFSTR("score");
  v8[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var1);
  v7[2] = CFSTR("likelihood");
  *(float *)&v5 = a3->var2;
  v8[2] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5);
  v7[3] = CFSTR("strength");
  *(float *)&v6 = a3->var3;
  v8[3] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6);
  v7[4] = CFSTR("tremorScore");
  v8[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var4);
  -[CLHealthAssessmentResultDelegate syncgetResultReady:ForAnalyzer:](-[CLHealthAssessmentChoreaDetectionService delegate](self, "delegate"), "syncgetResultReady:ForAnalyzer:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 5), 1);
}

- (CLHealthAssessmentResultDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHealthAssessmentResultDelegate *)a3;
}

@end
