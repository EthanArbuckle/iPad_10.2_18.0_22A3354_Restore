@implementation SROSmartRepliesActionSuggestion

- (SROSmartRepliesActionSuggestion)initWithType:(unint64_t)a3 title:(id)a4 attribution:(id)a5 isRichSuggestion:(BOOL)a6 metadata:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  SROSmartRepliesActionSuggestion *v15;
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *v16;
  void *v17;
  uint64_t v18;
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *underlyingSuggestion;
  SROSmartRepliesActionSuggestion *v20;
  objc_super v22;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SROSmartRepliesActionSuggestion;
  v15 = -[SROSmartRepliesSuggestion initWithTitle:isDynamicSuggestion:](&v22, sel_initWithTitle_isDynamicSuggestion_, v12, 1);
  if (v15)
  {
    v16 = [_TtC12SmartReplies30SRSmartRepliesActionSuggestion alloc];
    +[SROSmartRepliesObjCCompatibilityUtils metadataForWrappedMetadata:](SROSmartRepliesObjCCompatibilityUtils, "metadataForWrappedMetadata:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SRSmartRepliesActionSuggestion initWithType:title:attribution:isRichSuggestion:metadata:](v16, "initWithType:title:attribution:isRichSuggestion:metadata:", a3, v12, v13, v8, v17);
    underlyingSuggestion = v15->_underlyingSuggestion;
    v15->_underlyingSuggestion = (_TtC12SmartReplies30SRSmartRepliesActionSuggestion *)v18;

    v20 = v15;
  }

  return v15;
}

- (unint64_t)type
{
  return -[SRSmartRepliesActionSuggestion type](self->_underlyingSuggestion, "type");
}

- (id)title
{
  return -[SRSmartRepliesSuggestion title](self->_underlyingSuggestion, "title");
}

- (NSString)attribution
{
  return -[SRSmartRepliesActionSuggestion attribution](self->_underlyingSuggestion, "attribution");
}

- (BOOL)isDynamicSuggestion
{
  return -[SRSmartRepliesSuggestion isDynamicSuggestion](self->_underlyingSuggestion, "isDynamicSuggestion");
}

- (BOOL)isRichSuggestion
{
  return -[SRSmartRepliesActionSuggestion isRichSuggestion](self->_underlyingSuggestion, "isRichSuggestion");
}

- (SROSmartRepliesActionMetadata)metadata
{
  void *v2;
  void *v3;

  -[SRSmartRepliesActionSuggestion metadata](self->_underlyingSuggestion, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SROSmartRepliesObjCCompatibilityUtils wrappedMetadataForMetadata:](SROSmartRepliesObjCCompatibilityUtils, "wrappedMetadataForMetadata:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SROSmartRepliesActionMetadata *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSuggestion, 0);
}

@end
