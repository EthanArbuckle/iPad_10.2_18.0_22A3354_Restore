@implementation NSAttributedString(PXLocalization)

+ (id)px_localizedAttributedStringForUserPostWithPhotoCount:()PXLocalization videoCount:defaultTextAttributes:emphasizedTextAttributes:
{
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (a3 != 1 || a4)
  {
    if (a3 || a4 != 1)
    {
      if (a3 < 2 || a4)
      {
        v13 = a3 == 0;
        v14 = a4 > 1;
        if (v13 && v14)
          v12 = CFSTR("CLOUD_FEED_YOU_POSTED_N_VIDEOS_PHRASE_FORMAT");
        else
          v12 = CFSTR("CLOUD_FEED_YOU_POSTED_N_ITEMS_PHRASE_FORMAT");
        if (v13 && v14)
          v11 = CFSTR("CLOUD_FEED_YOU_POSTED_N_VIDEOS_SUBJECT");
        else
          v11 = CFSTR("CLOUD_FEED_YOU_POSTED_N_ITEMS_SUBJECT");
      }
      else
      {
        v11 = CFSTR("CLOUD_FEED_YOU_POSTED_N_PHOTOS_SUBJECT");
        v12 = CFSTR("CLOUD_FEED_YOU_POSTED_N_PHOTOS_PHRASE_FORMAT");
      }
    }
    else
    {
      v11 = CFSTR("CLOUD_FEED_YOU_POSTED_1_VIDEO_SUBJECT");
      v12 = CFSTR("CLOUD_FEED_YOU_POSTED_1_VIDEO_PHRASE_FORMAT");
    }
  }
  else
  {
    v11 = CFSTR("CLOUD_FEED_YOU_POSTED_1_PHOTO_SUBJECT");
    v12 = CFSTR("CLOUD_FEED_YOU_POSTED_1_PHOTO_PHRASE_FORMAT");
  }
  PXLocalizedStringFromTable(v12, CFSTR("PhotosUICore"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v16)
    v18 = v16;
  else
    v18 = &stru_1E5149688;
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v10);
  PXLocalizedStringFromInteger(a4 + a3);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = (void *)MEMORY[0x1E0CB3498];
  if (v15)
    v23 = v15;
  else
    v23 = &stru_1E5149688;
  v27[0] = v19;
  v27[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "px_stringWithFormat:defaultAttributes:arguments:", v23, v9, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)px_localizedAttributedStringForPostWithSubjectFullName:()PXLocalization photoCount:videoCount:defaultTextAttributes:emphasizedTextAttributes:
{
  __CFString *v11;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  if (a4 != 1 || a5)
  {
    if (a4 || a5 != 1)
    {
      if (a4 < 2 || a5)
      {
        if (a5 > 1 && a4 == 0)
          v14 = CFSTR("CLOUD_FEED_SOMEONE_POSTED_N_VIDEOS_PHRASE_FORMAT");
        else
          v14 = CFSTR("CLOUD_FEED_SOMEONE_POSTED_N_ITEMS_PHRASE_FORMAT");
      }
      else
      {
        v14 = CFSTR("CLOUD_FEED_SOMEONE_POSTED_N_PHOTOS_PHRASE_FORMAT");
      }
    }
    else
    {
      v14 = CFSTR("CLOUD_FEED_SOMEONE_POSTED_1_VIDEO_PHRASE_FORMAT");
    }
  }
  else
  {
    v14 = CFSTR("CLOUD_FEED_SOMEONE_POSTED_1_PHOTO_PHRASE_FORMAT");
  }
  PXLocalizedStringFromTable(v14, CFSTR("PhotosUICore"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v11)
    v18 = v11;
  else
    v18 = &stru_1E5149688;
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v13);
  PXLocalizedStringFromInteger(a5 + a4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = (void *)MEMORY[0x1E0CB3498];
  if (v16)
    v23 = v16;
  else
    v23 = &stru_1E5149688;
  v27[0] = v19;
  v27[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "px_stringWithFormat:defaultAttributes:arguments:", v23, v12, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)px_localizedAttributedStringForUserCommentWithText:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3500];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v12, "length"))
  {
    v13 = (__CFString *)v7;

    v12 = v13;
  }
  if (-[__CFString px_endsWithFullStopOrEquivalentPunctuationMark](v12, "px_endsWithFullStopOrEquivalentPunctuationMark"))v14 = CFSTR("CLOUD_FEED_YOU_SAID_SOMETHING_WITH_FULL_STOP_PHRASE_FORMAT");
  else
    v14 = CFSTR("CLOUD_FEED_YOU_SAID_SOMETHING_PHRASE_FORMAT");
  PXLocalizedStringFromTable(v14, CFSTR("PhotosUICore"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_SAID_SOMETHING_SUBJECT"), CFSTR("PhotosUICore"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v16)
    v18 = v16;
  else
    v18 = &stru_1E5149688;
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v9);

  v20 = (void *)MEMORY[0x1E0CB3498];
  if (v15)
    v21 = v15;
  else
    v21 = &stru_1E5149688;
  if (v12)
    v22 = v12;
  else
    v22 = &stru_1E5149688;
  v26[0] = v19;
  v26[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "px_stringWithFormat:defaultAttributes:arguments:", v21, v10, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)px_localizedAttributedStringForCommentWithCommenterFullName:()PXLocalization text:defaultTextAttributes:emphasizedTextAttributes:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  const __CFString *v25;

  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CB3500];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "whitespaceAndNewlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v14);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v15, "length"))
  {
    v16 = (__CFString *)v9;

    v15 = v16;
  }
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_SOMEONE_SAID_SOMETHING_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = &stru_1E5149688;
  if (v13)
    v20 = v13;
  else
    v20 = &stru_1E5149688;
  if (v15)
    v19 = v15;
  v24 = v20;
  v25 = v19;
  PXLocalizedStringWithValidatedFormat(v17, CFSTR("%@ %@"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v21, v12, v11, 0, v24, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)px_localizedAttributedStringForLikesFromUser:()PXLocalization otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  __CFString *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  id v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  id v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  id v58;
  const __CFString *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  __CFString *v70;
  __CFString *v71;
  id v72;
  id v73;
  const __CFString *v74;
  id v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  __CFString *v81;
  __CFString *v82;
  __CFString *v83;
  id v84;
  const __CFString *v85;
  void *v86;
  id v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id v110;
  id v111;
  _QWORD v112[2];
  _QWORD v113[2];
  __CFString *v114;
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[2];
  _QWORD v118[3];

  v118[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = objc_msgSend(v11, "count");
  if (a3)
  {
    if (v14 != 2)
    {
      v15 = v14 - 1;
      if (v14 == 1)
      {
        if (a5)
          v70 = CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_VIDEO_PHRASE_FORMAT");
        else
          v70 = CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_PHOTO_PHRASE_FORMAT");
        if (a5)
          v71 = CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_VIDEO_YOU_SUBJECT");
        else
          v71 = CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_PHOTO_YOU_SUBJECT");
        PXLocalizedStringFromTable(v70, CFSTR("PhotosUICore"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v71, CFSTR("PhotosUICore"));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v72 = objc_alloc(MEMORY[0x1E0CB3498]);
        v73 = v12;
        if (v19)
          v74 = v19;
        else
          v74 = &stru_1E5149688;
        v24 = (__CFString *)objc_msgSend(v72, "initWithString:attributes:", v74, v13);
        v75 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v11, "objectAtIndex:", 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v75, "initWithString:attributes:", v76, v13);

        v77 = (void *)MEMORY[0x1E0CB3498];
        if (v18)
          v78 = v18;
        else
          v78 = &stru_1E5149688;
        v117[0] = v24;
        v117[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "px_stringWithFormat:defaultAttributes:arguments:", v78, v73, v79);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v73;
        goto LABEL_74;
      }
      if (!v14)
      {
        if (a5)
          v16 = CFSTR("CLOUD_FEED_YOU_LIKED_THIS_VIDEO_PHRASE_FORMAT");
        else
          v16 = CFSTR("CLOUD_FEED_YOU_LIKED_THIS_PHOTO_PHRASE_FORMAT");
        if (a5)
          v17 = CFSTR("CLOUD_FEED_YOU_LIKED_THIS_VIDEO_SUBJECT");
        else
          v17 = CFSTR("CLOUD_FEED_YOU_LIKED_THIS_PHOTO_SUBJECT");
        PXLocalizedStringFromTable(v16, CFSTR("PhotosUICore"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v17, CFSTR("PhotosUICore"));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x1E0CB3498]);
        v21 = &stru_1E5149688;
        if (v19)
          v22 = v19;
        else
          v22 = &stru_1E5149688;
        v23 = objc_msgSend(v20, "initWithString:attributes:", v22, v13);
        v24 = (__CFString *)v23;
        v25 = (void *)MEMORY[0x1E0CB3498];
        if (v18)
          v21 = v18;
        v118[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "px_stringWithFormat:defaultAttributes:arguments:", v21, v12, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_74:

        goto LABEL_75;
      }
      if (v14 >= 3)
      {
        if (a5)
          v81 = CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT");
        else
          v81 = CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT");
        if (a5)
          v82 = CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_VIDEO_YOU_SUBJECT");
        else
          v82 = CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_PHOTO_YOU_SUBJECT");
        if (a5)
          v83 = CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_VIDEO_LIST_SEPARATOR");
        else
          v83 = CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_PHOTO_LIST_SEPARATOR");
        PXLocalizedStringFromTable(v81, CFSTR("PhotosUICore"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v82, CFSTR("PhotosUICore"));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v83, CFSTR("PhotosUICore"));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v84 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v19)
          v85 = v19;
        else
          v85 = &stru_1E5149688;
        v100 = (void *)objc_msgSend(v84, "initWithString:attributes:", v85, v13);
        v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E5149688);
        v87 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v24)
          v88 = v24;
        else
          v88 = &stru_1E5149688;
        v103 = v12;
        v89 = (void *)objc_msgSend(v87, "initWithString:attributes:", v88, v12);
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v15);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke;
        v108[3] = &unk_1E5148740;
        v109 = v86;
        v110 = v89;
        v91 = v13;
        v111 = v91;
        v99 = v89;
        v92 = v86;
        objc_msgSend(v11, "enumerateObjectsAtIndexes:options:usingBlock:", v90, 0, v108);

        v93 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v11, "lastObject");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = (void *)objc_msgSend(v93, "initWithString:attributes:", v94, v91);

        v96 = (void *)MEMORY[0x1E0CB3498];
        if (v18)
          v97 = v18;
        else
          v97 = &stru_1E5149688;
        v115[0] = v100;
        v115[1] = v92;
        v115[2] = v95;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 3);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "px_stringWithFormat:defaultAttributes:arguments:", v97, v103, v98);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v103;
        goto LABEL_75;
      }
