@implementation ATXPBSuggestionLayout

- (BOOL)readFrom:(id)a3
{
  return ATXPBSuggestionLayoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)addOneByOneSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)widgetUniqueId
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)uuidString
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (uint64_t)uuidOfHighestConfidenceSuggestion
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)twoByTwoSuggestions
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)twoByFourSuggestions
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)oneByTwoSuggestions
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)oneByOneSuggestions
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)oneByFourSuggestions
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)numWidgetsInStack
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)layoutType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 116) & 4) != 0)
      return *(unsigned int *)(result + 40);
    else
      return 0;
  }
  return result;
}

- (double)layoutScore
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (BOOL)isValidForSuggestionsWidget
{
  if (result)
    return *(_BYTE *)(result + 115) != 0;
  return result;
}

- (BOOL)isNPlusOne
{
  if (result)
    return *(_BYTE *)(result + 114) != 0;
  return result;
}

- (BOOL)isLowConfidenceStackRotationForStaleStack
{
  if (result)
    return *(_BYTE *)(result + 113) != 0;
  return result;
}

- (BOOL)hasUuidOfHighestConfidenceSuggestion
{
  if (result)
    return *(_QWORD *)(result + 88) != 0;
  return result;
}

- (uint64_t)fourByFourSuggestions
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)fourByEightSuggestions
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (BOOL)confidenceWarrantsSnappingOrNPlusOne
{
  if (result)
    return *(_BYTE *)(result + 112) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_uuidOfHighestConfidenceSuggestion, 0);
  objc_storeStrong((id *)&self->_twoByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_twoByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByTwoSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByOneSuggestions, 0);
  objc_storeStrong((id *)&self->_oneByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_fourByFourSuggestions, 0);
  objc_storeStrong((id *)&self->_fourByEightSuggestions, 0);
}

- (uint64_t)setLayoutType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 116) |= 4u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasLayoutType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 116) = *(_BYTE *)(result + 116) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasLayoutType
{
  if (result)
    return (*(unsigned __int8 *)(result + 116) >> 2) & 1;
  return result;
}

- (__CFString)layoutTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0x12)
      return off_1E57CF050[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsLayoutType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Eight1x1")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Two1x2AndFour1x1")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("One2x2AndFour1x1")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("One2x4")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Two1x2")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("One2x2")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Two2x2")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Four1x2")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("N1x4")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Two1x4")) & 1) != 0)
    {
      v6 = 9;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("One4x4")) & 1) != 0)
    {
      v6 = 10;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Four1x4")) & 1) != 0)
    {
      v6 = 11;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("N2x2AndN1x1")) & 1) != 0)
    {
      v6 = 12;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("N2x4AndN1x1")) & 1) != 0)
    {
      v6 = 13;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("N2x4AndN2x2AndN1x1")) & 1) != 0)
    {
      v6 = 14;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("N1x1")) & 1) != 0)
    {
      v6 = 15;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("One4x8")) & 1) != 0)
    {
      v6 = 16;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionList")))
    {
      v6 = 17;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)setLayoutScore:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 116) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasLayoutScore:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 116) = *(_BYTE *)(result + 116) & 0xFE | a2;
  return result;
}

- (uint64_t)hasLayoutScore
{
  if (result)
    return *(_BYTE *)(result + 116) & 1;
  return result;
}

- (BOOL)hasUuidString
{
  if (result)
    return *(_QWORD *)(result + 96) != 0;
  return result;
}

- (uint64_t)clearOneByOneSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "removeAllObjects");
  return result;
}

- (uint64_t)oneByOneSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "count");
  return result;
}

- (id)oneByOneSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[7], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)oneByOneSuggestionsType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)clearOneByTwoSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "removeAllObjects");
  return result;
}

- (void)addOneByTwoSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)oneByTwoSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "count");
  return result;
}

- (id)oneByTwoSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[8], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearTwoByTwoSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "removeAllObjects");
  return result;
}

