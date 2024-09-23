@implementation SSCalculatorResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.calculation");
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  char v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSCalculatorResultBuilder;
  if ((objc_msgSendSuper2(&v8, sel_supportsResult_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "sectionBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.conversion"));

  }
  return v5;
}

+ (id)yahooAttributionImageWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setLocalImageType:", 3);
  objc_msgSend(v5, "setSize:", width, height);
  return v5;
}

- (SSCalculatorResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSCalculatorResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSCalculatorResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v13, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", CFSTR("SSAttributeCalculatorInput"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SSCalculatorResultBuilder setInput:](v5, "setInput:", v6);
    }
    else
    {
      objc_msgSend(v4, "userInput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCalculatorResultBuilder setInput:](v5, "setInput:", v7);

    }
    objc_msgSend(v4, "valueForAttribute:withType:", CFSTR("SSAttributeCalculatorOutput"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalculatorResultBuilder setOutput:](v5, "setOutput:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", CFSTR("SSAttributeIsCurrencyConversion"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalculatorResultBuilder setIsCurrencyConversion:](v5, "setIsCurrencyConversion:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "sectionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalculatorResultBuilder setIsCalculation:](v5, "setIsCalculation:", objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.conversion")) ^ 1);

    objc_msgSend(v4, "valueForAttribute:withType:", CFSTR("SSAttributeIsCalculation"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCalculatorResultBuilder setIsCalculation:](v5, "setIsCalculation:", objc_msgSend(v11, "BOOLValue"));

  }
  return v5;
}

- (id)buildResult
{
  _BOOL4 v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = -[SSCalculatorResultBuilder isCalculation](self, "isCalculation");
  v4 = CFSTR("com.apple.conversion");
  if (v3)
    v4 = CFSTR("com.apple.calculation");
  v9.receiver = self;
  v9.super_class = (Class)SSCalculatorResultBuilder;
  if (v3)
    v5 = 6;
  else
    v5 = 7;
  v6 = v4;
  -[SSResultBuilder buildResult](&v9, sel_buildResult);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResultBundleId:", v6, v9.receiver, v9.super_class);
  objc_msgSend(v7, "setSectionBundleIdentifier:", v6);
  objc_msgSend(v7, "setApplicationBundleIdentifier:", CFSTR("com.apple.calculation"));
  objc_msgSend(v7, "setPlacement:", 3);
  objc_msgSend(v7, "setType:", v5);
  objc_msgSend(v7, "setIdentifier:", v6);

  return v7;
}

- (id)buildInlineCardSections
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INLINE_EQUATION_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSCalculatorResultBuilder formattedInput](self, "formattedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setTitle:", v7);
  -[SSCalculatorResultBuilder output](self, "output");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", v9);

  objc_msgSend(v8, "setSubtitleIsEmphasized:", 1);
  -[SSCalculatorResultBuilder buildCommand](self, "buildCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommand:", v10);

  v11 = (void *)objc_opt_new();
  -[SSCalculatorResultBuilder output](self, "output");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCopyableString:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setCopyableItem:", v11);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setCommand:", v13);
  -[SSCalculatorResultBuilder buildButtonItems](self, "buildButtonItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonItems:", v15);

  if (-[SSCalculatorResultBuilder isCurrencyConversion](self, "isCurrencyConversion"))
  {
    objc_msgSend(v8, "setSeparatorStyle:", 1);
    v16 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "yahooAttributionImageWithSize:", 78.0, 12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIcons:", v18);

    v19 = objc_alloc_init(MEMORY[0x1E0D8C1C0]);
    objc_msgSend(v19, "setTrailingAttribution:", v16);
    objc_msgSend(v8, "command");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCommand:", v20);

    v24[0] = v8;
    v24[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)buildCompactCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COMPACT_EQUATION_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SSCalculatorResultBuilder formattedInput](self, "formattedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSCalculatorResultBuilder output](self, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)SSCalculatorResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v16, sel_buildCompactCardSection);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v10);

  if (-[SSCalculatorResultBuilder isCurrencyConversion](self, "isCurrencyConversion"))
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "yahooAttributionImageWithSize:", 91.0, 15.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIcons:", v13);

    v17 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDescriptions:", v14);

  }
  return v9;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[SSCalculatorResultBuilder isCurrencyConversion](self, "isCurrencyConversion"))
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)MEMORY[0x1E0D8C5E0];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://finance.yahoo.com/currency-converter/"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchoutWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPunchout:", v6);

  }
  else
  {
    if (-[SSCalculatorResultBuilder isCalculation](self, "isCalculation"))
    {
LABEL_6:
      v3 = (void *)objc_opt_new();
      -[SSCalculatorResultBuilder input](self, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setInput:", v7);

      -[SSCalculatorResultBuilder output](self, "output");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setOutput:", v8);

      return v3;
    }
    v3 = (void *)objc_opt_new();
    -[SSCalculatorResultBuilder input](self, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSearchString:", v5);
  }

  if (!v3)
    goto LABEL_6;
  return v3;
}

- (id)buildPreviewButtonItems
{
  void *v3;
  objc_super v5;

  if (-[SSCalculatorResultBuilder isCalculation](self, "isCalculation") && (isMacOS() & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)SSCalculatorResultBuilder;
    -[SSResultBuilder buildPreviewButtonItems](&v5, sel_buildPreviewButtonItems);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SSCalculatorResultBuilder buildButtonItems](self, "buildButtonItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)buildButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSCalculatorResultBuilder output](self, "output");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCopyableString:", v4);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setCopyableItem:", v3);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setCommand:", v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildBackgroundColor
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setApplicationBundleIdentifier:", CFSTR("com.apple.calculator"));
  return v2;
}

- (id)formattedInput
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v11;

  -[SSCalculatorResultBuilder input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[=＝]\\s*$"), 0, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (v5)
      v7 = v11 == 0;
    else
      v7 = 0;
    if (v7)
    {
      -[SSCalculatorResultBuilder input](self, "input");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCalculatorResultBuilder input](self, "input");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v9, "length"), &stru_1E6E549F0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[SSCalculatorResultBuilder input](self, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (NSString)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (BOOL)isCalculation
{
  return self->_isCalculation;
}

- (void)setIsCalculation:(BOOL)a3
{
  self->_isCalculation = a3;
}

- (BOOL)isCurrencyConversion
{
  return self->_isCurrencyConversion;
}

- (void)setIsCurrencyConversion:(BOOL)a3
{
  self->_isCurrencyConversion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
