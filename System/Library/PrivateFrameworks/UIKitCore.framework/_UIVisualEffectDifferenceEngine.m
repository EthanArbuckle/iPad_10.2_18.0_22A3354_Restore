@implementation _UIVisualEffectDifferenceEngine

- (void)dealloc
{
  objc_super v3;

  free(self->_mergeTable);
  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectDifferenceEngine;
  -[_UIVisualEffectDifferenceEngine dealloc](&v3, sel_dealloc);
}

- (void)_reset
{
  NSArray *merged;

  merged = self->_merged;
  self->_merged = 0;

  free(self->_mergeTable);
  self->_mergeTable = 0;
}

- (void)_calculatePrefixAndSuffix
{
  int64_t sourceCount;
  int64_t prefixCount;
  void *v5;
  void *v6;
  int v7;
  int64_t innerSourceCount;
  int64_t innerDestinationCount;
  int64_t v10;
  int64_t v11;
  int64_t suffixCount;
  void *v15;
  void *v16;
  char v17;

  self->_prefixCount = 0;
  self->_suffixCount = 0;
  sourceCount = self->_sourceCount;
  if (sourceCount && self->_destinationCount)
  {
    if (sourceCount < 1)
    {
      prefixCount = 0;
    }
    else
    {
      prefixCount = 0;
      do
      {
        if (prefixCount >= self->_destinationCount)
          break;
        -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", self->_prefixCount);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v5, "isSameTypeOfEffect:", v6);

        prefixCount = self->_prefixCount;
        if (!v7)
          break;
        self->_prefixCount = ++prefixCount;
      }
      while (prefixCount < self->_sourceCount);
    }
    innerSourceCount = self->_innerSourceCount;
    innerDestinationCount = self->_innerDestinationCount;
    v10 = innerDestinationCount - prefixCount;
    v11 = innerSourceCount - prefixCount;
    self->_innerSourceCount = innerSourceCount - prefixCount;
    self->_innerDestinationCount = innerDestinationCount - prefixCount;
    if (innerSourceCount != prefixCount && innerDestinationCount != prefixCount)
    {
      suffixCount = self->_suffixCount;
      while (suffixCount < v11 && suffixCount < v10)
      {
        -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", self->_sourceCount + ~suffixCount);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", self->_destinationCount + ~self->_suffixCount);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isSameTypeOfEffect:", v16);

        suffixCount = self->_suffixCount;
        v11 = self->_innerSourceCount;
        if ((v17 & 1) == 0)
        {
          v10 = self->_innerDestinationCount;
          break;
        }
        self->_suffixCount = ++suffixCount;
        v10 = self->_innerDestinationCount;
      }
      self->_innerSourceCount = v11 - suffixCount;
      self->_innerDestinationCount = v10 - suffixCount;
    }
  }
}

