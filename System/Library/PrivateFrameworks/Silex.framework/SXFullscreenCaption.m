@implementation SXFullscreenCaption

- (id)initWithText:(void *)a3 dataSource:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SXFullscreenCaption;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeWeak(a1 + 3, v7);
    }
  }

  return a1;
}

- (id)initWithCaption:(void *)a3 dataSource:
{
  id v6;
  id v7;
  id *v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXFullscreenCaption;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 2, a2);
      objc_msgSend(v6, "text");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[1];
      a1[1] = (id)v9;

      objc_storeWeak(a1 + 3, v7);
    }
  }

  return a1;
}

- (id)textResizerForTextSource:(id)a3
{
  id WeakRetained;
  void *v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "textResizerForCaption:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textRulesForTextSource:(id)a3
{
  id WeakRetained;
  void *v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "textRulesForCaption:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)additionsForTextSource:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (SXFullscreenCaption *)self->_caption;
  -[SXFullscreenCaption additions](self, "additions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NSArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)caption
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (id)inlineTextStylesForTextSource:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (SXFullscreenCaption *)self->_caption;
  -[SXFullscreenCaption inlineTextStyles](self, "inlineTextStyles", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NSArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)componentTextStyleForTextSource:(id)a3 inheritingFromDefaultStyles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SXComponentTextStyle *v7;
  id WeakRetained;
  SXFormattedText *caption;
  SXFormattedText *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  if (v4)
    v7 = -[SXJSONObject initWithJSONObject:andVersion:]([SXComponentTextStyle alloc], "initWithJSONObject:andVersion:", &unk_24D703210, 0);
  else
    v7 = 0;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    caption = self->_caption;
  }
  else
  {
    WeakRetained = 0;
    caption = 0;
  }
  v10 = caption;
  -[SXFormattedText textStyle](v10, "textStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "componentTextStyleForIdentifier:inheritingFromComponentTextStyle:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)defaultComponentTextStyleForTextSource:(id)a3
{
  return -[SXJSONObject initWithJSONObject:andVersion:]([SXComponentTextStyle alloc], "initWithJSONObject:andVersion:", &unk_24D703238, 0);
}

- (id)defaultComponentTextStylesForTextSource:(id)a3
{
  SXComponentTextStyle *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[SXJSONObject initWithJSONObject:andVersion:]([SXComponentTextStyle alloc], "initWithJSONObject:andVersion:", &unk_24D703260, 0);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self)
    self = (SXFullscreenCaption *)objc_loadWeakRetained((id *)&self->_dataSource);
  -[SXFullscreenCaption textStyleForIdentifier:](self, "textStyleForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentSizeCategoryForTextSource:(id)a3
{
  id WeakRetained;
  void *v5;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "contentSizeCategoryForCaption:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)text
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
