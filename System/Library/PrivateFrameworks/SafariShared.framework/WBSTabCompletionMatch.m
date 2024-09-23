@implementation WBSTabCompletionMatch

- (WBSTabCompletionMatch)initWithUserTypedString:(id)a3 url:(id)a4 title:(id)a5 forQueryID:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  WBSURLCompletionUserTypedString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  NSString *title;
  WBSTabCompletionMatch *v20;
  objc_super v22;

  v11 = a4;
  v12 = a5;
  v13 = a3;
  v14 = -[WBSURLCompletionUserTypedString initWithString:]([WBSURLCompletionUserTypedString alloc], "initWithString:", v13);

  v15 = objc_msgSend((id)objc_opt_class(), "_matchLocationForString:url:title:", v14, v11, v12);
  if (v15 >= 5
    && (v16 = v15,
        -[WBSURLCompletionUserTypedString normalizedString](v14, "normalizedString"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v22.receiver = self,
        v22.super_class = (Class)WBSTabCompletionMatch,
        self = -[WBSURLCompletionMatch initWithMatchLocation:userInput:forQueryID:](&v22, sel_initWithMatchLocation_userInput_forQueryID_, v16, v17, a6), v17, self))
  {
    objc_storeStrong((id *)&self->_url, a4);
    v18 = (NSString *)objc_msgSend(v12, "copy");
    title = self->_title;
    self->_title = v18;

    self = self;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)originalURLString
{
  return -[NSURL safari_originalDataAsString](self->_url, "safari_originalDataAsString");
}

- (id)userVisibleURLString
{
  return -[NSURL safari_userVisibleString](self->_url, "safari_userVisibleString");
}

+ (int64_t)_matchLocationForString:(id)a3 url:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  uint64_t v14;

  v8 = a3;
  v9 = a5;
  if (!a4)
  {
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a4, "safari_userVisibleString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "normalizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "safari_isPrefixOfWwwDot"))
  {
    v12 = objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled");

    if (!v12)
      goto LABEL_6;
    objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 8, 0, 0);
    v11 = v10;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  v13 = objc_msgSend(a1, "matchLocationForString:inURLString:", v8, v10);
  if ((unint64_t)(v13 - 9) >= 2)
  {
    v14 = objc_msgSend(a1, "matchLocationForString:inTitle:", v8, v9);
    if (v13 <= v14)
      v13 = v14;
  }

LABEL_11:
  return v13;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
