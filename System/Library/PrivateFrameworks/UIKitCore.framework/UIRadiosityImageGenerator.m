@implementation UIRadiosityImageGenerator

void __44___UIRadiosityImageGenerator_sharedInstance__block_invoke()
{
  _UIRadiosityImageGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(_UIRadiosityImageGenerator);
  v1 = (void *)qword_1ECD822B8;
  qword_1ECD822B8 = (uint64_t)v0;

}

uint64_t __63___UIRadiosityImageGenerator_imageWithImage_completionHandler___block_invoke()
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_respondsToSelector();
  _MergedGlobals_1307 = result & 1;
  return result;
}

uint64_t __63___UIRadiosityImageGenerator_imageWithImage_completionHandler___block_invoke_2(uint64_t a1, CGImageRef image)
{
  double Width;
  size_t Height;

  Width = (double)CGImageGetWidth(image);
  Height = CGImageGetHeight(image);
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(Width / *(double *)(a1 + 40), (double)Height / *(double *)(a1 + 48));
}

@end
