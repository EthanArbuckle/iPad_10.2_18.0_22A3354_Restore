@implementation SXDefaultButtonComponentTextStyleModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  SXComponentTextStyle *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SXComponentTextStyle *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_shouldReturnUnmodifiedDOM)
  {
    +[SXButtonComponentClassification typeString](SXButtonComponentClassification, "typeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXComponentClassification classificationForComponentWithType:](SXComponentClassification, "classificationForComponentWithType:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v9, "defaultTextStyleIdentifiers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v6, "componentTextStyles");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (SXComponentTextStyle *)objc_claimAutoreleasedReturnValue();

          if (v17 && -[SXComponentTextStyle textAlignment](v17, "textAlignment"))
          {
            self->_shouldReturnUnmodifiedDOM = 1;
            goto LABEL_17;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v12)
          continue;
        break;
      }
    }

    +[SXButtonComponentClassification typeString](SXButtonComponentClassification, "typeString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SXDefaultTextStyleIdentifierForRole((uint64_t)v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "componentTextStyles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "JSONRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
      v21 = (void *)MEMORY[0x24BDBD1B8];
    v23 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v23, "setObject:forKey:", CFSTR("center"), CFSTR("textAlignment"));
    objc_msgSend(v20, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      objc_msgSend(v23, "setObject:forKey:", v10, CFSTR("identifier"));
    v25 = [SXComponentTextStyle alloc];
    objc_msgSend(v7, "specVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SXJSONObject initWithJSONObject:andVersion:](v25, "initWithJSONObject:andVersion:", v23, v26);

    objc_msgSend(v6, "componentTextStyles");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v17, v10);

LABEL_17:
  }

}

- (BOOL)shouldReturnUnmodifiedDOM
{
  return self->_shouldReturnUnmodifiedDOM;
}

- (void)setShouldReturnUnmodifiedDOM:(BOOL)a3
{
  self->_shouldReturnUnmodifiedDOM = a3;
}

@end
