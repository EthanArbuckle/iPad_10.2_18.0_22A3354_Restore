@implementation SSMessageResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.MobileSMS");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSMessageResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSMessageResultBuilder *v5;
  SSMessageResultBuilder *v6;
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
  int v19;
  _QWORD *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SSMessageResultBuilder *v36;
  void *v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SSMessageResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v38, sel_initWithResult_, v4);
  v6 = v5;
  if (v5)
  {
    v36 = v5;
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FF8], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6000], objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6008], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6048], objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6030], objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA67D8], objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6028], objc_opt_class());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v36;
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA67C8], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v7;
    else
      v11 = 0;
    -[SSMessageResultBuilder setAttachmentNames:](v36, "setAttachmentNames:", v11);

    objc_msgSend(v37, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v37;
    else
      v13 = 0;
    -[SSMessageResultBuilder setAttachmentPaths:](v36, "setAttachmentPaths:", v13);

    objc_msgSend(v8, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v8;
    else
      v15 = 0;
    -[SSMessageResultBuilder setAttachmentTypes:](v36, "setAttachmentTypes:", v15);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMessageResultBuilder setGroupDisplayName:](v36, "setGroupDisplayName:", v16);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6338], objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMessageResultBuilder setGroupPhotoPath:](v36, "setGroupPhotoPath:", v17);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68B8], objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMessageResultBuilder setMessage:](v36, "setMessage:", v18);

    v19 = isMacOS();
    v20 = (_QWORD *)MEMORY[0x1E0CA62F0];
    if (!v19)
      v20 = (_QWORD *)MEMORY[0x1E0CA6978];
    objc_msgSend(v4, "valueForAttribute:withType:", *v20, objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMessageResultBuilder setMessageId:](v36, "setMessageId:", v21);

    objc_msgSend(v33, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v33;
    else
      v23 = v34;
    -[SSMessageResultBuilder setSenders:](v36, "setSenders:", v23);

    objc_msgSend(v32, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v32;
    else
      v25 = 0;
    -[SSMessageResultBuilder setRecipients:](v36, "setRecipients:", v25);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMessageResultBuilder setSendDate:](v36, "setSendDate:", v26);

    objc_msgSend(v35, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v35;
    else
      v28 = 0;
    -[SSMessageResultBuilder setSenderContactIds:](v36, "setSenderContactIds:", v28);

    objc_msgSend(v9, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v9;
    else
      v30 = 0;
    -[SSMessageResultBuilder setRecipientContactIds:](v36, "setRecipientContactIds:", v30);

  }
  return v6;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSMessageResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v10, sel_buildInlineCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D8C3D0];
  -[SSMessageResultBuilder sendDate](self, "sendDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryTitle:", v7);

  objc_msgSend(v3, "setIsSecondaryTitleDetached:", 1);
  -[SSMessageResultBuilder buildAttachmentThumbnail](self, "buildAttachmentThumbnail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTrailingThumbnail:", v8);

  return v3;
}

