@implementation CAFilter(PhotosUICore)

+ (id)px_filterWithPXCompositingFilterType:()PhotosUICore
{
  id v3;
  void *v4;

  if (a3 != 1)
  {
    v3 = 0;
    goto LABEL_5;
  }
  v3 = (id)*MEMORY[0x1E0CD2C30];
  if (!v3)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v4;
}

@end
