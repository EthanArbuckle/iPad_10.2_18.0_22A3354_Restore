@implementation SFVisibleResultsFeedback

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFVisibleResultsFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, CFSTR("results"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("trigger_event"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueIdsOfVisibleButtons, CFSTR("unique_ids_of_visible_buttons"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueIdentifiersOfVisibleCardSections, CFSTR("unique_identifiers_of_visible_card_sections"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfVisibleCardSections, 0);
  objc_storeStrong((id *)&self->_uniqueIdsOfVisibleButtons, 0);
  objc_storeStrong((id *)&self->_goTakeoverResult, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SFVisibleResultsFeedback;
  v4 = -[SFFeedback copyWithZone:](&v18, sel_copyWithZone_, a3);
  -[SFVisibleResultsFeedback results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  v4[4] = -[SFVisibleResultsFeedback triggerEvent](self, "triggerEvent");
  -[SFVisibleResultsFeedback goTakeoverResult](self, "goTakeoverResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[5];
  v4[5] = v9;

  -[SFVisibleResultsFeedback uniqueIdentifiersOfVisibleCardSections](self, "uniqueIdentifiersOfVisibleCardSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[7];
  v4[7] = v12;

  -[SFVisibleResultsFeedback uniqueIdsOfVisibleButtons](self, "uniqueIdsOfVisibleButtons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  return v4;
}

- (NSArray)results
{
  return self->_results;
}

- (NSArray)uniqueIdsOfVisibleButtons
{
  return self->_uniqueIdsOfVisibleButtons;
}

- (NSArray)uniqueIdentifiersOfVisibleCardSections
{
  return self->_uniqueIdentifiersOfVisibleCardSections;
}

- (SFSearchResult)goTakeoverResult
{
  return self->_goTakeoverResult;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (SFVisibleResultsFeedback)initWithCoder:(id)a3
{
  id v4;
  SFVisibleResultsFeedback *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *results;
  uint64_t v11;
  NSArray *uniqueIdsOfVisibleButtons;
  uint64_t v13;
  NSArray *uniqueIdentifiersOfVisibleCardSections;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFVisibleResultsFeedback;
  v5 = -[SFFeedback initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("results"));
    v9 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSArray *)v9;

    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trigger_event"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("unique_ids_of_visible_buttons"));
    v11 = objc_claimAutoreleasedReturnValue();
    uniqueIdsOfVisibleButtons = v5->_uniqueIdsOfVisibleButtons;
    v5->_uniqueIdsOfVisibleButtons = (NSArray *)v11;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("unique_identifiers_of_visible_card_sections"));
    v13 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifiersOfVisibleCardSections = v5->_uniqueIdentifiersOfVisibleCardSections;
    v5->_uniqueIdentifiersOfVisibleCardSections = (NSArray *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setGoTakeoverResult:(id)a3
{
  objc_storeStrong((id *)&self->_goTakeoverResult, a3);
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setUniqueIdsOfVisibleButtons:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdsOfVisibleButtons, a3);
}

- (void)setUniqueIdentifiersOfVisibleCardSections:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfVisibleCardSections, a3);
}

- (SFVisibleResultsFeedback)initWithResults:(id)a3 triggerEvent:(unint64_t)a4 visibleButtons:(id)a5 visibleCardSections:(id)a6
{
  id v10;
  id v11;
  SFVisibleResultsFeedback *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = -[SFVisibleResultsFeedback initWithResults:triggerEvent:](self, "initWithResults:triggerEvent:", a3, a4);
  if (v12)
  {
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v33 = v10;
      v14 = v10;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            if (objc_msgSend(v19, "uniqueId"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v19, "uniqueId"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v16);
      }

      v21 = (void *)objc_msgSend(v13, "copy");
      -[SFVisibleResultsFeedback setUniqueIdsOfVisibleButtons:](v12, "setUniqueIdsOfVisibleButtons:", v21);

      v10 = v33;
    }
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v23 = v11;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v35 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_msgSend(v28, "cardSectionId");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v28, "cardSectionId");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v30);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v25);
      }

      v31 = (void *)objc_msgSend(v22, "copy");
      -[SFVisibleResultsFeedback setUniqueIdentifiersOfVisibleCardSections:](v12, "setUniqueIdentifiersOfVisibleCardSections:", v31);

    }
  }

  return v12;
}

- (SFVisibleResultsFeedback)initWithResults:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6;
  SFVisibleResultsFeedback *v7;
  uint64_t v8;
  NSArray *results;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFVisibleResultsFeedback;
  v7 = -[SFFeedback init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    results = v7->_results;
    v7->_results = (NSArray *)v8;

    v7->_triggerEvent = a4;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)SFVisibleResultsFeedback;
  -[SFFeedback description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFVisibleResultsFeedback results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFVisibleResultsFeedback uniqueIdsOfVisibleButtons](self, "uniqueIdsOfVisibleButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFVisibleResultsFeedback uniqueIdentifiersOfVisibleCardSections](self, "uniqueIdentifiersOfVisibleCardSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - result: %@ - buttons: %@ - card sections: %@"), v4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

@end
