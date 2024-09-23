@implementation SISchemaInstrumentationMessage

- (id)formattedJsonBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  uint64_t v14;

  -[SISchemaInstrumentationMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("{ \"error\" : \"Invalid JSON\", \"messageType\" : \"%@\" }"), v6);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v4 = (void *)MEMORY[0x1E0CB36D8];
  -[SISchemaInstrumentationMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 3, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  v8 = 0;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
LABEL_9:
    v8 = (void *)v10;
  }

  return v8;
}

- (id)qualifiedMessageName
{
  return CFSTR("unspecified");
}

- (BOOL)shouldSuppressMessageUnderConditions:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[SISchemaInstrumentationMessage suppressMessageUnderConditions](self, "suppressMessageUnderConditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v4, "isEmpty") & 1) == 0 && (objc_msgSend(v4, "intersectsWith:", v5) & 1) != 0;

  return v6;
}

- (id)suppressMessageUnderConditions
{
  return +[SISensitiveConditionsSet fromDeviceSensitivityState:](SISensitiveConditionsSet, "fromDeviceSensitivityState:", 1);
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  SISensitiveConditionsMessagePolicyResult *v5;

  v4 = a3;
  v5 = objc_alloc_init(SISensitiveConditionsMessagePolicyResult);
  LODWORD(self) = -[SISchemaInstrumentationMessage shouldSuppressMessageUnderConditions:](self, "shouldSuppressMessageUnderConditions:", v4);

  if ((_DWORD)self)
    -[SISensitiveConditionsMessagePolicyResult setSuppressMessage:](v5, "setSuppressMessage:", 1);
  return v5;
}

- (id)_pruneSuppressedMessagesFromArray:(id)a3 underConditions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __105__SISchemaInstrumentationMessage_SensitiveConditions___pruneSuppressedMessagesFromArray_underConditions___block_invoke;
  v21[3] = &unk_1E5628C20;
  v8 = v6;
  v22 = v8;
  v9 = v7;
  v23 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v21);
  if (v9)
  {
    v10 = (id)objc_msgSend(v5, "mutableCopy");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v9, "reverseObjectEnumerator", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "removeObjectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "unsignedIntegerValue"));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

void __105__SISchemaInstrumentationMessage_SensitiveConditions___pruneSuppressedMessagesFromArray_underConditions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "applySensitiveConditionsPolicy:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "suppressMessage"))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)unwrapMessageWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD, SISchemaInstrumentationMessage *))a3 + 2))(a3, 0, 0, self);
}

@end
