@implementation TransitInstructionLayoutItem

- (TransitInstructionLayoutItem)initWithStrings:(id)a3 font:(id)a4 width:(double)a5
{
  return -[TransitInstructionLayoutItem initWithStrings:font:width:extraTextAttributes:](self, "initWithStrings:font:width:extraTextAttributes:", a3, a4, 0, a5);
}

- (TransitInstructionLayoutItem)initWithStrings:(id)a3 font:(id)a4 width:(double)a5 extraTextAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  TransitInstructionLayoutItem *v13;
  NSArray *v14;
  NSArray *strings;
  UIFont *v16;
  UIFont *font;
  NSDictionary *v18;
  NSDictionary *extraTextAttributes;
  TransitInstructionLayoutItem *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TransitInstructionLayoutItem;
  v13 = -[TransitInstructionLayoutItem init](&v22, "init");
  if (v13)
  {
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    strings = v13->_strings;
    v13->_strings = v14;

    v16 = (UIFont *)objc_msgSend(v11, "copy");
    font = v13->_font;
    v13->_font = v16;

    v13->_width = fmax(a5, 0.0);
    v18 = (NSDictionary *)objc_msgSend(v12, "copy");
    extraTextAttributes = v13->_extraTextAttributes;
    v13->_extraTextAttributes = v18;

    v20 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TransitInstructionLayoutItem *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (TransitInstructionLayoutItem *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(TransitInstructionLayoutItem);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[TransitInstructionLayoutItem isEqualToLayoutItem:](self, "isEqualToLayoutItem:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToLayoutItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;

  v8 = a3;
  -[TransitInstructionLayoutItem width](self, "width");
  v10 = v9;
  objc_msgSend(v8, "width");
  if (v10 != v11)
  {
    v14 = 0;
    goto LABEL_32;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
  if (!v12)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "strings"));
    if (!v5)
    {
      v13 = 0;
      goto LABEL_9;
    }
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "strings"));
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    v13 = 1;
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem font](self, "font"));
    if (v15 || (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"))) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem font](self, "font"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
      if (!objc_msgSend(v16, "isEqual:", v6))
      {
        v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v24 = v16;
      v28 = 1;
    }
    else
    {
      v25 = 0;
      v28 = 0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem extraTextAttributes](self, "extraTextAttributes"));
    if (v17 || (v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "extraTextAttributes"))) != 0)
    {
      v26 = v13;
      v27 = v5;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem extraTextAttributes](self, "extraTextAttributes", v22));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "extraTextAttributes"));
      v14 = objc_msgSend(v18, "isEqualToDictionary:", v19);

      if (v17)
      {

        v13 = v26;
        if (v28)
        {
          v5 = v27;
          v16 = v24;
          goto LABEL_24;
        }
        v5 = v27;
LABEL_25:
        if (!v15)

        if (v13)
        {

        }
        goto LABEL_29;
      }
      v5 = v27;
      v13 = v26;
      v20 = v23;
    }
    else
    {
      v20 = 0;
      v14 = 1;
    }

    v16 = v24;
    if ((v28 & 1) != 0)
      goto LABEL_24;
    goto LABEL_25;
  }

  v14 = 0;
LABEL_29:
  if (!v12)

LABEL_32:
  return v14;
}

- (void)setWidth:(double)a3
{
  MKMultiPartAttributedString *bestFittingMultiPartString;

  if (self->_width != a3)
  {
    self->_width = a3;
    bestFittingMultiPartString = self->_bestFittingMultiPartString;
    self->_bestFittingMultiPartString = 0;

  }
}

- (void)setCombineStrings:(BOOL)a3
{
  MKMultiPartAttributedString *bestFittingMultiPartString;

  if (self->_combineStrings != a3)
  {
    self->_combineStrings = a3;
    bestFittingMultiPartString = self->_bestFittingMultiPartString;
    self->_bestFittingMultiPartString = 0;

  }
}

