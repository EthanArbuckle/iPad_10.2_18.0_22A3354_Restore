@implementation PGMeaningPeopleCriteria

+ (id)criteriaKey
{
  return CFSTR("People");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfPeople"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfPeople:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requiresPetPresence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequiresPetPresence:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requiresChildPresence"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequiresChildPresence:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requiresPartnerPresence"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRequiresPartnerPresence:", objc_msgSend(v9, "BOOLValue"));
  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "totalNumberOfPersons");
  if (v8 >= -[PGMeaningPeopleCriteria minimumNumberOfPeople](self, "minimumNumberOfPeople"))
  {
    -[PGMeaningPeopleCriteria requiresPetPresence](self, "requiresPetPresence");
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v20 = !-[PGMeaningPeopleCriteria requiresPartnerPresence](self, "requiresPartnerPresence");
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v16 = !-[PGMeaningPeopleCriteria requiresChildPresence](self, "requiresChildPresence");
    objc_msgSend(v7, "personNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__PGMeaningPeopleCriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v12[3] = &unk_1E842EC78;
    v12[4] = &v17;
    v12[5] = &v13;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);
    if (*((_BYTE *)v18 + 24))
      v9 = *((_BYTE *)v14 + 24) != 0;
    else
      v9 = 0;

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  return 1;
}

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumNumberOfPeople: %d\n"), -[PGMeaningPeopleCriteria minimumNumberOfPeople](self, "minimumNumberOfPeople"));
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresPetPresence: %d\n"), -[PGMeaningPeopleCriteria requiresPetPresence](self, "requiresPetPresence"));
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresChildPresence: %d\n"), -[PGMeaningPeopleCriteria requiresChildPresence](self, "requiresChildPresence"));
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresPartnerPresence: %d\n"), -[PGMeaningPeopleCriteria requiresPartnerPresence](self, "requiresPartnerPresence"));
  return (NSString *)v3;
}

- (unint64_t)minimumNumberOfPeople
{
  return self->_minimumNumberOfPeople;
}

- (void)setMinimumNumberOfPeople:(unint64_t)a3
{
  self->_minimumNumberOfPeople = a3;
}

- (BOOL)requiresPetPresence
{
  return self->_requiresPetPresence;
}

- (void)setRequiresPetPresence:(BOOL)a3
{
  self->_requiresPetPresence = a3;
}

- (BOOL)requiresChildPresence
{
  return self->_requiresChildPresence;
}

- (void)setRequiresChildPresence:(BOOL)a3
{
  self->_requiresChildPresence = a3;
}

- (BOOL)requiresPartnerPresence
{
  return self->_requiresPartnerPresence;
}

- (void)setRequiresPartnerPresence:(BOOL)a3
{
  self->_requiresPartnerPresence = a3;
}

void __63__PGMeaningPeopleCriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(v10, "isMeNode") & 1) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v5 + 24))
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v10, "isMyPartner");
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    *(_BYTE *)(v5 + 24) = v6;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v7 + 24))
    {
      v8 = 1;
    }
    else
    {
      v8 = objc_msgSend(v10, "isMyChild");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    *(_BYTE *)(v7 + 24) = v8;
    v9 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v9)
      v9 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
    *a3 = v9;
  }

}

@end
