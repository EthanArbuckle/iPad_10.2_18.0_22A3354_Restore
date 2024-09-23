@implementation ICNote(HTML)

- (uint64_t)htmlString
{
  return objc_msgSend(a1, "htmlStringWithAttachmentConversionHandler:", &__block_literal_global_3);
}

- (id)htmlStringWithAttachments:()HTML
{
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "htmlString");
  else
    objc_msgSend(a1, "htmlStringWithAttachmentConversionHandler:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)htmlStringWithAttachmentConversionHandler:()HTML
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "uiAttributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "htmlStringFromAttributedString:attachmentConversionHandler:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)htmlStringWithHTMLAttachments
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__ICNote_HTML__htmlStringWithHTMLAttachments__block_invoke;
  v2[3] = &unk_1E5C1DED0;
  v2[4] = a1;
  objc_msgSend(a1, "htmlStringWithAttachmentConversionHandler:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)attributedStringFromHTMLString:()HTML
{
  return objc_msgSend(a1, "attributedStringFromHTMLString:baseURL:readerDelegate:", a3, 0, 0);
}

+ (uint64_t)attributedStringFromHTMLString:()HTML readerDelegate:
{
  return objc_msgSend(a1, "attributedStringFromHTMLString:baseURL:readerDelegate:", a3, 0, a4);
}

+ (id)attributedStringFromHTMLString:()HTML baseURL:readerDelegate:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "htmlStringByFixingDashedListsInHTMLString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(a1, "mutableAttributedStringFromHTMLString:readerDelegate:", v10, v9);
  else
    objc_msgSend(a1, "mutableAttributedStringFromHTMLString:baseURL:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fixDashedListsInAttributedString:", v11);
  objc_msgSend(a1, "fixUnwantedCharactersInAttributedString:", v11);
  objc_msgSend(a1, "fixFontsInAttributedString:", v11);
  objc_msgSend(a1, "fixTextColorsInAttributedString:", v11);

  return v11;
}

+ (uint64_t)htmlObjectAttributesForAttachmentWithContentID:()HTML
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" type=\"application/x-apple-msg-attachment\" data=\"cid:%@\"), a3);
}

+ (id)mutableAttributedStringFromHTMLString:()HTML baseURL:
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  +[ICHTMLConverterClient sharedClient](ICHTMLConverterClient, "sharedClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__ICNote_HTML__mutableAttributedStringFromHTMLString_baseURL___block_invoke;
  v15[3] = &unk_1E5C1DEF8;
  v17 = &v23;
  v18 = &v19;
  v10 = v7;
  v16 = v10;
  objc_msgSend(v9, "attributedStringFromHTMLString:baseURL:timeoutDate:completionBlock:", v5, v6, v8, v15);

  v11 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v10, v11);
  if (!*((_BYTE *)v20 + 24))
  {
    v12 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ICNote(HTML) mutableAttributedStringFromHTMLString:baseURL:].cold.1(v12);

  }
  v13 = (id)v24[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

+ (id)mutableAttributedStringFromHTMLString:()HTML readerDelegate:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v5 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0DC1148], *MEMORY[0x1E0DC1118]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E5C71B50, *MEMORY[0x1E0DC1110]);
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D639A0]);
  v12 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithData:options:documentAttributes:error:", v6, v7, 0, &v12);
  v9 = v12;
  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ICNote(HTML) mutableAttributedStringFromHTMLString:readerDelegate:].cold.1((uint64_t)v9, v10);

  }
  return v8;
}

+ (id)htmlStringByFixingDashedListsInHTMLString:()HTML
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<style>ul.Apple-dash-list, ul.Apple-dash-list ul { list-style-type: %@; }</style>"),
    CFSTR("upper-roman"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "rangeOfString:", CFSTR("<head>"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<head>%@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v6, v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (void)fixDashedListsInAttributedString:()HTML
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (!fixDashedListsInAttributedString__NSTextListClass)
    fixDashedListsInAttributedString__NSTextListClass = (uint64_t)NSClassFromString(CFSTR("NSTextList"));
  v4 = *MEMORY[0x1E0DC1178];
  v5 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ICNote_HTML__fixDashedListsInAttributedString___block_invoke;
  v7[3] = &unk_1E5C1DF20;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v7);

}

+ (void)fixUnwantedCharactersInAttributedString:()HTML
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "mutableString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR(" "), 0, 0, v4);
}

