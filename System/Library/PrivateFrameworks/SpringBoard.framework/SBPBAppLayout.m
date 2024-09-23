@implementation SBPBAppLayout

- (__CFString)layoutConfigurationAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 5)
      return off_1E8EB2FA0[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsLayoutConfiguration:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Undefined")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Full")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NarrowWide")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HalfHalf")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("WideNarrow")))
    {
      v6 = 4;
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

- (BOOL)hasPrimaryDisplayItem
{
  if (result)
    return *(_QWORD *)(result + 104) != 0;
  return result;
}

- (uint64_t)secondaryDisplayItemRole
{
  if (result)
  {
    if ((*(_BYTE *)(result + 148) & 2) != 0)
      return *(unsigned int *)(result + 128);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setSecondaryDisplayItemRole:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 148) |= 2u;
    *(_DWORD *)(result + 128) = a2;
  }
  return result;
}

- (uint64_t)setHasSecondaryDisplayItemRole:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 148) = *(_BYTE *)(result + 148) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSecondaryDisplayItemRole
{
  if (result)
    return (*(unsigned __int8 *)(result + 148) >> 1) & 1;
  return result;
}

- (__CFString)secondaryDisplayItemRoleAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 5)
      return off_1E8EB2FE8[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsSecondaryDisplayItemRole:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Undefined")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Primary")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Side")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Floating")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Center")))
    {
      v6 = 4;
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

- (BOOL)hasSecondaryDisplayItem
{
  if (result)
    return *(_QWORD *)(result + 120) != 0;
  return result;
}

- (__CFString)environmentAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 4)
      return off_1E8EB2FC8[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsEnvironment:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Main")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Floating")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Inline")) & 1) != 0)
    {
      v6 = 2;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CenterModal")))
    {
      v6 = 3;
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

- (uint64_t)centerDisplayItemRole
{
  if (result)
  {
    if ((*(_BYTE *)(result + 148) & 1) != 0)
      return *(unsigned int *)(result + 48);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setCenterDisplayItemRole:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 148) |= 1u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setHasCenterDisplayItemRole:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 148) = *(_BYTE *)(result + 148) & 0xFE | a2;
  return result;
}

- (uint64_t)hasCenterDisplayItemRole
{
  if (result)
    return *(_BYTE *)(result + 148) & 1;
  return result;
}

- (BOOL)hasCenterDisplayItem
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (__CFString)centerConfigurationAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 3)
      return off_1E8EB3010[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsCenterConfiguration:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Undefined")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Page")) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("FullScreen")))
    {
      v6 = 2;
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

- (BOOL)hasPrimaryLayoutAttributes
{
  if (result)
    return *(_QWORD *)(result + 112) != 0;
  return result;
}

- (BOOL)hasSecondaryLayoutAttributes
{
  if (result)
    return *(_QWORD *)(result + 136) != 0;
  return result;
}

- (BOOL)hasCenterLayoutAttributes
{
  if (result)
    return *(_QWORD *)(result + 56) != 0;
  return result;
}

- (uint64_t)clearDisplayItems
{
  if (result)
    return objc_msgSend(*(id *)(result + 88), "removeAllObjects");
  return result;
}

- (void)addDisplayItems:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)displayItemsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 88), "count");
  return result;
}

- (id)displayItemsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[11], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)displayItemsType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)clearDisplayItemLayoutAttributes
{
  if (result)
    return objc_msgSend(*(id *)(result + 72), "removeAllObjects");
  return result;
}

- (void)addDisplayItemLayoutAttributes:(uint64_t)a1
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

- (uint64_t)displayItemLayoutAttributesCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 72), "count");
  return result;
}

- (id)displayItemLayoutAttributesAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[9], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)displayItemLayoutAttributesType
{
  objc_opt_self();
  return objc_opt_class();
}

- (BOOL)hasContinuousExposeIdentifier
{
  if (result)
    return *(_QWORD *)(result + 64) != 0;
  return result;
}

- (uint64_t)clearDisplayItemLayoutAttributesForNonPreferredDisplays
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "removeAllObjects");
  return result;
}

- (void)addDisplayItemLayoutAttributesForNonPreferredDisplay:(uint64_t)a1
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

- (uint64_t)displayItemLayoutAttributesForNonPreferredDisplaysCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "count");
  return result;
}

