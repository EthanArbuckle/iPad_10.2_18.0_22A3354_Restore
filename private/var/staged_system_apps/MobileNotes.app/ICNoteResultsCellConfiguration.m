@implementation ICNoteResultsCellConfiguration

+ (NSManagedObjectContext)legacyBackgroundContext
{
  if (qword_1005DDF60 != -1)
    dispatch_once(&qword_1005DDF60, &stru_1005543C0);
  return (NSManagedObjectContext *)(id)qword_1005DDF68;
}

+ (NSManagedObjectContext)modernBackgroundContext
{
  if (qword_1005DDF70 != -1)
    dispatch_once(&qword_1005DDF70, &stru_1005543E0);
  return (NSManagedObjectContext *)(id)qword_1005DDF78;
}

+ (OS_dispatch_queue)loadDataQueue
{
  if (qword_1005DDF80 != -1)
    dispatch_once(&qword_1005DDF80, &stru_100554400);
  return (OS_dispatch_queue *)(id)qword_1005DDF88;
}

- (ICNoteResultsCellConfiguration)initWithNote:(id)a3
{
  id v5;
  ICNoteResultsCellConfiguration *v6;
  ICNoteResultsCellConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICNoteResultsCellConfiguration;
  v6 = -[ICNoteResultsCellConfiguration init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_note, a3);
    -[ICNoteResultsCellConfiguration commonInit](v7, "commonInit");
  }

  return v7;
}

- (ICNoteResultsCellConfiguration)initWithSearchResult:(id)a3
{
  id v5;
  ICNoteResultsCellConfiguration *v6;
  ICNoteResultsCellConfiguration *v7;
  uint64_t v8;
  ICSearchIndexableNote *note;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteResultsCellConfiguration;
  v6 = -[ICNoteResultsCellConfiguration init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchResult, a3);
    v7->_showFolderName = 1;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));
    note = v7->_note;
    v7->_note = (ICSearchIndexableNote *)v8;

    -[ICNoteResultsCellConfiguration commonInit](v7, "commonInit");
  }

  return v7;
}

- (ICNoteResultsCellConfiguration)initWithInvitation:(id)a3
{
  id v5;
  ICNoteResultsCellConfiguration *v6;
  ICNoteResultsCellConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICNoteResultsCellConfiguration;
  v6 = -[ICNoteResultsCellConfiguration init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_invitation, a3);
    v7->_showFolderName = 1;
    -[ICNoteResultsCellConfiguration commonInit](v7, "commonInit");
  }

  return v7;
}

- (void)commonInit
{
  ICSearchIndexableNote *note;
  uint64_t v4;
  unsigned __int8 v5;

  self->_maxNumberOfLabelLines = 1;
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled(self))
  {
    note = self->_note;
    v4 = objc_opt_class(ICNote);
    if ((objc_opt_isKindOfClass(note, v4) & 1) != 0)
      v5 = -[ICSearchIndexableNote hasThumbnailImage](self->_note, "hasThumbnailImage");
    else
      v5 = 0;
    self->_hasThumbnailImage = v5;
  }
}

+ (id)sizingConfigurationWithShowParticipantsInfo:(BOOL)a3 showsFolderName:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  ICNoteResultsCellConfiguration *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(ICNoteResultsCellConfiguration);
  -[ICNoteResultsCellConfiguration setShowFolderName:](v6, "setShowFolderName:", v4);
  -[ICNoteResultsCellConfiguration setIsDataLoaded:](v6, "setIsDataLoaded:", 1);
  -[ICNoteResultsCellConfiguration setTitleString:](v6, "setTitleString:", CFSTR("Two\nLines"));
  -[ICNoteResultsCellConfiguration setParticipantsInfoString:](v6, "setParticipantsInfoString:", CFSTR("Participants"));
  -[ICNoteResultsCellConfiguration setFolderAndAccountInfoString:](v6, "setFolderAndAccountInfoString:", CFSTR("Folder"));
  -[ICNoteResultsCellConfiguration setDateString:](v6, "setDateString:", CFSTR("Date"));
  -[ICNoteResultsCellConfiguration setShowParticipantsInfo:](v6, "setShowParticipantsInfo:", v5);
  return v6;
}

