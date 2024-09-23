@implementation TPSPhoneNumberEditingPane

- (void)setPreferenceSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)TPSPhoneNumberEditingPane;
  -[PSTextEditingPane setPreferenceSpecifier:](&v7, sel_setPreferenceSpecifier_, a3);
  v4 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80610]);
  objc_msgSend(v4, "setAutocorrectionType:", 1);
  objc_msgSend(v4, "setAutoresizesTextToFit:", 1);
  objc_msgSend(v4, "setClearButtonMode:", 0);
  v8 = *MEMORY[0x1E0DC1258];
  v9[0] = &unk_1EA2D7CF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultTextAttributes:", v5);

  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(v4, "setKeyboardType:", 5);
  objc_msgSend(v4, "setReturnKeyType:", 9);
  objc_msgSend(v4, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentsIsSingleValue:", 1);

  objc_msgSend(v4, "setTextSuggestionDelegate:", self);
}

- ($629251E1A16707720BAFC5477F2E46A8)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  id v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  $629251E1A16707720BAFC5477F2E46A8 result;

  v5 = a3;
  -[TPSPhoneNumberEditingPane previousStringSuggestion](self, "previousStringSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    -[TPSPhoneNumberEditingPane previousStringSuggestion](self, "previousStringSuggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)UIPhoneNumberSuggestionForString();
    v8 = v11;

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSPhoneNumberEditingPane setPreviousStringSuggestion:](self, "setPreviousStringSuggestion:", v12);

    }
  }

  v13 = v9;
  v14 = v8;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (NSString)previousStringSuggestion
{
  return self->_previousStringSuggestion;
}

- (void)setPreviousStringSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousStringSuggestion, 0);
}

@end