- (void)_calculateLCSSTable
{
  int64_t innerSourceCount;
  int64_t innerDestinationCount;
  void *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  id v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  id v18;
  id v19;

  innerSourceCount = self->_innerSourceCount;
  if (innerSourceCount)
  {
    innerDestinationCount = self->_innerDestinationCount;
    if (innerDestinationCount)
    {
      self->_mergeTable = (int64_t *)malloc_type_calloc(innerDestinationCount * innerSourceCount, 8uLL, 0x100004000313F17uLL);
      if (self->_innerDestinationCount >= 1)
      {
        v18 = 0;
        v5 = 0;
        v6 = 0;
        v7 = -1;
        do
        {
          v8 = v5;
          -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", self->_prefixCount + v6);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          if (self->_innerSourceCount < 1)
          {
            v12 = v18;
          }
          else
          {
            v9 = 0;
            v10 = v18;
            do
            {
              -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", v9 + self->_prefixCount);
              v19 = (id)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v19, "isSameTypeOfEffect:", v5))
              {
                v11 = 0;
                if (v6)
                {
                  v12 = v19;
                  if (v9)
                  {
                    v13 = self->_innerSourceCount;
                    if (v9 <= v13 && v6 <= self->_innerDestinationCount)
                      v11 = self->_mergeTable[v9 - 1 + v7 * v13];
                    else
                      v11 = 0;
                  }
                }
                else
                {
                  v12 = v19;
                }
                v15 = v11 + 1;
              }
              else
              {
                if (v6 && (v14 = self->_innerSourceCount, v9 < v14) && v6 <= self->_innerDestinationCount)
                  v15 = self->_mergeTable[v9 + v7 * v14];
                else
                  v15 = 0;
                v12 = v19;
                if (v9 && (v16 = self->_innerSourceCount, v9 <= v16) && v6 < self->_innerDestinationCount)
                  v17 = self->_mergeTable[v9 - 1 + v6 * v16];
                else
                  v17 = 0;
                if (v17 > v15)
                  v15 = v17;
              }
              self->_mergeTable[v9 + v6 * self->_innerSourceCount] = v15;
              ++v9;
              v10 = v12;
            }
            while (v9 < self->_innerSourceCount);
          }
          v18 = v12;
          ++v6;
          ++v7;
        }
        while (v6 < self->_innerDestinationCount);

      }
    }
  }
}

- (void)_calculateMerge
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t prefixCount;
  int64_t innerSourceCount;
  int64_t innerDestinationCount;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  void *v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  int64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSArray *v44;
  NSArray *merged;
  id v46;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_prefixCount < 1)
  {
    v5 = 0;
    v4 = 0;
    v3 = 0;
    prefixCount = 0;
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = v4;
      v8 = v3;
      -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "canTransitionToEffect:", v4))
      {
        v9 = objc_msgSend(v3, "copyForTransitionToEffect:", v4);
        v10 = v5;
      }
      else
      {
        v10 = (void *)objc_msgSend(v3, "copyForTransitionOut");

        objc_msgSend(v46, "addObject:", v10);
        v9 = objc_msgSend(v4, "copyWithZone:", 0);
      }
      v5 = (void *)v9;

      objc_msgSend(v46, "addObject:", v5);
      ++v6;
      prefixCount = self->_prefixCount;
    }
    while (v6 < prefixCount);
  }
  innerSourceCount = self->_innerSourceCount;
  innerDestinationCount = self->_innerDestinationCount;
  if (innerSourceCount)
  {
    if (innerDestinationCount)
    {
      v14 = prefixCount - 1 + innerSourceCount;
      v15 = innerDestinationCount + prefixCount - 1;
      v16 = objc_msgSend(v46, "count");
      -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", v14);
      v17 = objc_claimAutoreleasedReturnValue();

      -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", v15);
      v18 = objc_claimAutoreleasedReturnValue();

      while (1)
      {
        while (1)
        {
          if (!(v17 | v18))
          {
            v4 = 0;
            v3 = 0;
            v33 = self->_innerDestinationCount + prefixCount;
            prefixCount += self->_innerSourceCount;
            goto LABEL_57;
          }
          if (v18)
            break;
          if (v17)
            goto LABEL_31;
          v18 = 0;
          v17 = 0;
          if (v5)
            goto LABEL_46;
        }
        if (objc_msgSend((id)v17, "isSameTypeOfEffect:", v18))
        {
          if (objc_msgSend((id)v17, "canTransitionToEffect:", v18))
          {
            v19 = objc_msgSend((id)v17, "copyForTransitionToEffect:", v18);
          }
          else
          {
            v31 = (void *)objc_msgSend((id)v18, "copyWithZone:", 0);
            objc_msgSend(v46, "insertObject:atIndex:", v31, v16);

            v19 = objc_msgSend((id)v17, "copyForTransitionOut");
          }
          v27 = v19;

          if (v14 < 1)
          {
            v28 = 0;
          }
          else
          {
            -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", v14 - 1);
            v28 = objc_claimAutoreleasedReturnValue();
            --v14;
          }

          if (v15 < 1)
          {
            v29 = (void *)v18;
LABEL_44:
            v18 = 0;
            goto LABEL_45;
          }
          -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", v15 - 1);
          v32 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v18;
          --v15;
          v18 = v32;
        }
        else
        {
          if (v17)
          {
            v20 = self->_innerSourceCount;
            v21 = v14 + v20 * (v15 - 1);
            if ((v21 & 0x8000000000000000) == 0)
            {
              v22 = v20 * v15;
              v23 = self->_innerDestinationCount * v20;
              v24 = v22 + v14;
              v25 = v21 >= v23 || v24 < 1;
              v26 = !v25 && v24 <= v23;
              if (v26 && self->_mergeTable[v21] < self->_mergeTable[v14 - 1 + v22])
              {
LABEL_31:
                v27 = objc_msgSend((id)v17, "copyForTransitionOut");

                if (v14 < 1)
                {
                  v28 = 0;
                  v29 = (void *)v17;
                }
                else
                {
                  -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", v14 - 1);
                  v28 = objc_claimAutoreleasedReturnValue();
                  v29 = (void *)v17;
                  --v14;
                }
                goto LABEL_45;
              }
            }
          }
          v27 = objc_msgSend((id)v18, "copyWithZone:", 0);

          if (v15 < 1)
          {
            v29 = (void *)v18;
            v28 = v17;
            goto LABEL_44;
          }
          -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", v15 - 1);
          v30 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v18;
          --v15;
          v18 = v30;
          v28 = v17;
        }
LABEL_45:

        v5 = (void *)v27;
        v17 = v28;
        if (v27)
LABEL_46:
          objc_msgSend(v46, "insertObject:atIndex:", v5, v16);
      }
    }
    if (innerSourceCount >= 1)
    {
      v37 = 0;
      do
      {
        v38 = v5;
        v39 = v3;
        -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", prefixCount + v37);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = (void *)objc_msgSend(v3, "copyForTransitionOut");
        objc_msgSend(v46, "addObject:", v5);
        ++v37;
      }
      while (v37 < self->_innerSourceCount);
      v33 = prefixCount;
      prefixCount += v37;
      goto LABEL_57;
    }
  }
  else if (innerDestinationCount >= 1)
  {
    v34 = 0;
    do
    {
      v35 = v5;
      v36 = v4;
      -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", prefixCount + v34);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
      objc_msgSend(v46, "addObject:", v5);
      ++v34;
    }
    while (v34 < self->_innerDestinationCount);
    v33 = prefixCount + v34;
    goto LABEL_57;
  }
  v33 = prefixCount;