- (void)updateTitleLabelAttributes:(id)a3 summaryLabelAttributes:(id)a4 folderAndAccountLabelAttributes:(id)a5 estimatedTitleLabelFrame:(CGRect)a6 estimatedSummaryLabelFrame:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v18;
  id v19;
  ICNoteResultsCellConfiguration *v20;
  id v21;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v11 = a6.size.height;
  v12 = a6.size.width;
  v13 = a6.origin.y;
  v14 = a6.origin.x;
  v21 = a3;
  v18 = a4;
  v19 = a5;
  v20 = self;
  objc_sync_enter(v20);
  -[ICNoteResultsCellConfiguration setTitleLabelAttributes:](v20, "setTitleLabelAttributes:", v21);
  -[ICNoteResultsCellConfiguration setSummaryLabelAttributes:](v20, "setSummaryLabelAttributes:", v18);
  -[ICNoteResultsCellConfiguration setFolderAndAccountLabelAttributes:](v20, "setFolderAndAccountLabelAttributes:", v19);
  -[ICNoteResultsCellConfiguration setEstimatedTitleLabelFrame:](v20, "setEstimatedTitleLabelFrame:", v14, v13, v12, v11);
  -[ICNoteResultsCellConfiguration setEstimatedSummaryLabelFrame:](v20, "setEstimatedSummaryLabelFrame:", x, y, width, height);
  objc_sync_exit(v20);

}

- (void)updateTitleLabelAttributes:(id)a3 summaryLabelAttributes:(id)a4
{
  id v6;
  ICNoteResultsCellConfiguration *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[ICNoteResultsCellConfiguration setTitleLabelAttributes:](v7, "setTitleLabelAttributes:", v8);
  -[ICNoteResultsCellConfiguration setSummaryLabelAttributes:](v7, "setSummaryLabelAttributes:", v6);
  objc_sync_exit(v7);

}

- (void)synchronouslyLoadData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](self, "invitation"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D3FE4;
  v9[3] = &unk_10054FE80;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

- (void)loadDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "loadDataQueue");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D408C;
  v8[3] = &unk_100550160;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)loadDataWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ICNoteResultsCellConfiguration clearData](self, "clearData");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));

  if (v4)
  {
    -[ICNoteResultsCellConfiguration loadNoteDataWithContext:](self, "loadNoteDataWithContext:", v6);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](self, "invitation"));

    if (v5)
      -[ICNoteResultsCellConfiguration loadInvitationDataWithContext:](self, "loadInvitationDataWithContext:", v6);
  }
  -[ICNoteResultsCellConfiguration setIsDataLoaded:](self, "setIsDataLoaded:", 1);

}

