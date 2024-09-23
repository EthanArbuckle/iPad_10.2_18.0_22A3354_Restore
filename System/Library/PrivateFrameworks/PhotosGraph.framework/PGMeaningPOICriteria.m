@implementation PGMeaningPOICriteria

+ (id)criteriaKey
{
  return CFSTR("POI");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positivePOIs"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = (void *)v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  objc_msgSend(v5, "setPositivePOIs:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfPOIs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;
  objc_msgSend(v5, "setMinimumNumberOfPOIs:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mustBeSpecial"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMustBeSpecial:", objc_msgSend(v14, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("negativePOIs"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v8;
  v18 = v17;

  objc_msgSend(v5, "setNegativePOIs:", v18);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumParkDiameter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  objc_msgSend(v5, "setMaximumParkDiameter:");

  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[4];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;

  v6 = a3;
  v7 = a4;
  -[PGMeaningPOICriteria positivePOIs](self, "positivePOIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[PGMeaningPOICriteria negativePOIs](self, "negativePOIs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 | v11)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = v9 == 0;
    if (-[PGMeaningPOICriteria mustBeSpecial](self, "mustBeSpecial"))
      objc_msgSend(v7, "specialPOINodes");
    else
      objc_msgSend(v7, "poiNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preciseAreaNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__PGMeaningPOICriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v17[3] = &unk_1E8427DC0;
    v19 = &v23;
    v17[4] = self;
    v15 = v14;
    v18 = v15;
    v20 = v22;
    v21 = v11;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
    v12 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PGMeaningPOICriteria positivePOIs](self, "positivePOIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningPOICriteria negativePOIs](self, "negativePOIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphPOINode validPOILabels](PGGraphPOINode, "validPOILabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    v12 = 1;
    *(_QWORD *)&v9 = 138412290;
    v18 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v14, v18, (_QWORD)v19) & 1) == 0)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loggingConnection");
          v16 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            v24 = v14;
            _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid poi \"%@\", buf, 0xCu);
          }

          v12 = 0;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  return v12 & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningPOICriteria positivePOIs](self, "positivePOIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMeaningPOICriteria negativePOIs](self, "negativePOIs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendFormat:", CFSTR("positivePOIs: %@\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("negativePOIs: %@\n"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumNumberOfPOIs: %d\n"), -[PGMeaningPOICriteria minimumNumberOfPOIs](self, "minimumNumberOfPOIs"));
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumNumberOfPOIs: %d\n"), -[PGMeaningPOICriteria minimumNumberOfPOIs](self, "minimumNumberOfPOIs"));
  v8 = -[PGMeaningPOICriteria mustBeSpecial](self, "mustBeSpecial");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("mustBeSpecial: %@\n"), v9);
  -[PGMeaningPOICriteria maximumParkDiameter](self, "maximumParkDiameter");
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumParkDiameter: %d\n"), (int)v10);

  return (NSString *)v3;
}

- (BOOL)_parkIsLargerThanMaximumDiameterWithAreaNodes:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  -[PGMeaningPOICriteria maximumParkDiameter](self, "maximumParkDiameter");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PGMeaningPOICriteria__parkIsLargerThanMaximumDiameterWithAreaNodes___block_invoke;
  v7[3] = &unk_1E8427DE8;
  v7[4] = &v8;
  v7[5] = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

- (NSArray)positivePOIs
{
  return self->_positivePOIs;
}

- (void)setPositivePOIs:(id)a3
{
  objc_storeStrong((id *)&self->_positivePOIs, a3);
}

- (NSArray)negativePOIs
{
  return self->_negativePOIs;
}

- (void)setNegativePOIs:(id)a3
{
  objc_storeStrong((id *)&self->_negativePOIs, a3);
}

- (unint64_t)minimumNumberOfPOIs
{
  return self->_minimumNumberOfPOIs;
}

- (void)setMinimumNumberOfPOIs:(unint64_t)a3
{
  self->_minimumNumberOfPOIs = a3;
}

- (BOOL)mustBeSpecial
{
  return self->_mustBeSpecial;
}

- (void)setMustBeSpecial:(BOOL)a3
{
  self->_mustBeSpecial = a3;
}

- (double)maximumParkDiameter
{
  return self->_maximumParkDiameter;
}

- (void)setMaximumParkDiameter:(double)a3
{
  self->_maximumParkDiameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativePOIs, 0);
  objc_storeStrong((id *)&self->_positivePOIs, 0);
}

uint64_t __70__PGMeaningPOICriteria__parkIsLargerThanMaximumDiameterWithAreaNodes___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "diameterIsLargerThanDiameter:", *(double *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __60__PGMeaningPOICriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (v13 = v5,
        objc_msgSend(*(id *)(a1 + 32), "positivePOIs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", v13),
        v6,
        v5 = v13,
        !v7))
  {
    if (*(_QWORD *)(a1 + 64))
    {
      v14 = v5;
      objc_msgSend(*(id *)(a1 + 32), "negativePOIs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v14);

      v5 = v14;
      if (v12)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
    }
  }
  else if (!objc_msgSend(v13, "isEqualToString:", CFSTR("Park"))
         || (v8 = objc_msgSend(*(id *)(a1 + 32), "_parkIsLargerThanMaximumDiameterWithAreaNodes:", *(_QWORD *)(a1 + 40)),
             v5 = v13,
             (v8 & 1) == 0))
  {
    v9 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v10 = objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfPOIs");
    v5 = v13;
    if (v9 >= v10)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

@end
