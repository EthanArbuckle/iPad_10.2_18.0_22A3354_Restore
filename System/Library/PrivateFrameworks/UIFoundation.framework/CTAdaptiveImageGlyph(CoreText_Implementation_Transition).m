@implementation CTAdaptiveImageGlyph(CoreText_Implementation_Transition)

- (id)_configuredFileWrapperForAttributes:()CoreText_Implementation_Transition
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  if (a3)
  {
    objc_msgSend(a1, "_fileWrapperForAttributes:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "contentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFilenameExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "contentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("AdaptiveImageGlyph-"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v8, "stringByAppendingPathExtension:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v10 = objc_alloc(MEMORY[0x1E0CB3650]);
    objc_msgSend(a1, "imageContent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v10, "initRegularFileWithContents:", v11);

    objc_msgSend(v4, "setPreferredFilename:", v8);
  }
  return v4;
}

@end