- (id)displayItemLayoutAttributesForNonPreferredDisplayAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[10], "objectAtIndex:", a2);
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
  v8.super_class = (Class)SBPBAppLayout;
  -[SBPBAppLayout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPBAppLayout dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t layoutConfiguration;
  __CFString *v5;
  SBPBDisplayItem *primaryDisplayItem;
  void *v7;
  uint64_t secondaryDisplayItemRole;
  __CFString *v9;
  SBPBDisplayItem *secondaryDisplayItem;
  void *v11;
  uint64_t environment;
  __CFString *v13;
  void *v14;
  uint64_t centerDisplayItemRole;
  __CFString *v16;
  SBPBDisplayItem *centerDisplayItem;
  void *v18;
  uint64_t centerConfiguration;
  __CFString *v20;
  void *v21;
  void *v22;
  SBPBDisplayItemLayoutAttributes *primaryLayoutAttributes;
  void *v24;
  SBPBDisplayItemLayoutAttributes *secondaryLayoutAttributes;
  void *v26;
  SBPBDisplayItemLayoutAttributes *centerLayoutAttributes;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  NSString *continuousExposeIdentifier;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
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
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  layoutConfiguration = self->_layoutConfiguration;
  if (layoutConfiguration >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_layoutConfiguration);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E8EB2FA0[layoutConfiguration];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("layoutConfiguration"));

  primaryDisplayItem = self->_primaryDisplayItem;
  if (primaryDisplayItem)
  {
    -[SBPBDisplayItem dictionaryRepresentation](primaryDisplayItem, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("primaryDisplayItem"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    secondaryDisplayItemRole = self->_secondaryDisplayItemRole;
    if (secondaryDisplayItemRole >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_secondaryDisplayItemRole);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E8EB2FE8[secondaryDisplayItemRole];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("secondaryDisplayItemRole"));

  }
  secondaryDisplayItem = self->_secondaryDisplayItem;
  if (secondaryDisplayItem)
  {
    -[SBPBDisplayItem dictionaryRepresentation](secondaryDisplayItem, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("secondaryDisplayItem"));

  }
  environment = self->_environment;
  if (environment >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_environment);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E8EB2FC8[environment];
  }
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("environment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("hidden"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    centerDisplayItemRole = self->_centerDisplayItemRole;
    if (centerDisplayItemRole >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_centerDisplayItemRole);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E8EB2FE8[centerDisplayItemRole];
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("centerDisplayItemRole"));

  }
  centerDisplayItem = self->_centerDisplayItem;
  if (centerDisplayItem)
  {
    -[SBPBDisplayItem dictionaryRepresentation](centerDisplayItem, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("centerDisplayItem"));

  }
  centerConfiguration = self->_centerConfiguration;
  if (centerConfiguration >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_centerConfiguration);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E8EB3010[centerConfiguration];
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("centerConfiguration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relativeWidth);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("relativeWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relativeHeight);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("relativeHeight"));

  primaryLayoutAttributes = self->_primaryLayoutAttributes;
  if (primaryLayoutAttributes)
  {
    -[SBPBDisplayItemLayoutAttributes dictionaryRepresentation](primaryLayoutAttributes, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("primaryLayoutAttributes"));

  }
  secondaryLayoutAttributes = self->_secondaryLayoutAttributes;
  if (secondaryLayoutAttributes)
  {
    -[SBPBDisplayItemLayoutAttributes dictionaryRepresentation](secondaryLayoutAttributes, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("secondaryLayoutAttributes"));

  }
  centerLayoutAttributes = self->_centerLayoutAttributes;
  if (centerLayoutAttributes)
  {
    -[SBPBDisplayItemLayoutAttributes dictionaryRepresentation](centerLayoutAttributes, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("centerLayoutAttributes"));

  }
  if (-[NSMutableArray count](self->_displayItems, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_displayItems, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v30 = self->_displayItems;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v62 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("displayItems"));
  }
  if (-[NSMutableArray count](self->_displayItemLayoutAttributes, "count"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_displayItemLayoutAttributes, "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v37 = self->_displayItemLayoutAttributes;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v58 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v39);
    }

    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("displayItemLayoutAttributes"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_preferredDisplayOrdinal);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("preferredDisplayOrdinal"));

  continuousExposeIdentifier = self->_continuousExposeIdentifier;
  if (continuousExposeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", continuousExposeIdentifier, CFSTR("continuousExposeIdentifier"));
  if (-[NSMutableArray count](self->_displayItemLayoutAttributesForNonPreferredDisplays, "count"))
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_displayItemLayoutAttributesForNonPreferredDisplays, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v46 = self->_displayItemLayoutAttributesForNonPreferredDisplays;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v54 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * k), "dictionaryRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v51);

        }
        v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v48);
    }

    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("displayItemLayoutAttributesForNonPreferredDisplay"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SBPBAppLayoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_primaryDisplayItem)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_secondaryDisplayItem)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_centerDisplayItem)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  if (self->_primaryLayoutAttributes)
    PBDataWriterWriteSubmessage();
  if (self->_secondaryLayoutAttributes)
    PBDataWriterWriteSubmessage();
  if (self->_centerLayoutAttributes)
    PBDataWriterWriteSubmessage();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_displayItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_displayItemLayoutAttributes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  PBDataWriterWriteInt64Field();
  if (self->_continuousExposeIdentifier)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_displayItemLayoutAttributesForNonPreferredDisplays;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  id *v23;

  v23 = a2;
  if (a1)
  {
    v3 = v23;
    *((_DWORD *)v23 + 25) = *(_DWORD *)(a1 + 100);
    v4 = *(void **)(a1 + 104);
    if (v4)
    {
      -[SBPBAppLayout setPrimaryDisplayItem:]((uint64_t)v23, v4);
      v3 = v23;
    }
    if ((*(_BYTE *)(a1 + 148) & 2) != 0)
    {
      *((_DWORD *)v3 + 32) = *(_DWORD *)(a1 + 128);
      *((_BYTE *)v3 + 148) |= 2u;
    }
    v5 = *(void **)(a1 + 120);
    if (v5)
    {
      -[SBPBAppLayout setSecondaryDisplayItem:]((uint64_t)v23, v5);
      v3 = v23;
    }
    *((_DWORD *)v3 + 24) = *(_DWORD *)(a1 + 96);
    *((_BYTE *)v3 + 144) = *(_BYTE *)(a1 + 144);
    if ((*(_BYTE *)(a1 + 148) & 1) != 0)
    {
      *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
      *((_BYTE *)v3 + 148) |= 1u;
    }
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      -[SBPBAppLayout setCenterDisplayItem:]((uint64_t)v23, v6);
      v3 = v23;
    }
    *((_DWORD *)v3 + 8) = *(_DWORD *)(a1 + 32);
    v3[3] = *(id *)(a1 + 24);
    v3[2] = *(id *)(a1 + 16);
    v7 = *(void **)(a1 + 112);
    if (v7)
      -[SBPBAppLayout setPrimaryLayoutAttributes:]((uint64_t)v23, v7);
    v8 = *(void **)(a1 + 136);
    if (v8)
      -[SBPBAppLayout setSecondaryLayoutAttributes:]((uint64_t)v23, v8);
    v9 = *(void **)(a1 + 56);
    if (v9)
      -[SBPBAppLayout setCenterLayoutAttributes:]((uint64_t)v23, v9);
    if (objc_msgSend(*(id *)(a1 + 88), "count"))
    {
      objc_msgSend(v23[11], "removeAllObjects");
      v10 = objc_msgSend(*(id *)(a1 + 88), "count");
      if (v10)
      {
        v11 = v10;
        for (i = 0; i != v11; ++i)
        {
          -[SBPBAppLayout displayItemsAtIndex:]((id *)a1, i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBPBAppLayout addDisplayItems:]((uint64_t)v23, v13);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      if (v23)
        objc_msgSend(v23[9], "removeAllObjects");
      v14 = objc_msgSend(*(id *)(a1 + 72), "count");
      if (v14)
      {
        v15 = v14;
        for (j = 0; j != v15; ++j)
        {
          -[SBPBAppLayout displayItemLayoutAttributesAtIndex:]((id *)a1, j);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBPBAppLayout addDisplayItemLayoutAttributes:]((uint64_t)v23, v17);

        }
      }
    }
    v23[1] = *(id *)(a1 + 8);
    v18 = *(void **)(a1 + 64);
    if (v18)
      -[SBPBAppLayout setContinuousExposeIdentifier:]((uint64_t)v23, v18);
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      objc_msgSend(v23[10], "removeAllObjects");
      v19 = objc_msgSend(*(id *)(a1 + 80), "count");
      if (v19)
      {
        v20 = v19;
        for (k = 0; k != v20; ++k)
        {
          -[SBPBAppLayout displayItemLayoutAttributesForNonPreferredDisplayAtIndex:]((id *)a1, k);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:]((uint64_t)v23, v22);

        }
      }
    }
  }

}

