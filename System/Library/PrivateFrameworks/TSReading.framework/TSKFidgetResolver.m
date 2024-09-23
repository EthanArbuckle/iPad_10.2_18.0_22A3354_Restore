@implementation TSKFidgetResolver

- (TSKFidgetResolver)init
{
  TSKFidgetResolver *v2;
  TSKFidgetResolver *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKFidgetResolver;
  v2 = -[TSKFidgetResolver init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fidgetThreshold = 0.1;
    v2->_values = (id *)malloc_type_calloc(0xAuLL, 8uLL, 0x80040B8603338uLL);
    v3->_times = (double *)malloc_type_calloc(0xAuLL, 8uLL, 0x100004000313F17uLL);
    v3->_head = 9;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 0; i != 10; ++i)

  free(self->_values);
  free(self->_times);
  v4.receiver = self;
  v4.super_class = (Class)TSKFidgetResolver;
  -[TSKFidgetResolver dealloc](&v4, sel_dealloc);
}

- (id)nonFidgetValue
{
  double v3;
  unint64_t i;
  id result;
  double v6;
  unint64_t v8;

  v3 = CFAbsoluteTimeGetCurrent() - self->_fidgetThreshold;
  for (i = self->_head; ; i = v8)
  {
    result = self->_values[i];
    v6 = self->_times[i];
    if (!result || v6 <= v3)
      break;
    v8 = -[TSKFidgetResolver p_previousValidIndexFromIndex:](self, "p_previousValidIndexFromIndex:", v6);
    if (v8 == self->_head)
      return 0;
  }
  return result;
}

- (void)pushValue:(id)a3
{
  -[TSKFidgetResolver pushValue:withTime:](self, "pushValue:withTime:", a3, CFAbsoluteTimeGetCurrent());
}

- (void)pushValue:(id)a3 withTime:(double)a4
{
  id v7;

  -[TSKFidgetResolver p_advanceHead](self, "p_advanceHead");
  v7 = a3;

  self->_values[self->_head] = a3;
  self->_times[self->_head] = a4;
}

- (void)p_advanceHead
{
  unint64_t head;
  unint64_t v3;

  head = self->_head;
  if (head == 9)
    v3 = 0;
  else
    v3 = head + 1;
  self->_head = v3;
}

- (unint64_t)p_previousValidIndexFromIndex:(unint64_t)a3
{
  if (a3)
    return a3 - 1;
  else
    return 9;
}

- (double)fidgetThreshold
{
  return self->_fidgetThreshold;
}

- (void)setFidgetThreshold:(double)a3
{
  self->_fidgetThreshold = a3;
}

@end
