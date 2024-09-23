@implementation UILabel

uint64_t __72__UILabel_Truncation__px_isTruncatedForAttributedString_forWidth_lines___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0DC3990]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)px_isTruncatedForAttributedString_forWidth_lines__label;
  px_isTruncatedForAttributedString_forWidth_lines__label = v1;

  return objc_msgSend((id)px_isTruncatedForAttributedString_forWidth_lines__label, "setNumberOfLines:", 0);
}

@end
