@implementation ICMentionsController(UI)

- (void)registerForContactsChangedNotification
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  objc_msgSend(a1, "contactsChangedObserverToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_initWeak(&location, a1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C95130], "ic_mentionableNamesCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D63F08];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __66__ICMentionsController_UI__registerForContactsChangedNotification__block_invoke;
    v10 = &unk_1E5C22E40;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, v4, 0, &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setContactsChangedObserverToken:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (id)fetchContactNamesForParticipants:()UI
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "-[ICMentionsController(UI) fetchContactNamesForParticipants:]", 1, 0, CFSTR("Unexpected call from main thread"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "ic_mentionTokensFromContacts", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ic_setNonNilObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (uint64_t)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int v34;
  BOOL v35;
  void *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSUInteger v57;
  void *v58;
  void *v59;
  NSUInteger v60;
  void *v61;
  uint64_t v62;
  NSUInteger v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSUInteger v76;
  NSUInteger v77;
  id v78;
  NSUInteger v80;
  void *v81;
  NSRange v82;
  NSRange v83;
  NSRange v84;
  NSRange v85;
  NSRange v86;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a11;
  if (objc_msgSend(a1, "allowsMentions"))
  {
    v20 = objc_msgSend(a1, "maxLengthOfStringForCheckingMention");
    v21 = v20 + 1;
    v22 = a4;
    v23 = a3;
    if (v20 + 1 > a4)
    {
      if (a3 >= v20 + 1 - a4)
        v24 = v20 + 1 - a4;
      else
        v24 = a3;
      v23 = a3 - v24;
      v25 = objc_msgSend(v16, "length") - (a3 - v24);
      if (v21 < v25)
        v25 = v21;
      if (v25 + v23 <= a3 + a4)
        v22 = v25;
      else
        v22 = v24 + a4;
    }
    v26 = objc_msgSend(v16, "hasNamedStyle:inRange:", 4, a3, a4);
    v81 = a1;
    if ((v26 & 1) != 0 || a4)
    {
      if ((v26 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v18, "typingAttributes");
      v77 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
      v76 = v22;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v19;
      v31 = v18;
      v32 = v16;
      v33 = v17;
      v34 = objc_msgSend(v29, "style");

      v22 = v76;
      v23 = v77;
      v35 = v34 == 4;
      v17 = v33;
      v16 = v32;
      v18 = v31;
      v19 = v30;
      if (!v35)
      {
LABEL_18:
        v38 = objc_msgSend(v18, "selectedRange", v76);
        objc_msgSend(v81, "checkForMentionsInString:inRange:selectionRange:languageHasSpaces:", v16, v23, v22, v38, v39, a10);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v78 = v19;
          v40 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            v84.location = a3;
            v84.length = a4;
            -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:].cold.5(v84, v36, v40);
          }

          v42 = objc_msgSend(v36, "rangeOfMention");
          v43 = v41;
          v44 = a3 + a4;
          if (v42 + v41 == a3 + a4)
          {
            v45 = v41;
            v46 = objc_opt_class();
            objc_msgSend(v16, "string");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (void *)v46;
            v43 = v45;
            if ((objc_msgSend(v48, "range:hasValidPostfixCharacterForString:", v42, v45, v47) & 1) != 0
              || v44 == objc_msgSend(v16, "length"))
            {

              if ((a9 & 1) == 0)
              {
                if (objc_msgSend(v36, "isExplicitMention"))
                {
                  v49 = os_log_create("com.apple.notes", "Mentions");
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    v82.location = v42;
                    v82.length = v45;
                    -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:].cold.3(v82);
                  }
LABEL_53:

                  objc_msgSend(v36, "matchingParticipants");
                  v57 = v43;
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "mentionString");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "applyUnconfirmedMentionToTextStorage:participants:range:textView:mentionString:", v16, v58, v42, v57, v18, v59);

                  v37 = 1;
                  v19 = v78;
                  goto LABEL_49;
                }
                if ((objc_msgSend(v36, "isPartialMention") & 1) == 0)
                {
                  v49 = os_log_create("com.apple.notes", "Mentions");
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    v85.location = v42;
                    v85.length = v45;
                    -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:].cold.4(v85);
                  }
                  goto LABEL_53;
                }
