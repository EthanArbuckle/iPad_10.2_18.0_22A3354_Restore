@implementation PKTextRangeHyperlink

- (PKTextRangeHyperlink)initWithLinkText:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  PKTextRangeHyperlink *v9;
  uint64_t v10;
  id action;
  PKTextRangeHyperlink *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v14.receiver = self;
    v14.super_class = (Class)PKTextRangeHyperlink;
    v9 = -[PKTextRangeHyperlink init](&v14, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v8, "copy");
      action = v9->_action;
      v9->_action = (id)v10;

      objc_storeStrong((id *)&v9->_linkText, a3);
    }
    self = v9;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)hyperlinkSourcesFromApplyFooter:(id)a3 linkTapped:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PKTextRangeHyperlink *v13;
  void *v14;
  id v15;
  PKTextRangeHyperlink *v16;
  void *v17;
  id v19;
  id obj;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v5;
    objc_msgSend(v5, "links");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
          v13 = [PKTextRangeHyperlink alloc];
          objc_msgSend(v12, "linkText");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __67__PKTextRangeHyperlink_hyperlinkSourcesFromApplyFooter_linkTapped___block_invoke;
          v21[3] = &unk_1E3E618A0;
          v15 = v6;
          v21[4] = v12;
          v22 = v15;
          v16 = -[PKTextRangeHyperlink initWithLinkText:action:](v13, "initWithLinkText:action:", v14, v21);

          objc_msgSend(v7, "safelyAddObject:", v16);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v7, "count"))
      v17 = (void *)objc_msgSend(v7, "copy");
    else
      v17 = 0;

    v5 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __67__PKTextRangeHyperlink_hyperlinkSourcesFromApplyFooter_linkTapped___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = _Block_copy(self->_action);
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_linkText);
  v5 = PKCombinedHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKTextRangeHyperlink *v4;
  PKTextRangeHyperlink *v5;
  const void **v6;
  void *v7;
  void *v8;
  NSString *linkText;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;

  v4 = (PKTextRangeHyperlink *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = _Block_copy(self->_action);
    v8 = _Block_copy(v6[2]);
    if (PKEqualObjects())
    {
      linkText = self->_linkText;
      v10 = (void *)v6[1];
      v11 = linkText;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {
        v14 = 1;
      }
      else
      {
        v14 = 0;
        if (v11 && v12)
          v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)linkText
{
  return self->_linkText;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
}

@end
