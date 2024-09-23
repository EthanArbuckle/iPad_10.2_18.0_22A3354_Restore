@implementation BKPaginationJob

- (id)init:(unint64_t)a3
{
  BKPaginationJob *v4;
  BKPaginationJob *v5;

  v4 = -[BKJob init](self, "init");
  v5 = v4;
  if (v4)
    -[BKPaginationJob setJobGeneration:](v4, "setJobGeneration:", a3);
  return v5;
}

- (void)copyState:(id)a3
{
  -[BKPaginationJob setJobGeneration:](self, "setJobGeneration:", objc_msgSend(a3, "jobGeneration"));
}

- (unint64_t)jobGeneration
{
  return self->_jobGeneration;
}

- (void)setJobGeneration:(unint64_t)a3
{
  self->_jobGeneration = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

@end
