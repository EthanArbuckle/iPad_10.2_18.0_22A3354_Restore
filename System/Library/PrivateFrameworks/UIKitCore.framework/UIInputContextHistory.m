@implementation UIInputContextHistory

- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifiers:(id)a4
{
  id v6;
  id v7;
  UIInputContextHistory *v8;
  uint64_t v9;
  TIInputContextHistory *tiInputContextHistory;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIInputContextHistory;
  v8 = -[UIInputContextHistory init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDBA0]), "initWithRecipientIdentifiers:senderIdentifiers:", v6, v7);
    tiInputContextHistory = v8->_tiInputContextHistory;
    v8->_tiInputContextHistory = (TIInputContextHistory *)v9;

  }
  return v8;
}

- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3
{
  return -[UIInputContextHistory initWithRecipientIdentifiers:senderIdentifier:](self, "initWithRecipientIdentifiers:senderIdentifier:", a3, 0);
}

- (UIInputContextHistory)initWithInputContextHistory:(id)a3
{
  id v5;
  UIInputContextHistory *v6;
  UIInputContextHistory *v7;
  objc_super v9;

  v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInputContextHistory;
    v6 = -[UIInputContextHistory init](&v9, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_tiInputContextHistory, a3);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (UIInputContextHistory)initWithThreadID:(unint64_t)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 infoDict:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UIInputContextHistory *v19;
  id v20;
  void *v21;
  uint64_t v22;
  TIInputContextHistory *tiInputContextHistory;
  uint64_t v24;
  TIInputContextHistory *v25;
  int v26;
  id v27;
  uint64_t v28;
  TIInputContextHistory *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  TIInputContextHistory *v41;
  id v43;
  id v44;
  UIInputContextHistory *v45;
  id v46;
  id v47;
  id v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v54.receiver = self;
  v54.super_class = (Class)UIInputContextHistory;
  v19 = -[UIInputContextHistory init](&v54, sel_init);
  if (v19)
  {
    if (objc_msgSend(MEMORY[0x1E0DBDBA0], "instancesRespondToSelector:", sel_threadIdentifier))
    {
      v20 = objc_alloc(MEMORY[0x1E0DBDBA0]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "initWithThreadIdentifier:participantsIDtoNamesMap:firstPersonIDs:primaryRecipients:secondaryRecipients:infoDict:", v21, v14, v15, v16, v17, v18);
      tiInputContextHistory = v19->_tiInputContextHistory;
      v19->_tiInputContextHistory = (TIInputContextHistory *)v22;

    }
    else if (objc_msgSend(MEMORY[0x1E0DBDBA0], "instancesRespondToSelector:", sel_firstPersonIdentifiers))
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDBA0]), "initWithThreadID:participantsIDtoNamesMap:firstPersonIDs:primaryRecipients:secondaryRecipients:", a3, v14, v15, v16, v17);
      v25 = v19->_tiInputContextHistory;
      v19->_tiInputContextHistory = (TIInputContextHistory *)v24;

      -[TIInputContextHistory setInfoDict:](v19->_tiInputContextHistory, "setInfoDict:", v18);
    }
    else
    {
      v26 = objc_msgSend(MEMORY[0x1E0DBDBA0], "instancesRespondToSelector:", sel_participantsMap);
      v27 = objc_alloc(MEMORY[0x1E0DBDBA0]);
      if (v26)
      {
        v48 = v14;
        v46 = v16;
        v44 = v17;
        v28 = objc_msgSend(v27, "initWithThreadID:participantsIDtoNamesMap:primaryRecipients:secondaryRecipients:", a3, v14, v16, v17);
        v29 = v19->_tiInputContextHistory;
        v45 = v19;
        v19->_tiInputContextHistory = (TIInputContextHistory *)v28;

        v43 = v18;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v18);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v47 = v15;
        obj = v15;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v31)
        {
          v32 = v31;
          v33 = 0;
          v34 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v51 != v34)
                objc_enumerationMutation(obj);
              v36 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
              v37 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33 + i);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "stringWithFormat:", CFSTR("firstPerson-%@"), v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v30, "setObject:forKeyedSubscript:", v36, v39);
            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            v33 = (v33 + i);
          }
          while (v32);
        }

        v19 = v45;
        -[TIInputContextHistory setInfoDict:](v45->_tiInputContextHistory, "setInfoDict:", v30);

        v15 = v47;
        v14 = v48;
        v16 = v46;
        v18 = v43;
        v17 = v44;
      }
      else
      {
        v40 = objc_msgSend(v27, "initWithRecipientIdentifiers:senderIdentifiers:", v16, v15);
        v41 = v19->_tiInputContextHistory;
        v19->_tiInputContextHistory = (TIInputContextHistory *)v40;

      }
    }
  }

  return v19;
}

