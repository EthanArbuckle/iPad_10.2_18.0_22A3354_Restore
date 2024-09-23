@implementation TIWordSearchCandidateResultSet

- (TIWordSearchCandidateResultSet)init
{
  return -[TIWordSearchCandidateResultSet initWithCandidates:candidateRefsDictionary:](self, "initWithCandidates:candidateRefsDictionary:", 0, 0);
}

- (TIWordSearchCandidateResultSet)initWithCandidates:(id)a3 candidateRefsDictionary:(id)a4 disambiguationCandidates:(id)a5 selectedDisambiguationCandidateIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  TIWordSearchCandidateResultSet *v13;
  NSMutableArray *v14;
  NSMutableArray *mutableCandidates;
  NSMutableDictionary *v16;
  NSMutableDictionary *mutableCandidateRefsDictionary;
  uint64_t v18;
  NSArray *disambiguationCandidates;
  NSMutableArray *v20;
  NSMutableArray *mutableProactiveTriggers;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TIWordSearchCandidateResultSet;
  v13 = -[TIWordSearchCandidateResultSet init](&v23, sel_init);
  if (v13)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableCandidates = v13->_mutableCandidates;
    v13->_mutableCandidates = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableCandidateRefsDictionary = v13->_mutableCandidateRefsDictionary;
    v13->_mutableCandidateRefsDictionary = v16;

    if (v10 && v11)
      -[TIWordSearchCandidateResultSet addCandidates:candidateRefsDictionary:](v13, "addCandidates:candidateRefsDictionary:", v10, v11);
    v18 = objc_msgSend(v12, "copy");
    disambiguationCandidates = v13->_disambiguationCandidates;
    v13->_disambiguationCandidates = (NSArray *)v18;

    v13->_selectedDisambiguationCandidateIndex = a6;
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableProactiveTriggers = v13->_mutableProactiveTriggers;
    v13->_mutableProactiveTriggers = v20;

  }
  return v13;
}

- (TIWordSearchCandidateResultSet)initWithCandidates:(id)a3 candidateRefsDictionary:(id)a4
{
  return -[TIWordSearchCandidateResultSet initWithCandidates:candidateRefsDictionary:disambiguationCandidates:selectedDisambiguationCandidateIndex:](self, "initWithCandidates:candidateRefsDictionary:disambiguationCandidates:selectedDisambiguationCandidateIndex:", a3, a4, 0, 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[TIWordSearchCandidateResultSet candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[TIWordSearchCandidateResultSet disambiguationCandidates](self, "disambiguationCandidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[TIWordSearchCandidateResultSet proactiveTriggers](self, "proactiveTriggers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v4 = 0;
      }
      else
      {
        -[TIWordSearchCandidateResultSet proactiveCandidates](self, "proactiveCandidates");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "count") == 0;

      }
    }

  }
  return v4;
}

- (void)addCandidates:(id)a3 candidateRefsDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v7);

  -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v6);

}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4
{
  -[TIWordSearchCandidateResultSet addSyntheticMecabraCandidateWithSurface:input:isExtension:](self, "addSyntheticMecabraCandidateWithSurface:input:isExtension:", a3, a4, 0);
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5
{
  -[TIWordSearchCandidateResultSet addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:](self, "addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:", a3, a4, a5, 0);
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6
{
  -[TIWordSearchCandidateResultSet addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:cursorMovement:](self, "addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:cursorMovement:", a3, a4, a5, a6, 0);
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6 cursorMovement:(int64_t)a7
{
  -[TIWordSearchCandidateResultSet addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:cursorMovement:annotation:](self, "addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:cursorMovement:annotation:", a3, a4, a5, a6, a7, 0);
}

- (void)addSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 isExtension:(BOOL)a5 deleteCount:(unint64_t)a6 cursorMovement:(int64_t)a7 annotation:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v10 = a5;
  v23 = a8;
  v14 = a4;
  v15 = a3;
  v16 = (void *)MecabraConversionCandidateCreate();
  v17 = objc_alloc(MEMORY[0x1E0DBDC88]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:", v15, v14, v18, v10, a6, a7);

  if (v23)
    objc_msgSend(v19, "setAnnotationText:", v23);
  -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v19);

  -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mecabraCandidatePointerValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v16, v22);

}

- (void)insertSyntheticMecabraCandidateWithSurface:(id)a3 input:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = (void *)MecabraConversionCandidateCreate();
  v11 = objc_alloc(MEMORY[0x1E0DBDC88]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v11, "initWithSurface:input:mecabraCandidatePointerValue:", v9, v8, v12);

  -[TIWordSearchCandidateResultSet candidates](self, "candidates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v10)
  {
    if (v14 < a5)
      a5 = v14;
    -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertObject:atIndex:", v18, a5);

    -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mecabraCandidatePointerValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v10, v17);

  }
}

