@implementation ICTextStyle

- (NSAttributedString)attributedName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[ICTextStyle attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setFirstLineHeadIndent:", 0.0);
  objc_msgSend(v7, "setHeadIndent:", 0.0);
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v5);

  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[ICTextStyle name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v4);

  return (NSAttributedString *)v11;
}

- (NSString)styleID
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_ICTTNamedStyle_%d"), self->_ttStyle);
}

+ (unsigned)namedStyleFromStyleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("_ICTTNamedStyle_")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("_ICTTNamedStyle_"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntValue");

  }
  else
  {
    v6 = +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle");
  }

  return v6;
}

- (BOOL)isTextList
{
  return -[ICTextStyle ttStyle](self, "ttStyle") - 100 < 3;
}

+ (id)defaultTextStyles
{
  if (defaultTextStyles_onceToken != -1)
    dispatch_once(&defaultTextStyles_onceToken, &__block_literal_global_44);
  return (id)defaultTextStyles_defaultStyles;
}

void __32__ICTextStyle_defaultTextStyles__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[9];

  v10[8] = *MEMORY[0x1E0C80C00];
  +[ICTextStyle titleStyle](ICTextStyle, "titleStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  +[ICTextStyle headingStyle](ICTextStyle, "headingStyle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  +[ICTextStyle subheadingStyle](ICTextStyle, "subheadingStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  +[ICTextStyle bodyStyle](ICTextStyle, "bodyStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  +[ICTextStyle fixedWidthStyle](ICTextStyle, "fixedWidthStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  +[ICTextStyle bulletStyle](ICTextStyle, "bulletStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  +[ICTextStyle dashStyle](ICTextStyle, "dashStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  +[ICTextStyle numberedStyle](ICTextStyle, "numberedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)defaultTextStyles_defaultStyles;
  defaultTextStyles_defaultStyles = v8;

}

+ (id)titleStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("TITLE_TEXT_STYLE"), CFSTR("Title"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v4);

  -[ICTTTextController titleAttributes](v2, "titleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v5);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 0);
  return v3;
}

+ (id)headingStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Heading"), CFSTR("Heading"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v4);

  -[ICTTTextController headingAttributes](v2, "headingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v5);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 1);
  return v3;
}

+ (id)subheadingStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Subheading"), CFSTR("Subheading"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v4);

  -[ICTTTextController subheadingAttributes](v2, "subheadingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v5);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 2);
  return v3;
}

+ (id)bodyStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Body"), CFSTR("Body"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v4);

  -[ICTTTextController bodyAttributes](v2, "bodyAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v5);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 3);
  return v3;
}

+ (id)fixedWidthStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Monostyled"), CFSTR("Monostyled"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v4);

  -[ICTTTextController fixedWidthAttributes](v2, "fixedWidthAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v5);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 4);
  return v3;
}

+ (id)bulletStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("• Bulleted List"), CFSTR("• Bulleted List"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v4);

  -[ICTTTextController defaultListAttributes](v2, "defaultListAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v5);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 100);
  return v3;
}

+ (id)dashStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("– Dashed List"), CFSTR("– Dashed List"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v4);

  -[ICTTTextController defaultListAttributes](v2, "defaultListAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v5);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 101);
  return v3;
}

+ (id)numberedStyle
{
  ICTTTextController *v2;
  ICTextStyle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(ICTTTextController);
  v3 = objc_alloc_init(ICTextStyle);
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%ld. Numbered List"), CFSTR("%ld. Numbered List"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setName:](v3, "setName:", v6);

  -[ICTTTextController defaultListAttributes](v2, "defaultListAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextStyle setAttributes:](v3, "setAttributes:", v7);

  -[ICTextStyle setTtStyle:](v3, "setTtStyle:", 102);
  return v3;
}

+ (unsigned)validatedNamedStyle:(unsigned int)a3
{
  unsigned int result;

  result = a3;
  if (a3 >= 6 && a3 - 100 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICTextStyle validatedNamedStyle:]", 1, 0, CFSTR("Invalid named style %lu, defaulting to title"), a3);
    return 3;
  }
  return result;
}

+ (unsigned)noteDefaultNamedStyle
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("TTTextControllerNoteDefaultNamedStyleKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(a1, "validatedNamedStyle:", objc_msgSend(v3, "unsignedIntegerValue"));
  else
    v5 = 0;

  return v5;
}

+ (void)setNoteDefaultNamedStyle:(unsigned int)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D64270];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("TTTextControllerNoteDefaultNamedStyleKey"));

}