- (void)addTwoByTwoSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)twoByTwoSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "count");
  return result;
}

- (id)twoByTwoSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[10], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearOneByFourSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "removeAllObjects");
  return result;
}

- (void)addOneByFourSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)oneByFourSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "count");
  return result;
}

- (id)oneByFourSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[6], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearTwoByFourSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 72), "removeAllObjects");
  return result;
}

- (void)addTwoByFourSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)twoByFourSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 72), "count");
  return result;
}

- (id)twoByFourSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[9], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)setIsValidForSuggestionsWidget:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 116) |= 0x40u;
    *(_BYTE *)(result + 115) = a2;
  }
  return result;
}

- (uint64_t)setHasIsValidForSuggestionsWidget:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 64;
    else
      v2 = 0;
    *(_BYTE *)(result + 116) = *(_BYTE *)(result + 116) & 0xBF | v2;
  }
  return result;
}

- (uint64_t)hasIsValidForSuggestionsWidget
{
  if (result)
    return (*(unsigned __int8 *)(result + 116) >> 6) & 1;
  return result;
}

- (uint64_t)setConfidenceWarrantsSnappingOrNPlusOne:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 116) |= 8u;
    *(_BYTE *)(result + 112) = a2;
  }
  return result;
}

- (uint64_t)setHasConfidenceWarrantsSnappingOrNPlusOne:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 116) = *(_BYTE *)(result + 116) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasConfidenceWarrantsSnappingOrNPlusOne
{
  if (result)
    return (*(unsigned __int8 *)(result + 116) >> 3) & 1;
  return result;
}

- (uint64_t)setIsNPlusOne:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 116) |= 0x20u;
    *(_BYTE *)(result + 114) = a2;
  }
  return result;
}

- (uint64_t)setHasIsNPlusOne:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 32;
    else
      v2 = 0;
    *(_BYTE *)(result + 116) = *(_BYTE *)(result + 116) & 0xDF | v2;
  }
  return result;
}

- (uint64_t)hasIsNPlusOne
{
  if (result)
    return (*(unsigned __int8 *)(result + 116) >> 5) & 1;
  return result;
}

- (BOOL)hasWidgetUniqueId
{
  if (result)
    return *(_QWORD *)(result + 104) != 0;
  return result;
}

- (uint64_t)setIsLowConfidenceStackRotationForStaleStack:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 116) |= 0x10u;
    *(_BYTE *)(result + 113) = a2;
  }
  return result;
}

- (uint64_t)setHasIsLowConfidenceStackRotationForStaleStack:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_BYTE *)(result + 116) = *(_BYTE *)(result + 116) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasIsLowConfidenceStackRotationForStaleStack
{
  if (result)
    return (*(unsigned __int8 *)(result + 116) >> 4) & 1;
  return result;
}

- (uint64_t)setNumWidgetsInStack:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 116) |= 2u;
    *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasNumWidgetsInStack:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 116) = *(_BYTE *)(result + 116) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasNumWidgetsInStack
{
  if (result)
    return (*(unsigned __int8 *)(result + 116) >> 1) & 1;
  return result;
}

- (uint64_t)clearFourByFourSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (void)addFourByFourSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)fourByFourSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)fourByFourSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearFourByEightSuggestions
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "removeAllObjects");
  return result;
}

- (void)addFourByEightSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)fourByEightSuggestionsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "count");
  return result;
}

