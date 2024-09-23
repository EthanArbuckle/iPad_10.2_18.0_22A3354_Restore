@implementation NSAttributedString(VideosExtras)

+ (id)attributedStringWithTextElement:()VideosExtras baseFont:
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "attributedStringWithFont:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = &stru_1E9FF3598;
  v9 = -[__CFString length](v8, "length");
  objc_msgSend(v5, "textAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
  objc_msgSend(v11, "addAttributes:range:", v10, 0, v9);

  return v11;
}

@end