- (UIInputContextHistory)initWithThreadIdentifier:(id)a3 participantsIDtoNames:(id)a4 firstPerson:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 info:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  UIInputContextHistory *v20;
  uint64_t v21;
  TIInputContextHistory *tiInputContextHistory;
  UIInputContextHistory *v23;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(MEMORY[0x1E0DBDBA0], "instancesRespondToSelector:", sel_initWithThreadIdentifier_participantsIDtoNamesMap_firstPersonIDs_primaryRecipients_secondaryRecipients_infoDict_))
  {
    v25.receiver = self;
    v25.super_class = (Class)UIInputContextHistory;
    v20 = -[UIInputContextHistory init](&v25, sel_init);
    if (v20)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDBA0]), "initWithThreadIdentifier:participantsIDtoNamesMap:firstPersonIDs:primaryRecipients:secondaryRecipients:infoDict:", v14, v15, v16, v17, v18, v19);
      tiInputContextHistory = v20->_tiInputContextHistory;
      v20->_tiInputContextHistory = (TIInputContextHistory *)v21;

    }
    self = v20;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)addNewParticipantWithIdentifier:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0DBDBA0], "instancesRespondToSelector:", sel_addNewParticipantWithIdentifier_name_))
  {
    -[UIInputContextHistory tiInputContextHistory](self, "tiInputContextHistory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addNewParticipantWithIdentifier:name:", v8, v6);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[UIInputContextHistory tiInputContextHistory](self, "tiInputContextHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipientIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tiInputContextHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "recipientIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToSet:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSSet)recipientIdentifiers
{
  return (NSSet *)-[TIInputContextHistory recipientIdentifiers](self->_tiInputContextHistory, "recipientIdentifiers");
}

- (NSSet)senderIdentifiers
{
  return (NSSet *)-[TIInputContextHistory senderIdentifiers](self->_tiInputContextHistory, "senderIdentifiers");
}

- (NSSet)recipientNames
{
  return (NSSet *)-[TIInputContextHistory recipientNames](self->_tiInputContextHistory, "recipientNames");
}

- (void)addEntry:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TIInputContextHistory addEntry:](self->_tiInputContextHistory, "addEntry:", v4);

}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TIInputContextHistory addTextEntry:timestamp:senderIdentifier:entryIdentifier:](self->_tiInputContextHistory, "addTextEntry:timestamp:senderIdentifier:entryIdentifier:", v13, v10, v11, v12);

}

- (void)updateRecipientNames:(id)a3
{
  -[TIInputContextHistory updateRecipientNames:](self->_tiInputContextHistory, "updateRecipientNames:", a3);
}

- (NSString)senderIdentifier
{
  void *v2;
  void *v3;

  -[UIInputContextHistory senderIdentifiers](self, "senderIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  UIInputContextHistory *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIInputContextHistory initWithRecipientIdentifiers:senderIdentifiers:](self, "initWithRecipientIdentifiers:senderIdentifiers:", v7, v8);

  return v9;
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4
{
  -[UIInputContextHistory addTextEntry:timestamp:senderIdentifier:](self, "addTextEntry:timestamp:senderIdentifier:", a3, a4, 0);
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5
{
  -[TIInputContextHistory addTextEntry:timestamp:senderIdentifier:](self->_tiInputContextHistory, "addTextEntry:timestamp:senderIdentifier:", a3, a4, a5);
}

- (id)mostRecentTextEntries:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[UIInputContextHistory tiInputContextHistory](self, "tiInputContextHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mostRecentTextEntries:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TIInputContextHistory)tiInputContextHistory
{
  return self->_tiInputContextHistory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiInputContextHistory, 0);
}

@end
