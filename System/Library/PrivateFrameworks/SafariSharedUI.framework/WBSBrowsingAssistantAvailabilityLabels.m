@implementation WBSBrowsingAssistantAvailabilityLabels

+ (id)possibleLabelsForContentOptions:(unint64_t)a3
{
  WBSBrowsingAssistantAvailabilityLabels *v4;
  int8x8_t v5;
  uint8x8_t v6;
  void *v7;
  WBSBrowsingAssistantAvailabilityLabels *v9;
  WBSBrowsingAssistantAvailabilityLabels *v10;
  WBSBrowsingAssistantAvailabilityLabels *v12;
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  v4 = -[WBSBrowsingAssistantAvailabilityLabels initWithContentOptions:template:]([WBSBrowsingAssistantAvailabilityLabels alloc], "initWithContentOptions:template:", a3, 0);
  v5 = -[WBSBrowsingAssistantAvailabilityLabels representedOptionsAtIndex:](v4, "representedOptionsAtIndex:", 0);
  v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] == 1)
  {
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[WBSBrowsingAssistantAvailabilityLabels initWithContentOptions:template:]([WBSBrowsingAssistantAvailabilityLabels alloc], "initWithContentOptions:template:", a3, 2);
    v10 = v9;
    if ((~v5.i32[0] & 0x21) != 0 || (*(_QWORD *)&v5 & 0xFFFFFFFFFFFFFFDELL) == 0)
    {
      v13[0] = v4;
      v13[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = -[WBSBrowsingAssistantAvailabilityLabels initWithContentOptions:template:]([WBSBrowsingAssistantAvailabilityLabels alloc], "initWithContentOptions:template:", a3, 1);
      v14[0] = v4;
      v14[1] = v12;
      v14[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (WBSBrowsingAssistantAvailabilityLabels)initWithContentOptions:(unint64_t)a3 template:(int64_t)a4
{
  char v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  WBSBrowsingAssistantAvailabilityLabels *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 0x61) == 0)
    goto LABEL_9;
  switch(a4)
  {
    case 2:
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __74__WBSBrowsingAssistantAvailabilityLabels_initWithContentOptions_template___block_invoke_2;
      v19 = &unk_1E5449110;
      v20 = v7;
      v21 = v8;
      WBSBrowsingAssistantContentOptionsEnumerateOptionsUsingBlock();

      v10 = v20;
LABEL_8:

      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 & 0x21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      objc_msgSend(v8, "addObject:", &unk_1E547A260);
      v22 = v7;
      v23 = v8;
      WBSBrowsingAssistantContentOptionsEnumerateOptionsUsingBlock();

      v10 = v22;
      goto LABEL_8;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 & 0x61);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      objc_msgSend(v8, "addObject:", &unk_1E547A260);
      break;
  }
LABEL_9:
  v12 = WBSBrowsingAssistantContentOptionsMostProminentRemoteOption();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

    objc_msgSend(v8, "addObject:", &unk_1E547A278);
  }
  v14 = -[WBSBrowsingAssistantAvailabilityLabels initWithRepresentedOptions:groups:](self, "initWithRepresentedOptions:groups:", v7, v8, v16, v17, v18, v19);

  return v14;
}

uint64_t __74__WBSBrowsingAssistantAvailabilityLabels_initWithContentOptions_template___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "addObject:", &unk_1E547A260);
}

uint64_t __74__WBSBrowsingAssistantAvailabilityLabels_initWithContentOptions_template___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "addObject:", &unk_1E547A260);
}

