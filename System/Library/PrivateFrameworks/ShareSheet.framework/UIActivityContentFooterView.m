@implementation UIActivityContentFooterView

id __49___UIActivityContentFooterView__createEditButton__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC32A0]);

  return v2;
}

@end
