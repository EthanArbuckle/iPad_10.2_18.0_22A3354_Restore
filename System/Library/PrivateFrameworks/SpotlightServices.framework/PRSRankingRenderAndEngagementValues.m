@implementation PRSRankingRenderAndEngagementValues

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  uint64_t v5;
  uint64_t v6;

  objc_opt_class();
  result = (id)objc_opt_new();
  if (result)
  {
    v5 = *(_QWORD *)self->_renderValues;
    *((_DWORD *)result + 4) = *(_DWORD *)&self->_renderValues[4];
    *((_QWORD *)result + 1) = v5;
    v6 = *(_QWORD *)self->_engagementValues;
    *((_DWORD *)result + 7) = *(_DWORD *)&self->_engagementValues[4];
    *(_QWORD *)((char *)result + 20) = v6;
  }
  return result;
}

- (PRSRankingRenderAndEngagementValues)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSRankingRenderAndEngagementValues;
  return -[PRSRankingRenderAndEngagementValues init](&v3, sel_init);
}

- (PRSRankingRenderAndEngagementValues)initWithCoder:(id)a3
{
  id v4;
  PRSRankingRenderAndEngagementValues *v5;
  void *v6;
  uint64_t i;
  void *v8;
  char *v9;
  void *v10;

  v4 = a3;
  v5 = -[PRSRankingRenderAndEngagementValues init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("values"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 12)
    {
      for (i = 0; i != 6; ++i)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (char *)v5 + 2 * i;
        *((_WORD *)v9 + 4) = objc_msgSend(v8, "shortValue");

        objc_msgSend(v6, "objectAtIndexedSubscript:", i + 6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *((_WORD *)v9 + 10) = objc_msgSend(v10, "shortValue");

      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[13];

  v20[12] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = self->_renderValues[0];
  v19 = a3;
  objc_msgSend(v4, "numberWithShort:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_renderValues[1]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_renderValues[2]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_renderValues[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_renderValues[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_renderValues[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_engagementValues[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_engagementValues[1]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_engagementValues[2]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_engagementValues[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_engagementValues[4]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_engagementValues[5]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "encodeObject:forKey:", v15, CFSTR("values"));
}

- (BOOL)getRankingValues:(signed __int16 *)a3 withRankingValueSize:(unint64_t)a4 forType:(int)a5
{
  uint64_t v5;
  char *v7;
  uint64_t v8;

  if (a4 != 6)
    return 0;
  if (!a5)
  {
    v5 = 20;
    goto LABEL_7;
  }
  if (a5 != 1)
    return 0;
  v5 = 8;
LABEL_7:
  v7 = (char *)self + v5;
  v8 = *(_QWORD *)v7;
  *((_DWORD *)a3 + 2) = *((_DWORD *)v7 + 2);
  *(_QWORD *)a3 = v8;
  return 1;
}

- (void)setRankingValues:(signed __int16)a3[6] forType:(int)a4
{
  uint64_t v4;
  char *v5;
  uint64_t v6;

  if (a4)
  {
    if (a4 != 1)
      return;
    v4 = 8;
  }
  else
  {
    v4 = 20;
  }
  v5 = (char *)self + v4;
  v6 = *(_QWORD *)a3;
  *((_DWORD *)v5 + 2) = *((_DWORD *)a3 + 2);
  *(_QWORD *)v5 = v6;
}

- (void)incrementRankingValuesForType:(int)a3
{
  uint64_t v3;
  signed __int16 *renderValues;
  int v5;
  uint64_t v6;
  signed __int16 *engagementValues;
  int v8;

  if (a3)
  {
    if (a3 == 1)
    {
      v3 = 0;
      renderValues = self->_renderValues;
      do
      {
        v5 = (unsigned __int16)renderValues[v3];
        if (v5 != 0x7FFF)
          renderValues[v3] = v5 + 1;
        ++v3;
      }
      while (v3 != 6);
    }
  }
  else
  {
    v6 = 0;
    engagementValues = self->_engagementValues;
    do
    {
      v8 = (unsigned __int16)engagementValues[v6];
      if (v8 != 0x7FFF)
        engagementValues[v6] = v8 + 1;
      ++v6;
    }
    while (v6 != 6);
  }
}

@end
