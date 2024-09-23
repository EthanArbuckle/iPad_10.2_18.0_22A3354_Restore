@implementation ICSendNoteActivityViewController

- (ICSendNoteActivityViewController)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  ICPagesHandoffActivity *v15;
  void *v16;
  id v17;
  ICLinkPresentationMetadata *v18;
  void *v19;
  ICLinkPresentationMetadata *v20;
  ICNotePrintActivityItemSource *v21;
  void *v22;
  double v23;
  double v24;
  ICNotePrintActivityItemSource *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  ICSendNoteActivityViewController *v32;
  id v35;
  ICSendNoteActivityViewController *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  objc_super v42;
  _QWORD v43[2];

  v8 = a3;
  v9 = a4;
  v35 = a5;
  v40 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v8, "canBeSharedViaICloud")
    && (objc_msgSend(v8, "isSharedThroughParent") & 1) == 0
    && objc_msgSend(v8, "canCurrentUserShare"))
  {
    v12 = objc_alloc_init((Class)NSItemProvider);
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
    objc_msgSend(v14, "registerShareForObject:itemProvider:generateThumbnails:", v8, v12, 1);

    v11 = v13;
    objc_msgSend(v10, "addObject:", v12);

  }
  if (+[ICFeatureFlags pagesHandoffEnabled](_TtC11MobileNotes14ICFeatureFlags, "pagesHandoffEnabled")
    && +[ICPagesHandoffManager canLaunchPagesForNote:](ICPagesHandoffManager, "canLaunchPagesForNote:", v8))
  {
    v15 = -[ICPagesHandoffActivity initWithNote:viewController:]([ICPagesHandoffActivity alloc], "initWithNote:viewController:", v8, v9);
    objc_msgSend(v11, "addObject:", v15);

  }
  v39 = objc_alloc_init((Class)ICShareNoteExporter);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "noteActivityItemsForSharingWithNoteExporter:"));
  objc_msgSend(v10, "addObjectsFromArray:");
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "airDropActivityItemSource"));
  objc_msgSend(v10, "ic_addNonNilObject:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController shareSheetNoteThumbnailImage](ICCollaborationController, "shareSheetNoteThumbnailImage"));
  if (!v16)
  {
    v17 = objc_msgSend((id)objc_opt_class(self), "fallbackImageWithNote:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }
  v18 = [ICLinkPresentationMetadata alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v36 = self;
  v20 = -[ICLinkPresentationMetadata initWithTitle:image:](v18, "initWithTitle:image:", v19, v16);

  objc_msgSend(v10, "addObject:", v20);
  v21 = [ICNotePrintActivityItemSource alloc];
  v41 = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v22, "bounds");
  v25 = -[ICNotePrintActivityItemSource initWithNote:size:](v21, "initWithNote:size:", v8, v23, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInfo printInfo](UIPrintInfo, "printInfo"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  objc_msgSend(v26, "setJobName:", v27);

  v43[0] = v26;
  v43[1] = v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
  objc_msgSend(v10, "addObjectsFromArray:", v28);

  v29 = objc_msgSend(v10, "copy");
  v30 = v11;
  v31 = objc_msgSend(v11, "copy");
  v42.receiver = v36;
  v42.super_class = (Class)ICSendNoteActivityViewController;
  v32 = -[ICSendNoteActivityViewController initWithActivityItems:applicationActivities:](&v42, "initWithActivityItems:applicationActivities:", v29, v31);

  if (v32)
  {
    objc_storeStrong((id *)&v32->_note, a3);
    objc_storeStrong((id *)&v32->_noteExporter, v39);
    objc_storeStrong((id *)&v32->_eventReporter, v35);
  }

  return v32;
}

- (id)excludedActivityTypes
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[3];

  v3 = objc_alloc((Class)NSMutableArray);
  v10[0] = ICActivityTypeShareToNote;
  v10[1] = UIActivityTypeOpenInIBooks;
  v10[2] = UIActivityTypeSharePlay;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));
  v5 = objc_msgSend(v3, "initWithArray:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivityViewController additionalExcludedTypes](self, "additionalExcludedTypes"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivityViewController additionalExcludedTypes](self, "additionalExcludedTypes"));
    objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  return v5;
}

+ (id)fallbackImageWithNote:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)ICThumbnailConfiguration), "initForNoteNavigationBarIconWithNote:preferredSize:", v3, 90.0, 72.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "thumbnailWithConfiguration:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "image"));

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)additionalExcludedTypes
{
  return self->_additionalExcludedTypes;
}

- (void)setAdditionalExcludedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_additionalExcludedTypes, a3);
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (ICShareNoteExporter)noteExporter
{
  return self->_noteExporter;
}

- (void)setNoteExporter:(id)a3
{
  objc_storeStrong((id *)&self->_noteExporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteExporter, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_additionalExcludedTypes, 0);
}

@end