- (WBSBrowsingAssistantAvailabilityLabels)initWithRepresentedOptions:(id)a3 groups:(id)a4
{
  id v5;
  id v6;
  WBSBrowsingAssistantAvailabilityLabels *v7;
  uint64_t v8;
  NSArray *representedOptions;
  uint64_t v10;
  NSArray *representedOptionsGroups;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSBrowsingAssistantAvailabilityLabels;
  v5 = a4;
  v6 = a3;
  v7 = -[WBSBrowsingAssistantAvailabilityLabels init](&v13, sel_init);
  v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  representedOptions = v7->_representedOptions;
  v7->_representedOptions = (NSArray *)v8;

  v10 = objc_msgSend(v5, "copy");
  representedOptionsGroups = v7->_representedOptionsGroups;
  v7->_representedOptionsGroups = (NSArray *)v10;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_previouslyConsumedOptions)
    objc_msgSend(v3, "appendFormat:", CFSTR("; previousOptions = %lu"), self->_previouslyConsumedOptions);
  objc_msgSend(v4, "appendFormat:", CFSTR("; labels = {\n"));
  v5 = -[WBSBrowsingAssistantAvailabilityLabels count](self, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      -[WBSBrowsingAssistantAvailabilityLabels textForOptionsAtIndex:](self, "textForOptionsAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[WBSBrowsingAssistantAvailabilityLabels representedOptionsAtIndex:](self, "representedOptionsAtIndex:", i);
      -[NSArray objectAtIndexedSubscript:](self->_representedOptionsGroups, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("\t%lu = \"%@\" (options = %lu; group = %lu),\n"),
        i,
        v8,
        v9,
        objc_msgSend(v10, "unsignedIntegerValue"));

    }
  }
  objc_msgSend(v4, "appendString:", CFSTR("}>"));
  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_previouslyConsumedOptions)
    objc_msgSend(v3, "appendFormat:", CFSTR("; previousOptions = %lu"), self->_previouslyConsumedOptions);
  objc_msgSend(v4, "appendString:", CFSTR("; labels ="));
  v5 = -[WBSBrowsingAssistantAvailabilityLabels count](self, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = v5 - 1;
    do
    {
      -[WBSBrowsingAssistantAvailabilityLabels textForOptionsAtIndex:](self, "textForOptionsAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" \"%@\"), v9);

      if (v7 < v8)
        objc_msgSend(v4, "appendString:", CFSTR(","));
      ++v7;
    }
    while (v6 != v7);
  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (unint64_t)count
{
  return -[NSArray count](self->_representedOptions, "count");
}

- (id)textForOptionsAtIndex:(unint64_t)a3
{
  __CFString *v3;
  NSArray *labels;
  NSArray *v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint8x8_t v15;
  uint64_t v16;
  NSArray *v17;

  labels = self->_labels;
  if (!labels)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSArray count](self->_representedOptions, "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_representedOptions, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");
        -[NSArray objectAtIndexedSubscript:](self->_representedOptionsGroups, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");
        v15 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
        v15.i16[0] = vaddlv_u8(v15);
        if (v15.u32[0] == 1 || v14 == 1)
          break;
        if (!v14)
        {
          if (v12 > 95)
          {
            if (v12 != 96)
            {
              v3 = &stru_1E5449658;
              if (v12 != 97)
                goto LABEL_13;
            }
          }
          else if (v12 != 33)
          {
            v3 = &stru_1E5449658;
            if (v12 != 65)
              goto LABEL_13;
          }
          _WBSLocalizedString();
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
LABEL_13:
        -[NSArray addObject:](v7, "addObject:", v3);

        if (v9 == ++v10)
          goto LABEL_18;
      }
      WBSBrowsingAssistantContentTypeAvailabilityLabel();
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v3 = (__CFString *)v16;
      goto LABEL_13;
    }
LABEL_18:
    v17 = self->_labels;
    self->_labels = v7;

    labels = self->_labels;
  }
  return -[NSArray objectAtIndexedSubscript:](labels, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)representedOptionsAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_representedOptions, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)representsSupersetOfContentOptions:(unint64_t)a3
{
  unint64_t previouslyConsumedOptions;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  previouslyConsumedOptions = self->_previouslyConsumedOptions;
  v5 = self->_representedOptions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        previouslyConsumedOptions |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "unsignedIntegerValue", (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return (a3 & ~previouslyConsumedOptions) == 0;
}

- (id)possibleLabelsByIncorporatingContentOptions:(unint64_t)a3 intoLabelsAfterIndex:(unint64_t)a4
{
  NSArray *representedOptions;
  unint64_t previouslyConsumedOptions;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  previouslyConsumedOptions = self->_previouslyConsumedOptions;
  representedOptions = self->_representedOptions;
  v23 = previouslyConsumedOptions;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = a3;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__WBSBrowsingAssistantAvailabilityLabels_possibleLabelsByIncorporatingContentOptions_intoLabelsAfterIndex___block_invoke;
  v15[3] = &unk_1E5449138;
  v15[5] = &v16;
  v15[6] = a4;
  v15[4] = &v20;
  -[NSArray enumerateObjectsUsingBlock:](representedOptions, "enumerateObjectsUsingBlock:", v15);
  v17[3] &= ~v21[3];
  +[WBSBrowsingAssistantAvailabilityLabels possibleLabelsForContentOptions:](WBSBrowsingAssistantAvailabilityLabels, "possibleLabelsForContentOptions:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++) + 8) = v21[3];
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v24, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v6;
}

uint64_t __107__WBSBrowsingAssistantAvailabilityLabels_possibleLabelsByIncorporatingContentOptions_intoLabelsAfterIndex___block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  unint64_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = a1[6];
  result = objc_msgSend(a2, "unsignedIntegerValue");
  if (v5 <= a3)
    v7 = a1[5];
  else
    v7 = a1[4];
  *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24) |= result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  WBSBrowsingAssistantAvailabilityLabels *v4;
  WBSBrowsingAssistantAvailabilityLabels *v5;
  BOOL v6;

  v4 = (WBSBrowsingAssistantAvailabilityLabels *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSArray isEqualToArray:](self->_representedOptions, "isEqualToArray:", v5->_representedOptions))
        v6 = self->_previouslyConsumedOptions == v5->_previouslyConsumedOptions;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_representedOptionsGroups, 0);
  objc_storeStrong((id *)&self->_representedOptions, 0);
}

@end
