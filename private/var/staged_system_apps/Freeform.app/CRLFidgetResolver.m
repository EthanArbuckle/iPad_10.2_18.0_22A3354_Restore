@implementation CRLFidgetResolver

- (CRLFidgetResolver)init
{
  CRLFidgetResolver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLFidgetResolver;
  result = -[CRLFidgetResolver init](&v3, "init");
  if (result)
  {
    result->_fidgetThreshold = 0.1;
    result->_head = 9;
  }
  return result;
}

- (id)nonFidgetValue
{
  double v3;
  unint64_t head;
  id v5;
  void *v6;
  double v7;
  BOOL v8;
  id v9;
  unint64_t v10;
  BOOL v11;

  v3 = CFAbsoluteTimeGetCurrent() - self->_fidgetThreshold;
  head = self->_head;
  v5 = self->_values[head];
  v6 = v5;
  v7 = self->_times[self->_head];
  if (v5)
    v8 = v7 <= v3;
  else
    v8 = 1;
  if (v8)
  {
    v9 = v5;
  }
  else
  {
    while (1)
    {
      v10 = -[CRLFidgetResolver p_previousValidIndexFromIndex:](self, "p_previousValidIndexFromIndex:", head, v7);
      if (v10 == self->_head)
        break;
      head = v10;
      v9 = self->_values[v10];

      v7 = self->_times[head];
      if (v9)
        v11 = v7 <= v3;
      else
        v11 = 1;
      v6 = v9;
      if (v11)
        return v9;
    }

    v9 = 0;
  }
  return v9;
}

- (void)pushValue:(id)a3
{
  id v4;

  v4 = a3;
  -[CRLFidgetResolver pushValue:withTime:](self, "pushValue:withTime:", v4, CFAbsoluteTimeGetCurrent());

}

- (void)pushValue:(id)a3 withTime:(double)a4
{
  objc_class *v6;
  Class *v7;
  Class v8;

  v6 = (objc_class *)a3;
  -[CRLFidgetResolver p_advanceHead](self, "p_advanceHead");
  v7 = &self->super.isa + self->_head;
  v8 = v7[2];
  v7[2] = v6;

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

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 88; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

@end
