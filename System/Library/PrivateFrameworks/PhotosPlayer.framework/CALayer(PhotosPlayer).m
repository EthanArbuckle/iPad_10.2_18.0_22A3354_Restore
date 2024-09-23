@implementation CALayer(PhotosPlayer)

- (void)is_setBlurRadius:()PhotosPlayer
{
  id v4;

  objc_msgSend(a1, "is_addBlurFilterIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKeyPath:", v4, CFSTR("filters.LivePhotoBlur.inputRadius"));

}

- (double)is_blurRadius
{
  void *v1;
  float v2;
  double v3;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("filters.LivePhotoBlur.inputRadius"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (uint64_t)_is_setBlurFilter:()PhotosPlayer
{
  return objc_msgSend(a1, "setValue:forKeyPath:", a3, CFSTR("filters.LivePhotoBlur"));
}

- (uint64_t)_is_blurFilter
{
  return objc_msgSend(a1, "valueForKeyPath:", CFSTR("filters.LivePhotoBlur"));
}

- (void)is_addBlurFilterIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_is_blurFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", CFSTR("LivePhotoBlur"));
    objc_msgSend(v3, "setCachesInputImage:", 0);
    objc_msgSend(v3, "setValue:forKey:", &unk_1E945FD28, CFSTR("inputRadius"));
    objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputHardEdges"));
    objc_msgSend(v3, "setValue:forKey:", CFSTR("medium"), CFSTR("inputQuality"));
    objc_msgSend(a1, "_is_setBlurFilter:", v3);
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v8 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    objc_msgSend(a1, "setFilters:", v4);

  }
}

- (void)is_addFilter:()PhotosPlayer
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
  {
    if (v5)
    {
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    else
    {
      v8 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "setFilters:", v5);
  }

}

- (void)is_removeFilter:()PhotosPlayer
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "removeObject:", v8);
    v7 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(a1, "setFilters:", v7);
  }

}

- (void)_is_removeBlurFilterIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_is_blurFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "_is_blurFilter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "removeObject:", v5);
    objc_msgSend(a1, "setFilters:", v4);
    objc_msgSend(a1, "_is_setBlurFilter:", 0);

  }
}

@end
