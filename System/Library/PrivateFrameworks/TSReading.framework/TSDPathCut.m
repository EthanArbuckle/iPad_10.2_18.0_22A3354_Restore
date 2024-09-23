@implementation TSDPathCut

- (TSDPathCut)initWithSegment:(int64_t)a3 atT:(double)a4 withSkew:(double)a5
{
  TSDPathCut *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDPathCut;
  result = -[TSDPathCut init](&v9, sel_init);
  if (result)
  {
    result->mSegment = a3;
    result->mT = a4;
    result->mSkew = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cut on seg %ld at %f skew %f"), self->mSegment, *(_QWORD *)&self->mT, *(_QWORD *)&self->mSkew);
}

- (int64_t)segment
{
  return self->mSegment;
}

- (double)t
{
  return self->mT;
}

- (double)skew
{
  return self->mSkew;
}

@end