+ (id)titleForNamedStyle:(unsigned int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "defaultTextStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      if (objc_msgSend(v10, "ttStyle") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (v11)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "textStyle", "+[ICTextStyle titleForNamedStyle:]", 1, 0, CFSTR("No text style found for namedStyle %ld"), a3);
  objc_msgSend(a1, "defaultTextStyles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)icaxStyleDescriptionForNamedStyle:(unsigned int)a3
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  id result;

  switch(a3)
  {
    case 0u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("TITLE_TEXT_STYLE");
      v5 = CFSTR("Title");
      goto LABEL_15;
    case 1u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Heading");
      goto LABEL_14;
    case 2u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Subheading");
      goto LABEL_14;
    case 3u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Body");
      goto LABEL_14;
    case 4u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Fixed width");
      goto LABEL_14;
    case 5u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Caption");
LABEL_14:
      v5 = v4;
LABEL_15:
      objc_msgSend(v3, "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v5, 0, 1);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      switch(a3)
      {
        case 'd':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("Bulleted List");
          goto LABEL_14;
        case 'e':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("Dashed List");
          goto LABEL_14;
        case 'f':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("Numbered List");
          goto LABEL_14;
        case 'g':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("Checklist");
          goto LABEL_14;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

+ (id)icaxStyleDescriptionForBIUSStyle:(unint64_t)a3
{
  void *v3;
  const __CFString *v4;

  switch(a3)
  {
    case 1uLL:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Bold");
      goto LABEL_8;
    case 2uLL:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Italic");
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return a1;
    case 4uLL:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Underline");
      goto LABEL_8;
    case 8uLL:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Strikethrough");
      goto LABEL_8;
    default:
      if (a3 != 16)
        return a1;
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("Highlight");
LABEL_8:
      objc_msgSend(v3, "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v4, 0, 1);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      return a1;
  }
}

+ (id)settingsDescriptionForNamedStyle:(unsigned int)a3
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  id result;

  switch(a3)
  {
    case 0u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("SETTINGS_TEXT_STYLE_TITLE");
      v5 = CFSTR("Title");
      goto LABEL_14;
    case 1u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("SETTINGS_TEXT_STYLE_HEADING");
      v5 = CFSTR("Heading");
      goto LABEL_14;
    case 2u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("SETTINGS_TEXT_STYLE_SUBHEADING");
      v5 = CFSTR("Subheading");
      goto LABEL_14;
    case 3u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("SETTINGS_TEXT_STYLE_BODY");
      v5 = CFSTR("Body");
      goto LABEL_14;
    case 4u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("SETTINGS_TEXT_STYLE_FIXED_WIDTH");
      v5 = CFSTR("Fixed width");
      goto LABEL_14;
    case 5u:
      v3 = (void *)MEMORY[0x1E0D64218];
      v4 = CFSTR("SETTINGS_TEXT_STYLE_CAPTION");
      v5 = CFSTR("Caption");
LABEL_14:
      objc_msgSend(v3, "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v5, 0, 1);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      switch(a3)
      {
        case 'd':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("SETTINGS_TEXT_STYLE_BULLETED_LIST");
          v5 = CFSTR("Bulleted List");
          goto LABEL_14;
        case 'e':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("SETTINGS_TEXT_STYLE_DASHED_LIST");
          v5 = CFSTR("Dashed List");
          goto LABEL_14;
        case 'f':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("SETTINGS_TEXT_STYLE_NUMBERED_LIST");
          v5 = CFSTR("Numbered List");
          goto LABEL_14;
        case 'g':
          v3 = (void *)MEMORY[0x1E0D64218];
          v4 = CFSTR("SETTINGS_TEXT_STYLE_CHECKLIST");
          v5 = CFSTR("Checklist");
          goto LABEL_14;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

+ (id)styleForNamedStyle:(unsigned int)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;

  switch(a3)
  {
    case 0u:
      +[ICTextStyle titleStyle](ICTextStyle, "titleStyle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1u:
      +[ICTextStyle headingStyle](ICTextStyle, "headingStyle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      +[ICTextStyle subheadingStyle](ICTextStyle, "subheadingStyle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      +[ICTextStyle bodyStyle](ICTextStyle, "bodyStyle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4u:
      +[ICTextStyle fixedWidthStyle](ICTextStyle, "fixedWidthStyle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5u:
      v4 = (void *)MEMORY[0x1E0D641A0];
      v5 = CFSTR("Trying to access caption style, but it doesn't exist");
LABEL_13:
      objc_msgSend(v4, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICTextStyle styleForNamedStyle:]", 1, 0, v5);
LABEL_14:
      v3 = 0;
      break;
    default:
      switch(a3)
      {
        case 'd':
          +[ICTextStyle bulletStyle](ICTextStyle, "bulletStyle");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 'e':
          +[ICTextStyle dashStyle](ICTextStyle, "dashStyle");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 'f':
          +[ICTextStyle numberedStyle](ICTextStyle, "numberedStyle");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 'g':
          v4 = (void *)MEMORY[0x1E0D641A0];
          v5 = CFSTR("Trying to access Todo style, but it doesn't exist");
          goto LABEL_13;
        default:
          goto LABEL_14;
      }
      break;
  }
  return v3;
}

- (id)icaxStyleDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "icaxStyleDescriptionForNamedStyle:", -[ICTextStyle ttStyle](self, "ttStyle"));
}

+ (void)setAutoListInsertionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ICTextStyleAutoListInsertionEnabled"));

}

+ (BOOL)autoListInsertionEnabled
{
  return 1;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)ttStyle
{
  return self->_ttStyle;
}

- (void)setTtStyle:(unsigned int)a3
{
  self->_ttStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
