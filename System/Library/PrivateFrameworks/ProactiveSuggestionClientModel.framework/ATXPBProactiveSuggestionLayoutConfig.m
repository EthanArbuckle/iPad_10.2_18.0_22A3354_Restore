@implementation ATXPBProactiveSuggestionLayoutConfig

- (uint64_t)setApplicableLayoutType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 12) |= 1u;
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)applicableLayoutType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 12) & 1) != 0)
      return *(unsigned int *)(result + 8);
    else
      return 0;
  }
  return result;
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (uint64_t)setHasApplicableLayoutType:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 12) = *(_BYTE *)(result + 12) & 0xFE | a2;
  return result;
}

- (uint64_t)hasApplicableLayoutType
{
  if (result)
    return *(_BYTE *)(result + 12) & 1;
  return result;
}

- (__CFString)applicableLayoutTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 9)
      return off_1E57CE848[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsApplicableLayoutType:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_1Row1Column")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_1Row2Columns")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_2Rows2Columns")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_2Rows4Columns")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_1Row4Columns")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_4Rows4Columns")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("_4Rows8Columns")) & 1) != 0)
    {
      v6 = 7;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Max")))
    {
      v6 = 8;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestionLayoutConfig;
  -[ATXPBProactiveSuggestionLayoutConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionLayoutConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t applicableLayoutType;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    applicableLayoutType = self->_applicableLayoutType;
    if (applicableLayoutType >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_applicableLayoutType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57CE848[applicableLayoutType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("applicableLayoutType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionLayoutConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  _DWORD *v3;

  v3 = a2;
  if (a1 && (*(_BYTE *)(a1 + 12) & 1) != 0)
  {
    v3[2] = *(_DWORD *)(a1 + 8);
    *((_BYTE *)v3 + 12) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_applicableLayoutType;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  v5 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_applicableLayoutType == *((_DWORD *)v4 + 2))
    {
      v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_applicableLayoutType;
  else
    return 0;
}

- (void)mergeFrom:(uint64_t)a1
{
  _DWORD *v3;

  v3 = a2;
  if (a1 && (v3[3] & 1) != 0)
  {
    *(_DWORD *)(a1 + 8) = v3[2];
    *(_BYTE *)(a1 + 12) |= 1u;
  }

}

@end
