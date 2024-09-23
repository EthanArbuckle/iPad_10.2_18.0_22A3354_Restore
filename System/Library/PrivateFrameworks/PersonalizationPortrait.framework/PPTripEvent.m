@implementation PPTripEvent

- (PPTripEvent)initWithStartDate:(id)a3 endDate:(id)a4 tripParts:(id)a5
{
  id v9;
  PPTripEvent *v10;
  PPTripEvent *v11;
  void *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PPTripEvent;
  v10 = -[PPScoredEvent initWithStartDate:endDate:title:score:](&v14, sel_initWithStartDate_endDate_title_score_, a3, a4, 0, 1.0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tripParts, a5);
    -[PPTripEvent destinationsBasedTitle](v11, "destinationsBasedTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPScoredEvent setTitle:](v11, "setTitle:", v12);

  }
  return v11;
}

- (PPTripEvent)initWithCoder:(id)a3
{
  id v4;
  PPTripEvent *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  PPTripEvent *v10;
  NSArray *tripParts;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPTripEvent;
  v5 = -[PPScoredEvent initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("tps"));
  v10 = (PPTripEvent *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    tripParts = v5->_tripParts;
    v5->_tripParts = (NSArray *)v10;

LABEL_4:
    v10 = v5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPTripEvent;
  v4 = a3;
  -[PPScoredEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tripParts, CFSTR("tps"), v5.receiver, v5.super_class);

}

- (id)destinations
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_tripParts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "destinationString", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)destinationsBasedTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateFormat:", CFSTR("MMM d, yyyy"));
  -[PPScoredEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPScoredEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTripEvent destinations](self, "destinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_componentsJoinedByString:", CFSTR("; "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Trip to %@ - %@ to %@"), v10, v5, v7);

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPScoredEvent title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPTripEvent t:'%@'>"), v4);

  return v5;
}

- (NSArray)tripParts
{
  return self->_tripParts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripParts, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
