@implementation Bokeh

+ (id)thumbnailImageName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "presetWallpaperOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("thumbnailImageName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)representativeThumbnailImageName
{
  return CFSTR("NewBokeh-Dark-Mixed_thumb");
}

+ (id)presetWallpaperOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  optionVariant(CFSTR("newmixedcolors"), CFSTR("NewBokeh-Dark-Mixed_thumb"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  optionVariant(CFSTR("newgreen"), CFSTR("NewBokeh-Dark-Green_thumb"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  optionVariant(CFSTR("newyellow"), CFSTR("NewBokeh-Dark-Yellow_thumb"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  optionVariant(CFSTR("neworange"), CFSTR("NewBokeh-Dark-Orange_thumb"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  optionVariant(CFSTR("newred"), CFSTR("NewBokeh-Dark-Red_thumb"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  optionVariant(CFSTR("newpurple"), CFSTR("NewBokeh-Dark-Purple_thumb"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  optionVariant(CFSTR("newblue"), CFSTR("NewBokeh-Dark-Blue_thumb"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObjectsFromArray:", v10, v18, v19, v20, v21, v22, v23);
  optionVariant(CFSTR("Yellow_v03"), CFSTR("NewBokeh-Light-Yellow_thumb"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  optionVariant(CFSTR("Green_v01"), CFSTR("NewBokeh-Light-Green_thumb"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  optionVariant(CFSTR("Red_v01"), CFSTR("NewBokeh-Light-Red_thumb"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13;
  optionVariant(CFSTR("Blue_v01"), CFSTR("NewBokeh-Light-Blue_thumb"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  optionVariant(CFSTR("Silver_v01"), CFSTR("NewBokeh-Light-Silver_thumb"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObjectsFromArray:", v16);
  objc_msgSend(v2, "addObjectsFromArray:", &unk_24D8FF540);
  return v2;
}

+ (id)identifier
{
  return CFSTR("Bokeh");
}

@end
