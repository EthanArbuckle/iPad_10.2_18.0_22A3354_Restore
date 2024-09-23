@implementation RTHintManagerNotificationDidUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintSourcesUpdated, 0);
}

- (NSNumber)hintSourcesUpdated
{
  return self->_hintSourcesUpdated;
}

- (RTHintManagerNotificationDidUpdate)initWithHints:(id)a3
{
  id v4;
  RTHintManagerNotificationDidUpdate *v5;
  uint64_t v6;
  NSNumber *hintSourcesUpdated;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTHintManagerNotificationDidUpdate;
  v5 = -[RTNotification init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "sourcesUpdatedForHints:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    hintSourcesUpdated = v5->_hintSourcesUpdated;
    v5->_hintSourcesUpdated = (NSNumber *)v6;

  }
  return v5;
}

+ (id)sourcesUpdatedForHints:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 |= 1 << (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "source") + 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[RTHintManagerNotificationDidUpdate hintSourcesUpdated](self, "hintSourcesUpdated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("hintSourcesUpdated, %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setHintSourcesUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_hintSourcesUpdated, a3);
}

@end
