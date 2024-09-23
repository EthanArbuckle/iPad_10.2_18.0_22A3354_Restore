@implementation SearchUIAppTopHitCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  if (objc_msgSend(a3, "isLocalApplicationResult")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "spotlightBackingResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SearchUIAppTopHitCompletion)initWithTypedString:(id)a3 result:(id)a4 cardSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SearchUIAppTopHitCompletion *v13;
  void *v14;
  void *v15;
  SearchUIAppTopHitCompletion *v16;
  objc_super v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v10, "spotlightBackingResult"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    objc_msgSend(v10, "spotlightBackingResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)SearchUIAppTopHitCompletion;
    v13 = -[SearchUICompletion initWithTypedString:result:cardSection:](&v19, sel_initWithTypedString_result_cardSection_, v8, v12, v10);

    if (v13)
    {
      objc_msgSend(v10, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIAppTopHitCompletion setEnforcedExtensionString:](v13, "setEnforcedExtensionString:", v15);

      -[SearchUICompletion updateFields](v13, "updateFields");
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SearchUIAppTopHitCompletion;
    v13 = -[SearchUICompletion initWithTypedString:result:cardSection:](&v18, sel_initWithTypedString_result_cardSection_, v8, v9, v10);
  }
  v16 = v13;

  return v16;
}

- (id)nonPrefixMatchExtensionString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SearchUIAppTopHitCompletion enforcedExtensionString](self, "enforcedExtensionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIAppTopHitCompletion;
    -[SearchUICompletion nonPrefixMatchExtensionString](&v8, sel_nonPrefixMatchExtensionString);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)prefixMatchExtensionString
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v9;

  -[SearchUIAppTopHitCompletion enforcedExtensionString](self, "enforcedExtensionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {

    goto LABEL_5;
  }
  -[SearchUICompletion completionStringToMatch](self, "completionStringToMatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAppTopHitCompletion enforcedExtensionString](self, "enforcedExtensionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)SearchUIAppTopHitCompletion;
    -[SearchUICompletion prefixMatchExtensionString](&v9, sel_prefixMatchExtensionString);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  -[SearchUIAppTopHitCompletion enforcedExtensionString](self, "enforcedExtensionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

- (NSString)enforcedExtensionString
{
  return self->_enforcedExtensionString;
}

- (void)setEnforcedExtensionString:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedExtensionString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcedExtensionString, 0);
}

@end