- (id)fourByEightSuggestionsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[3], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSuggestionLayout;
  -[ATXPBSuggestionLayout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSuggestionLayout dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t layoutType;
  __CFString *v6;
  void *v7;
  NSString *uuidString;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  void *v43;
  char v44;
  void *v45;
  NSString *widgetUniqueId;
  void *v47;
  NSString *uuidOfHighestConfidenceSuggestion;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t ii;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t jj;
  void *v63;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    layoutType = self->_layoutType;
    if (layoutType >= 0x12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_layoutType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E57CF050[layoutType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("layoutType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_layoutScore);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("layoutScore"));

  }
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  if (-[NSMutableArray count](self->_oneByOneSuggestions, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_oneByOneSuggestions, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v10 = self->_oneByOneSuggestions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v92 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("oneByOneSuggestions"));
  }
  if (-[NSMutableArray count](self->_oneByTwoSuggestions, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_oneByTwoSuggestions, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v17 = self->_oneByTwoSuggestions;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v88 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("oneByTwoSuggestions"));
  }
  if (-[NSMutableArray count](self->_twoByTwoSuggestions, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_twoByTwoSuggestions, "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v24 = self->_twoByTwoSuggestions;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v84 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("twoByTwoSuggestions"));
  }
  if (-[NSMutableArray count](self->_oneByFourSuggestions, "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_oneByFourSuggestions, "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v31 = self->_oneByFourSuggestions;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v80;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v80 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * m), "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v36);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
      }
      while (v33);
    }

    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("oneByFourSuggestions"));
  }
  if (-[NSMutableArray count](self->_twoByFourSuggestions, "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_twoByFourSuggestions, "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v38 = self->_twoByFourSuggestions;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v76;
      do
      {
        for (n = 0; n != v40; ++n)
        {
          if (*(_QWORD *)v76 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * n), "dictionaryRepresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v43);

        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
      }
      while (v40);
    }

    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("twoByFourSuggestions"));
  }
  v44 = (char)self->_has;
  if ((v44 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isValidForSuggestionsWidget);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("isValidForSuggestionsWidget"));

    v44 = (char)self->_has;
    if ((v44 & 8) == 0)
    {
LABEL_57:
      if ((v44 & 0x20) == 0)
        goto LABEL_59;
      goto LABEL_58;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_confidenceWarrantsSnappingOrNPlusOne);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("confidenceWarrantsSnappingOrNPlusOne"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isNPlusOne);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("isNPlusOne"));

  }
