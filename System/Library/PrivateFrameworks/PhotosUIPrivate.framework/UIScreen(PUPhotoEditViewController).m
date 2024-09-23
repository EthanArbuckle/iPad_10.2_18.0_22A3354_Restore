@implementation UIScreen(PUPhotoEditViewController)

- (double)pu_workImageSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;
  CGSize v16;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "scale");
  v7 = v3 * v6;
  v8 = v5 * v6;
  if (v7 >= v8)
    v9 = v7;
  else
    v9 = v8;
  if (v9 <= 0.0)
  {
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16.width = v9;
      v16.height = v9;
      NSStringFromCGSize(v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Invalid work image size for photo editor: %@. Using default size.", (uint8_t *)&v13, 0xCu);

    }
    return 1200.0;
  }
  return v9;
}

@end
