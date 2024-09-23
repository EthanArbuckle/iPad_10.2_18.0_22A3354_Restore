@implementation SKUIComposeTextView

- (void)setPlaceholder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0DC1140];
  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "placeholderTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v7);
  -[SKUIComposeTextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:", v8);

}

@end
