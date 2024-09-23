@implementation ECMessages

+ (void)initialize
{
  TCTaggedMessage *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  TCTaggedMessage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  TCTaggedMessage *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  TCTaggedMessage *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  TCTaggedMessage *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  TCTaggedMessage *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  TCTaggedMessage *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  TCTaggedMessage *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  TCTaggedMessage *v42;
  uint64_t v43;
  void *v44;
  TCTaggedMessage *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  TCTaggedMessage *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  TCTaggedMessage *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;

  if ((id)objc_opt_class() == a1)
  {
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Password protection on sheets was removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TCTaggedMessage initWithMessageText:](v2, "initWithMessageText:", v4);
    v6 = (void *)ECPasswordProtectedSheet;
    ECPasswordProtectedSheet = v5;

    v7 = [TCTaggedMessage alloc];
    TCBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Pivot tables aren\\U2019t supported and were converted to regular tables."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TCTaggedMessage initWithMessageText:](v7, "initWithMessageText:", v9);
    v11 = (void *)ECPivotTables;
    ECPivotTables = v10;

    v12 = [TCTaggedMessage alloc];
    TCBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Sparklines aren\\U2019t supported and were ignored."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TCTaggedMessage initWithMessageText:](v12, "initWithMessageText:", v14);
    v16 = (void *)ECUnsupportedSparklines;
    ECUnsupportedSparklines = v15;

    v17 = [TCTaggedMessage alloc];
    TCBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("This document was created with an unsupported version of Excel."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[TCTaggedMessage initWithMessageText:](v17, "initWithMessageText:", v19);
    v21 = (void *)ECUnsupportedVersion;
    ECUnsupportedVersion = v20;

    v22 = [TCTaggedMessage alloc];
    TCBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Cells outside the limits of iWork tables were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[TCTaggedMessage initWithMessageText:](v22, "initWithMessageText:", v24);
    v26 = (void *)ECCellsOutsideLassoBoundary;
    ECCellsOutsideLassoBoundary = v25;

    v27 = [TCTaggedMessage alloc];
    TCBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Some formulas couldn\\U2019t be imported. Last values were retained."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[TCTaggedMessage initWithMessageText:](v27, "initWithMessageText:", v29);
    v31 = (void *)ECUnsupportedImportFormula;
    ECUnsupportedImportFormula = v30;

    v32 = [TCTaggedMessage alloc];
    TCBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("A column or row was too large and was resized. Shapes and charts might look different."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TCTaggedMessage initWithMessageText:](v32, "initWithMessageText:", v34);
    v36 = (void *)ECColumnOrRowTooBig;
    ECColumnOrRowTooBig = v35;

    v37 = [TCTaggedMessage alloc];
    TCBundle();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Some formulas couldn\\U2019t be exported. Last values were retained."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[TCTaggedMessage initWithMessageText:](v37, "initWithMessageText:", v39);
    v41 = (void *)ECUnsupportedExportFormula;
    ECUnsupportedExportFormula = v40;

    v42 = [TCTaggedMessage alloc];
    v43 = -[TCTaggedMessage initWithMessageText:](v42, "initWithMessageText:", kWarningMessageNoConditionalFormats);
    v44 = (void *)ECTUnsupportedConditionalFormat;
    ECTUnsupportedConditionalFormat = v43;

    v45 = [TCTaggedMessage alloc];
    TCBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Content too long to fit in table cells was removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[TCTaggedMessage initWithMessageText:](v45, "initWithMessageText:", v47);
    v49 = (void *)ECStringTooLong;
    ECStringTooLong = v48;

    v50 = [TCTaggedMessage alloc];
    TCBundle();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("The document contains more colors than are supported; some colors might look different."),
      &stru_24F3BFFF8,
      CFSTR("TCCompatibility"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[TCTaggedMessage initWithMessageText:](v50, "initWithMessageText:", v52);
    v54 = (void *)ECTooManyColors;
    ECTooManyColors = v53;

    v55 = [TCTaggedMessage alloc];
    TCBundle();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("A font size was too large and was resized."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[TCTaggedMessage initWithMessageText:](v55, "initWithMessageText:", v57);
    v59 = (void *)ECFontSizeTooLarge;
    ECFontSizeTooLarge = v58;

    objc_opt_class();
  }
}

@end
