@implementation UIFont(Weather)

- (id)wa_bold
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorWithSymbolicTraits:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