LABEL_57:
  if (self->_suffixCount < 1)
  {
    v43 = v5;
    v42 = v4;
    v41 = v3;
  }
  else
  {
    v40 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", prefixCount + v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray objectAtIndexedSubscript:](self->_destination, "objectAtIndexedSubscript:", v33 + v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)objc_msgSend(v41, "copyForTransitionToEffect:", v42);
      objc_msgSend(v46, "addObject:", v43);
      ++v40;
      v3 = v41;
      v4 = v42;
      v5 = v43;
    }
    while (v40 < self->_suffixCount);
  }
  v44 = (NSArray *)objc_msgSend(v46, "copy");
  merged = self->_merged;
  self->_merged = v44;

}

- (void)_calculate
{
  int64_t v3;
  int64_t v4;

  v3 = -[NSArray count](self->_source, "count");
  self->_innerSourceCount = v3;
  self->_sourceCount = v3;
  v4 = -[NSArray count](self->_destination, "count");
  self->_innerDestinationCount = v4;
  self->_destinationCount = v4;
  -[_UIVisualEffectDifferenceEngine _calculatePrefixAndSuffix](self, "_calculatePrefixAndSuffix");
  -[_UIVisualEffectDifferenceEngine _calculateLCSSTable](self, "_calculateLCSSTable");
  -[_UIVisualEffectDifferenceEngine _calculateMerge](self, "_calculateMerge");
}

