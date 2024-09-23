@implementation SSGeneralResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "sectionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SSGeneralResultBuilder;
  -[SSResultBuilder buildTitle](&v18, sel_buildTitle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (isMacOS())
  {
    -[SSResultBuilder result](self, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A8], objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    if (v7 != 0.0)
    {
      v8 = (void *)MEMORY[0x1E0D8C3D0];
      objc_msgSend(v3, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setIsEmphasized:", 1);
      v11 = (void *)MEMORY[0x1E0D8C3D0];
      v12 = (void *)MEMORY[0x1E0CB3940];
      +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR(" — %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = v10;
      v19[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFormattedTextPieces:", v16);

    }
  }
  return v3;
}

- (id)buildSecondaryTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (buildSecondaryTitle_onceToken != -1)
    dispatch_once(&buildSecondaryTitle_onceToken, &__block_literal_global_13);
  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "contentTypeTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !objc_msgSend((id)buildSecondaryTitle_utiTypesWithSecondaryTitle, "intersectsSet:", v6))
  {
    v8 = 0;
    goto LABEL_8;
  }
  +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

void __45__SSGeneralResultBuilder_buildSecondaryTitle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)*MEMORY[0x1E0CEC4D0], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC560], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)buildSecondaryTitle_utiTypesWithSecondaryTitle;
  buildSecondaryTitle_utiTypesWithSecondaryTitle = v4;

}

- (id)buildSecondaryTitleImage
{
  return 0;
}

- (id)buildDescriptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  objc_super v47;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FF0], objc_opt_class());
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA5F80], objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6770], objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA60C0], objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA68C0], objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA64C8], objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = isMacOS();
  v9 = (_QWORD *)MEMORY[0x1E0CA6468];
  if (!v8)
    v9 = (_QWORD *)MEMORY[0x1E0CA6318];
  objc_msgSend(v3, "valueForAttribute:withType:", *v9, objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA60A0], objc_opt_class());
  *((_QWORD *)&v46 + 1) = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A0], objc_opt_class());
  *(_QWORD *)&v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA68C8], objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA61C8], objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA63D8], objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = (void *)MEMORY[0x1E0C99DE8];
  v47.receiver = self;
  v47.super_class = (Class)SSGeneralResultBuilder;
  -[SSResultBuilder buildDescriptions](&v47, sel_buildDescriptions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    v14 = (void *)objc_opt_new();
  v15 = (void *)v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v16);

  }
  v17 = (void *)v7;
  if (v5)
  {
    v18 = (void *)MEMORY[0x1E0D8C660];
    +[SSMusicResultBuilder stringWithAlbum:releaseDate:](SSMusicResultBuilder, "stringWithAlbum:releaseDate:", v5, v43);
    v19 = v5;
    v20 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

    v15 = v20;
    v5 = v19;
    v7 = (uint64_t)v17;
  }
  if (v46 != 0)
  {
    +[SSReminderResultBuilder stringWithCompletionDate:dueDate:modificationDate:](SSReminderResultBuilder, "stringWithCompletionDate:dueDate:modificationDate:", *((_QWORD *)&v46 + 1), (_QWORD)v46, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v23);
    v24 = v5;
    v25 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v26);

    v15 = v25;
    v5 = v24;
    v7 = (uint64_t)v17;

  }
  if (v44)
  {
    +[SSCalendarResultBuilder stringWithStartDate:endDate:isAllDay:](SSCalendarResultBuilder, "stringWithStartDate:endDate:isAllDay:", v44, v42, v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v28);

  }
  if (v7)
  {
    v29 = (void *)MEMORY[0x1E0D8C660];
    +[SSFileResultBuilder stringWithPageCount:](SSFileResultBuilder, "stringWithPageCount:", v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textWithString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v31);

  }
  if (v45)
  {
    v32 = (void *)MEMORY[0x1E0D8C660];
    +[SSNumberFormatManager stringFromByteCount:](SSNumberFormatManager, "stringFromByteCount:", objc_msgSend(v45, "longLongValue"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textWithString:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v34);

  }
  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v40);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v35);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v36, "setStarRating:");
    objc_msgSend(v14, "addObject:", v36);

  }
  if (objc_msgSend(v14, "count"))
    v37 = v14;
  else
    v37 = 0;
  v38 = v37;

  return v38;
}

- (id)buildFootnote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;

  if ((isMacOS() & 1) == 0)
  {
    -[SSResultBuilder result](self, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A8], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64A0], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentTypeTree");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC478], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5F90], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v8 == 0.0)
    {
      if (v9)
        v17 = v12;
      else
        v17 = 1;
      if ((v17 & 1) != 0)
      {
        if (v15)
        {
          v18 = v15;
LABEL_15:
          objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v18);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          return v3;
        }
LABEL_16:
        v3 = 0;
        goto LABEL_17;
      }
      +[SSNewsResultBuilder newsFootnoteWithNewsSource:publishedDate:](SSNewsResultBuilder, "newsFootnoteWithNewsSource:publishedDate:", v9, v5);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:", v8);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (id)v16;
    if (v16)
      goto LABEL_15;
    goto LABEL_16;
  }
  v3 = 0;
  return v3;
}

- (id)buildDetailedRowCardSection
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSGeneralResultBuilder;
  -[SSResultBuilder buildDetailedRowCardSection](&v6, sel_buildDetailedRowCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSGeneralResultBuilder buildSecondaryTitle](self, "buildSecondaryTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsSecondaryTitleDetached:", v4 != 0);

  return v3;
}

@end