+ (void)fixFontsInAttributedString:()HTML
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC1138];
  v7 = objc_msgSend(v3, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__ICNote_HTML__fixFontsInAttributedString___block_invoke;
  v11[3] = &unk_1E5C1DF48;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0x100000, v11);

}

+ (void)fixTextColorsInAttributedString:()HTML
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = *MEMORY[0x1E0DC1140];
  v6 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ICNote_HTML__fixTextColorsInAttributedString___block_invoke;
  v8[3] = &unk_1E5C1DF70;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v8);

}

+ (id)htmlStringFromAttributedString:()HTML attachmentConversionHandler:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  id v35;
  id v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  id v42;
  __CFString *v44;
  id v45;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;

  v5 = a3;
  v49 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("img"), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    v42 = (id)objc_opt_new();
    goto LABEL_29;
  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC10F0];
  v9 = objc_msgSend(v5, "ic_range");
  v11 = v10;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke;
  v61[3] = &unk_1E5C1DF98;
  v47 = v7;
  v62 = v47;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v8, v9, v11, 0, v61);
  v12 = (void *)objc_msgSend(v5, "mutableCopy");
  v13 = objc_msgSend(v5, "ic_range");
  objc_msgSend(v12, "removeAttribute:range:", v8, v13, v14);
  v51 = v12;
  objc_msgSend(v12, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "paragraphRangeForRange:", 0, 0);
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_27;
  v50 = v18;
  v45 = v5;
  v20 = 0;
  do
  {
    objc_msgSend(v51, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v16, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    if (objc_msgSend(v21, "isList") && (v23 = objc_msgSend(v21, "indent"), v22 = v23 + 1, v23 + 1 > v20))
    {
      v24 = v23 - v20 + 1;
      do
      {
        v25 = objc_msgSend(v21, "style");
        if (objc_msgSend(v21, "style") == 102)
          v26 = CFSTR("ol");
        else
          v26 = CFSTR("ul");
        v27 = v26;
        objc_msgSend(v19, "addObject:", v27);
        if (v25 == 101)
          objc_msgSend(v6, "appendFormat:", CFSTR("<%@ class=\"%@\">\n"), v27, CFSTR("Apple-dash-list"));
        else
          objc_msgSend(v6, "appendFormat:", CFSTR("<%@>\n"), v27, v44);

        --v24;
      }
      while (v24);
    }
    else
    {
      if (v22 >= v20)
        goto LABEL_18;
      do
      {
        --v20;
        objc_msgSend(v19, "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeLastObject");
        objc_msgSend(v6, "appendFormat:", CFSTR("</%@>\n"), v28);

      }
      while (v22 < v20);
    }
    v20 = v22;
LABEL_18:
    objc_msgSend(a1, "tagDictionaryForWrapperAroundParagraphStyle:", v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("TagName"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Attributes"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    v33 = &stru_1E5C2F8C0;
    if (v31)
      v33 = (__CFString *)v31;
    v34 = v33;

    v44 = v34;
    objc_msgSend(v6, "appendFormat:", CFSTR("<%@%@>"), v30);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_2;
    v52[3] = &unk_1E5C1DFE8;
    v58 = a1;
    v57 = v49;
    v35 = v6;
    v53 = v35;
    v54 = v48;
    v36 = v51;
    v55 = v36;
    v56 = v47;
    v59 = v16;
    v60 = v50;
    objc_msgSend(v36, "enumerateAttributesInRange:options:usingBlock:", v16, v50, 0, v52);
    objc_msgSend(v35, "appendFormat:", CFSTR("</%@>"), v30);
    objc_msgSend(v35, "appendString:", CFSTR("\n"));
    v37 = v16 + v50;
    if (v37 >= objc_msgSend(v36, "length"))
    {
      v50 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      objc_msgSend(v36, "string");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v38, "paragraphRangeForRange:", v37, 0);
      v50 = v39;

    }
  }
  while (v16 != 0x7FFFFFFFFFFFFFFFLL);
  v5 = v45;
  if ((uint64_t)v20 >= 1)
  {
    v40 = v20 + 1;
    do
    {
      objc_msgSend(v19, "lastObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeLastObject");
      objc_msgSend(v35, "appendFormat:", CFSTR("</%@>\n"), v41);

      --v40;
    }
    while (v40 > 1);
  }
LABEL_27:
  v42 = v6;

LABEL_29:
  return v42;
}

+ (id)tagDictionaryForWrapperAroundParagraphStyle:()HTML
{
  id v3;
  void *v4;
  int v5;
  const __CFString *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "isList");

  if (v5)
    v6 = CFSTR("li");
  else
    v6 = CFSTR("div");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("TagName"));
  return v4;
}