- (id)buildDescriptions
{
  void *v3;
  const char *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = isMessagesAttachmentCoreSpotlightId(v3, v4);

  if (v5)
  {
    -[SSMessageResultBuilder attachmentPaths](self, "attachmentPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    v10 = v9;
    if (v9)
      goto LABEL_12;
  }
  -[SSMessageResultBuilder message](self, "message");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  v12 = (void *)v11;
  -[SSMessageResultBuilder message](self, "message");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder matchedStrings](self, "matchedStrings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqual:", v15);

  if (!v16)
  {
LABEL_9:
    -[SSMessageResultBuilder message](self, "message");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v9 = (id)v21;
      v10 = 0;
    }
    else
    {
      -[SSMessageResultBuilder buildAttachmentSummary](self, "buildAttachmentSummary");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v19 = 0;
      v20 = 0;
      if (!v9)
        goto LABEL_13;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v9;
    goto LABEL_13;
  }
  -[SSResultBuilder buildHighlightedMatchedTextWithTitle:headTruncation:](self, "buildHighlightedMatchedTextWithTitle:headTruncation:", 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "formattedTextPieces");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {

    goto LABEL_9;
  }
  v26[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_9;
  v10 = 0;
  v20 = 0;
LABEL_13:
  v23 = v19;

  return v23;
}

- (id)buildAttachmentSummary
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  SSMessageResultBuilder *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v61 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v54 = self;
  -[SSMessageResultBuilder attachmentTypes](self, "attachmentTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v67;
    v7 = *MEMORY[0x1E0CEC520];
    v60 = *MEMORY[0x1E0CEC568];
    v58 = *MEMORY[0x1E0CEC6A8];
    v59 = *MEMORY[0x1E0CEC6A0];
    v56 = *MEMORY[0x1E0CEC690];
    v57 = *MEMORY[0x1E0CEC6B0];
    v53 = *MEMORY[0x1E0CEC450];
    v47 = *MEMORY[0x1E0CEC490];
    v44 = *MEMORY[0x1E0D39C18];
    v45 = *MEMORY[0x1E0CEC478];
    v43 = *MEMORY[0x1E0D39C08];
    v46 = *MEMORY[0x1E0D39C10];
    v51 = *MEMORY[0x1E0D39CA0];
    v52 = *MEMORY[0x1E0D39C00];
    v8 = *MEMORY[0x1E0D39C78];
    v9 = *MEMORY[0x1E0D39C70];
    v10 = *MEMORY[0x1E0D39C60];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v67 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "conformsToType:", v7);
        v14 = v10;
        if ((v13 & 1) == 0)
        {
          v15 = objc_msgSend(v12, "conformsToType:", v60);
          v14 = v9;
          if ((v15 & 1) == 0)
          {
            v16 = objc_msgSend(v12, "conformsToType:", v59);
            v14 = v8;
            if ((v16 & 1) == 0)
            {
              v17 = objc_msgSend(v12, "conformsToType:", v58);
              v14 = v8;
              if ((v17 & 1) == 0)
              {
                v18 = objc_msgSend(v12, "conformsToType:", v57);
                v14 = v8;
                if ((v18 & 1) == 0)
                {
                  if (objc_msgSend(v12, "conformsToType:", v56))
                  {
                    -[SSMessageResultBuilder attachmentTypes](v54, "attachmentTypes");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v55, "count") == 1)
                    {
                      -[SSMessageResultBuilder senders](v54, "senders");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "firstObject");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = objc_msgSend(v48, "length");

                      v14 = v51;
                      if (v49)
                      {
                        v36 = (void *)MEMORY[0x1E0CB3940];
                        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SHARED_WATCHFACE_NOTIFICATION"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SSMessageResultBuilder senders](v54, "senders");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "firstObject");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v36, "localizedStringWithFormat:", v38, v40);
                        v41 = (void *)objc_claimAutoreleasedReturnValue();

                        goto LABEL_36;
                      }
                    }
                    else
                    {

                      v14 = v51;
                    }
                  }
                  else
                  {
                    v19 = objc_msgSend(v12, "conformsToType:", v53);
                    v14 = v52;
                    if ((v19 & 1) == 0)
                    {
                      v20 = objc_msgSend(v12, "conformsToType:", v47);
                      v14 = v46;
                      if ((v20 & 1) == 0)
                      {
                        if (objc_msgSend(v12, "conformsToType:", v45))
                          v14 = v43;
                        else
                          v14 = v44;
                      }
                    }
                  }
                }
              }
            }
          }
        }
        objc_msgSend(v61, "addObject:", v14);

        ++v11;
      }
      while (v5 != v11);
      v21 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      v5 = v21;
    }
    while (v21);
  }

  v22 = v61;
  if (objc_msgSend(v61, "count"))
  {
    v41 = (void *)objc_opt_new();
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("%lu Attachments: "), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringWithFormat:", v25, objc_msgSend(v61, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendString:", v26);

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v3 = v61;
    v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v63;
      v30 = 1;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v63 != v29)
            objc_enumerationMutation(v3);
          v32 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          v33 = objc_msgSend(v3, "countForObject:", v32);
          if ((v30 & 1) == 0)
            objc_msgSend(v41, "appendString:", CFSTR(", "));
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "localizedStringForKey:value:table:", v32, &stru_1E6E549F0, CFSTR("SpotlightServices"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "appendFormat:", v35, v33);

          v30 = 0;
        }
        v28 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        v30 = 0;
      }
      while (v28);