- (void)setPrimaryDisplayItem:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)setSecondaryDisplayItem:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 120), a2);
}

- (void)setCenterDisplayItem:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setPrimaryLayoutAttributes:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (void)setSecondaryLayoutAttributes:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 136), a2);
}

- (void)setCenterLayoutAttributes:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setContinuousExposeIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 100) = self->_layoutConfiguration;
  v6 = -[SBPBDisplayItem copyWithZone:](self->_primaryDisplayItem, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_secondaryDisplayItemRole;
    *(_BYTE *)(v5 + 148) |= 2u;
  }
  v8 = -[SBPBDisplayItem copyWithZone:](self->_secondaryDisplayItem, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v8;

  *(_DWORD *)(v5 + 96) = self->_environment;
  *(_BYTE *)(v5 + 144) = self->_hidden;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_centerDisplayItemRole;
    *(_BYTE *)(v5 + 148) |= 1u;
  }
  v10 = -[SBPBDisplayItem copyWithZone:](self->_centerDisplayItem, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  *(_DWORD *)(v5 + 32) = self->_centerConfiguration;
  *(double *)(v5 + 24) = self->_relativeWidth;
  *(double *)(v5 + 16) = self->_relativeHeight;
  v12 = -[SBPBDisplayItemLayoutAttributes copyWithZone:](self->_primaryLayoutAttributes, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v12;

  v14 = -[SBPBDisplayItemLayoutAttributes copyWithZone:](self->_secondaryLayoutAttributes, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v14;

  v16 = -[SBPBDisplayItemLayoutAttributes copyWithZone:](self->_centerLayoutAttributes, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v18 = self->_displayItems;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v48;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v48 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v22), "copyWithZone:", a3);
        -[SBPBAppLayout addDisplayItems:](v5, v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v20);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v24 = self->_displayItemLayoutAttributes;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v44;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v28), "copyWithZone:", a3);
        -[SBPBAppLayout addDisplayItemLayoutAttributes:](v5, v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v26);
  }

  *(_QWORD *)(v5 + 8) = self->_preferredDisplayOrdinal;
  v30 = -[NSString copyWithZone:](self->_continuousExposeIdentifier, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v30;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = self->_displayItemLayoutAttributesForNonPreferredDisplays;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v40;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v36), "copyWithZone:", a3, (_QWORD)v39);
        -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:](v5, v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v34);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SBPBDisplayItem *primaryDisplayItem;
  SBPBDisplayItem *secondaryDisplayItem;
  SBPBDisplayItem *centerDisplayItem;
  SBPBDisplayItemLayoutAttributes *primaryLayoutAttributes;
  SBPBDisplayItemLayoutAttributes *secondaryLayoutAttributes;
  SBPBDisplayItemLayoutAttributes *centerLayoutAttributes;
  NSMutableArray *displayItems;
  NSMutableArray *displayItemLayoutAttributes;
  NSString *continuousExposeIdentifier;
  NSMutableArray *displayItemLayoutAttributesForNonPreferredDisplays;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  if (self->_layoutConfiguration != *((_DWORD *)v4 + 25))
    goto LABEL_42;
  primaryDisplayItem = self->_primaryDisplayItem;
  if ((unint64_t)primaryDisplayItem | *((_QWORD *)v4 + 13))
  {
    if (!-[SBPBDisplayItem isEqual:](primaryDisplayItem, "isEqual:"))
      goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 2) == 0 || self->_secondaryDisplayItemRole != *((_DWORD *)v4 + 32))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 148) & 2) != 0)
  {
    goto LABEL_42;
  }
  secondaryDisplayItem = self->_secondaryDisplayItem;
  if ((unint64_t)secondaryDisplayItem | *((_QWORD *)v4 + 15)
    && !-[SBPBDisplayItem isEqual:](secondaryDisplayItem, "isEqual:")
    || self->_environment != *((_DWORD *)v4 + 24))
  {
    goto LABEL_42;
  }
  if (self->_hidden)
  {
    if (!*((_BYTE *)v4 + 144))
      goto LABEL_42;
  }
  else if (*((_BYTE *)v4 + 144))
  {
LABEL_42:
    v15 = 0;
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 1) == 0 || self->_centerDisplayItemRole != *((_DWORD *)v4 + 12))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    goto LABEL_42;
  }
  centerDisplayItem = self->_centerDisplayItem;
  if ((unint64_t)centerDisplayItem | *((_QWORD *)v4 + 5)
    && !-[SBPBDisplayItem isEqual:](centerDisplayItem, "isEqual:"))
  {
    goto LABEL_42;
  }
  if (self->_centerConfiguration != *((_DWORD *)v4 + 8))
    goto LABEL_42;
  if (self->_relativeWidth != *((double *)v4 + 3))
    goto LABEL_42;
  if (self->_relativeHeight != *((double *)v4 + 2))
    goto LABEL_42;
  primaryLayoutAttributes = self->_primaryLayoutAttributes;
  if ((unint64_t)primaryLayoutAttributes | *((_QWORD *)v4 + 14))
  {
    if (!-[SBPBDisplayItemLayoutAttributes isEqual:](primaryLayoutAttributes, "isEqual:"))
      goto LABEL_42;
  }
  secondaryLayoutAttributes = self->_secondaryLayoutAttributes;
  if ((unint64_t)secondaryLayoutAttributes | *((_QWORD *)v4 + 17))
  {
    if (!-[SBPBDisplayItemLayoutAttributes isEqual:](secondaryLayoutAttributes, "isEqual:"))
      goto LABEL_42;
  }
  centerLayoutAttributes = self->_centerLayoutAttributes;
  if ((unint64_t)centerLayoutAttributes | *((_QWORD *)v4 + 7))
  {
    if (!-[SBPBDisplayItemLayoutAttributes isEqual:](centerLayoutAttributes, "isEqual:"))
      goto LABEL_42;
  }
  displayItems = self->_displayItems;
  if ((unint64_t)displayItems | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](displayItems, "isEqual:"))
      goto LABEL_42;
  }
  displayItemLayoutAttributes = self->_displayItemLayoutAttributes;
  if ((unint64_t)displayItemLayoutAttributes | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](displayItemLayoutAttributes, "isEqual:"))
      goto LABEL_42;
  }
  if (self->_preferredDisplayOrdinal != *((_QWORD *)v4 + 1))
    goto LABEL_42;
  continuousExposeIdentifier = self->_continuousExposeIdentifier;
  if ((unint64_t)continuousExposeIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](continuousExposeIdentifier, "isEqual:"))
      goto LABEL_42;
  }
  displayItemLayoutAttributesForNonPreferredDisplays = self->_displayItemLayoutAttributesForNonPreferredDisplays;
  if ((unint64_t)displayItemLayoutAttributesForNonPreferredDisplays | *((_QWORD *)v4 + 10))
    v15 = -[NSMutableArray isEqual:](displayItemLayoutAttributesForNonPreferredDisplays, "isEqual:");
  else
    v15 = 1;
