@implementation SROSmartRepliesSuggestion

- (SROSmartRepliesSuggestion)initWithTitle:(id)a3 isDynamicSuggestion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SROSmartRepliesSuggestion *v7;
  _TtC12SmartReplies24SRSmartRepliesSuggestion *v8;
  _TtC12SmartReplies24SRSmartRepliesSuggestion *underlyingSuggestion;
  SROSmartRepliesSuggestion *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SROSmartRepliesSuggestion;
  v7 = -[SROSmartRepliesSuggestion init](&v12, sel_init);
  if (v7)
  {
    v8 = -[SRSmartRepliesSuggestion initWithTitle:isDynamicSuggestion:]([_TtC12SmartReplies24SRSmartRepliesSuggestion alloc], "initWithTitle:isDynamicSuggestion:", v6, v4);
    underlyingSuggestion = v7->_underlyingSuggestion;
    v7->_underlyingSuggestion = v8;

    v10 = v7;
  }

  return v7;
}

- (NSString)title
{
  return -[SRSmartRepliesSuggestion title](self->_underlyingSuggestion, "title");
}

- (BOOL)isDynamicSuggestion
{
  return -[SRSmartRepliesSuggestion isDynamicSuggestion](self->_underlyingSuggestion, "isDynamicSuggestion");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSuggestion, 0);
}

@end
