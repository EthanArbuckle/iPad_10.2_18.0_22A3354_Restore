@implementation TSUCustomFormatWrapper

- (TSUCustomFormatWrapper)initWithCustomFormat:(void *)a3
{
  TSUCustomFormatWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUCustomFormatWrapper;
  result = -[TSUCustomFormatWrapper init](&v5, sel_init);
  if (result)
    result->mCustomFormat = a3;
  return result;
}

- (const)pointerToTSUCustomFormat
{
  return self->mCustomFormat;
}

- (id)formatName
{
  return (id)TSUCustomFormat::formatName((TSUCustomFormat *)self->mCustomFormat);
}

- (int)formatType
{
  return TSUCustomFormat::type((TSUCustomFormat *)self->mCustomFormat);
}

- (const)defaultFormatData
{
  return (const $541BF66048AE1D4B37D4F3D49CF3468B *)TSUCustomFormat::defaultFormatData((TSUCustomFormat *)self->mCustomFormat);
}

- (const)conditionalFormatDataForValue:(double)a3
{
  return (const $541BF66048AE1D4B37D4F3D49CF3468B *)TSUCustomFormat::formatByEvaluatingConditionsWithDouble((TSUCustomFormat *)self->mCustomFormat, a3);
}

@end
