@implementation MOGenericInteraction

- (MOGenericInteraction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOGenericInteraction;
  return -[MOGenericInteraction init](&v3, "init");
}

- (MOGenericInteraction)initWithParticipants:(id)a3
{
  id v4;
  MOGenericInteraction *v5;
  uint64_t v6;
  NSArray *participants;
  uint64_t v8;
  NSString *interactionKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOGenericInteraction;
  v5 = -[MOGenericInteraction init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));
    participants = v5->_participants;
    v5->_participants = (NSArray *)v6;

    v8 = objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v5->_participants, "componentsJoinedByString:", CFSTR("_")));
    interactionKey = v5->_interactionKey;
    v5->_interactionKey = (NSString *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  MOGenericInteraction *v5;
  uint64_t v6;
  MOGenericInteraction *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;

  v5 = (MOGenericInteraction *)a3;
  if (v5 == self)
  {
    v20 = 1;
  }
  else
  {
    v6 = objc_opt_class(MOGenericInteraction, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = objc_claimAutoreleasedReturnValue(-[MOGenericInteraction participants](self, "participants"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_claimAutoreleasedReturnValue(-[MOGenericInteraction participants](v7, "participants"));
        if (!v10)
        {
          v20 = 0;
          goto LABEL_13;
        }
        v11 = (void *)v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOGenericInteraction participants](self, "participants"));
        v13 = objc_msgSend(v12, "count");
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOGenericInteraction participants](v7, "participants"));
        v15 = objc_msgSend(v14, "count");

        if (v13 == v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(-[MOGenericInteraction interactionKey](self, "interactionKey"));
          if (v16)
          {
            v17 = (void *)v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOGenericInteraction interactionKey](v7, "interactionKey"));

            if (v18)
            {
              v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOGenericInteraction interactionKey](self, "interactionKey"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOGenericInteraction interactionKey](v7, "interactionKey"));
              v20 = objc_msgSend(v9, "isEqualToString:", v19);

LABEL_13:
              goto LABEL_14;
            }
          }
        }
      }
      v20 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v20 = 0;
  }
LABEL_15:

  return v20;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_interactionKey, "hash");
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSString)interactionKey
{
  return self->_interactionKey;
}

- (void)setInteractionKey:(id)a3
{
  objc_storeStrong((id *)&self->_interactionKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionKey, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