LABEL_59:
  widgetUniqueId = self->_widgetUniqueId;
  if (widgetUniqueId)
    objc_msgSend(v3, "setObject:forKey:", widgetUniqueId, CFSTR("widgetUniqueId"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLowConfidenceStackRotationForStaleStack);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("isLowConfidenceStackRotationForStaleStack"));

  }
  uuidOfHighestConfidenceSuggestion = self->_uuidOfHighestConfidenceSuggestion;
  if (uuidOfHighestConfidenceSuggestion)
    objc_msgSend(v3, "setObject:forKey:", uuidOfHighestConfidenceSuggestion, CFSTR("uuidOfHighestConfidenceSuggestion"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numWidgetsInStack);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("numWidgetsInStack"));

  }
  if (-[NSMutableArray count](self->_fourByFourSuggestions, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fourByFourSuggestions, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v51 = self->_fourByFourSuggestions;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v72;
      do
      {
        for (ii = 0; ii != v53; ++ii)
        {
          if (*(_QWORD *)v72 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * ii), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
      }
      while (v53);
    }

    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("fourByFourSuggestions"));
  }
  if (-[NSMutableArray count](self->_fourByEightSuggestions, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fourByEightSuggestions, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v58 = self->_fourByEightSuggestions;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v68;
      do
      {
        for (jj = 0; jj != v60; ++jj)
        {
          if (*(_QWORD *)v68 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * jj), "dictionaryRepresentation");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
      }
      while (v60);
    }

    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("fourByEightSuggestions"));
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  char v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_uuidString)
    PBDataWriterWriteStringField();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v6 = self->_oneByOneSuggestions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v8);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v11 = self->_oneByTwoSuggestions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v63 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v13);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v16 = self->_twoByTwoSuggestions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v59 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    }
    while (v18);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v21 = self->_oneByFourSuggestions;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v55;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v55 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    }
    while (v23);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = self->_twoByFourSuggestions;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v51;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
    }
    while (v28);
  }

  v31 = (char)self->_has;
  if ((v31 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v31 = (char)self->_has;
    if ((v31 & 8) == 0)
    {
LABEL_44:
      if ((v31 & 0x20) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_45:
    PBDataWriterWriteBOOLField();
LABEL_46:
  if (self->_widgetUniqueId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_uuidOfHighestConfidenceSuggestion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v32 = self->_fourByFourSuggestions;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v47;
    do
    {
      for (ii = 0; ii != v34; ++ii)
      {
        if (*(_QWORD *)v47 != v35)
          objc_enumerationMutation(v32);
        PBDataWriterWriteSubmessage();
      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
    }
    while (v34);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v37 = self->_fourByEightSuggestions;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v43;
    do
    {
      for (jj = 0; jj != v39; ++jj)
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(v37);
        PBDataWriterWriteSubmessage();
      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
    }
    while (v39);
  }

}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t n;
  void *v24;
  char v25;
  id *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t ii;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t jj;
  void *v36;
  id *v37;

  v37 = a2;
  if (!a1)
    goto LABEL_63;
  if ((*(_BYTE *)(a1 + 116) & 4) != 0)
  {
    v3 = v37;
    *((_DWORD *)v37 + 10) = *(_DWORD *)(a1 + 40);
    *((_BYTE *)v37 + 116) |= 4u;
    if ((*(_BYTE *)(a1 + 116) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v3 = v37;
  if ((*(_BYTE *)(a1 + 116) & 1) != 0)
  {
LABEL_6:
    v3[1] = *(id *)(a1 + 8);
    *((_BYTE *)v3 + 116) |= 1u;
  }
LABEL_7:
  v4 = *(void **)(a1 + 96);
  if (v4)
    -[ATXPBSuggestionLayout setUuidString:]((uint64_t)v37, v4);
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    if (v37)
      objc_msgSend(v37[7], "removeAllObjects");
    v5 = objc_msgSend(*(id *)(a1 + 56), "count");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBSuggestionLayout oneByOneSuggestionsAtIndex:]((id *)a1, i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBSuggestionLayout addOneByOneSuggestions:]((uint64_t)v37, v8);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    if (v37)
      objc_msgSend(v37[8], "removeAllObjects");
    v9 = objc_msgSend(*(id *)(a1 + 64), "count");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[ATXPBSuggestionLayout oneByTwoSuggestionsAtIndex:]((id *)a1, j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:]((uint64_t)v37, v12);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    if (v37)
      objc_msgSend(v37[10], "removeAllObjects");
    v13 = objc_msgSend(*(id *)(a1 + 80), "count");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[ATXPBSuggestionLayout twoByTwoSuggestionsAtIndex:]((id *)a1, k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:]((uint64_t)v37, v16);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    if (v37)
      objc_msgSend(v37[6], "removeAllObjects");
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[ATXPBSuggestionLayout oneByFourSuggestionsAtIndex:]((id *)a1, m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBSuggestionLayout addOneByFourSuggestions:]((uint64_t)v37, v20);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    if (v37)
      objc_msgSend(v37[9], "removeAllObjects");
    v21 = objc_msgSend(*(id *)(a1 + 72), "count");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[ATXPBSuggestionLayout twoByFourSuggestionsAtIndex:]((id *)a1, n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:]((uint64_t)v37, v24);

      }
    }
  }
  v25 = *(_BYTE *)(a1 + 116);
  v26 = v37;
  if ((v25 & 0x40) == 0)
  {
    if ((*(_BYTE *)(a1 + 116) & 8) == 0)
      goto LABEL_41;
LABEL_65:
    *((_BYTE *)v37 + 112) = *(_BYTE *)(a1 + 112);
    *((_BYTE *)v37 + 116) |= 8u;
    if ((*(_BYTE *)(a1 + 116) & 0x20) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
  *((_BYTE *)v37 + 115) = *(_BYTE *)(a1 + 115);
  *((_BYTE *)v37 + 116) |= 0x40u;
  v25 = *(_BYTE *)(a1 + 116);
  if ((v25 & 8) != 0)
    goto LABEL_65;
LABEL_41:
  if ((v25 & 0x20) != 0)
  {
LABEL_42:
    *((_BYTE *)v37 + 114) = *(_BYTE *)(a1 + 114);
    *((_BYTE *)v37 + 116) |= 0x20u;
  }
LABEL_43:
  v27 = *(void **)(a1 + 104);
  if (v27)
  {
    -[ATXPBSuggestionLayout setWidgetUniqueId:]((uint64_t)v37, v27);
    v26 = v37;
  }
  if ((*(_BYTE *)(a1 + 116) & 0x10) != 0)
  {
    *((_BYTE *)v26 + 113) = *(_BYTE *)(a1 + 113);
    *((_BYTE *)v26 + 116) |= 0x10u;
  }
  v28 = *(void **)(a1 + 88);
  if (v28)
  {
    -[ATXPBSuggestionLayout setUuidOfHighestConfidenceSuggestion:]((uint64_t)v37, v28);
    v26 = v37;
  }
  if ((*(_BYTE *)(a1 + 116) & 2) != 0)
  {
    v26[2] = *(id *)(a1 + 16);
    *((_BYTE *)v26 + 116) |= 2u;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (v37)
      objc_msgSend(v37[4], "removeAllObjects");
    v29 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v29)
    {
      v30 = v29;
      for (ii = 0; ii != v30; ++ii)
      {
        -[ATXPBSuggestionLayout fourByFourSuggestionsAtIndex:]((id *)a1, ii);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBSuggestionLayout addFourByFourSuggestions:]((uint64_t)v37, v32);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    if (v37)
      objc_msgSend(v37[3], "removeAllObjects");
    v33 = objc_msgSend(*(id *)(a1 + 24), "count");
    if (v33)
    {
      v34 = v33;
      for (jj = 0; jj != v34; ++jj)
      {
        -[ATXPBSuggestionLayout fourByEightSuggestionsAtIndex:]((id *)a1, jj);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBSuggestionLayout addFourByEightSuggestions:]((uint64_t)v37, v36);

      }
    }
  }
LABEL_63:

}

- (void)setUuidString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (void)setWidgetUniqueId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)setUuidOfHighestConfidenceSuggestion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t jj;
  void *v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_layoutType;
    *(_BYTE *)(v5 + 116) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_layoutScore;
    *(_BYTE *)(v5 + 116) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v8;

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v10 = self->_oneByOneSuggestions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v83 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "copyWithZone:", a3);
        -[ATXPBSuggestionLayout addOneByOneSuggestions:](v6, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    }
    while (v12);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v16 = self->_oneByTwoSuggestions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v79 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "copyWithZone:", a3);
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:](v6, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    }
    while (v18);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v22 = self->_twoByTwoSuggestions;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v75 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "copyWithZone:", a3);
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:](v6, v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    }
    while (v24);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v28 = self->_oneByFourSuggestions;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v71;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v71 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * m), "copyWithZone:", a3);
        -[ATXPBSuggestionLayout addOneByFourSuggestions:](v6, v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
    }
    while (v30);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v34 = self->_twoByFourSuggestions;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v67;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v67 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * n), "copyWithZone:", a3);
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:](v6, v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
    }
    while (v36);
  }

  v40 = (char)self->_has;
  if ((v40 & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 115) = self->_isValidForSuggestionsWidget;
    *(_BYTE *)(v6 + 116) |= 0x40u;
    v40 = (char)self->_has;
    if ((v40 & 8) == 0)
    {
LABEL_42:
      if ((v40 & 0x20) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_42;
  }
  *(_BYTE *)(v6 + 112) = self->_confidenceWarrantsSnappingOrNPlusOne;
  *(_BYTE *)(v6 + 116) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_43:
    *(_BYTE *)(v6 + 114) = self->_isNPlusOne;
    *(_BYTE *)(v6 + 116) |= 0x20u;
  }
LABEL_44:
  v41 = -[NSString copyWithZone:](self->_widgetUniqueId, "copyWithZone:", a3);
  v42 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v41;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 113) = self->_isLowConfidenceStackRotationForStaleStack;
    *(_BYTE *)(v6 + 116) |= 0x10u;
  }
  v43 = -[NSString copyWithZone:](self->_uuidOfHighestConfidenceSuggestion, "copyWithZone:", a3);
  v44 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v43;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_numWidgetsInStack;
    *(_BYTE *)(v6 + 116) |= 2u;
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v45 = self->_fourByFourSuggestions;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v63;
    do
    {
      for (ii = 0; ii != v47; ++ii)
      {
        if (*(_QWORD *)v63 != v48)
          objc_enumerationMutation(v45);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * ii), "copyWithZone:", a3);
        -[ATXPBSuggestionLayout addFourByFourSuggestions:](v6, v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
    }
    while (v47);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v51 = self->_fourByEightSuggestions;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v59;
    do
    {
      for (jj = 0; jj != v53; ++jj)
      {
        if (*(_QWORD *)v59 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * jj), "copyWithZone:", a3, (_QWORD)v58);
        -[ATXPBSuggestionLayout addFourByEightSuggestions:](v6, v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
    }
    while (v53);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuidString;
  NSMutableArray *oneByOneSuggestions;
  NSMutableArray *oneByTwoSuggestions;
  NSMutableArray *twoByTwoSuggestions;
  NSMutableArray *oneByFourSuggestions;
  NSMutableArray *twoByFourSuggestions;
  char has;
  NSString *widgetUniqueId;
  NSString *uuidOfHighestConfidenceSuggestion;
  NSMutableArray *fourByFourSuggestions;
  NSMutableArray *fourByEightSuggestions;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_71;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 4) == 0 || self->_layoutType != *((_DWORD *)v4 + 10))
      goto LABEL_71;
  }
  else if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_layoutScore != *((double *)v4 + 1))
      goto LABEL_71;
  }
  else if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    goto LABEL_71;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](uuidString, "isEqual:"))
  {
    goto LABEL_71;
  }
  oneByOneSuggestions = self->_oneByOneSuggestions;
  if ((unint64_t)oneByOneSuggestions | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](oneByOneSuggestions, "isEqual:"))
      goto LABEL_71;
  }
  oneByTwoSuggestions = self->_oneByTwoSuggestions;
  if ((unint64_t)oneByTwoSuggestions | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](oneByTwoSuggestions, "isEqual:"))
      goto LABEL_71;
  }
  twoByTwoSuggestions = self->_twoByTwoSuggestions;
  if ((unint64_t)twoByTwoSuggestions | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](twoByTwoSuggestions, "isEqual:"))
      goto LABEL_71;
  }
  oneByFourSuggestions = self->_oneByFourSuggestions;
  if ((unint64_t)oneByFourSuggestions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](oneByFourSuggestions, "isEqual:"))
      goto LABEL_71;
  }
  twoByFourSuggestions = self->_twoByFourSuggestions;
  if ((unint64_t)twoByFourSuggestions | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](twoByFourSuggestions, "isEqual:"))
      goto LABEL_71;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 0x40) == 0)
      goto LABEL_71;
    if (self->_isValidForSuggestionsWidget)
    {
      if (!*((_BYTE *)v4 + 115))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 115))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 8) == 0)
      goto LABEL_71;
    if (self->_confidenceWarrantsSnappingOrNPlusOne)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 0x20) == 0)
      goto LABEL_71;
    if (self->_isNPlusOne)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 0x20) != 0)
  {
    goto LABEL_71;
  }
  widgetUniqueId = self->_widgetUniqueId;
  if ((unint64_t)widgetUniqueId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](widgetUniqueId, "isEqual:"))
      goto LABEL_71;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 0x10) == 0)
      goto LABEL_71;
    if (self->_isLowConfidenceStackRotationForStaleStack)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 0x10) != 0)
  {
    goto LABEL_71;
  }
  uuidOfHighestConfidenceSuggestion = self->_uuidOfHighestConfidenceSuggestion;
  if (!((unint64_t)uuidOfHighestConfidenceSuggestion | *((_QWORD *)v4 + 11)))
    goto LABEL_62;
  if (!-[NSString isEqual:](uuidOfHighestConfidenceSuggestion, "isEqual:"))
  {
LABEL_71:
    v16 = 0;
    goto LABEL_72;
  }
  has = (char)self->_has;