- (void)addMecabraCandidate:(id)a3 mecabraCandidateRef:(void *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TIWordSearchCandidateResultSet updateSupplementalMecabraCandidate:withMecabraCandidateRef:](self, "updateSupplementalMecabraCandidate:withMecabraCandidateRef:", v9, a4);
  -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  if (a4)
  {
    -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mecabraCandidatePointerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", a4, v8);

  }
}

- (void)addMecabraProactiveCandidate:(void *)a3 triggerSourceType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  TIProactiveTrigger *v10;
  void *v11;
  id v12;

  v4 = a4;
  if (MecabraCandidateGetType() == 6)
  {
    MecabraCandidateGetAttributes();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", a3, v7);

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x1E0DBEB18]);
      v10 = -[TIProactiveTrigger initWithSourceType:attributes:]([TIProactiveTrigger alloc], "initWithSourceType:attributes:", v4, v9);
      -[TIWordSearchCandidateResultSet mutableProactiveTriggers](self, "mutableProactiveTriggers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

    }
  }
}

- (void)addMecabraFacemarkCandidate:(void *)a3 forInput:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  if (a3)
  {
    v17 = v6;
    v7 = MecabraCandidateGetType() == 7;
    v6 = v17;
    if (v7)
    {
      MecabraCandidateGetSurface();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MecabraCandidateGetAttributes();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0DBDC90];
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("category"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "candidateWithCandidate:category:input:mecabraCandidatePointerValue:", v8, v11, v17, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v13);

      -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mecabraCandidatePointerValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", a3, v16);

      v6 = v17;
    }
  }

}

- (void)addSyntheticMecabraProactiveCandidate:(id)a3 triggerSourceType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;

  v4 = a4;
  v6 = (void *)MecabraProactiveCandidateCreate();
  -[TIWordSearchCandidateResultSet addMecabraProactiveCandidate:triggerSourceType:](self, "addMecabraProactiveCandidate:triggerSourceType:", v6, v4);
  if (v6)

}

- (void)addProactiveTrigger:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[TIWordSearchCandidateResultSet mutableProactiveTriggers](self, "mutableProactiveTriggers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)insertMecabraCandidate:(id)a3 mecabraCandidateRef:(void *)a4 atIndex:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[TIWordSearchCandidateResultSet updateSupplementalMecabraCandidate:withMecabraCandidateRef:](self, "updateSupplementalMecabraCandidate:withMecabraCandidateRef:", v11, a4);
  -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObject:atIndex:", v11, a5);

  if (a4)
  {
    -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mecabraCandidatePointerValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", a4, v10);

  }
}

- (void)setAutoconvertedMecabraCandidates:(id)a3 candidateRefsDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[TIWordSearchCandidateResultSet setAutoconvertedCandidates:](self, "setAutoconvertedCandidates:", v7);
  objc_msgSend(v7, "valueForKey:", CFSTR("candidate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", &stru_1EA1081D0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearchCandidateResultSet setAutoconvertedCandidateString:](self, "setAutoconvertedCandidateString:", v9);

  objc_msgSend(v7, "valueForKey:", CFSTR("input"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "componentsJoinedByString:", &stru_1EA1081D0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearchCandidateResultSet setAutoconvertedInputString:](self, "setAutoconvertedInputString:", v11);

  -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v6);

}

- (void)moveCandidate:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  -[TIWordSearchCandidateResultSet candidates](self, "candidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a4)
  {
    -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", a4);

    -[TIWordSearchCandidateResultSet candidates](self, "candidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 < a5)
      a5 = v12;
    -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertObject:atIndex:", v14, a5);

  }
}

- (void)insertStickers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB36B8];
    -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexSetWithIndexesInRange:", objc_msgSend(v6, "count") != 0, objc_msgSend(v8, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertObjects:atIndexes:", v8, v7);

  }
}

- (void)clearProactiveTriggers
{
  if (-[NSMutableArray count](self->_mutableProactiveTriggers, "count"))
    -[NSMutableArray removeAllObjects](self->_mutableProactiveTriggers, "removeAllObjects");
}

