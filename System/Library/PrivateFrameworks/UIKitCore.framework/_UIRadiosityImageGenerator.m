@implementation _UIRadiosityImageGenerator

+ (id)sharedInstance
{
  if (qword_1ECD822C0 != -1)
    dispatch_once(&qword_1ECD822C0, &__block_literal_global_632);
  return (id)qword_1ECD822B8;
}

- (void)imageWithImage:(CGImage *)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  size_t Width;
  size_t Height;
  double v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  double v13;
  double v14;

  v5 = a4;
  v6 = v5;
  if (qword_1ECD822C8 == -1)
  {
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    dispatch_once(&qword_1ECD822C8, &__block_literal_global_1_20);
    if (!v6)
      goto LABEL_8;
  }
  if (a3)
  {
    if (_MergedGlobals_1307)
    {
      Width = CGImageGetWidth(a3);
      Height = CGImageGetHeight(a3);
      if (Width)
      {
        if (Height)
        {
          v9 = (double)Width;
          v10 = (void *)MEMORY[0x1E0D1A6C8];
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __63___UIRadiosityImageGenerator_imageWithImage_completionHandler___block_invoke_2;
          v11[3] = &unk_1E16E9EE0;
          v13 = v9;
          v14 = (double)Height;
          v12 = v6;
          objc_msgSend(v10, "radiosityImageWithImage:displayScale:completionHandler:", a3, 1, v11);

        }
      }
    }
  }
LABEL_8:

}

@end
