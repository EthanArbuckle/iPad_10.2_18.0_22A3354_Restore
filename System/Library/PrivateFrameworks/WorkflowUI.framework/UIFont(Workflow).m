@implementation UIFont(Workflow)

+ (uint64_t)workflowsFooterFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
}

+ (uint64_t)setupFlowButtonFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 15.0);
}

+ (uint64_t)setupFlowFieldFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
}

+ (id)galleryCollectionTitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)galleryCollectionSubtitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)galleryWorkflowNameFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 18.0, *MEMORY[0x24BEBB610]);
}

+ (uint64_t)galleryWorkflowDescriptionFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 14.0, *MEMORY[0x24BEBB608]);
}

+ (uint64_t)galleryCollectionSeeAllButtonFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
}

+ (id)gallerySearchCollectionTitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE250]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)gallerySearchCollectionSubtitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)galleryCardDescriptionFont
{
  return objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
}

+ (id)gallerySuggestionTextFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)chicletTitleFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 32770);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)chicletDescriptionFont
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
