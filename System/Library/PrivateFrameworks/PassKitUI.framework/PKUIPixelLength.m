@implementation PKUIPixelLength

double __PKUIPixelLength_block_invoke()
{
  double result;

  if (qword_1ED06C668 != -1)
    dispatch_once(&qword_1ED06C668, &__block_literal_global_204);
  result = 1.0 / *(double *)&qword_1ED06C660;
  *(double *)&qword_1ED06C670 = 1.0 / *(double *)&qword_1ED06C660;
  return result;
}

@end
