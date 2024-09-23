@implementation EDPhoneticRun

- (EDPhoneticRun)init
{
  EDPhoneticRun *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPhoneticRun;
  result = -[EDPhoneticRun init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->mCharIndex = -1;
    result->mBaseCharCount = 0;
  }
  return result;
}

- (unsigned)charIndex
{
  return self->mCharIndex;
}

- (void)adjustIndex:(unint64_t)a3
{
  *(int32x2_t *)&self->mCharIndex = vadd_s32(*(int32x2_t *)&self->mCharIndex, vdup_n_s32(a3));
}

- (void)setCharIndex:(unsigned int)a3
{
  self->mCharIndex = a3;
}

- (unsigned)charBaseIndex
{
  return self->mBaseCharIndex;
}

- (void)setCharBaseIndex:(unsigned int)a3
{
  self->mBaseCharIndex = a3;
}

- (unsigned)charBaseCount
{
  return self->mBaseCharCount;
}

- (void)setCharBaseCount:(unsigned int)a3
{
  self->mBaseCharCount = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPhoneticRun;
  -[EDPhoneticRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