LABEL_97:
      v27 = 0;
      goto LABEL_76;
    }
    if (a5)
      v56 = CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT");
    else
      v56 = CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT");
    if (a5)
      v57 = CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_VIDEO_YOU_SUBJECT");
    else
      v57 = CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_PHOTO_YOU_SUBJECT");
    PXLocalizedStringFromTable(v56, CFSTR("PhotosUICore"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v57, CFSTR("PhotosUICore"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v58 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v19)
      v59 = v19;
    else
      v59 = &stru_1E5149688;
    v24 = (__CFString *)objc_msgSend(v58, "initWithString:attributes:", v59, v13);
    v60 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v11, "objectAtIndex:", 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (id)objc_msgSend(v60, "initWithString:attributes:", v61, v13);

    v62 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v11, "objectAtIndex:", 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "initWithString:attributes:", v63, v13);
    v102 = v13;
    v65 = v12;
    v66 = (void *)v64;

    v67 = (void *)MEMORY[0x1E0CB3498];
    if (v18)
      v68 = v18;
    else
      v68 = &stru_1E5149688;
    v116[0] = v24;
    v116[1] = v41;
    v116[2] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 3);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "px_stringWithFormat:defaultAttributes:arguments:", v68, v65, v69);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v65;
    v13 = v102;
  }
  else if (v14 == 2)
  {
    if (a5)
      v34 = CFSTR("CLOUD_FEED_TWO_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT");
    else
      v34 = CFSTR("CLOUD_FEED_TWO_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT");
    PXLocalizedStringFromTable(v34, CFSTR("PhotosUICore"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v11, "objectAtIndex:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (__CFString *)objc_msgSend(v35, "initWithString:attributes:", v36, v13);

    v37 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v11, "objectAtIndex:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (__CFString *)objc_msgSend(v37, "initWithString:attributes:", v38, v13);

    v39 = (void *)MEMORY[0x1E0CB3498];
    if (v18)
      v40 = v18;
    else
      v40 = &stru_1E5149688;
    v113[0] = v19;
    v113[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "px_stringWithFormat:defaultAttributes:arguments:", v40, v12, v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = v14 - 1;
    if (v14 == 1)
    {
      if (a5)
        v29 = CFSTR("CLOUD_FEED_SOMEONE_LIKED_THIS_VIDEO_PHRASE_FORMAT");
      else
        v29 = CFSTR("CLOUD_FEED_SOMEONE_LIKED_THIS_PHOTO_PHRASE_FORMAT");
      PXLocalizedStringFromTable(v29, CFSTR("PhotosUICore"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v11, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (__CFString *)objc_msgSend(v30, "initWithString:attributes:", v31, v13);

      v32 = (void *)MEMORY[0x1E0CB3498];
      if (v18)
        v33 = v18;
      else
        v33 = &stru_1E5149688;
      v114 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "px_stringWithFormat:defaultAttributes:arguments:", v33, v12, v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_75;
    }
    if (v14 < 3)
      goto LABEL_97;
    if (a5)
      v42 = CFSTR("CLOUD_FEED_MORE_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT");
    else
      v42 = CFSTR("CLOUD_FEED_MORE_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT");
    if (a5)
      v43 = CFSTR("CLOUD_FEED_MORE_PERSONS_LIKED_THIS_VIDEO_LIST_SEPARATOR");
    else
      v43 = CFSTR("CLOUD_FEED_MORE_PERSONS_LIKED_THIS_PHOTO_LIST_SEPARATOR");
    PXLocalizedStringFromTable(v42, CFSTR("PhotosUICore"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v43, CFSTR("PhotosUICore"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:");
    v45 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v19)
      v46 = v19;
    else
      v46 = &stru_1E5149688;
    v47 = (void *)objc_msgSend(v45, "initWithString:attributes:", v46, v12);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v28);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2;
    v104[3] = &unk_1E5148740;
    v105 = v44;
    v106 = v47;
    v101 = v12;
    v49 = v13;
    v107 = v49;
    v41 = v47;
    v24 = v44;
    objc_msgSend(v11, "enumerateObjectsAtIndexes:options:usingBlock:", v48, 0, v104);

    v50 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v11, "lastObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v50, "initWithString:attributes:", v51, v49);

    v53 = (void *)MEMORY[0x1E0CB3498];
    if (v18)
      v54 = v18;
    else
      v54 = &stru_1E5149688;
    v112[0] = v24;
    v112[1] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "px_stringWithFormat:defaultAttributes:arguments:", v54, v101, v55);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v101;
  }

LABEL_75:
LABEL_76:

  return v27;
}

+ (id)px_localizedAttributedStringForLikesFromUser:()PXLocalization orPersonFullName:photoCount:videoCount:streamName:defaultTextAttributes:emphasizedTextAttributes:italicizedTextAttributes:
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  const __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v37;
  __CFString *v38;

  v15 = a4;
  v16 = a10;
  v17 = a9;
  v18 = a8;
  objc_msgSend(a7, "px_stringConvertedToHTMLString");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (__CFString *)v19;
  else
    v21 = &stru_1E5149688;
  v22 = v21;

  v23 = (__CFString *)(a6 + a5);
  v24 = a5 > 0;
  v25 = a5 == 0;
  if (a6)
    v24 = 0;
  if (a6 <= 0)
    v25 = 0;
  if (a3)
  {
    if (v25)
      v26 = CFSTR("CLOUD_FEED_YOU_LIKED_THESE_N_VIDEOS_IN_STREAM_NAMED_HTML_FORMAT");
    else
      v26 = CFSTR("CLOUD_FEED_YOU_LIKED_THESE_N_ITEMS_IN_STREAM_NAMED_HTML_FORMAT");
    if (v24)
      v27 = CFSTR("CLOUD_FEED_YOU_LIKED_THESE_N_PHOTOS_IN_STREAM_NAMED_HTML_FORMAT");
    else
      v27 = (__CFString *)v26;
    PXLocalizedStringFromTable(v27, CFSTR("PhotosUICore"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v23;
    v38 = v22;
    PXLocalizedStringWithValidatedFormat(v28, CFSTR("%lu %@"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v25)
      v30 = CFSTR("CLOUD_FEED_SOMEONE_LIKED_THESE_N_VIDEOS_IN_STREAM_NAMED_HTML_FORMAT");
    else
      v30 = CFSTR("CLOUD_FEED_SOMEONE_LIKED_THESE_N_ITEMS_IN_STREAM_NAMED_HTML_FORMAT");
    if (v24)
      v31 = CFSTR("CLOUD_FEED_SOMEONE_LIKED_THESE_N_PHOTOS_IN_STREAM_NAMED_HTML_FORMAT");
    else
      v31 = (__CFString *)v30;
    PXLocalizedStringFromTable(v31, CFSTR("PhotosUICore"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_stringConvertedToHTMLString");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = (const __CFString *)v32;
    else
      v34 = &stru_1E5149688;
    v38 = v23;
    v37 = v34;
    PXLocalizedStringWithValidatedFormat(v28, CFSTR("%@ %lu %@"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v29, v18, v17, v16, v37, v38);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)px_localizedAttributedStringForLikesWithLikerCount:()PXLocalization isVideo:defaultTextAttributes:emphasizedTextAttributes:
{
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  if (a4)
    v11 = CFSTR("CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_VIDEO_PHRASE_FORMAT");
  else
    v11 = CFSTR("CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_PHOTO_PHRASE_FORMAT");
  if (a4)
    v12 = CFSTR("CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_VIDEO_SUBJECT");
  else
    v12 = CFSTR("CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_PHOTO_SUBJECT");
  PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v12, CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromInteger(a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v9, v15);

  v18 = (void *)MEMORY[0x1E0CB3498];
  if (v13)
    v19 = v13;
  else
    v19 = &stru_1E5149688;
  v23[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "px_stringWithFormat:defaultAttributes:arguments:", v19, v10, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)px_localizedAttributedStringForUserJoiningStreamWithName:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_JOINED_STREAM_NAMED_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_JOINED_STREAM_NAMED_SUBJECT"), CFSTR("PhotosUICore"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v11)
    v13 = v11;
  else
    v13 = &stru_1E5149688;
  v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v7);

  v15 = (void *)MEMORY[0x1E0CB3498];
  if (v10)
    v16 = v10;
  else
    v16 = &stru_1E5149688;
  if (v9)
    v17 = v9;
  else
    v17 = &stru_1E5149688;
  v21[0] = v14;
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "px_stringWithFormat:defaultAttributes:arguments:", v16, v8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)px_localizedAttributedStringForUserJoiningSharedAlbumWithName:()PXLocalization defaultTextAttributes:posterTextAttributes:albumTextAttributes:
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_JOINED_STREAM_NAMED_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_JOINED_STREAM_NAMED_SUBJECT"), CFSTR("PhotosUICore"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v14)
    v16 = v14;
  else
    v16 = &stru_1E5149688;
  v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v10);

  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v12)
    v19 = v12;
  else
    v19 = &stru_1E5149688;
  v20 = (__CFString *)objc_msgSend(v18, "initWithString:attributes:", v19, v9);

  v21 = (void *)MEMORY[0x1E0CB3498];
  if (v13)
    v22 = v13;
  else
    v22 = &stru_1E5149688;
  if (v20)
    v23 = v20;
  else
    v23 = &stru_1E5149688;
  v27[0] = v17;
  v27[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "px_stringWithFormat:defaultAttributes:arguments:", v22, v11, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:()PXLocalization streamName:accepted:defaultTextAttributes:emphasizedTextAttributes:streamNameAttributes:
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v13 = (objc_class *)MEMORY[0x1E0CB3498];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  v19 = [v13 alloc];
  if (v18)
    v20 = v18;
  else
    v20 = &stru_1E5149688;
  v21 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v15);

  v22 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v17)
    v23 = v17;
  else
    v23 = &stru_1E5149688;
  v24 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v14);

  if (a5)
    v25 = CFSTR("CLOUD_FEED_SOMEONE_JOINED_STREAM_NAMED_PHRASE_FORMAT");
  else
    v25 = CFSTR("CLOUD_FEED_SOMEONE_DECLINED_TO_JOIN_STREAM_NAMED_PHRASE_FORMAT");
  PXLocalizedStringFromTable(v25, CFSTR("PhotosUICore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0CB3498];
  v31[0] = v21;
  v31[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "px_stringWithFormat:defaultAttributes:arguments:", v26, v16, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:()PXLocalization sharedAlbumName:accepted:defaultTextAttributes:posterTextAttributes:albumTextAttributes:
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  const __CFString *v25;
  __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v13 = (objc_class *)MEMORY[0x1E0CB3498];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  v19 = [v13 alloc];
  if (v18)
    v20 = v18;
  else
    v20 = &stru_1E5149688;
  v21 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v15);

  if (a5)
    v22 = CFSTR("CLOUD_FEED_SOMEONE_JOINED_STREAM_NAMED_PHRASE_FORMAT");
  else
    v22 = CFSTR("CLOUD_FEED_SOMEONE_DECLINED_TO_JOIN_STREAM_NAMED_PHRASE_FORMAT");
  PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v17)
    v25 = v17;
  else
    v25 = &stru_1E5149688;
  v26 = (__CFString *)objc_msgSend(v24, "initWithString:attributes:", v25, v14);

  v27 = (void *)MEMORY[0x1E0CB3498];
  if (v26)
    v28 = v26;
  else
    v28 = &stru_1E5149688;
  v32[0] = v21;
  v32[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "px_stringWithFormat:defaultAttributes:arguments:", v23, v16, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)px_localizedAttributedStringForUserCreatingStreamWithName:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_CREATED_STREAM_NAMED_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_CREATED_STREAM_NAMED_SUBJECT"), CFSTR("PhotosUICore"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v11)
    v13 = v11;
  else
    v13 = &stru_1E5149688;
  v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v7);

  v15 = (void *)MEMORY[0x1E0CB3498];
  if (v10)
    v16 = v10;
  else
    v16 = &stru_1E5149688;
  if (v9)
    v17 = v9;
  else
    v17 = &stru_1E5149688;
  v21[0] = v14;
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "px_stringWithFormat:defaultAttributes:arguments:", v16, v8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)px_localizedAttributedStringForUserCreatingSharedAlbumWithName:()PXLocalization defaultTextAttributes:posterTextAttributes:albumTextAttributes:
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_CREATED_STREAM_NAMED_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_CREATED_STREAM_NAMED_SUBJECT"), CFSTR("PhotosUICore"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v14)
    v16 = v14;
  else
    v16 = &stru_1E5149688;
  v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v10);

  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v12)
    v19 = v12;
  else
    v19 = &stru_1E5149688;
  v20 = (__CFString *)objc_msgSend(v18, "initWithString:attributes:", v19, v9);

  v21 = (void *)MEMORY[0x1E0CB3498];
  if (v13)
    v22 = v13;
  else
    v22 = &stru_1E5149688;
  if (v20)
    v23 = v20;
  else
    v23 = &stru_1E5149688;
  v27[0] = v17;
  v27[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "px_stringWithFormat:defaultAttributes:arguments:", v22, v11, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (uint64_t)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization defaultTextAttributes:subjectName:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserPostWithCountsSet:subjectName:defaultTextAttributes:posterTextAttributes:", a3, a5, a4, 0);
}

+ (uint64_t)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization subjectName:defaultTextAttributes:posterTextAttributes:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserPostWithCountsSet:subjectName:captionText:defaultTextAttributes:posterTextAttributes:captionTextAttributes:", a3, a4, 0, a5, a6, 0);
}

+ (id)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization subjectName:captionText:defaultTextAttributes:posterTextAttributes:captionTextAttributes:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  const __CFString *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v45 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = objc_msgSend(v13, "count");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v19 = v13;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = v14;
    v23 = v17;
    v24 = v16;
    v25 = v15;
    v26 = 0;
    v27 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v47 != v27)
          objc_enumerationMutation(v19);
        v26 += objc_msgSend(v19, "countForObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v21);
    v15 = v25;
    v16 = v24;
    v17 = v23;
    v14 = v22;
  }
  else
  {
    v26 = 0;
  }

  if (v18 == 1)
  {
    objc_msgSend(v19, "anyObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerValue");

    v31 = v45;
    switch(v30)
    {
      case 0:
        v32 = CFSTR("ICLOUD_SOMEONE_SHARED_ITEM");
        v33 = CFSTR("ICLOUD_YOU_SHARED_ITEM");
        goto LABEL_24;
      case 1:
        v32 = CFSTR("ICLOUD_SOMEONE_SHARED_PHOTO");
        v33 = CFSTR("ICLOUD_YOU_SHARED_PHOTO");
        goto LABEL_24;
      case 2:
        v32 = CFSTR("ICLOUD_SOMEONE_SHARED_VIDEO");
        v33 = CFSTR("ICLOUD_YOU_SHARED_VIDEO");
        goto LABEL_24;
      case 3:
        v32 = CFSTR("ICLOUD_SOMEONE_SHARED_BOUNCE");
        v33 = CFSTR("ICLOUD_YOU_SHARED_BOUNCE");
        goto LABEL_24;
      case 4:
        v32 = CFSTR("ICLOUD_SOMEONE_SHARED_LOOP");
        v33 = CFSTR("ICLOUD_YOU_SHARED_LOOP");
        goto LABEL_24;
      case 5:
        v32 = CFSTR("ICLOUD_SOMEONE_SHARED_LONGEXP");
        v33 = CFSTR("ICLOUD_YOU_SHARED_LONGEXP");
        goto LABEL_24;
      case 6:
        v32 = CFSTR("ICLOUD_SOMEONE_SHARED_GIF");
        v33 = CFSTR("ICLOUD_YOU_SHARED_GIF");
LABEL_24:
        if (!v14)
          v32 = (__CFString *)v33;
        goto LABEL_26;
      default:
        v34 = 0;
        if (v45)
          goto LABEL_27;
        goto LABEL_28;
    }
  }
  v32 = CFSTR("ICLOUD_SOMEONE_SHARED_ITEM");
  if (!v14)
    v32 = CFSTR("ICLOUD_YOU_SHARED_ITEM");
  v31 = v45;
