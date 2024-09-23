@implementation NSAttributedString(NSAttributedStringAdaptiveImageGlyphConveniences)

+ (id)attributedStringWithAdaptiveImageGlyph:()NSAttributedStringAdaptiveImageGlyphConveniences attributes:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("CTAdaptiveImageProvider"));

  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3498], "_sharedAttachmentString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v6);

  return v9;
}

@end
