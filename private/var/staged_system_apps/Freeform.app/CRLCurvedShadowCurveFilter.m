@implementation CRLCurvedShadowCurveFilter

+ (id)curveKernel
{
  if (qword_101414F18 != -1)
    dispatch_once(&qword_101414F18, &stru_10123F790);
  return (id)qword_101414F10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputCurveAmount, 0);
  objc_storeStrong((id *)&self->inputPadding, 0);
  objc_storeStrong((id *)&self->inputExtent, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
