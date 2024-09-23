@implementation UIImage(STImageAdditions)

- (id)iconFromPrecomposedImage:()STImageAdditions platform:
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  switch(a4)
  {
    case 0:
    case 2:
      objc_msgSend(a1, "_applicationIconImageForFormat:precomposed:", 0, a3);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 1:
    case 3:
      objc_msgSend(a1, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v5 = (void *)v4;
      break;
    case 4:
      v6 = objc_retainAutorelease(a1);
      v7 = objc_msgSend(v6, "CGImage");
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v6, "traitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayScale");
        v11 = v10;

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A80]), "initWithCGImage:scale:", v8, v11);
        v13 = objc_alloc(MEMORY[0x24BE51A90]);
        v23[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithImages:", v14);

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 29.0, 29.0, v11);
        objc_msgSend(v16, "setShape:", 2);
        v22 = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "prepareImagesForImageDescriptors:", v17);

        v18 = objc_msgSend(v15, "CGImageForDescriptor:", v16);
        objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
      if (v19)
        v20 = v19;
      else
        v20 = v6;
      objc_msgSend(v20, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)iconWithAppBundleID:()STImageAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDF6D38];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(a1, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)iconWithAppURL:()STImageAdditions
{
  return 0;
}

+ (id)blankIcon
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE51A90], "genericApplicationIcon");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 29.0, 29.0, 2.0);
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "prepareImagesForImageDescriptors:", v2);

  v3 = objc_msgSend(v0, "CGImageForDescriptor:", v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v3, 0, 2.0);

  return v4;
}

+ (id)blankSpaceImageWithSize:()STImageAdditions
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", a1, a2);
  objc_msgSend(v2, "imageWithActions:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