LABEL_46:
                v37 = 0;
LABEL_47:
                v19 = v78;
                goto LABEL_48;
              }
            }
            else
            {

            }
          }
          v50 = objc_msgSend(v36, "rangeOfMention");
          if (v51 + v50 + 1 != v44 && !a9)
            goto LABEL_46;
          v52 = objc_msgSend(v36, "isExplicitMention");
          if (!a8)
          {
            v37 = 0;
            if (v52 && (a9 & 1) == 0)
            {
              v49 = os_log_create("com.apple.notes", "Mentions");
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                v83.location = v42;
                v83.length = v43;
                -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:].cold.2(v83);
              }
              goto LABEL_53;
            }
            goto LABEL_47;
          }
          if (!v52 || (objc_msgSend(v36, "isPartialMention") & 1) != 0)
            goto LABEL_46;
          v53 = v17;
          objc_msgSend(v36, "matchingParticipants");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v54, "count") == 1)
          {

          }
          else
          {
            if (!objc_msgSend(v36, "isAllMention"))
            {
              v37 = 0;
LABEL_75:
              v19 = v78;

              v17 = v53;
              goto LABEL_48;
            }
            objc_msgSend(v36, "matchingParticipants");
            v60 = v43;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "count");

            v43 = v60;
            if (v62)
            {
              v37 = 0;
              v17 = v53;
              goto LABEL_47;
            }
          }
          v55 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            v86.location = v42;
            v86.length = v43;
            -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:].cold.1(v86);
          }

          if ((objc_msgSend(v36, "isAllMention") & 1) != 0)
          {
            objc_msgSend((id)objc_opt_class(), "allUserRecordName");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v36, "matchingParticipants");
            v63 = v43;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "anyObject");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "ic_userRecordNameInNote:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = v63;
          }
          if (objc_msgSend(v36, "isAllMention"))
          {
            objc_msgSend((id)objc_opt_class(), "allKeyword");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_69:
            objc_msgSend(MEMORY[0x1E0D63B40], "createMentionAttachmentIfApplicableWithMentionText:userRecordName:note:parentAttachment:", v66, v54, v53, v78);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v74;
            if (v74)
            {
              objc_msgSend(v74, "setAnimateInsertion:", 1);
              objc_msgSend(v75, "setMentionNotificationState:", 1);
              v37 = objc_opt_respondsToSelector();
              if ((v37 & 1) != 0)
                objc_msgSend(v81, "insertMentionAttachment:atRange:viaAutoComplete:", v75, v42, v43, 0);
              objc_msgSend(v53, "save");
            }
            else
            {
              v37 = 0;
            }

            goto LABEL_75;
          }
          v80 = v43;
          objc_msgSend(v36, "matchingParticipants");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "anyObject");
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "mentionString");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "length");

          if (v70)
          {
            objc_msgSend(v36, "mentionString");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "ic_trailingTrimmedString");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "ic_participantNameMatchingString:returnFullName:", v72, 0);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (v73)
            {
              v66 = v73;
              v43 = v80;
              if (objc_msgSend(v73, "length"))
              {
LABEL_68:

                goto LABEL_69;
              }
LABEL_67:
              objc_msgSend(v68, "ic_shortParticipantName");
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_68;
            }
          }
          else
          {
            v73 = 0;
          }
          v43 = v80;
          goto LABEL_67;
        }
LABEL_28:
        v37 = 0;
LABEL_48:
        objc_msgSend(v81, "clearUnconfirmedMentionInTextStorage:", v16, v76);
