@implementation TUConversationActivityContext

- (TUConversationActivityContext)initWithContextIdentifier:(id)a3 actionDescription:(id)a4 ongoingDescription:(id)a5 completedDescription:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUConversationActivityContext *v15;
  TUConversationActivityContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationActivityContext;
  v15 = -[TUConversationActivityContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_typedIdentifier, a3);
    objc_storeStrong((id *)&v16->_actionDescription, a4);
    objc_storeStrong((id *)&v16->_ongoingDescription, a5);
    objc_storeStrong((id *)&v16->_completedDescription, a6);
  }

  return v16;
}

- (id)description
{
  void *v2;
  void *v3;

  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)analyticsIdentifier
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  int v21;

  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CPGroupActivityListenTogetherContext"));

  if ((v4 & 1) != 0)
    return (NSString *)CFSTR("listenTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CPGroupActivityWatchTogetherContext"));

  if ((v7 & 1) != 0)
    return (NSString *)CFSTR("watchTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CPGroupActivityWorkoutTogetherContext"));

  if ((v9 & 1) != 0)
    return (NSString *)CFSTR("workoutTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("CPGroupActivityPlayTogetherContext"));

  if ((v11 & 1) != 0)
    return (NSString *)CFSTR("playTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("CPGroupActivityShopTogetherContext"));

  if ((v13 & 1) != 0)
    return (NSString *)CFSTR("shopTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("CPGroupActivityReadTogetherContext"));

  if ((v15 & 1) != 0)
    return (NSString *)CFSTR("readTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("CPGroupActivityExploreTogetherContext"));

  if ((v17 & 1) != 0)
    return (NSString *)CFSTR("exploreTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("CPGroupActivityLearnTogetherContext"));

  if ((v19 & 1) != 0)
    return (NSString *)CFSTR("learnTogether");
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("CPGroupActivityCreateTogetherContext"));

  if (v21)
    return (NSString *)CFSTR("createTogether");
  else
    return (NSString *)CFSTR("generic");
}

- (BOOL)isMedia
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "mediaContextIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

+ (id)mediaContextIdentifiers
{
  if (mediaContextIdentifiers_onceToken != -1)
    dispatch_once(&mediaContextIdentifiers_onceToken, &__block_literal_global_5);
  return (id)mediaContextIdentifiers_mediaContextIdentifiers;
}

void __56__TUConversationActivityContext_mediaContextIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CPGroupActivityWatchTogetherContext"), CFSTR("CPGroupActivityListenTogetherContext"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mediaContextIdentifiers_mediaContextIdentifiers;
  mediaContextIdentifiers_mediaContextIdentifiers = v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationActivityContext isEqualToActivityContext:](self, "isEqualToActivityContext:", v4);

  return v5;
}

- (BOOL)isEqualToActivityContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUConversationActivityContext actionDescription](self, "actionDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TUConversationActivityContext ongoingDescription](self, "ongoingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ongoingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[TUConversationActivityContext completedDescription](self, "completedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "completedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationActivityContext actionDescription](self, "actionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TUConversationActivityContext ongoingDescription](self, "ongoingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[TUConversationActivityContext completedDescription](self, "completedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityContext actionDescription](self, "actionDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityContext ongoingDescription](self, "ongoingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityContext completedDescription](self, "completedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithContextIdentifier:actionDescription:ongoingDescription:completedDescription:", v5, v6, v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivityContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  TUConversationActivityContext *v17;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_typedIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_opt_class();
    NSStringFromSelector(sel_actionDescription);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_opt_class();
      NSStringFromSelector(sel_ongoingDescription);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_opt_class();
        NSStringFromSelector(sel_completedDescription);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          self = -[TUConversationActivityContext initWithContextIdentifier:actionDescription:ongoingDescription:completedDescription:](self, "initWithContextIdentifier:actionDescription:ongoingDescription:completedDescription:", v7, v10, v13, v16);
          v17 = self;
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[TUConversationActivityContext typedIdentifier](self, "typedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_typedIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationActivityContext actionDescription](self, "actionDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_actionDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationActivityContext ongoingDescription](self, "ongoingDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ongoingDescription);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUConversationActivityContext completedDescription](self, "completedDescription");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_completedDescription);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v11);

}

- (NSString)typedIdentifier
{
  return self->_typedIdentifier;
}

- (void)setTypedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)ongoingDescription
{
  return self->_ongoingDescription;
}

- (void)setOngoingDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)completedDescription
{
  return self->_completedDescription;
}

- (void)setCompletedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedDescription, 0);
  objc_storeStrong((id *)&self->_ongoingDescription, 0);
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_typedIdentifier, 0);
}

@end