LABEL_62:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 2) == 0 || self->_numWidgetsInStack != *((_QWORD *)v4 + 2))
      goto LABEL_71;
  }
  else if ((*((_BYTE *)v4 + 116) & 2) != 0)
  {
    goto LABEL_71;
  }
  fourByFourSuggestions = self->_fourByFourSuggestions;
  if ((unint64_t)fourByFourSuggestions | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](fourByFourSuggestions, "isEqual:"))
  {
    goto LABEL_71;
  }
  fourByEightSuggestions = self->_fourByEightSuggestions;
  if ((unint64_t)fourByEightSuggestions | *((_QWORD *)v4 + 3))
    v16 = -[NSMutableArray isEqual:](fourByEightSuggestions, "isEqual:");
  else
    v16 = 1;
LABEL_72:

  return v16;
}

- (unint64_t)hash
{
  double layoutScore;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  unint64_t v24;
  uint64_t v25;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v25 = 2654435761 * self->_layoutType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v24 = 0;
    goto LABEL_12;
  }
  v25 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  layoutScore = self->_layoutScore;
  v4 = -layoutScore;
  if (layoutScore >= 0.0)
    v4 = self->_layoutScore;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  v24 = v7;
LABEL_12:
  v23 = -[NSString hash](self->_uuidString, "hash");
  v22 = -[NSMutableArray hash](self->_oneByOneSuggestions, "hash");
  v21 = -[NSMutableArray hash](self->_oneByTwoSuggestions, "hash");
  v20 = -[NSMutableArray hash](self->_twoByTwoSuggestions, "hash");
  v8 = -[NSMutableArray hash](self->_oneByFourSuggestions, "hash");
  v9 = -[NSMutableArray hash](self->_twoByFourSuggestions, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_14;
LABEL_17:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v10 = 2654435761 * self->_isValidForSuggestionsWidget;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_17;
LABEL_14:
  v11 = 2654435761 * self->_confidenceWarrantsSnappingOrNPlusOne;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    v12 = 2654435761 * self->_isNPlusOne;
    goto LABEL_19;
  }