- (void)updateSupplementalMecabraCandidate:(id)a3 withMecabraCandidateRef:(void *)a4
{
  unsigned __int16 v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  if (MecabraCandidateIsSupplementalLexiconCandidate())
  {
    objc_msgSend(v8, "setSupplementalItemIdentifiers:", MecabraCandidateGetSupplementalLexiconIdentifiers());
    objc_msgSend(v8, "setSupplementalItemPrefix:", 0);
    v4 = objc_msgSend((id)MecabraCandidateGetSupplementalLexiconItemPrefix(), "shortValue");
    objc_msgSend(v8, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v8, "input");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "characterAtIndex:", 0);

      if (v7 == v4)
        objc_msgSend(v8, "setSupplementalItemPrefix:", v4);
    }
    else
    {

    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  TIWordSearchCandidateResultSet *v4;
  void *v5;
  void *v6;
  void *v7;
  TIWordSearchCandidateResultSet *v8;

  v4 = +[TIWordSearchCandidateResultSet allocWithZone:](TIWordSearchCandidateResultSet, "allocWithZone:", a3);
  -[TIWordSearchCandidateResultSet mutableCandidates](self, "mutableCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearchCandidateResultSet mutableCandidateRefsDictionary](self, "mutableCandidateRefsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearchCandidateResultSet disambiguationCandidates](self, "disambiguationCandidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIWordSearchCandidateResultSet initWithCandidates:candidateRefsDictionary:disambiguationCandidates:selectedDisambiguationCandidateIndex:](v4, "initWithCandidates:candidateRefsDictionary:disambiguationCandidates:selectedDisambiguationCandidateIndex:", v5, v6, v7, -[TIWordSearchCandidateResultSet selectedDisambiguationCandidateIndex](self, "selectedDisambiguationCandidateIndex"));

  return v8;
}

- (NSMutableArray)mutableCandidates
{
  return self->_mutableCandidates;
}

- (void)setMutableCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_mutableCandidates, a3);
}

- (NSMutableDictionary)mutableCandidateRefsDictionary
{
  return self->_mutableCandidateRefsDictionary;
}

- (void)setMutableCandidateRefsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mutableCandidateRefsDictionary, a3);
}

- (NSArray)disambiguationCandidates
{
  return self->_disambiguationCandidates;
}

- (void)setDisambiguationCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)selectedDisambiguationCandidateIndex
{
  return self->_selectedDisambiguationCandidateIndex;
}

- (void)setSelectedDisambiguationCandidateIndex:(unint64_t)a3
{
  self->_selectedDisambiguationCandidateIndex = a3;
}

- (TIKeyboardCandidate)candidateAfterSegmentBreak
{
  return self->_candidateAfterSegmentBreak;
}

- (void)setCandidateAfterSegmentBreak:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)proactiveCandidates
{
  return self->_proactiveCandidates;
}

- (void)setProactiveCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveCandidates, a3);
}

- (NSArray)autoconvertedCandidates
{
  return self->_autoconvertedCandidates;
}

- (void)setAutoconvertedCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)autoconvertedCandidateString
{
  return self->_autoconvertedCandidateString;
}

- (void)setAutoconvertedCandidateString:(id)a3
{
  objc_storeStrong((id *)&self->_autoconvertedCandidateString, a3);
}

- (NSString)autoconvertedInputString
{
  return self->_autoconvertedInputString;
}

- (void)setAutoconvertedInputString:(id)a3
{
  objc_storeStrong((id *)&self->_autoconvertedInputString, a3);
}

- (NSMutableArray)mutableProactiveTriggers
{
  return self->_mutableProactiveTriggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProactiveTriggers, 0);
  objc_storeStrong((id *)&self->_autoconvertedInputString, 0);
  objc_storeStrong((id *)&self->_autoconvertedCandidateString, 0);
  objc_storeStrong((id *)&self->_autoconvertedCandidates, 0);
  objc_storeStrong((id *)&self->_proactiveCandidates, 0);
  objc_storeStrong((id *)&self->_candidateAfterSegmentBreak, 0);
  objc_storeStrong((id *)&self->_disambiguationCandidates, 0);
  objc_storeStrong((id *)&self->_mutableCandidateRefsDictionary, 0);
  objc_storeStrong((id *)&self->_mutableCandidates, 0);
}

+ (id)emptySet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TIWordSearchCandidateResultSet_emptySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptySet___onceToken != -1)
    dispatch_once(&emptySet___onceToken, block);
  return (id)emptySet___emptySet;
}

void __42__TIWordSearchCandidateResultSet_emptySet__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCandidates:candidateRefsDictionary:", 0, 0);
  v2 = (void *)emptySet___emptySet;
  emptySet___emptySet = v1;

}

@end
