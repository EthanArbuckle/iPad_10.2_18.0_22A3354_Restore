@implementation TIContact

- (id)flatten
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[4];
  id v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" ,:;"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __20__TIContact_flatten__block_invoke;
  aBlock[3] = &unk_1EA103540;
  v5 = v3;
  v39 = v5;
  v6 = v4;
  v40 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[TIContact familyName](self, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  -[TIContact givenName](self, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

  -[TIContact middleName](self, "middleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

  -[TIContact organizationName](self, "organizationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v11);

  -[TIContact jobTitle](self, "jobTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v12);

  -[TIContact nickname](self, "nickname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v13);

  -[TIContact relations](self, "relations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[TIContact relations](self, "relations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          v7[2](v7, *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v18);
    }

  }
  -[TIContact cities](self, "cities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[TIContact cities](self, "cities", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          v7[2](v7, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v27++));
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      }
      while (v25);
    }

  }
  v28 = v6;

  return v28;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_familyName, a3);
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticFamilyName, a3);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_givenName, a3);
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticGivenName, a3);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->_middleName, a3);
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setPhoneticMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticMiddleName, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (void)setJobTitle:(id)a3
{
  objc_storeStrong((id *)&self->_jobTitle, a3);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (NSArray)relations
{
  return self->_relations;
}

- (void)setRelations:(id)a3
{
  objc_storeStrong((id *)&self->_relations, a3);
}

- (NSArray)cities
{
  return self->_cities;
}

- (void)setCities:(id)a3
{
  objc_storeStrong((id *)&self->_cities, a3);
}

- (BOOL)hasRelevancyScore
{
  return self->_hasRelevancyScore;
}

- (void)setHasRelevancyScore:(BOOL)a3
{
  self->_hasRelevancyScore = a3;
}

- (float)relevancyScore
{
  return self->_relevancyScore;
}

- (void)setRelevancyScore:(float)a3
{
  self->_relevancyScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

void __20__TIContact_flatten__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v5, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 32)) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    }
    else
    {
      objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 32));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "mutableCopy");

      objc_msgSend(v4, "removeObject:", &stru_1EA1081D0);
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);

    }
  }

}

@end