LABEL_43:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t environment;
  _BOOL4 hidden;
  uint64_t v7;
  unint64_t v8;
  uint64_t centerConfiguration;
  double relativeWidth;
  double v11;
  long double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double relativeHeight;
  double v20;
  long double v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  unint64_t v35;
  uint64_t v36;
  uint64_t layoutConfiguration;

  layoutConfiguration = self->_layoutConfiguration;
  v35 = -[SBPBDisplayItem hash](self->_primaryDisplayItem, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_secondaryDisplayItemRole;
  else
    v3 = 0;
  v4 = -[SBPBDisplayItem hash](self->_secondaryDisplayItem, "hash", v35);
  environment = self->_environment;
  hidden = self->_hidden;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_centerDisplayItemRole;
  else
    v7 = 0;
  v8 = -[SBPBDisplayItem hash](self->_centerDisplayItem, "hash");
  centerConfiguration = self->_centerConfiguration;
  relativeWidth = self->_relativeWidth;
  v11 = -relativeWidth;
  if (relativeWidth >= 0.0)
    v11 = self->_relativeWidth;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = fmod(v12, 1.84467441e19);
  v15 = 2654435761u * (unint64_t)v14;
  v16 = v15 + (unint64_t)v13;
  if (v13 <= 0.0)
    v16 = 2654435761u * (unint64_t)v14;
  v17 = v15 - (unint64_t)fabs(v13);
  if (v13 < 0.0)
    v18 = v17;
  else
    v18 = v16;
  relativeHeight = self->_relativeHeight;
  v20 = -relativeHeight;
  if (relativeHeight >= 0.0)
    v20 = self->_relativeHeight;
  v21 = floor(v20 + 0.5);
  v22 = (v20 - v21) * 1.84467441e19;
  v23 = fmod(v21, 1.84467441e19);
  v24 = 2654435761u * (unint64_t)v23;
  v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0)
    v25 = 2654435761u * (unint64_t)v23;
  v26 = v24 - (unint64_t)fabs(v22);
  if (v22 >= 0.0)
    v26 = v25;
  v27 = v36 ^ v3 ^ v4 ^ (2654435761 * layoutConfiguration) ^ (2654435761 * environment) ^ (2654435761 * hidden) ^ v26 ^ v7 ^ v8 ^ (2654435761 * centerConfiguration) ^ v18;
  v28 = -[SBPBDisplayItemLayoutAttributes hash](self->_primaryLayoutAttributes, "hash");
  v29 = v28 ^ -[SBPBDisplayItemLayoutAttributes hash](self->_secondaryLayoutAttributes, "hash");
  v30 = v29 ^ -[SBPBDisplayItemLayoutAttributes hash](self->_centerLayoutAttributes, "hash");
  v31 = v30 ^ -[NSMutableArray hash](self->_displayItems, "hash");
  v32 = v31 ^ -[NSMutableArray hash](self->_displayItemLayoutAttributes, "hash") ^ (2654435761
                                                                                  * self->_preferredDisplayOrdinal);
  v33 = v32 ^ -[NSString hash](self->_continuousExposeIdentifier, "hash");
  return v27 ^ v33 ^ -[NSMutableArray hash](self->_displayItemLayoutAttributesForNonPreferredDisplays, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _DWORD *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    *(_DWORD *)(a1 + 100) = v3[25];
    v5 = *(_QWORD *)(a1 + 104);
    v6 = (void *)*((_QWORD *)v4 + 13);
    if (v5)
    {
      if (v6)
        -[SBPBDisplayItem mergeFrom:](v5, v6);
    }
    else if (v6)
    {
      -[SBPBAppLayout setPrimaryDisplayItem:](a1, v6);
    }
    if ((*((_BYTE *)v4 + 148) & 2) != 0)
    {
      *(_DWORD *)(a1 + 128) = *((_DWORD *)v4 + 32);
      *(_BYTE *)(a1 + 148) |= 2u;
    }
    v7 = *(_QWORD *)(a1 + 120);
    v8 = (void *)*((_QWORD *)v4 + 15);
    if (v7)
    {
      if (v8)
        -[SBPBDisplayItem mergeFrom:](v7, v8);
    }
    else if (v8)
    {
      -[SBPBAppLayout setSecondaryDisplayItem:](a1, v8);
    }
    *(_DWORD *)(a1 + 96) = *((_DWORD *)v4 + 24);
    *(_BYTE *)(a1 + 144) = *((_BYTE *)v4 + 144);
    if ((*((_BYTE *)v4 + 148) & 1) != 0)
    {
      *(_DWORD *)(a1 + 48) = *((_DWORD *)v4 + 12);
      *(_BYTE *)(a1 + 148) |= 1u;
    }
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)*((_QWORD *)v4 + 5);
    if (v9)
    {
      if (v10)
        -[SBPBDisplayItem mergeFrom:](v9, v10);
    }
    else if (v10)
    {
      -[SBPBAppLayout setCenterDisplayItem:](a1, v10);
    }
    *(_DWORD *)(a1 + 32) = *((_DWORD *)v4 + 8);
    *(_QWORD *)(a1 + 24) = *((_QWORD *)v4 + 3);
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v4 + 2);
    v11 = *(_QWORD *)(a1 + 112);
    v12 = (void *)*((_QWORD *)v4 + 14);
    if (v11)
    {
      if (v12)
        -[SBPBDisplayItemLayoutAttributes mergeFrom:](v11, (uint64_t)v12);
    }
    else if (v12)
    {
      -[SBPBAppLayout setPrimaryLayoutAttributes:](a1, v12);
    }
    v13 = *(_QWORD *)(a1 + 136);
    v14 = (void *)*((_QWORD *)v4 + 17);
    if (v13)
    {
      if (v14)
        -[SBPBDisplayItemLayoutAttributes mergeFrom:](v13, (uint64_t)v14);
    }
    else if (v14)
    {
      -[SBPBAppLayout setSecondaryLayoutAttributes:](a1, v14);
    }
    v15 = *(_QWORD *)(a1 + 56);
    v16 = (void *)*((_QWORD *)v4 + 7);
    if (v15)
    {
      if (v16)
        -[SBPBDisplayItemLayoutAttributes mergeFrom:](v15, (uint64_t)v16);
    }
    else if (v16)
    {
      -[SBPBAppLayout setCenterLayoutAttributes:](a1, v16);
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v17 = *((id *)v4 + 11);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          -[SBPBAppLayout addDisplayItems:](a1, *(void **)(*((_QWORD *)&v41 + 1) + 8 * v21++));
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v19);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v22 = *((id *)v4 + 9);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v38;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v22);
          -[SBPBAppLayout addDisplayItemLayoutAttributes:](a1, *(void **)(*((_QWORD *)&v37 + 1) + 8 * v26++));
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v24);
    }

    *(_QWORD *)(a1 + 8) = *((_QWORD *)v4 + 1);
    v27 = (void *)*((_QWORD *)v4 + 8);
    if (v27)
      -[SBPBAppLayout setContinuousExposeIdentifier:](a1, v27);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = *((id *)v4 + 10);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v34;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(v28);
          -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:](a1, *(void **)(*((_QWORD *)&v33 + 1) + 8 * v32++));
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v30);
    }

  }
}

