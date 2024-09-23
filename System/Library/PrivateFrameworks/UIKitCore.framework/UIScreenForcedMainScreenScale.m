@implementation UIScreenForcedMainScreenScale

void ___UIScreenForcedMainScreenScale_block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = *(double *)(a1 + 32);
  +[UIApplication _classicMode](UIApplication, "_classicMode");
  if (v1 <= 2.0 || dyld_program_sdk_at_least())
  {
    qword_1ECD799B8 = 0;
  }
  else
  {
    qword_1ECD799B8 = 0x4000000000000000;
    qword_1ECD799A8 = (uint64_t)_dyld_get_image_name(0);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", qword_1ECD799A8, 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByResolvingSymlinksInPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByDeletingLastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteString");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD799B0;
    qword_1ECD799B0 = v4;

  }
}

@end
