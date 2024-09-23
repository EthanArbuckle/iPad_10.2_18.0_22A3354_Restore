@implementation SSNoteResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.mobilenotes");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSNoteResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSNoteResultBuilder *v5;
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
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SSNoteResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v17, sel_initWithResult_, v4);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "whiteSpaceCondensedStringForString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNoteResultBuilder setTitle:](v5, "setTitle:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64C0], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNoteResultBuilder setIsShared:](v5, "setIsShared:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64B8], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNoteResultBuilder setIsLocked:](v5, "setIsLocked:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60E0], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNoteResultBuilder setModificationDate:](v5, "setModificationDate:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68B8], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[SSNoteResultBuilder setFormattedBody:](v5, "setFormattedBody:", v12);
    }
    else
    {
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSNoteResultBuilder setFormattedBody:](v5, "setFormattedBody:", v13);

    }
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64B0], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNoteResultBuilder setFolder:](v5, "setFolder:", v14);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64A8], objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSNoteResultBuilder setAccount:](v5, "setAccount:", v15);

  }
  return v5;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  void *v92;
  _BYTE v93[128];
  void *v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  if (-[SSNoteResultBuilder isLocked](self, "isLocked"))
  {
    v3 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOCKED"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textWithString:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  -[SSNoteResultBuilder title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder buildHighlightedMatchedTextWithTitle:headTruncation:](self, "buildHighlightedMatchedTextWithTitle:headTruncation:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v7)
  {
    v6 = v7;
    v5 = v6;
    goto LABEL_5;
  }
  v24 = (void *)MEMORY[0x1E0D8C660];
  -[SSNoteResultBuilder formattedBody](self, "formattedBody");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textWithString:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v91.receiver = self;
  v91.super_class = (Class)SSNoteResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v91, sel_buildInlineCardSection);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SSSnippetModernizationEnabled())
  {
    v10 = (void *)objc_opt_new();
    -[SSNoteResultBuilder modificationDate](self, "modificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0D8C3D0];
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[SSNoteResultBuilder modificationDate](self, "modificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@  "), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);

    }
    objc_msgSend(v8, "formattedTextPieces");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v10, "addObjectsFromArray:", v18);
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0D8C3D0];
      objc_msgSend(v8, "text");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "textWithString:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v29);

    }
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "setFormattedTextPieces:", v10);
    v94 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDescriptions:", v31);

    v32 = isMacOS();
    v33 = (void *)objc_opt_new();
    -[SSNoteResultBuilder folder](self, "folder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length");

    if (v32)
    {
      if (v35)
      {
        -[SSNoteResultBuilder folder](self, "folder");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v36);

      }
      -[SSNoteResultBuilder account](self, "account");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "length");

      if (v38)
      {
        -[SSNoteResultBuilder account](self, "account");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v39);

      }
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR(" · "));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "length"))
      {
        v41 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" — %@"), v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v41;
        objc_msgSend(v41, "setText:", v42);

        objc_msgSend(v9, "title");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "formattedTextPieces");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "arrayByAddingObject:", v41);
        v45 = v10;
        v46 = v33;
        v47 = v30;
        v48 = v8;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "title");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setFormattedTextPieces:", v49);

        v8 = v48;
        v30 = v47;
        v33 = v46;
        v10 = v45;

        objc_msgSend(v9, "title");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "formattedTextPieces");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "firstObject");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setIsEmphasized:", 1);

      }
    }
    else
    {
      if (v35)
      {
        v54 = (void *)objc_opt_new();
        objc_msgSend(v54, "setSymbolName:", CFSTR("folder"));
        objc_msgSend(v54, "setIsTemplate:", 1);
        v55 = (void *)objc_opt_new();
        objc_msgSend(v55, "setGlyph:", v54);
        objc_msgSend(v33, "addObject:", v55);
        v56 = (void *)MEMORY[0x1E0D8C3D0];
        v57 = (void *)MEMORY[0x1E0CB3940];
        -[SSNoteResultBuilder folder](self, "folder");
        v86 = v30;
        v58 = v8;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringWithFormat:", CFSTR(" %@"), v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "textWithString:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v61);

        v8 = v58;
        v30 = v86;

      }
      -[SSNoteResultBuilder account](self, "account");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "length");

      if (v63)
      {
        v64 = (void *)MEMORY[0x1E0D8C3D0];
        v65 = (void *)MEMORY[0x1E0CB3940];
        -[SSNoteResultBuilder folder](self, "folder");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v66, "length"))
          v67 = CFSTR(" — ");
        else
          v67 = &stru_1E6E549F0;
        -[SSNoteResultBuilder account](self, "account");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "stringWithFormat:", CFSTR("%@%@"), v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "textWithString:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v70);

      }
      if (objc_msgSend(v33, "count"))
      {
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v71 = v33;
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
        if (v72)
        {
          v73 = v72;
          v74 = *(_QWORD *)v88;
          do
          {
            for (i = 0; i != v73; ++i)
            {
              if (*(_QWORD *)v88 != v74)
                objc_enumerationMutation(v71);
              objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "setIsEmphasized:", 1);
            }
            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
          }
          while (v73);
        }

        v76 = (void *)objc_opt_new();
        v77 = (void *)objc_msgSend(v71, "copy");
        objc_msgSend(v76, "setFormattedTextPieces:", v77);

        objc_msgSend(v9, "setFootnote:", v76);
      }
      objc_msgSend(v9, "footnote");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        v78 = 1;
      else
        v78 = 2;
      objc_msgSend(v30, "setMaxLines:", v78);
    }

  }
  else
  {
    -[SSNoteResultBuilder modificationDate](self, "modificationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      +[SSDateFormatManager shortDateTimeFormatter](SSDateFormatManager, "shortDateTimeFormatter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSNoteResultBuilder modificationDate](self, "modificationDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringFromDate:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      +[SSDateFormatManager dateModifiedStringFormat](SSDateFormatManager, "dateModifiedStringFormat");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((SSSnippetModernizationEnabled() & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v79 = (void *)MEMORY[0x1E0D8C660];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v23, v22);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "textWithString:", v80);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v10 = 0;
    }
    v92 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDescriptions:", v81);

    objc_msgSend(v9, "descriptions");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "firstObject");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setMaxLines:", 2);

    objc_msgSend(v9, "setFootnote:", v10);
  }

  return v9;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0D8C3D0];
  -[SSNoteResultBuilder title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIsEmphasized:", 1);
  objc_msgSend(v3, "addObject:", v6);
  if (SSSnippetModernizationEnabled())
  {
    if (-[SSNoteResultBuilder isShared](self, "isShared"))
    {
      objc_msgSend(v6, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(" "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", v8);

      v9 = (void *)objc_opt_new();
      v10 = v9;
      v11 = CFSTR("person.crop.circle");
LABEL_6:
      objc_msgSend(v9, "setSymbolName:", v11);
      objc_msgSend(v10, "setIsTemplate:", 1);
      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setGlyph:", v10);
      objc_msgSend(v3, "addObject:", v14);

      goto LABEL_7;
    }
    if (-[SSNoteResultBuilder isLocked](self, "isLocked"))
    {
      objc_msgSend(v6, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(" "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", v13);

      v9 = (void *)objc_opt_new();
      v10 = v9;
      v11 = CFSTR("lock.fill");
      goto LABEL_6;
    }
  }
LABEL_7:
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v15, "setFormattedTextPieces:", v16);

  return v15;
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
  objc_super v11;

  v3 = (void *)objc_opt_new();
  -[SSNoteResultBuilder modificationDate](self, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SSNoteResultBuilder modificationDate](self, "modificationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSDateFormatManager dynamicDateTimeStringsFromDate:](SSDateFormatManager, "dynamicDateTimeStringsFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[SSNoteResultBuilder formattedBody](self, "formattedBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  v11.receiver = self;
  v11.super_class = (Class)SSNoteResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v11, sel_buildCompactCardSection);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "richTextsFromStrings:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDescriptions:", v9);

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSString)formattedBody
{
  return self->_formattedBody;
}

- (void)setFormattedBody:(id)a3
{
  objc_storeStrong((id *)&self->_formattedBody, a3);
}

- (NSString)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_formattedBody, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