LABEL_26:
  v34 = v32;
  if (v31)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CAPTION"), v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v34 = (__CFString *)v35;
  }
LABEL_28:
  PXLocalizedStringFromTable(v34, CFSTR("PhotosUICore"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v14)
  {
    objc_msgSend(v14, "px_stringConvertedToHTMLString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v38;
    if (v31)
      v39 = CFSTR("%@ %d %@");
    else
      v39 = CFSTR("%@ %d");
    PXLocalizedStringWithValidatedFormat(v37, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = v26;
    if (v31)
      v40 = CFSTR("%d %@");
    else
      v40 = CFSTR("%d");
    PXLocalizedStringWithValidatedFormat(v36, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
  }

  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v41, v15, v16, v17, v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

+ (id)px_localizedAttributedStringForPostAttributionOfAssetWithDisplayType:()PXLocalization postedByUserOrSubjectWithFullName:atDate:nameAttributes:dateAttributes:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v36 = v13;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXLocalization.m"), 1038, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v17 = v16;
      if (v13)
      {
        v18 = CFSTR("PHOTO_POSTED_BY_SOMEONE");
        goto LABEL_16;
      }
      v22 = CFSTR("PHOTO_POSTED_BY_YOU");
      goto LABEL_24;
    case 2:
      v17 = v16;
      if (v13)
      {
        v18 = CFSTR("VIDEO_POSTED_BY_SOMEONE");
        goto LABEL_16;
      }
      v22 = CFSTR("VIDEO_POSTED_BY_YOU");
      goto LABEL_24;
    case 3:
      v17 = v16;
      if (v13)
      {
        v18 = CFSTR("BOUNCE_POSTED_BY_SOMEONE");
        goto LABEL_16;
      }
      v22 = CFSTR("BOUNCE_POSTED_BY_YOU");
      goto LABEL_24;
    case 4:
      v17 = v16;
      if (v13)
      {
        v18 = CFSTR("LOOP_POSTED_BY_SOMEONE");
        goto LABEL_16;
      }
      v22 = CFSTR("LOOP_POSTED_BY_YOU");
      goto LABEL_24;
    case 5:
      v17 = v16;
      if (v13)
      {
        v18 = CFSTR("LONGEXP_POSTED_BY_SOMEONE");
        goto LABEL_16;
      }
      v22 = CFSTR("LONGEXP_POSTED_BY_YOU");
      goto LABEL_24;
    case 6:
      v17 = v16;
      if (v13)
      {
        v18 = CFSTR("GIF_POSTED_BY_SOMEONE");
LABEL_16:
        PXLocalizedStringFromTable(v18, CFSTR("PhotosUICore"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
        PXStringWithValidatedFormat();
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = CFSTR("GIF_POSTED_BY_YOU");
LABEL_24:
        PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
        v21 = v19;
        v20 = v21;
      }
      v23 = v21;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v21, v15);
      PLRelativePrettyDateForDate();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v14;
      v27 = (void *)v25;
      v28 = &stru_1E5149688;
      if (v25)
        v28 = (__CFString *)v25;
      v29 = v28;

      v30 = (void *)MEMORY[0x1E0CB3498];
      PXLocalizedStringFromTable(CFSTR("POSTED_BY_ON_DATE"), CFSTR("PhotosUICore"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v24;
      v37[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "px_stringWithFormat:defaultAttributes:arguments:", v31, v17, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      return v33;
    default:
      v17 = v16;
      v19 = 0;
      v20 = 0;
      if (!v13)
        goto LABEL_25;
      goto LABEL_17;
  }
}

+ (id)px_localizedAttributedStringForInboxCoalescedCommentsFromUser:()PXLocalization otherPeopleFullNames:defaultTextAttributes:emphasizedTextAttributes:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  const __CFString *v17;
  __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  id v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  id v51;
  const __CFString *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  id v63;
  const __CFString *v64;
  void *v65;
  id v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  _QWORD v91[2];
  _QWORD v92[2];
  __CFString *v93;
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[4];

  v96[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "count");
  if (!a3)
  {
    if (v12 == 2)
    {
      PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_TWO_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v9, "objectAtIndex:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (__CFString *)objc_msgSend(v31, "initWithString:attributes:", v32, v11);

      v33 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v9, "objectAtIndex:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (__CFString *)objc_msgSend(v33, "initWithString:attributes:", v34, v11);

      v35 = (void *)MEMORY[0x1E0CB3498];
      if (v14)
        v36 = v14;
      else
        v36 = &stru_1E5149688;
      v92[0] = v15;
      v92[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "px_stringWithFormat:defaultAttributes:arguments:", v36, v10, v37);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = v12 - 1;
      if (v12 == 1)
      {
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_ONE_PERSON_COALESCED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v27 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v9, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (__CFString *)objc_msgSend(v27, "initWithString:attributes:", v28, v11);

        v29 = (void *)MEMORY[0x1E0CB3498];
        if (v14)
          v30 = v14;
        else
          v30 = &stru_1E5149688;
        v93 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "px_stringWithFormat:defaultAttributes:arguments:", v30, v10, v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      if (v12 < 3)
        goto LABEL_30;
      PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MORE_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MORE_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_LIST_SEPARATOR"), CFSTR("PhotosUICore"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:");
      v39 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (v15)
        v40 = v15;
      else
        v40 = &stru_1E5149688;
      v41 = (void *)objc_msgSend(v39, "initWithString:attributes:", v40, v10);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v26);
      v82 = v10;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __168__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2;
      v83[3] = &unk_1E5148740;
      v84 = v38;
      v85 = v41;
      v43 = v11;
      v86 = v43;
      v37 = v41;
      v18 = v38;
      objc_msgSend(v9, "enumerateObjectsAtIndexes:options:usingBlock:", v42, 0, v83);

      v44 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v9, "lastObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v44, "initWithString:attributes:", v45, v43);

      v47 = (void *)MEMORY[0x1E0CB3498];
      if (v14)
        v48 = v14;
      else
        v48 = &stru_1E5149688;
      v91[0] = v18;
      v91[1] = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v47;
      v10 = v82;
      objc_msgSend(v50, "px_stringWithFormat:defaultAttributes:arguments:", v48, v82, v49);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  if (v12)
  {
    v81 = v10;
    if (v12 != 2)
    {
      v13 = v12 - 1;
      if (v12 == 1)
      {
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_COALESCED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_COALESCED_COMMENTED_THIS_PHOTO_YOU_SUBJECT"), CFSTR("PhotosUICore"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v15)
          v17 = v15;
        else
          v17 = &stru_1E5149688;
        v18 = (__CFString *)objc_msgSend(v16, "initWithString:attributes:", v17, v11);
        v19 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v9, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v11);

        v22 = (void *)MEMORY[0x1E0CB3498];
        if (v14)
          v23 = v14;
        else
          v23 = &stru_1E5149688;
        v96[0] = v18;
        v96[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "px_stringWithFormat:defaultAttributes:arguments:", v23, v81, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v81;
      }
      else
      {
        if (v12 < 3)
        {
          v25 = 0;
          v10 = v81;
          goto LABEL_40;
        }
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_YOU_SUBJECT"), CFSTR("PhotosUICore"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_LIST_SEPARATOR"), CFSTR("PhotosUICore"));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v63 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v15)
          v64 = v15;
        else
          v64 = &stru_1E5149688;
        v80 = (void *)objc_msgSend(v63, "initWithString:attributes:", v64, v11);
        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E5149688);
        v66 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v18)
          v67 = v18;
        else
          v67 = &stru_1E5149688;
        v68 = (void *)objc_msgSend(v66, "initWithString:attributes:", v67, v81);
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v13);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __168__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke;
        v87[3] = &unk_1E5148740;
        v88 = v65;
        v89 = v68;
        v70 = v11;
        v90 = v70;
        v78 = v68;
        v71 = v65;
        objc_msgSend(v9, "enumerateObjectsAtIndexes:options:usingBlock:", v69, 0, v87);

        v72 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v9, "lastObject");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)objc_msgSend(v72, "initWithString:attributes:", v73, v70);

        v75 = (void *)MEMORY[0x1E0CB3498];
        if (v14)
          v76 = v14;
        else
          v76 = &stru_1E5149688;
        v94[0] = v80;
        v94[1] = v71;
        v94[2] = v74;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 3, v78);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "px_stringWithFormat:defaultAttributes:arguments:", v76, v81, v77);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v81;
      }
      goto LABEL_39;
    }
    PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_COALESCED_COMMENTED_THIS_PHOTO_YOU_SUBJECT"), CFSTR("PhotosUICore"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v15)
      v52 = v15;
    else
      v52 = &stru_1E5149688;
    v18 = (__CFString *)objc_msgSend(v51, "initWithString:attributes:", v52, v11);
    v53 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "objectAtIndex:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v53, "initWithString:attributes:", v54, v11);

    v55 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "objectAtIndex:", 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v55, "initWithString:attributes:", v56, v11);

    v58 = (void *)MEMORY[0x1E0CB3498];
    if (v14)
      v59 = v14;
    else
      v59 = &stru_1E5149688;
    v95[0] = v18;
    v95[1] = v37;
    v95[2] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v59;
    v10 = v81;
    objc_msgSend(v58, "px_stringWithFormat:defaultAttributes:arguments:", v61, v81, v60);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