+ (id)tagDictionariesForAttributes:()HTML attachmentConversionHandler:
{
  id v6;
  void (**v7)(id, void *, __CFString **, id *);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  id v37;
  id v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  const __CFString **v44;
  const __CFString **v45;
  void *v46;
  void (**v48)(id, void *, __CFString **, id *);
  id v49;
  __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if ((v10 & 1) != 0)
  {
    v69 = CFSTR("TagName");
    v70[0] = CFSTR("b");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  if ((v10 & 2) != 0)
  {
    v67 = CFSTR("TagName");
    v68 = CFSTR("i");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63948]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v65 = CFSTR("TagName");
    v66 = CFSTR("u");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63930]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v63 = CFSTR("TagName");
    v64 = CFSTR("strike");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63910]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v17, "fontName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    objc_msgSend(v17, "fontName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR(" face=\"%@\"), v21);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63920]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "isDefaultColor:", v23) & 1) == 0)
    {
      objc_msgSend(a1, "hexStringForColor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendFormat:", CFSTR(" color=\"#%@\"), v24);

    }
  }
  if (objc_msgSend(v18, "length"))
  {
    v61[0] = CFSTR("TagName");
    v61[1] = CFSTR("Attributes");
    v62[0] = CFSTR("font");
    v62[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v25);

  }
  objc_msgSend(v17, "pointSize");
  if (v26 > 0.0)
  {
    v59[1] = CFSTR("Attributes");
    v60[0] = CFSTR("span");
    v59[0] = CFSTR("TagName");
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "pointSize");
    objc_msgSend(v27, "stringWithFormat:", CFSTR(" style=\"font-size: %.0Fpx\"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v30);

  }
  v31 = (_QWORD *)MEMORY[0x1E0DC10F8];
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      objc_msgSend(v32, "attachmentIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      v50 = CFSTR("object");
      v48 = v7;
      v7[2](v7, v34, &v50, &v49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v50;
      v37 = v49;
      if (v35 && v36)
      {
        v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v36, CFSTR("TagName"));
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v35, CFSTR("Attributes"));
        if (v37)
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("TextContent"));
        objc_msgSend(v8, "addObject:", v38);

      }
      v7 = v48;
      v31 = (_QWORD *)MEMORY[0x1E0DC10F8];
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "style");
  if (v39)
  {
    v41 = v40;
    objc_msgSend(v6, "objectForKeyedSubscript:", *v31);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      switch(v41)
      {
        case 0:
          v57 = CFSTR("TagName");
          v58 = CFSTR("h1");
          v43 = (void *)MEMORY[0x1E0C99D80];
          v44 = &v58;
          v45 = &v57;
          goto LABEL_35;
        case 1:
          v55 = CFSTR("TagName");
          v56 = CFSTR("h2");
          v43 = (void *)MEMORY[0x1E0C99D80];
          v44 = &v56;
          v45 = &v55;
          goto LABEL_35;
        case 2:
          v53 = CFSTR("TagName");
          v54 = CFSTR("h3");
          v43 = (void *)MEMORY[0x1E0C99D80];
          v44 = &v54;
          v45 = &v53;
          goto LABEL_35;
        case 4:
          v51 = CFSTR("TagName");
          v52 = CFSTR("tt");
          v43 = (void *)MEMORY[0x1E0C99D80];
          v44 = &v52;
          v45 = &v51;
LABEL_35:
          objc_msgSend(v43, "dictionaryWithObjects:forKeys:count:", v44, v45, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v46);

          break;
        default:
          break;
      }
    }
  }

  return v8;
}

+ (BOOL)isDefaultColor:()HTML
{
  id v3;
  void *v4;
  char v5;
  _BOOL8 v6;
  const CGFloat *Components;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v3), "CGColor"));
    v6 = 0;
    if (*Components == 0.0 && Components[1] == 0.0)
      v6 = Components[2] == 0.0;
  }

  return v6;
}

+ (uint64_t)hexStringForColor:()HTML
{
  const CGFloat *Components;

  Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X%02X"), (int)(*Components * 255.0), (int)(Components[1] * 255.0), (int)(Components[2] * 255.0));
}

+ (void)mutableAttributedStringFromHTMLString:()HTML baseURL:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Couldn't convert the attributed string within the timeout window.", v1, 2u);
}

+ (void)mutableAttributedStringFromHTMLString:()HTML readerDelegate:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Error converting HTML to attributed string: %@", (uint8_t *)&v2, 0xCu);
}

@end
