@implementation UIAdaptLocalizedStringForView

void ___UIAdaptLocalizedStringForView_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  const __CFAttributedString *v3;
  const __CTLine *v4;
  const __CTLine *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E167A828, "defaultFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0CB3498]);
  v6 = *(_QWORD *)off_1E1678D90;
  v7[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __CFAttributedString *)objc_msgSend(v1, "initWithString:attributes:", CFSTR("M"), v2);

  v4 = CTLineCreateWithAttributedString(v3);
  if (v4)
  {
    v5 = v4;
    qword_1EDDC8378 = CTLineGetTypographicBounds(v4, 0, 0, 0);
    CFRelease(v5);
  }

}

@end
