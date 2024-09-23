@implementation SearchUIWatchNowCardSection

+ (id)placeholderCardForMediaContainer:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIsPlaceholder:", 1);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTitle:", v5);

  if (v3)
    v6 = &stru_1EA1FB118;
  else
    v6 = CFSTR("\n");
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v7);

  return v4;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

@end
