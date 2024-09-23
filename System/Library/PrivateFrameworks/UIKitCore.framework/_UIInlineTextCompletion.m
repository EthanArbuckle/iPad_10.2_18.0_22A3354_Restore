@implementation _UIInlineTextCompletion

+ (id)inlineTextCompletion:(id)a3 source:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCompletion:source:", v6, v5);

  return v7;
}

- (_UIInlineTextCompletion)initWithCompletion:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  _UIInlineTextCompletion *v8;
  uint64_t v9;
  TIKeyboardCandidate *completion;
  uint64_t v11;
  TIKeyboardCandidate *source;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIInlineTextCompletion;
  v8 = -[_UIInlineTextCompletion init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    completion = v8->_completion;
    v8->_completion = (TIKeyboardCandidate *)v9;

    v11 = objc_msgSend(v7, "copy");
    source = v8->_source;
    v8->_source = (TIKeyboardCandidate *)v11;

  }
  return v8;
}

- (NSString)candidate
{
  void *v2;
  void *v3;

  -[_UIInlineTextCompletion completion](self, "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)input
{
  void *v2;
  void *v3;

  -[_UIInlineTextCompletion completion](self, "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TIKeyboardCandidate)completion
{
  return self->_completion;
}

- (TIKeyboardCandidate)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_completion, 0);
}

@end