- (void)loadNoteDataWithContext:(id)a3
{
  ICNoteResultsCellConfiguration *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  ICNoteIndicatorUnreadChanges *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  ICNoteIndicatorStatus *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  __CFString *v61;
  __CFString *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  __CFString *v87;
  __CFString *v88;
  void *v89;
  __CFString *v90;
  uint64_t v91;
  __CFString *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  id v110;

  v110 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration titleLabelAttributes](v4, "titleLabelAttributes"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryLabelAttributes](v4, "summaryLabelAttributes"));
  v8 = objc_msgSend(v7, "copy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration folderAndAccountLabelAttributes](v4, "folderAndAccountLabelAttributes"));
  v10 = objc_msgSend(v9, "copy");

  -[ICNoteResultsCellConfiguration estimatedTitleLabelFrame](v4, "estimatedTitleLabelFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[ICNoteResultsCellConfiguration estimatedSummaryLabelFrame](v4, "estimatedSummaryLabelFrame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_sync_exit(v4);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](v4, "note"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "ic_existingObjectWithID:", v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration folderNoteSortType](v4, "folderNoteSortType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities dateForCurrentSortTypeForNote:folderNoteSortType:](ICNoteListSortUtilities, "dateForCurrentSortTypeForNote:folderNoteSortType:", v29, v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ic_briefFormattedDate"));
  -[ICNoteResultsCellConfiguration setDateString:](v4, "setDateString:", v32);

  if (objc_msgSend(v29, "isSharedViaICloud"))
    v33 = objc_msgSend(v29, "isSharedViaICloudFolder") ^ 1;
  else
    v33 = 0;
  -[ICNoteResultsCellConfiguration setShowCollaboratorsBadge:](v4, "setShowCollaboratorsBadge:", v33);
  if (objc_msgSend(v29, "isPinned"))
    v34 = objc_msgSend(v29, "isDeletedOrInTrash") ^ 1;
  else
    v34 = 0;
  -[ICNoteResultsCellConfiguration setShowPinnedBadge:](v4, "setShowPinnedBadge:", v34);
  if (objc_msgSend(v29, "hasUnreadChanges"))
    v35 = objc_msgSend(v29, "isSharedViaICloud");
  else
    v35 = 0;
  -[ICNoteResultsCellConfiguration setShowUnreadIndicator:](v4, "setShowUnreadIndicator:", v35);
  v36 = objc_msgSend(v29, "currentStatus");
  if (-[ICNoteResultsCellConfiguration showUnreadIndicator](v4, "showUnreadIndicator") || v36)
  {
    if (-[ICNoteResultsCellConfiguration showUnreadIndicator](v4, "showUnreadIndicator"))
    {
      v37 = objc_alloc_init(ICNoteIndicatorUnreadChanges);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIndicatorUnreadChanges imageName](v37, "imageName"));
      v39 = v10;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration symbolImageConfiguration](v4, "symbolImageConfiguration"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v38, v40));
      -[ICNoteResultsCellConfiguration setPrimaryStatusImage:](v4, "setPrimaryStatusImage:", v41);

      v10 = v39;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIndicatorUnreadChanges tintColor](v37, "tintColor"));
      -[ICNoteResultsCellConfiguration setPrimaryStatusImageTintColor:](v4, "setPrimaryStatusImageTintColor:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration primaryStatusImage](v4, "primaryStatusImage"));
      -[ICNoteResultsCellConfiguration setUnreadIndicatorImage:](v4, "setUnreadIndicatorImage:", v43);

    }
    if (v36)
    {
      v44 = -[ICNoteIndicatorStatus initWithStatusType:isDisplayedInFolder:]([ICNoteIndicatorStatus alloc], "initWithStatusType:isDisplayedInFolder:", v36, -[ICNoteResultsCellConfiguration isDisplayedInFolder](v4, "isDisplayedInFolder"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIndicatorStatus imageName](v44, "imageName"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration symbolImageConfiguration](v4, "symbolImageConfiguration"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v45, v46));

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration primaryStatusImage](v4, "primaryStatusImage"));
      if (v48)
      {
        -[ICNoteResultsCellConfiguration setSecondaryStatusImage:](v4, "setSecondaryStatusImage:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIndicatorStatus tintColor](v44, "tintColor"));
        -[ICNoteResultsCellConfiguration setSecondaryStatusImageTintColor:](v4, "setSecondaryStatusImageTintColor:", v49);
      }
      else
      {
        -[ICNoteResultsCellConfiguration setPrimaryStatusImage:](v4, "setPrimaryStatusImage:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteIndicatorStatus tintColor](v44, "tintColor"));
        -[ICNoteResultsCellConfiguration setPrimaryStatusImageTintColor:](v4, "setPrimaryStatusImageTintColor:", v49);
      }

    }
  }
  v50 = objc_opt_class(ICNote);
  if ((objc_opt_isKindOfClass(v29, v50) & 1) != 0)
    v51 = objc_msgSend(v29, "hasThumbnailImage");
  else
    v51 = 0;
  -[ICNoteResultsCellConfiguration setHasThumbnailImage:](v4, "setHasThumbnailImage:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration searchResult](v4, "searchResult"));

  if (v52)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration searchResult](v4, "searchResult"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration highlightColor](v4, "highlightColor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "attributedTitleWithBaseAttributes:highlightColor:insideFrame:", v6, v54, v12, v14, v16, v18));
    -[ICNoteResultsCellConfiguration setTitleAttributedString:](v4, "setTitleAttributedString:", v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration searchResult](v4, "searchResult"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration highlightColor](v4, "highlightColor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "attributedSummaryWithBaseAttributes:highlightColor:insideFrame:", v8, v57, v20, v22, v24, v26));
    -[ICNoteResultsCellConfiguration setSummaryAttributedString:](v4, "setSummaryAttributedString:", v58);

    if (-[ICNoteResultsCellConfiguration isLargerThanAXLarge](v4, "isLargerThanAXLarge"))
      goto LABEL_46;
    v59 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration dateString](v4, "dateString"));
    v60 = (void *)v59;
    v61 = &stru_1005704B8;
    if (v59)
      v61 = (__CFString *)v59;
    v62 = v61;

    v63 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v62, v8);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryAttributedString](v4, "summaryAttributedString"));

    if (!v64)
    {
      -[ICNoteResultsCellConfiguration setSummaryAttributedString:](v4, "setSummaryAttributedString:", v63);
      goto LABEL_45;
    }
    objc_msgSend(v63, "ic_appendString:", CFSTR("  "));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryAttributedString](v4, "summaryAttributedString"));
    objc_msgSend(v63, "appendAttributedString:", v65);

    v66 = objc_msgSend(v63, "copy");
    -[ICNoteResultsCellConfiguration setSummaryAttributedString:](v4, "setSummaryAttributedString:", v66);
  }
  else
  {
    v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "title"));
    -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v6, v12, v14, v16, v18);
    if (v67 > 0.0)
    {
      v68 = v67;
      v69 = (double)(unint64_t)objc_msgSend(v63, "length");
      if (v68 <= v69)
        v69 = v68;
      v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "ic_substringWithRange:", 0, (unint64_t)v69));

      v63 = (id)v70;
    }
    -[ICNoteResultsCellConfiguration setTitleString:](v4, "setTitleString:", v63);
    if ((objc_msgSend(v29, "isUnsupported") & 1) != 0)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("Content hidden"), &stru_1005704B8, 0));

    }
    else
    {
      v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "contentInfoText"));
    }
    if (!-[ICNoteResultsCellConfiguration isLargerThanAXLarge](v4, "isLargerThanAXLarge"))
    {
      v72 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration dateString](v4, "dateString"));
      if (v72)
      {
        v73 = (void *)v72;
        v74 = objc_msgSend(v66, "length");

        if (v74)
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration dateString](v4, "dateString"));
          v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "stringByAppendingFormat:", CFSTR("  %@"), v66));

          v66 = (id)v76;
        }
      }
    }
    -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v8, v20, v22, v24, v26);
    if (v77 > 0.0)
    {
      v78 = v77;
      v79 = (double)(unint64_t)objc_msgSend(v66, "length");
      if (v78 <= v79)
        v79 = v78;
      v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "ic_substringWithRange:", 0, (unint64_t)v79));

      v66 = (id)v80;
    }
    -[ICNoteResultsCellConfiguration setSummaryString:](v4, "setSummaryString:", v66);
  }

