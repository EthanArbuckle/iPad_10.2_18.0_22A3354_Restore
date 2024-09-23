@implementation CRLCurvedShadowBlurBlendFilter

+ (id)blurBlendKernel
{
  if (qword_101414F28 != -1)
    dispatch_once(&qword_101414F28, &stru_10123F7B0);
  return (id)qword_101414F20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputMiddleOpacity, 0);
  objc_storeStrong((id *)&self->inputEdgeOpacity, 0);
  objc_storeStrong((id *)&self->inputPadding, 0);
  objc_storeStrong((id *)&self->inputExtent, 0);
  objc_storeStrong((id *)&self->inputMiddleBlurImage, 0);
  objc_storeStrong((id *)&self->inputInterpBlurImage, 0);
  objc_storeStrong((id *)&self->inputEdgeBlurImage, 0);
}

@end
