@implementation SearchUIBiomeEvent

+ (BOOL)supportsEvent:(id)a3 contextualAction:(id)a4
{
  return 1;
}

+ (id)eventForEvent:(id)a3 contextualAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  objc_class *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)eventForEvent_contextualAction__classes;
  if (!eventForEvent_contextualAction__classes)
  {
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)eventForEvent_contextualAction__classes;
    eventForEvent_contextualAction__classes = v8;

    v7 = (void *)eventForEvent_contextualAction__classes;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v7;
  v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(objc_class **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((-[objc_class supportsEvent:contextualAction:](v14, "supportsEvent:contextualAction:", v5, v6, (_QWORD)v16) & 1) != 0)
        {
          v11 = (void *)objc_msgSend([v14 alloc], "initWithEvent:contextualAction:", v5, v6);
          goto LABEL_13;
        }
      }
      v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  return v11;
}

- (SearchUIBiomeEvent)initWithEvent:(id)a3 contextualAction:(id)a4
{
  id v5;
  SearchUIBiomeEvent *v6;
  SearchUIBiomeEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIBiomeEvent;
  v6 = -[BMEventBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[SearchUIBiomeEvent setBiomeEvent:](v6, "setBiomeEvent:", v5);

  return v7;
}

- (void)getEnabledStatusWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a3;
  -[SearchUIBiomeEvent biomeEvent](self, "biomeEvent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[SearchUIBiomeEvent biomeEvent](self, "biomeEvent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    -[SearchUIBiomeEvent biomeEvent](self, "biomeEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getEnabledStatusWithCompletion:", v9);

  }
  else
  {
    v9[2](v9, 0);
  }

}

- (BMEventBase)biomeEvent
{
  return self->_biomeEvent;
}

- (void)setBiomeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_biomeEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeEvent, 0);
}

@end