LABEL_45:
LABEL_46:
  if (-[ICNoteResultsCellConfiguration showParticipantsInfo](v4, "showParticipantsInfo"))
  {
    v81 = objc_opt_class(ICNote);
    v82 = ICDynamicCast(v81, v29);
    v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "participantsInfoDescription"));
    -[ICNoteResultsCellConfiguration setParticipantsInfoString:](v4, "setParticipantsInfoString:", v84);

  }
  if (-[ICNoteResultsCellConfiguration showsNoteContainer](v4, "showsNoteContainer"))
  {
    if (-[ICNoteResultsCellConfiguration showFolderName](v4, "showFolderName")
      && -[ICNoteResultsCellConfiguration showAccountName](v4, "showAccountName"))
    {
      v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "folderName"));
      v86 = (void *)v85;
      v87 = &stru_1005704B8;
      if (v85)
        v87 = (__CFString *)v85;
      v88 = v87;

      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "accountName"));
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@ — %@"), v88, v89));

    }
    else
    {
      if (-[ICNoteResultsCellConfiguration showAccountName](v4, "showAccountName"))
      {
        v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "accountName"));
        v89 = (void *)v91;
        v92 = &stru_1005704B8;
        if (v91)
          v92 = (__CFString *)v91;
      }
      else
      {
        v90 = &stru_1005704B8;
        if (!-[ICNoteResultsCellConfiguration showFolderName](v4, "showFolderName"))
          goto LABEL_64;
        v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "folderName"));
        v89 = (void *)v93;
        if (v93)
          v92 = (__CFString *)v93;
        else
          v92 = &stru_1005704B8;
      }
      v90 = v92;
    }

LABEL_64:
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" "), "stringByAppendingString:", v90));
    -[ICNoteResultsCellConfiguration setFolderAndAccountInfoString:](v4, "setFolderAndAccountInfoString:", v94);

    if (-[ICNoteResultsCellConfiguration showFolderName](v4, "showFolderName")
      || (v95 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration searchResult](v4, "searchResult")),
          v95,
          v95))
    {
      v109 = v8;
      v96 = objc_opt_class(ICNote);
      v97 = ICDynamicCast(v96, v29);
      v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "folderSystemImageName"));
      v100 = v99;
      v101 = v6;
      if (v99)
        v102 = v99;
      else
        v102 = (id)objc_claimAutoreleasedReturnValue(+[ICFolder defaultSystemImageName](ICFolder, "defaultSystemImageName"));
      v103 = v102;

      v104 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", v103));
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", NSFontAttributeName));
      v106 = v10;
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v105, -1));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "imageWithConfiguration:", v107));
      -[ICNoteResultsCellConfiguration setFolderImage:](v4, "setFolderImage:", v108);

      v10 = v106;
      v6 = v101;
      v8 = v109;
    }

  }
}