LABEL_36:
      v22 = v61;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)buildThumbnail
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[SSMessageResultBuilder senderContactIds](self, "senderContactIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[SSMessageResultBuilder recipientContactIds](self, "recipientContactIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 2)
  {
    -[SSMessageResultBuilder recipientContactIds](self, "recipientContactIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  -[SSMessageResultBuilder groupPhotoPath](self, "groupPhotoPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setCornerRoundingStyle:", 4);
    v11 = (void *)MEMORY[0x1E0C99E98];
    -[SSMessageResultBuilder groupPhotoPath](self, "groupPhotoPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUrlValue:", v13);

  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setContactIdentifiers:", v5);
    objc_msgSend(v10, "setThreeDTouchEnabled:", 1);
    if (!-[SSResultBuilder isTopHit](self, "isTopHit"))
    {
      objc_msgSend(v10, "setAppIconBadgeBundleIdentifier:", 0);
      goto LABEL_9;
    }
    objc_msgSend((id)objc_opt_class(), "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAppIconBadgeBundleIdentifier:", v12);
  }

LABEL_9:
  return v10;
}

- (id)buildAttachmentThumbnail
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[SSMessageResultBuilder attachmentTypes](self, "attachmentTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v5 = *MEMORY[0x1E0CEC458];
    v6 = *MEMORY[0x1E0CEC520];
    while (1)
    {
      -[SSMessageResultBuilder attachmentNames](self, "attachmentNames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v4 >= v8)
        break;
      -[SSMessageResultBuilder attachmentTypes](self, "attachmentTypes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "conformsToType:", v5) & 1) != 0 || objc_msgSend(v10, "conformsToType:", v6))
      {
        -[SSMessageResultBuilder attachmentNames](self, "attachmentNames");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }

      ++v4;
      -[SSMessageResultBuilder attachmentTypes](self, "attachmentTypes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 >= objc_msgSend(v3, "count"))
        goto LABEL_7;
    }
    v11 = 0;
  }
  else
  {
LABEL_7:
    v11 = 0;
LABEL_9:

  }
  if (objc_msgSend(v11, "length"))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setPhotoIdentifier:", v11);
    objc_msgSend(v13, "setIsSyndicated:", 1);
    objc_msgSend(v13, "setSize:", 32.0, 32.0);
  }
  else
  {
    v13 = 0;
  }

  return v13;
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
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D8C660];
  -[SSMessageResultBuilder sendDate](self, "sendDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)SSMessageResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v12, sel_buildCompactCardSection);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDescriptions:", v10);

  return v8;
}

- (id)buildTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[SSMessageResultBuilder groupDisplayName](self, "groupDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SSMessageResultBuilder senders](self, "senders");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4
      || (v5 = (void *)v4,
          -[SSMessageResultBuilder senders](self, "senders"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "firstObject"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          !v3))
    {
      -[SSMessageResultBuilder recipients](self, "recipients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[SSMessageResultBuilder recipients](self, "recipients");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }

    }
  }
  if (MEMORY[0x1BCCB2F4C](v3))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formattedStringValue");
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (void)setGroupDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_groupDisplayName, a3);
}

- (NSString)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (void)setGroupPhotoPath:(id)a3
{
  objc_storeStrong((id *)&self->_groupPhotoPath, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (NSArray)attachmentNames
{
  return self->_attachmentNames;
}

- (void)setAttachmentNames:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentNames, a3);
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentPaths, a3);
}

- (NSArray)attachmentTypes
{
  return self->_attachmentTypes;
}

- (void)setAttachmentTypes:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentTypes, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSArray)recipientContactIds
{
  return self->_recipientContactIds;
}

- (void)setRecipientContactIds:(id)a3
{
  objc_storeStrong((id *)&self->_recipientContactIds, a3);
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (void)setSendDate:(id)a3
{
  objc_storeStrong((id *)&self->_sendDate, a3);
}

- (NSArray)senders
{
  return self->_senders;
}

- (void)setSenders:(id)a3
{
  objc_storeStrong((id *)&self->_senders, a3);
}

- (NSArray)senderContactIds
{
  return self->_senderContactIds;
}

- (void)setSenderContactIds:(id)a3
{
  objc_storeStrong((id *)&self->_senderContactIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderContactIds, 0);
  objc_storeStrong((id *)&self->_senders, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_recipientContactIds, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_attachmentTypes, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_attachmentNames, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
}

@end
