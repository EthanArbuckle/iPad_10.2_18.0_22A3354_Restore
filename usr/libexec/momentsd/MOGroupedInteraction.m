@implementation MOGroupedInteraction

- (MOGroupedInteraction)initWithScoredContact:(id)a3 interactionScore:(id)a4 interaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOGroupedInteraction *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *interactions;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (initWithScoredContact_interactionScore_interaction__onceToken != -1)
    dispatch_once(&initWithScoredContact_interactionScore_interaction__onceToken, &__block_literal_global_15);
  v18.receiver = self;
  v18.super_class = (Class)MOGroupedInteraction;
  v12 = -[MOGenericInteraction init](&v18, "init");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "participants"));
    -[MOGenericInteraction setParticipants:](v12, "setParticipants:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactionKey"));
    -[MOGenericInteraction setInteractionKey:](v12, "setInteractionKey:", v14);

    objc_storeStrong((id *)&v12->_scoredContact, a3);
    objc_storeStrong((id *)&v12->_interactionScore, a4);
    v12->_isScoredContactUsable = 0;
    v15 = objc_opt_new(NSMutableArray);
    interactions = v12->_interactions;
    v12->_interactions = v15;

    -[MOGroupedInteraction addInteraction:](v12, "addInteraction:", v11);
  }

  return v12;
}

void __75__MOGroupedInteraction_initWithScoredContact_interactionScore_interaction___block_invoke(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002D8D98, &off_1002D8DB0, &off_1002D8DC8, &off_1002D8DE0, &off_1002D8DF8, &off_1002D8E10, &off_1002D8E28, &off_1002D8E40, 0);
  v2 = (void *)_callLikeMechanismsSet;
  _callLikeMechanismsSet = (uint64_t)v1;

}

- (void)addInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOGroupedInteraction interactions](self, "interactions"));
  objc_msgSend(v4, "addObject:", v12);

  if (!-[MOGroupedInteraction isScoredContactUsable](self, "isScoredContactUsable"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOGroupedInteraction scoredContact](self, "scoredContact"));

    if (v5)
    {
      v6 = (void *)_callLikeMechanismsSet;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "mechanism")));
      LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

      if (!(_DWORD)v6
        || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "endDate")),
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate")),
            objc_msgSend(v8, "timeIntervalSinceDate:", v9),
            v11 = v10,
            v9,
            v8,
            v11 >= 5.0))
      {
        -[MOGroupedInteraction setIsScoredContactUsable:](self, "setIsScoredContactUsable:", 1);
      }
    }
  }

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOGenericInteraction interactionKey](self, "interactionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOGroupedInteraction scoredContact](self, "scoredContact"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOGroupedInteraction interactionScore](self, "interactionScore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOGroupedInteraction interactions](self, "interactions"));
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<MOGroupedInteraction | groupKey:%@ scoredContact:%@ score:%@ interactions:%@>"), v4, v5, v6, v7);

  return v8;
}

- (PPScoredContact)scoredContact
{
  return self->_scoredContact;
}

- (NSNumber)interactionScore
{
  return self->_interactionScore;
}

- (BOOL)isScoredContactUsable
{
  return self->_isScoredContactUsable;
}

- (void)setIsScoredContactUsable:(BOOL)a3
{
  self->_isScoredContactUsable = a3;
}

- (NSMutableArray)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_interactions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_interactionScore, 0);
  objc_storeStrong((id *)&self->_scoredContact, 0);
}

@end