- (void)loadInvitationDataWithContext:(id)a3
{
  ICNoteResultsCellConfiguration *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  double v51;
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
  void *v63;
  id v64;

  v64 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration titleLabelAttributes](v4, "titleLabelAttributes"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryLabelAttributes](v4, "summaryLabelAttributes"));
  v8 = objc_msgSend(v7, "copy");

  -[ICNoteResultsCellConfiguration estimatedTitleLabelFrame](v4, "estimatedTitleLabelFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[ICNoteResultsCellConfiguration estimatedSummaryLabelFrame](v4, "estimatedSummaryLabelFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_sync_exit(v4);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](v4, "invitation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "ic_existingObjectWithID:", v26));

  -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v6, v10, v12, v14, v16);
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));
  if (v30)
  {
    -[ICNoteResultsCellConfiguration setTitleString:](v4, "setTitleString:", v30);
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Invitation"), &stru_1005704B8, 0));
    -[ICNoteResultsCellConfiguration setTitleString:](v4, "setTitleString:", v32);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration titleString](v4, "titleString"));
  if (v29 == 0.0)
  {
    -[ICNoteResultsCellConfiguration setTitleString:](v4, "setTitleString:", v33);
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration titleString](v4, "titleString"));
    v35 = objc_msgSend(v34, "length");

    v36 = (double)(unint64_t)v35;
    if (v29 <= (double)(unint64_t)v35)
      v36 = v29;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ic_substringWithRange:", 0, (unint64_t)v36));
    -[ICNoteResultsCellConfiguration setTitleString:](v4, "setTitleString:", v37);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "creationDate"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ic_briefFormattedDate"));
  -[ICNoteResultsCellConfiguration setDateString:](v4, "setDateString:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contentDescription"));
  -[ICNoteResultsCellConfiguration setSummaryString:](v4, "setSummaryString:", v40);

  if (!-[ICNoteResultsCellConfiguration isLargerThanAXLarge](v4, "isLargerThanAXLarge"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration dateString](v4, "dateString"));
    if (objc_msgSend(v41, "length"))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryString](v4, "summaryString"));
      v43 = objc_msgSend(v42, "length");

      if (!v43)
        goto LABEL_14;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration dateString](v4, "dateString"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryString](v4, "summaryString"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  %@"), v41, v44));
      -[ICNoteResultsCellConfiguration setSummaryString:](v4, "setSummaryString:", v45);

    }
  }
LABEL_14:
  -[ICNoteResultsCellConfiguration maxLengthForAttributes:frame:](v4, "maxLengthForAttributes:frame:", v8, v18, v20, v22, v24);
  v47 = v46;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryString](v4, "summaryString"));
  if (v47 == 0.0)
  {
    -[ICNoteResultsCellConfiguration setSummaryString:](v4, "setSummaryString:", v48);
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration summaryString](v4, "summaryString"));
    v50 = objc_msgSend(v49, "length");

    v51 = (double)(unint64_t)v50;
    if (v47 <= (double)(unint64_t)v50)
      v51 = v47;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "ic_substringWithRange:", 0, (unint64_t)v51));
    -[ICNoteResultsCellConfiguration setSummaryString:](v4, "setSummaryString:", v52);

  }
  if (objc_msgSend(v27, "hasThumbnail"))
  {
    -[ICNoteResultsCellConfiguration setHasThumbnailImage:](v4, "setHasThumbnailImage:", 1);
  }
  else
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rootObjectType"));
    -[ICNoteResultsCellConfiguration setHasThumbnailImage:](v4, "setHasThumbnailImage:", objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.notes.folder")));

  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration symbolImageConfiguration](v4, "symbolImageConfiguration"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.down.message"), v54));
  -[ICNoteResultsCellConfiguration setPrimaryStatusImage:](v4, "setPrimaryStatusImage:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[ICNoteResultsCellConfiguration setPrimaryStatusImageTintColor:](v4, "setPrimaryStatusImageTintColor:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "typeDescription"));
  -[ICNoteResultsCellConfiguration setFolderAndAccountInfoString:](v4, "setFolderAndAccountInfoString:", v57);

  if (-[ICNoteResultsCellConfiguration showAccountName](v4, "showAccountName"))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "account"));

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration folderAndAccountInfoString](v4, "folderAndAccountInfoString"));
      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration folderAndAccountInfoString](v4, "folderAndAccountInfoString"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "account"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedName"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ — %@"), v60, v62));
        -[ICNoteResultsCellConfiguration setFolderAndAccountInfoString:](v4, "setFolderAndAccountInfoString:", v63);

      }
      else
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "account"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedName"));
        -[ICNoteResultsCellConfiguration setFolderAndAccountInfoString:](v4, "setFolderAndAccountInfoString:", v61);
      }

    }
  }

}