- (MKMultiPartAttributedString)bestFittingMultiPartString
{
  MKMultiPartAttributedString *bestFittingMultiPartString;
  MKMultiPartAttributedString *v4;
  MKMultiPartAttributedString *v5;

  bestFittingMultiPartString = self->_bestFittingMultiPartString;
  if (!bestFittingMultiPartString)
  {
    v4 = (MKMultiPartAttributedString *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem _calculateBestFittingString](self, "_calculateBestFittingString"));
    v5 = self->_bestFittingMultiPartString;
    self->_bestFittingMultiPartString = v4;

    bestFittingMultiPartString = self->_bestFittingMultiPartString;
  }
  return bestFittingMultiPartString;
}

- (id)_calculateBestFittingString
{
  void *v3;
  id v4;
  NSDictionary *extraTextAttributes;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  double v24;
  char *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  char *v31;
  char *v32;
  id v33;
  void *v34;
  void *v35;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  NSAttributedStringKey v51;
  void *v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    extraTextAttributes = self->_extraTextAttributes;
    if (extraTextAttributes)
    {
      v6 = -[NSDictionary mutableCopy](extraTextAttributes, "mutableCopy");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem font](self, "font"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, NSFontAttributeName);
    }
    else
    {
      v51 = NSFontAttributeName;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem font](self, "font"));
      v52 = v7;
      v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    }

    if (-[TransitInstructionLayoutItem shouldCombineStrings](self, "shouldCombineStrings"))
    {
      v9 = objc_alloc((Class)NSMutableArray);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
      v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v46;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v12);
            v17 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithComposedString:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v16));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "multiPartAttributedStringWithAttributes:", v6));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attributedString"));
            objc_msgSend(v11, "addObject:", v19);

            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v14);
      }

      v20 = objc_alloc((Class)NSAttributedString);
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("separator [transit layout]"), CFSTR("localized string not found"), 0));
      v23 = objc_msgSend(v20, "initWithString:", v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v11, v23));

LABEL_15:
LABEL_16:

      goto LABEL_29;
    }
    -[TransitInstructionLayoutItem width](self, "width");
    if (v24 <= 0.0)
    {
      v33 = objc_alloc((Class)MKServerFormattedString);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastObject"));
      v11 = objc_msgSend(v33, "initWithComposedString:", v35);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "multiPartAttributedStringWithAttributes:", v6));
    }
    else
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
      v40 = (char *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v40)
      {
        v25 = 0;
        v39 = *(_QWORD *)v42;
LABEL_20:
        v26 = 0;
        v37 = &v25[(_QWORD)v40];
        v38 = v25 + 1;
        while (1)
        {
          if (*(_QWORD *)v42 != v39)
            objc_enumerationMutation(v11);
          v21 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithComposedString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v26));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "multiPartAttributedStringWithAttributes:", v6));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributedString"));
          objc_msgSend(v22, "size");
          v28 = v27;
          -[TransitInstructionLayoutItem width](self, "width");
          if (v28 <= v29)
            goto LABEL_15;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
          v31 = (char *)objc_msgSend(v30, "count");

          if (&v38[v26] == v31)
            goto LABEL_16;

          if (v40 == (char *)++v26)
          {
            v32 = (char *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            v25 = v37;
            v40 = v32;
            if (v32)
              goto LABEL_20;
            break;
          }
        }
      }
      v8 = 0;
    }
LABEL_29:

    return v8;
  }
  v8 = 0;
  return v8;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  -[TransitInstructionLayoutItem width](self, "width");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitInstructionLayoutItem strings](self, "strings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p - w=%.2f strings=%@>"), v3, self, v5, v6));

  return v7;
}

- (NSArray)strings
{
  return self->_strings;
}

- (NSTimeZone)formattingTimeZone
{
  return self->_formattingTimeZone;
}

- (UIFont)font
{
  return self->_font;
}

- (NSDictionary)extraTextAttributes
{
  return self->_extraTextAttributes;
}

- (double)width
{
  return self->_width;
}

- (BOOL)shouldCombineStrings
{
  return self->_combineStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraTextAttributes, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_formattingTimeZone, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_bestFittingMultiPartString, 0);
}

@end
