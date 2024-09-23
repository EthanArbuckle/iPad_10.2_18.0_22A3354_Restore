@implementation CLHealthAssessmentTremorDetectionService

- (CLHealthAssessmentTremorDetectionService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHealthAssessmentTremorDetectionService;
  if (-[CLHealthAssessmentTremorDetectionService init](&v3, "init"))
    operator new();
  return 0;
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  v3 = qword_102314040;
  if (qword_102314040)
  {
    v4 = *(void **)(qword_102314040 + 12360);
    if (v4)
    {
      *(_QWORD *)(qword_102314040 + 12368) = v4;
      operator delete(v4);
    }
    v5 = *(void **)(v3 + 12312);
    if (v5)
    {
      *(_QWORD *)(v3 + 12320) = v5;
      operator delete(v5);
    }
    operator delete();
  }
  qword_102314040 = 0;
  v6.receiver = self;
  v6.super_class = (Class)CLHealthAssessmentTremorDetectionService;
  -[CLHealthAssessmentTremorDetectionService dealloc](&v6, "dealloc");
}

- (void)feedAccelSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4;

  v4 = a3;
  sub_10055D94C((unsigned __int16 *)qword_102314040, (uint64_t *)&v4, a4);
}

- (void)feedGyroSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4;

  v4 = a3;
  sub_10055DEB0((unsigned __int16 *)qword_102314040, (uint64_t *)&v4, a4);
}

- (void)onResultAvailable:(TremorScore *)a3
{
  double v5;
  double v6;
  _QWORD v7[4];
  _QWORD v8[4];

  v7[0] = CFSTR("time");
  v8[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3->var0);
  v7[1] = CFSTR("score");
  v8[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var1);
  v7[2] = CFSTR("displacement");
  *(float *)&v5 = a3->var2;
  v8[2] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5);
  v7[3] = CFSTR("freq");
  *(float *)&v6 = a3->var3;
  v8[3] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6);
  -[CLHealthAssessmentResultDelegate syncgetResultReady:ForAnalyzer:](-[CLHealthAssessmentTremorDetectionService delegate](self, "delegate"), "syncgetResultReady:ForAnalyzer:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4), 0);
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