- (void)clearData
{
  -[ICNoteResultsCellConfiguration setTitleString:](self, "setTitleString:", 0);
  -[ICNoteResultsCellConfiguration setTitleAttributedString:](self, "setTitleAttributedString:", 0);
  -[ICNoteResultsCellConfiguration setSummaryString:](self, "setSummaryString:", 0);
  -[ICNoteResultsCellConfiguration setSummaryAttributedString:](self, "setSummaryAttributedString:", 0);
  -[ICNoteResultsCellConfiguration setDateString:](self, "setDateString:", 0);
  -[ICNoteResultsCellConfiguration setFolderAndAccountInfoString:](self, "setFolderAndAccountInfoString:", 0);
  -[ICNoteResultsCellConfiguration setShowCollaboratorsBadge:](self, "setShowCollaboratorsBadge:", 0);
  -[ICNoteResultsCellConfiguration setHasThumbnailImage:](self, "setHasThumbnailImage:", 0);
  -[ICNoteResultsCellConfiguration setShowPinnedBadge:](self, "setShowPinnedBadge:", 0);
  -[ICNoteResultsCellConfiguration setShowUnreadIndicator:](self, "setShowUnreadIndicator:", 0);
  -[ICNoteResultsCellConfiguration setPrimaryStatusImage:](self, "setPrimaryStatusImage:", 0);
  -[ICNoteResultsCellConfiguration setPrimaryStatusImageTintColor:](self, "setPrimaryStatusImageTintColor:", 0);
  -[ICNoteResultsCellConfiguration setSecondaryStatusImage:](self, "setSecondaryStatusImage:", 0);
  -[ICNoteResultsCellConfiguration setSecondaryStatusImageTintColor:](self, "setSecondaryStatusImageTintColor:", 0);
}

- (BOOL)isLargerThanAXLarge
{
  void *v2;
  NSString *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));
  v4 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityLarge) > NSOrderedSame;

  return v4;
}

- (id)symbolImageConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  if (-[ICNoteResultsCellConfiguration isLargerThanAXLarge](self, "isLargerThanAXLarge"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForBodyTextWithContentSizeCategory:](UIFont, "ic_preferredFontForBodyTextWithContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_fontWithSingleLineA"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v2, 1));

  return v4;
}

- (double)maxLengthForAttributes:(id)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(CFSTR("."), "sizeWithAttributes:", a3);
  v10 = v9;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v11 = CGRectGetWidth(v15);
  v12 = 1.0;
  if (v10 >= 1.0)
    v12 = v10;
  v13 = (unint64_t)(v11 / v12);
  if (-[ICNoteResultsCellConfiguration maxNumberOfLabelLines](self, "maxNumberOfLabelLines") >= 2)
    v13 *= -[ICNoteResultsCellConfiguration maxNumberOfLabelLines](self, "maxNumberOfLabelLines");
  return (double)v13;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](self, "invitation"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](self, "invitation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootObjectType"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.notes.folder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if (v6)
      v9 = CFSTR("Invitation for folder titled %@");
    else
      v9 = CFSTR("Invitation for note titled %@");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1005704B8, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](self, "invitation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](self, "invitation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "receivedDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_briefFormattedDate"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration invitation](self, "invitation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentDescription"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Shared with me via iCloud"), &stru_1005704B8, 0));

    v21 = __ICAccessibilityStringForVariables(1, v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
    v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "title"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration folderNoteSortType](self, "folderNoteSortType"));
    v26 = objc_claimAutoreleasedReturnValue(+[ICNoteListSortUtilities dateForCurrentSortTypeAccessibilityStringForNote:folderNoteSortType:](ICNoteListSortUtilities, "dateForCurrentSortTypeAccessibilityStringForNote:folderNoteSortType:", v24, v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contentInfoText"));

    v28 = objc_msgSend(v16, "paragraphRangeForRange:", 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", v28, v29));
    v20 = 0;
    if (-[ICNoteResultsCellConfiguration showPinnedBadge](self, "showPinnedBadge"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("pinned"), &stru_1005704B8, 0));

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "folderName"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("In folder %@"), &stru_1005704B8, 0));

    v64 = (void *)v34;
    v65 = (void *)v32;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v34, v32));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
    v36 = objc_msgSend(v35, "currentStatus");

    switch((unint64_t)v36)
    {
      case 1uLL:
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v38 = v37;
        v39 = CFSTR("Locked");
        goto LABEL_12;
      case 2uLL:
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v38 = v37;
        v39 = CFSTR("Unlocked");
LABEL_12:
        v62 = 0;
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", v39, &stru_1005704B8, 0));
        v40 = v18;
        v18 = 0;
        goto LABEL_21;
      case 3uLL:
        v41 = objc_opt_class(ICNote);
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
        v43 = ICDynamicCast(v41, v42);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v43);

        LODWORD(v41) = objc_msgSend(v40, "isOwnedByCurrentUser");
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v38 = v44;
        if ((_DWORD)v41)
          v45 = CFSTR("Shared by me via iCloud");
        else
          v45 = CFSTR("Shared with me via iCloud");
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", v45, &stru_1005704B8, 0));
        v63 = 0;
        goto LABEL_21;
      case 4uLL:
        v46 = objc_opt_class(ICNote);
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
        v48 = ICDynamicCast(v46, v47);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v48);

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "folder"));
        LODWORD(v47) = objc_msgSend(v49, "isOwnedByCurrentUser");
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v51 = v50;
        if ((_DWORD)v47)
          v52 = CFSTR("In a folder shared by me called %@");
        else
          v52 = CFSTR("In a folder shared with me called %@");
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", v52, &stru_1005704B8, 0));

        v53 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, v65));
        v62 = 0;
        v63 = 0;
        v67 = (void *)v53;
