@implementation VUIImageResourceMap

+ (id)imageForResourceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0DB1878], "sharedInterfaceFactory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_resourceImageNamed:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