- (uint64_t)layoutConfiguration
{
  if (result)
    return *(unsigned int *)(result + 100);
  return result;
}

- (uint64_t)setLayoutConfiguration:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 100) = a2;
  return result;
}

- (uint64_t)primaryDisplayItem
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)secondaryDisplayItem
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

- (uint64_t)environment
{
  if (result)
    return *(unsigned int *)(result + 96);
  return result;
}

- (uint64_t)setEnvironment:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 96) = a2;
  return result;
}

- (BOOL)hidden
{
  if (result)
    return *(_BYTE *)(result + 144) != 0;
  return result;
}

- (uint64_t)setHidden:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 144) = a2;
  return result;
}

- (uint64_t)centerDisplayItem
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)centerConfiguration
{
  if (result)
    return *(unsigned int *)(result + 32);
  return result;
}

- (uint64_t)setCenterConfiguration:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 32) = a2;
  return result;
}

- (double)relativeWidth
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (uint64_t)setRelativeWidth:(uint64_t)result
{
  if (result)
    *(double *)(result + 24) = a2;
  return result;
}

- (double)relativeHeight
{
  if (a1)
    return *(double *)(a1 + 16);
  else
    return 0.0;
}

- (uint64_t)setRelativeHeight:(uint64_t)result
{
  if (result)
    *(double *)(result + 16) = a2;
  return result;
}

- (uint64_t)primaryLayoutAttributes
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

- (uint64_t)secondaryLayoutAttributes
{
  if (result)
    return *(_QWORD *)(result + 136);
  return result;
}

- (uint64_t)centerLayoutAttributes
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)displayItems
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (void)setDisplayItems:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (uint64_t)displayItemLayoutAttributes
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (void)setDisplayItemLayoutAttributes:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (uint64_t)preferredDisplayOrdinal
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)setPreferredDisplayOrdinal:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

- (uint64_t)continuousExposeIdentifier
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)displayItemLayoutAttributesForNonPreferredDisplays
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (void)setDisplayItemLayoutAttributesForNonPreferredDisplays:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_secondaryDisplayItem, 0);
  objc_storeStrong((id *)&self->_primaryLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_primaryDisplayItem, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_displayItemLayoutAttributesForNonPreferredDisplays, 0);
  objc_storeStrong((id *)&self->_displayItemLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_continuousExposeIdentifier, 0);
  objc_storeStrong((id *)&self->_centerLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_centerDisplayItem, 0);
}

@end