LABEL_21:
        v10 = (void *)v66;

        break;
      default:
        v62 = 0;
        v63 = 0;
        v10 = (void *)v66;
        break;
    }
    v54 = objc_opt_class(ICNote);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsCellConfiguration note](self, "note"));
    v56 = ICDynamicCast(v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

    if (objc_msgSend(v57, "isSharedViaICloud") && objc_msgSend(v57, "hasUnreadChanges"))
    {
      v13 = (void *)v26;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("has unread changes"), &stru_1005704B8, 0));

      v10 = (void *)v66;
    }
    else
    {
      v13 = (void *)v26;
      v59 = 0;
    }
    -[ICNoteResultsCellConfiguration showsNoteContainer](self, "showsNoteContainer");
    v60 = __ICAccessibilityStringForVariables(1, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v60);

  }
  return v22;
}

- (BOOL)showsNoteContainer
{
  if (-[ICNoteResultsCellConfiguration showFolderName](self, "showFolderName"))
    return 1;
  else
    return -[ICNoteResultsCellConfiguration showAccountName](self, "showAccountName");
}

- (ICSearchIndexableNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (ICInvitation)invitation
{
  return self->_invitation;
}

- (ICFolderCustomNoteSortType)folderNoteSortType
{
  return self->_folderNoteSortType;
}

- (void)setFolderNoteSortType:(id)a3
{
  objc_storeStrong((id *)&self->_folderNoteSortType, a3);
}

- (unint64_t)maxNumberOfLabelLines
{
  return self->_maxNumberOfLabelLines;
}

- (void)setMaxNumberOfLabelLines:(unint64_t)a3
{
  self->_maxNumberOfLabelLines = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (CGRect)estimatedTitleLabelFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_estimatedTitleLabelFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setEstimatedTitleLabelFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_estimatedTitleLabelFrame, &v3, 32, 1, 0);
}

- (CGRect)estimatedSummaryLabelFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_estimatedSummaryLabelFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setEstimatedSummaryLabelFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_estimatedSummaryLabelFrame, &v3, 32, 1, 0);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSAttributedString)titleAttributedString
{
  return self->_titleAttributedString;
}

- (void)setTitleAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (void)setSummaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSAttributedString)summaryAttributedString
{
  return self->_summaryAttributedString;
}

- (void)setSummaryAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)participantsInfoString
{
  return self->_participantsInfoString;
}

- (void)setParticipantsInfoString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)folderAndAccountInfoString
{
  return self->_folderAndAccountInfoString;
}

- (void)setFolderAndAccountInfoString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)showCollaboratorsBadge
{
  return self->_showCollaboratorsBadge;
}

- (void)setShowCollaboratorsBadge:(BOOL)a3
{
  self->_showCollaboratorsBadge = a3;
}

- (BOOL)showParticipantsInfo
{
  return self->_showParticipantsInfo;
}

- (void)setShowParticipantsInfo:(BOOL)a3
{
  self->_showParticipantsInfo = a3;
}

- (BOOL)isDisplayedInFolder
{
  return self->_isDisplayedInFolder;
}

