@implementation SearchUILabel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfText, 0);
}

- (void)setSfText:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_sfText, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKLabel setRichText:](self, "setRichText:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_opt_new();
      +[SearchUITLKMultilineTextConverter formattedTextForSearchUIText:](SearchUITLKMultilineTextConverter, "formattedTextForSearchUIText:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
      {
        v10[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFormattedTextItems:", v9);

      }
      else
      {
        objc_msgSend(v6, "setFormattedTextItems:", 0);
      }
      -[TLKLabel setRichText:](self, "setRichText:", v6);

    }
    else
    {
      +[SearchUITLKMultilineTextConverter textForSearchUIText:](SearchUITLKMultilineTextConverter, "textForSearchUIText:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKLabel setMultilineText:](self, "setMultilineText:", v6);
    }
  }

}

- (SFText)sfText
{
  return self->_sfText;
}

@end