- (void)setSource:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *source;

  if (self->_source != a3)
  {
    v4 = a3;
    -[_UIVisualEffectDifferenceEngine _reset](self, "_reset");
    v5 = (NSArray *)objc_msgSend(v4, "copy");

    source = self->_source;
    self->_source = v5;

  }
}

- (void)setDestination:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *destination;

  if (self->_destination != a3)
  {
    v4 = a3;
    -[_UIVisualEffectDifferenceEngine _reset](self, "_reset");
    v5 = (NSArray *)objc_msgSend(v4, "copy");

    destination = self->_destination;
    self->_destination = v5;

  }
}

- (NSArray)merged
{
  NSArray *merged;

  merged = self->_merged;
  if (!merged)
  {
    -[_UIVisualEffectDifferenceEngine _calculate](self, "_calculate");
    merged = self->_merged;
  }
  return merged;
}

- (id)mergeSource:(id)a3 andDestination:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  NSArray *source;
  NSArray *v10;
  NSArray *destination;

  v6 = a4;
  v7 = a3;
  -[_UIVisualEffectDifferenceEngine _reset](self, "_reset");
  v8 = (NSArray *)objc_msgSend(v7, "copy");

  source = self->_source;
  self->_source = v8;

  v10 = (NSArray *)objc_msgSend(v6, "copy");
  destination = self->_destination;
  self->_destination = v10;

  -[_UIVisualEffectDifferenceEngine _calculate](self, "_calculate");
  return self->_merged;
}

- (id)describeMergeTable
{
  void *v3;
  int64_t v4;
  int64_t innerSourceCount;
  uint64_t i;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_innerDestinationCount >= 1)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("{%li"), self->_mergeTable[self->_innerSourceCount * v4]);
      innerSourceCount = self->_innerSourceCount;
      if (innerSourceCount >= 2)
      {
        for (i = 1; i < innerSourceCount; ++i)
        {
          objc_msgSend(v3, "appendFormat:", CFSTR(", %li"), self->_mergeTable[i + v4 * innerSourceCount]);
          innerSourceCount = self->_innerSourceCount;
        }
      }
      objc_msgSend(v3, "appendString:", CFSTR("},\n"));
      ++v4;
    }
    while (v4 < self->_innerDestinationCount);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t innerSourceCount;
  uint64_t i;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIVisualEffectDifferenceEngine;
  -[_UIVisualEffectDifferenceEngine description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" prefixLength=%li sourceCount=%li destinationCount=%li suffixCount=%li innerSourceCount=%li innerDestinationCount=%li"), self->_prefixCount, self->_sourceCount, self->_destinationCount, self->_suffixCount, self->_innerSourceCount, self->_innerDestinationCount);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nSource\n%@"), self->_source);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nDestination\n%@"), self->_destination);
  if (self->_mergeTable)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\nLCSS Table\n"));
    if (self->_innerDestinationCount >= 1)
    {
      v5 = 0;
      do
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("{%li"), self->_mergeTable[self->_innerSourceCount * v5]);
        innerSourceCount = self->_innerSourceCount;
        if (innerSourceCount >= 2)
        {
          for (i = 1; i < innerSourceCount; ++i)
          {
            objc_msgSend(v4, "appendFormat:", CFSTR(", %li"), self->_mergeTable[i + v5 * innerSourceCount]);
            innerSourceCount = self->_innerSourceCount;
          }
        }
        objc_msgSend(v4, "appendString:", CFSTR("},\n"));
        ++v5;
      }
      while (v5 < self->_innerDestinationCount);
    }
    objc_msgSend(v4, "appendString:", CFSTR("}"));
  }
  if (self->_merged)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nMerged\n%@"), self->_merged);
  return v4;
}

- (NSArray)source
{
  return self->_source;
}

- (NSArray)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_merged, 0);
}

@end