LABEL_30:
  v25 = 0;
LABEL_40:

  return v25;
}

+ (id)px_localizedAttributedStringForInboxCoalescedCommentsWithCommenterCount:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MANY_PEOPLE_COALESCED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MANY_PEOPLE_COALESCED_COMMENTED_THIS_PHOTO_SUBJECT"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromInteger(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, v7, v11);

  v14 = (void *)MEMORY[0x1E0CB3498];
  if (v9)
    v15 = v9;
  else
    v15 = &stru_1E5149688;
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "px_stringWithFormat:defaultAttributes:arguments:", v15, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)px_localizedAttributedStringForInboxCoalescedLikesAndCommentsFromUser:()PXLocalization otherPeopleFullNames:defaultTextAttributes:emphasizedTextAttributes:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  id v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  const __CFString *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  id v61;
  const __CFString *v62;
  void *v63;
  id v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  id v77;
  id v78;
  __CFString *v79;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  _QWORD v85[4];
  void *v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[4];

  v97[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "count");
  if (!a3)
  {
    v28 = v12 - 1;
    if (v12 != 1)
    {
      if (v12 == 2)
      {
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_TWO_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v9, "objectAtIndex:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (__CFString *)objc_msgSend(v29, "initWithString:attributes:", v30, v11);

        v31 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v9, "objectAtIndex:", 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (__CFString *)objc_msgSend(v31, "initWithString:attributes:", v32, v11);

        v33 = (void *)MEMORY[0x1E0CB3498];
        if (v26)
          v34 = v26;
        else
          v34 = &stru_1E5149688;
        v94[0] = v15;
        v94[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "px_stringWithFormat:defaultAttributes:arguments:", v34, v10, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_45;
      }
      if (v12 >= 3)
      {
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MORE_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
        v82 = objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MORE_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_LIST_SEPARATOR"), CFSTR("PhotosUICore"));
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:");
        v37 = objc_alloc(MEMORY[0x1E0CB3498]);
        v79 = (__CFString *)v35;
        if (v35)
          v38 = (const __CFString *)v35;
        else
          v38 = &stru_1E5149688;
        v39 = (void *)objc_msgSend(v37, "initWithString:attributes:", v38, v10);
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v28);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __176__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedLikesAndCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2;
        v85[3] = &unk_1E5148740;
        v86 = v36;
        v87 = v39;
        v41 = v11;
        v88 = v41;
        v22 = v39;
        v19 = v36;
        objc_msgSend(v9, "enumerateObjectsAtIndexes:options:usingBlock:", v40, 0, v85);

        v42 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v9, "lastObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v42, "initWithString:attributes:", v43, v41);

        v45 = (void *)MEMORY[0x1E0CB3498];
        v26 = (__CFString *)v82;
        if (v82)
          v46 = (const __CFString *)v82;
        else
          v46 = &stru_1E5149688;
        v93[0] = v19;
        v93[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v45;
        v15 = v79;
        objc_msgSend(v48, "px_stringWithFormat:defaultAttributes:arguments:", v46, v10, v47);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = v86;
        goto LABEL_44;
      }
    }
LABEL_46:
    v27 = 0;
    goto LABEL_47;
  }
  if (!v12)
    goto LABEL_46;
  if (v12 == 2)
  {
    PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
    v83 = v10;
    v50 = objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_TWO_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_YOU_SUBJECT"), CFSTR("PhotosUICore"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v15)
      v52 = v15;
    else
      v52 = &stru_1E5149688;
    v19 = (__CFString *)objc_msgSend(v51, "initWithString:attributes:", v52, v11);
    v53 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "objectAtIndex:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v53, "initWithString:attributes:", v54, v11);

    v55 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "objectAtIndex:", 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v55, "initWithString:attributes:", v56, v11);

    v57 = (void *)MEMORY[0x1E0CB3498];
    if (v50)
      v58 = (const __CFString *)v50;
    else
      v58 = &stru_1E5149688;
    v96[0] = v19;
    v96[1] = v22;
    v96[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v58;
    v26 = (__CFString *)v50;
    v10 = v83;
    objc_msgSend(v57, "px_stringWithFormat:defaultAttributes:arguments:", v60, v83, v59);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  v13 = v12 - 1;
  if (v12 != 1)
  {
    if (v12 >= 3)
    {
      PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
      v84 = objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_YOU_SUBJECT"), CFSTR("PhotosUICore"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_MORE_PERSONS_COALESCED_LIKED_COMMENTED_THIS_PHOTO_LIST_SEPARATOR"), CFSTR("PhotosUICore"));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v61 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (v15)
        v62 = v15;
      else
        v62 = &stru_1E5149688;
      v22 = (id)objc_msgSend(v61, "initWithString:attributes:", v62, v11);
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E5149688);
      v64 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (v19)
        v65 = v19;
      else
        v65 = &stru_1E5149688;
      v66 = (void *)objc_msgSend(v64, "initWithString:attributes:", v65, v10);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v13);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __176__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedLikesAndCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke;
      v89[3] = &unk_1E5148740;
      v90 = v63;
      v91 = v66;
      v68 = v11;
      v92 = v68;
      v80 = v66;
      v69 = v63;
      v78 = v69;
      objc_msgSend(v9, "enumerateObjectsAtIndexes:options:usingBlock:", v67, 0, v89);

      v70 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v9, "lastObject");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)objc_msgSend(v70, "initWithString:attributes:", v71, v68);

      if (v84)
        v73 = (const __CFString *)v84;
      else
        v73 = &stru_1E5149688;
      v95[0] = v22;
      v95[1] = v69;
      v95[2] = v72;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3, MEMORY[0x1E0CB3498]);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v73;
      v26 = (__CFString *)v84;
      objc_msgSend(v77, "px_stringWithFormat:defaultAttributes:arguments:", v75, v10, v74);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = v78;
