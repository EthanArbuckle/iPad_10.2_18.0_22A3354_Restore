@implementation NSExtension(PUEditPlugin)

- (uint64_t)pu_supportsMediaType:()PUEditPlugin
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "pu_supportedMediaTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsIndex:", a3);

  return v5;
}

- (id)pu_supportedMediaTypes
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PHSupportedMediaTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", CFSTR("Image")))
      objc_msgSend(v3, "addIndex:", 0);
    if (objc_msgSend(v4, "containsObject:", CFSTR("LivePhoto")))
      objc_msgSend(v3, "addIndex:", 1);
    if (objc_msgSend(v4, "containsObject:", CFSTR("LoopingVideo")))
      objc_msgSend(v3, "addIndex:", 3);
    if (objc_msgSend(v4, "containsObject:", CFSTR("Video")))
      objc_msgSend(v3, "addIndex:", 2);

  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

@end
