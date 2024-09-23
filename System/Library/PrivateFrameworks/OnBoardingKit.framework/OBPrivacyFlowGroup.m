@implementation OBPrivacyFlowGroup

- (OBPrivacyFlowGroup)initWithIdentifier:(id)a3 privacyFlows:(id)a4
{
  id v7;
  id v8;
  OBPrivacyFlowGroup *v9;
  OBPrivacyFlowGroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OBPrivacyFlowGroup;
  v9 = -[OBPrivacyFlowGroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_privacyFlows, a4);
  }

  return v10;
}

- (OBPrivacyFlowGroup)init
{
  return -[OBPrivacyFlowGroup initWithIdentifier:privacyFlows:](self, "initWithIdentifier:privacyFlows:", 0, MEMORY[0x1E0C9AA60]);
}

+ (id)groupFlowsByCombinedHeader:(id)a3 language:(id)a4 preferredDeviceType:(unint64_t)a5
{
  id v6;
  id v7;
  char v8;
  uint64_t i;
  void *v10;
  char v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  OBPrivacyFlowGroup *v22;
  void *v23;
  void *v24;
  OBPrivacyFlowGroup *v25;
  void *v26;
  id obj;
  uint64_t v29;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v6;
  v33 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v33)
  {

LABEL_25:
    objc_msgSend(v32, "removeAllObjects");
    v25 = -[OBPrivacyFlowGroup initWithIdentifier:privacyFlows:]([OBPrivacyFlowGroup alloc], "initWithIdentifier:privacyFlows:", 0, v7);
    objc_msgSend(v32, "addObject:", v25);
    goto LABEL_26;
  }
  v8 = 0;
  obj = v7;
  v29 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v33; ++i)
    {
      if (*(_QWORD *)v41 != v29)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "enablesGroupingInCombinedList", obj);
      objc_msgSend(v10, "localizedCombinedHeaderForLanguage:preferredDeviceType:", v31, a5);
      v12 = objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v13 = v32;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v37;
        v35 = v10;
        v34 = v11;
LABEL_8:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v17);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isEqualToString:", v12))
            break;
          objc_msgSend(v18, "identifier");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20 | v12;

          if (!v21)
            goto LABEL_17;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            v10 = v35;
            v11 = v34;
            if (v15)
              goto LABEL_8;
            goto LABEL_15;
          }
        }

LABEL_17:
        v22 = v18;

        v10 = v35;
        v11 = v34;
        if (v22)
          goto LABEL_19;
      }
      else
      {
LABEL_15:

      }
      v22 = objc_alloc_init(OBPrivacyFlowGroup);
      -[OBPrivacyFlowGroup setIdentifier:](v22, "setIdentifier:", v12);
      objc_msgSend(v13, "addObject:", v22);
LABEL_19:
      v8 |= v11;
      -[OBPrivacyFlowGroup privacyFlows](v22, "privacyFlows");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObject:", v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyFlowGroup setPrivacyFlows:](v22, "setPrivacyFlows:", v24);

    }
    v7 = obj;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  }
  while (v33);

  if ((v8 & 1) == 0)
    goto LABEL_25;
  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "firstObject");
    v25 = (OBPrivacyFlowGroup *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyFlowGroup setIdentifier:](v25, "setIdentifier:", 0);
LABEL_26:

  }
  v26 = (void *)objc_msgSend(v32, "copy");

  return v26;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)privacyFlows
{
  return self->_privacyFlows;
}

- (void)setPrivacyFlows:(id)a3
{
  objc_storeStrong((id *)&self->_privacyFlows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyFlows, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