LABEL_44:

      goto LABEL_45;
    }
    goto LABEL_46;
  }
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_COALESCED_LIKED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v81 = v10;
  v14 = objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_YOU_AND_ONE_PERSON_COALESCED_LIKED_COMMENTED_THIS_PHOTO_YOU_SUBJECT"), CFSTR("PhotosUICore"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  v17 = &stru_1E5149688;
  if (v15)
    v18 = v15;
  else
    v18 = &stru_1E5149688;
  v19 = (__CFString *)objc_msgSend(v16, "initWithString:attributes:", v18, v11);
  v20 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v9, "objectAtIndex:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v20, "initWithString:attributes:", v21, v11);

  v23 = (void *)MEMORY[0x1E0CB3498];
  if (v14)
    v17 = (const __CFString *)v14;
  v97[0] = v19;
  v97[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  v26 = (__CFString *)v14;
  v10 = v81;
  objc_msgSend(v23, "px_stringWithFormat:defaultAttributes:arguments:", v25, v81, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

LABEL_45:
LABEL_47:

  return v27;
}

+ (id)px_localizedAttributedStringForInboxCoalescedLikesAndCommentsWithCommenterCount:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MANY_PEOPLE_COALESCED_LIKED_COMMENTED_THIS_PHOTO_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_MANY_PEOPLE_COALESCED_LIKED_COMMENTED_THIS_PHOTO_SUBJECT"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromInteger(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, v7, v11);

  v14 = (void *)MEMORY[0x1E0CB3498];
  if (v9)
    v15 = v9;
  else
    v15 = &stru_1E5149688;
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "px_stringWithFormat:defaultAttributes:arguments:", v15, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)px_localizedAttributedStringForUserInvitedToStreamWithName:()PXLocalization inviterName:defaultTextAttributes:emphasizedTextAttributes:
{
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  PXLocalizedStringFromTable(CFSTR("CLOUD_FEED_INBOX_INVITATION_PHRASE_FORMAT"), CFSTR("PhotosUICore"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v12)
    v15 = v12;
  else
    v15 = &stru_1E5149688;
  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v9);

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v11)
    v18 = v11;
  else
    v18 = &stru_1E5149688;
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v9);

  v20 = (void *)MEMORY[0x1E0CB3498];
  if (v13)
    v21 = v13;
  else
    v21 = &stru_1E5149688;
  v25[0] = v19;
  v25[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "px_stringWithFormat:defaultAttributes:arguments:", v21, v10, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