LABEL_49:

        goto LABEL_50;
      }
    }
    v36 = 0;
    goto LABEL_28;
  }
  v37 = 0;
LABEL_50:

  return v37 & 1;
}

+ (uint64_t)rangeOfUnconfirmedMentionInTextStorage:()UI
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v12 = "";
  v13 = xmmword_1ACA582A0;
  v4 = *MEMORY[0x1E0D63D48];
  v5 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__ICMentionsController_UI__rangeOfUnconfirmedMentionInTextStorage___block_invoke;
  v8[3] = &unk_1E5C1EEC8;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 2, v8);
  v6 = v10[4];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)clearUnconfirmedMentionInTextStorage:()UI
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "updateAutoCompletionView:range:textView:mentionString:", 0, 0, 0, 0, 0);
  v4 = objc_msgSend((id)objc_opt_class(), "rangeOfUnconfirmedMentionInTextStorage:", v6);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E0D63D48], v4, v5);

}

- (void)insertMentionWithText:()UI uuidString:parentAttachment:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;

  v8 = (void *)MEMORY[0x1E0D63B40];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a1, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createMentionAttachmentIfApplicableWithMentionText:userRecordName:note:parentAttachment:", v11, v10, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "setAnimateInsertion:", 1);
    objc_msgSend(v13, "setMentionNotificationState:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = objc_msgSend(a1, "editedRange");
      objc_msgSend(a1, "insertMentionAttachment:atRange:viaAutoComplete:", v13, v14, v15, 1);
    }
  }
  else
  {
    v16 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ICMentionsController(UI) insertMentionWithText:uuidString:parentAttachment:].cold.1(v16);

  }
}

- (uint64_t)newlineEnteredInNote:()UI
{
  return objc_msgSend(a1, "sendPendingNotificationsAfterDelay:forNote:", 3, a3);
}

- (uint64_t)tableCellFirstResponderChangedInNote:()UI
{
  return objc_msgSend(a1, "sendPendingNotificationsAfterDelay:forNote:", 3, a3);
}

- (void)sendPendingNotificationsAfterDelay:()UI forNote:
{
  void *v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "allowsMentions"))
  {
    v6 = dispatch_time(0, 1000000000 * a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__ICMentionsController_UI__sendPendingNotificationsAfterDelay_forNote___block_invoke;
    block[3] = &unk_1E5C1D540;
    v8 = v5;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);

  }
}

+ (BOOL)hasMentionInTextStorage:()UI inRange:
{
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v7 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke;
  v13[3] = &unk_1E5C1EF18;
  v13[4] = &v14;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", a4, a5, 0x100000, v13);
  if (*((_BYTE *)v15 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = *MEMORY[0x1E0DC10F8];
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke_2;
    v12[3] = &unk_1E5C1EEC8;
    v12[4] = &v14;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v10, a4, a5, 0, v12);
    v9 = *((_BYTE *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)applyUnconfirmedMentionToTextStorage:()UI participants:range:textView:mentionString:
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = *MEMORY[0x1E0D63D48];
  if (v14)
  {
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0D63D48], v14, a5, a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAttribute:value:range:", v17, v18, a5, a6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "updateAutoCompletionView:range:textView:mentionString:", v14, a5, a6, v15, v16);

}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.1(NSRange a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromRange(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Explicit mention automatically confirmed at %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.2(NSRange a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromRange(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Unconfirmed explicit mention at %@, not allowed to auto convert", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.3(NSRange a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromRange(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Unconfirmed explicit partial mention at %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.4(NSRange a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromRange(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Unconfirmed implicit mention at %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_3();
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.5(NSRange a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412547;
  v8 = v5;
  v9 = 2113;
  v10 = v6;
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "Mentions result at %@: %{private}@", (uint8_t *)&v7, 0x16u);

}

- (void)insertMentionWithText:()UI uuidString:parentAttachment:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Cannot addInlineAttachment because mentionsAttachment is nil", v1, 2u);
}

@end