- (void)setIsDisplayedInFolder:(BOOL)a3
{
  self->_isDisplayedInFolder = a3;
}

- (ICSearchResult)searchResult
{
  return self->_searchResult;
}

- (BOOL)showAccountName
{
  return self->_showAccountName;
}

- (void)setShowAccountName:(BOOL)a3
{
  self->_showAccountName = a3;
}

- (BOOL)showFolderName
{
  return self->_showFolderName;
}

- (void)setShowFolderName:(BOOL)a3
{
  self->_showFolderName = a3;
}

- (BOOL)hasThumbnailImage
{
  return self->_hasThumbnailImage;
}

- (void)setHasThumbnailImage:(BOOL)a3
{
  self->_hasThumbnailImage = a3;
}

- (BOOL)hideThumbnailImage
{
  return self->_hideThumbnailImage;
}

- (void)setHideThumbnailImage:(BOOL)a3
{
  self->_hideThumbnailImage = a3;
}

- (BOOL)showPinnedBadge
{
  return self->_showPinnedBadge;
}

- (void)setShowPinnedBadge:(BOOL)a3
{
  self->_showPinnedBadge = a3;
}

- (BOOL)showUnreadIndicator
{
  return self->_showUnreadIndicator;
}

- (void)setShowUnreadIndicator:(BOOL)a3
{
  self->_showUnreadIndicator = a3;
}

- (UIImage)folderImage
{
  return self->_folderImage;
}

- (void)setFolderImage:(id)a3
{
  objc_storeStrong((id *)&self->_folderImage, a3);
}

- (UIImage)unreadIndicatorImage
{
  return self->_unreadIndicatorImage;
}

- (void)setUnreadIndicatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_unreadIndicatorImage, a3);
}

- (UIImage)primaryStatusImage
{
  return self->_primaryStatusImage;
}

- (void)setPrimaryStatusImage:(id)a3
{
  objc_storeStrong((id *)&self->_primaryStatusImage, a3);
}

- (UIColor)primaryStatusImageTintColor
{
  return self->_primaryStatusImageTintColor;
}

- (void)setPrimaryStatusImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryStatusImageTintColor, a3);
}

- (UIImage)secondaryStatusImage
{
  return self->_secondaryStatusImage;
}

- (void)setSecondaryStatusImage:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStatusImage, a3);
}

- (UIColor)secondaryStatusImageTintColor
{
  return self->_secondaryStatusImageTintColor;
}

- (void)setSecondaryStatusImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStatusImageTintColor, a3);
}

- (BOOL)isDataLoaded
{
  return self->_isDataLoaded;
}

- (void)setIsDataLoaded:(BOOL)a3
{
  self->_isDataLoaded = a3;
}

- (BOOL)styleForCalculator
{
  return self->_styleForCalculator;
}

- (void)setStyleForCalculator:(BOOL)a3
{
  self->_styleForCalculator = a3;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
  objc_storeStrong((id *)&self->_noteContainer, a3);
}

- (NoteCollectionObject)noteCollectionObject
{
  return self->_noteCollectionObject;
}

- (void)setNoteCollectionObject:(id)a3
{
  objc_storeStrong((id *)&self->_noteCollectionObject, a3);
}

- (NSDictionary)titleLabelAttributes
{
  return self->_titleLabelAttributes;
}

- (void)setTitleLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelAttributes, a3);
}

- (NSDictionary)summaryLabelAttributes
{
  return self->_summaryLabelAttributes;
}

- (void)setSummaryLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabelAttributes, a3);
}

- (NSDictionary)folderAndAccountLabelAttributes
{
  return self->_folderAndAccountLabelAttributes;
}

- (void)setFolderAndAccountLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_folderAndAccountLabelAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderAndAccountLabelAttributes, 0);
  objc_storeStrong((id *)&self->_summaryLabelAttributes, 0);
  objc_storeStrong((id *)&self->_titleLabelAttributes, 0);
  objc_storeStrong((id *)&self->_noteCollectionObject, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_secondaryStatusImageTintColor, 0);
  objc_storeStrong((id *)&self->_secondaryStatusImage, 0);
  objc_storeStrong((id *)&self->_primaryStatusImageTintColor, 0);
  objc_storeStrong((id *)&self->_primaryStatusImage, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImage, 0);
  objc_storeStrong((id *)&self->_folderImage, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_folderAndAccountInfoString, 0);
  objc_storeStrong((id *)&self->_participantsInfoString, 0);
  objc_storeStrong((id *)&self->_summaryAttributedString, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_folderNoteSortType, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