LABEL_18:
  v12 = 0;
LABEL_19:
  v13 = -[NSString hash](self->_widgetUniqueId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v14 = 2654435761 * self->_isLowConfidenceStackRotationForStaleStack;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_uuidOfHighestConfidenceSuggestion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v16 = 2654435761u * self->_numWidgetsInStack;
  else
    v16 = 0;
  v17 = v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  v18 = v16 ^ -[NSMutableArray hash](self->_fourByFourSuggestions, "hash");
  return v17 ^ v18 ^ -[NSMutableArray hash](self->_fourByEightSuggestions, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  id *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  char v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ii;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t jj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)v3;
  if (!a1)
    goto LABEL_70;
  v5 = v3[116];
  if ((v5 & 4) != 0)
  {
    *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
    *(_BYTE *)(a1 + 116) |= 4u;
    v5 = v3[116];
  }
  if ((v5 & 1) != 0)
  {
    *(_QWORD *)(a1 + 8) = *((_QWORD *)v3 + 1);
    *(_BYTE *)(a1 + 116) |= 1u;
  }
  v6 = (void *)*((_QWORD *)v3 + 12);
  if (v6)
    -[ATXPBSuggestionLayout setUuidString:](a1, v6);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v7 = v4[7];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v70 != v10)
          objc_enumerationMutation(v7);
        -[ATXPBSuggestionLayout addOneByOneSuggestions:](a1, *(void **)(*((_QWORD *)&v69 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    }
    while (v9);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v12 = v4[8];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v66 != v15)
          objc_enumerationMutation(v12);
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:](a1, *(void **)(*((_QWORD *)&v65 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v14);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v17 = v4[10];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v62 != v20)
          objc_enumerationMutation(v17);
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:](a1, *(void **)(*((_QWORD *)&v61 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    }
    while (v19);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v22 = v4[6];
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v58 != v25)
          objc_enumerationMutation(v22);
        -[ATXPBSuggestionLayout addOneByFourSuggestions:](a1, *(void **)(*((_QWORD *)&v57 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    }
    while (v24);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = v4[9];
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(v27);
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:](a1, *(void **)(*((_QWORD *)&v53 + 1) + 8 * n));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
    }
    while (v29);
  }

  v32 = *((_BYTE *)v4 + 116);
  if ((v32 & 0x40) == 0)
  {
    if ((*((_BYTE *)v4 + 116) & 8) == 0)
      goto LABEL_45;
LABEL_72:
    *(_BYTE *)(a1 + 112) = *((_BYTE *)v4 + 112);
    *(_BYTE *)(a1 + 116) |= 8u;
    if ((*((_BYTE *)v4 + 116) & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
  *(_BYTE *)(a1 + 115) = *((_BYTE *)v4 + 115);
  *(_BYTE *)(a1 + 116) |= 0x40u;
  v32 = *((_BYTE *)v4 + 116);
  if ((v32 & 8) != 0)
    goto LABEL_72;
LABEL_45:
  if ((v32 & 0x20) != 0)
  {
LABEL_46:
    *(_BYTE *)(a1 + 114) = *((_BYTE *)v4 + 114);
    *(_BYTE *)(a1 + 116) |= 0x20u;
  }
LABEL_47:
  v33 = v4[13];
  if (v33)
    -[ATXPBSuggestionLayout setWidgetUniqueId:](a1, v33);
  if ((*((_BYTE *)v4 + 116) & 0x10) != 0)
  {
    *(_BYTE *)(a1 + 113) = *((_BYTE *)v4 + 113);
    *(_BYTE *)(a1 + 116) |= 0x10u;
  }
  v34 = v4[11];
  if (v34)
    -[ATXPBSuggestionLayout setUuidOfHighestConfidenceSuggestion:](a1, v34);
  if ((*((_BYTE *)v4 + 116) & 2) != 0)
  {
    *(_QWORD *)(a1 + 16) = v4[2];
    *(_BYTE *)(a1 + 116) |= 2u;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = v4[4];
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v50;
    do
    {
      for (ii = 0; ii != v37; ++ii)
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(v35);
        -[ATXPBSuggestionLayout addFourByFourSuggestions:](a1, *(void **)(*((_QWORD *)&v49 + 1) + 8 * ii));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
    }
    while (v37);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v40 = v4[3];
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v73, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v46;
    do
    {
      for (jj = 0; jj != v42; ++jj)
      {
        if (*(_QWORD *)v46 != v43)
          objc_enumerationMutation(v40);
        -[ATXPBSuggestionLayout addFourByEightSuggestions:](a1, *(void **)(*((_QWORD *)&v45 + 1) + 8 * jj));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v45, v73, 16);
    }
    while (v42);
  }

LABEL_70:
}

- (void)setOneByOneSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setOneByTwoSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setTwoByTwoSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setOneByFourSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setTwoByFourSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setFourByFourSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setFourByEightSuggestions:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

@end
