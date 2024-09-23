@implementation ICAttachmentInspectorViewController

- (ICAttachmentInspectorViewController)initWithAttachment:(id)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  ICAttachmentInspectorViewController *v10;
  NSArray *spotlightResults;
  NSOperationQueue *v12;
  NSOperationQueue *searchOperationQueue;
  objc_super v15;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6));
  v15.receiver = self;
  v15.super_class = (Class)ICAttachmentInspectorViewController;
  v10 = -[ICAttachmentInspectorViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v8, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_attachment, a3);
    spotlightResults = v10->_spotlightResults;
    v10->_spotlightResults = (NSArray *)&__NSArray0__struct;

    v12 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    searchOperationQueue = v10->_searchOperationQueue;
    v10->_searchOperationQueue = v12;

  }
  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentInspectorViewController;
  -[ICAttachmentInspectorViewController viewDidLoad](&v3, "viewDidLoad");
  -[ICAttachmentInspectorViewController setUpViews](self, "setUpViews");
  -[ICAttachmentInspectorViewController startCoreSpotlightSearch](self, "startCoreSpotlightSearch");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentInspectorViewController;
  -[ICAttachmentInspectorViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  if (-[ICAttachmentInspectorViewController regenerateMetadataOnClose](self, "regenerateMetadataOnClose"))
  {
    dispatchMainAfterDelay(&stru_1005552F0, 1.0);
    -[ICAttachmentInspectorViewController setRegenerateMetadataOnClose:](self, "setRegenerateMetadataOnClose:", 0);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  id v7;

  if ((unint64_t)(a4 - 1) < 6 || a4 == 8)
    return 1;
  if (a4 != 7)
    return 13;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController spotlightResults](self, "spotlightResults", a3));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  ICAttachmentInspectorViewController *v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  switch((unint64_t)v6)
  {
    case 0uLL:
      v7 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachmentInfoCellAtRow:](self, "attachmentInfoCellAtRow:", objc_msgSend(v5, "row", v6)));
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 8uLL:
      v7 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController defaultCellForRowInSection:](self, "defaultCellForRowInSection:", v6));
      goto LABEL_3;
    case 7uLL:
      v7 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController spotlightAttributeCellAtRow:](self, "spotlightAttributeCellAtRow:", objc_msgSend(v5, "row", v6)));
LABEL_3:
      self = v7;
      break;
    default:
      break;
  }

  return self;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[ICAttachmentInspectorViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  if (objc_msgSend(v9, "section"))
  {
    v5 = objc_msgSend(v9, "section");
  }
  else
  {
    v6 = objc_msgSend(v9, "row");
    v5 = objc_msgSend(v9, "section");
    if (v6 == (id)9)
    {
      -[ICAttachmentInspectorViewController confirmShowSubAttachmentsIfNeeded](self, "confirmShowSubAttachmentsIfNeeded");
LABEL_9:
      v8 = v9;
      goto LABEL_10;
    }
  }
  if (v5 == (id)8)
  {
    -[ICAttachmentInspectorViewController savePKDrawingData](self, "savePKDrawingData");
    goto LABEL_9;
  }
  v7 = objc_msgSend(v9, "section");
  v8 = v9;
  if (v7)
  {
    -[ICAttachmentInspectorViewController presentEditMenuAtIndexPath:](self, "presentEditMenuAtIndexPath:", v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  ICAttachmentInspectorViewController *v18;
  id v19;

  v6 = objc_msgSend(a5, "mutableCopy", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForSelectedRow"));

  if (-[ICAttachmentInspectorViewController canClear:](self, "canClear:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_10010DA14;
    v17 = &unk_100550A48;
    v18 = self;
    v19 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Clear"), v9, 0, &v14));

    objc_msgSend(v10, "setAttributes:", (unint64_t)objc_msgSend(v10, "attributes", v14, v15, v16, v17, v18) | 2);
    objc_msgSend(v6, "addObject:", v10);

  }
  v11 = objc_msgSend(v6, "copy");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v11));

  return v12;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedRow"));
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedRow"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController stringToCopyAtIndexPath:](self, "stringToCopyAtIndexPath:", v7));
  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
    objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v7, 1);

    goto LABEL_5;
  }
  if ("copy:" != a3)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = -[ICAttachmentInspectorViewController canCopy:](self, "canCopy:", v7);
LABEL_6:

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForSelectedRow"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController stringToCopyAtIndexPath:](self, "stringToCopyAtIndexPath:", v7));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
    objc_msgSend(v6, "setString:", v5);

  }
}

- (void)presentEditMenuAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellForRowAtIndexPath:", v11));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactions"));
  v7 = objc_msgSend(v6, "ic_firstObjectOfClass:", objc_opt_class(UIEditMenuInteraction));
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    v8 = objc_msgSend(objc_alloc((Class)UIEditMenuInteraction), "initWithDelegate:", self);
    objc_msgSend(v5, "addInteraction:", v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "section")));
  objc_msgSend(v5, "center");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v9));

  objc_msgSend(v8, "presentEditMenuWithConfiguration:", v10);
}

- (void)savePKDrawingData
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[3];
  void *v38;

  v3 = objc_opt_class(ICAttachmentInlineDrawingModel);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attachmentModel"));
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = objc_opt_class(ICAttachmentInlineDrawingModel);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachmentModel"));
    v11 = ICDynamicCast(v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v12, "newDrawingFromMergeableData");

    goto LABEL_5;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v15 = objc_msgSend(v14, "attachmentType");

  if (v15 == 13)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[ICSystemPaperDocumentHelper drawingForPaperAttachment:](ICSystemPaperDocumentHelper, "drawingForPaperAttachment:", v9));
LABEL_5:

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataRepresentation"));
    v17 = (void *)v16;
    if (v13)
    {
      if (v16)
      {
LABEL_7:
        v18 = NSTemporaryDirectory();
        v35 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v36 = v7;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v35));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ic_trimmedString"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ic_stringByReplacingNewlineCharactersWithWhiteSpace"));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ic_sanitizedFilenameString"));

        if (-[__CFString length](v25, "length"))
          v26 = v25;
        else
          v26 = CFSTR("Drawing");
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", v26, 0));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "URLByAppendingPathExtension:", CFSTR("pkdrawingdata")));
        objc_msgSend(v19, "removeItemAtURL:error:", v28, 0);
        objc_msgSend(v17, "writeToURL:atomically:", v28, 1);
        v29 = objc_alloc((Class)UIActivityViewController);
        v38 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
        v31 = objc_msgSend(v29, "initWithActivityItems:applicationActivities:", v30, 0);

        v37[0] = UIActivityTypeOpenInIBooks;
        v37[1] = ICActivityTypeShareToNote;
        v37[2] = UIActivityTypeSharePlay;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3));
        objc_msgSend(v31, "setExcludedActivityTypes:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController view](self, "view"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "popoverPresentationController"));
        objc_msgSend(v34, "setSourceView:", v33);

        -[ICAttachmentInspectorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v31, 1, 0);
        v7 = v36;

        goto LABEL_13;
      }
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((drawing) != nil)", "-[ICAttachmentInspectorViewController savePKDrawingData]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "drawing");
      if (v17)
        goto LABEL_7;
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((data) != nil)", "-[ICAttachmentInspectorViewController savePKDrawingData]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "data");
LABEL_13:

  }
}

- (int64_t)numberOfSections
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  if (objc_msgSend(v3, "attachmentType") == 10)
  {

    return 9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v5 = objc_msgSend(v4, "attachmentType");

  if (v5 == 13)
    return 9;
  return 8;
}

- (id)attachmentInfoAtRow:(int64_t)a3
{
  ICAttachmentInspectorViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CGRect v25;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v6 = v5;
  switch(a3)
  {
    case 0:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
      goto LABEL_12;
    case 1:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userTitle"));
      goto LABEL_12;
    case 2:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      goto LABEL_12;
    case 3:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "typeUTI"));
      goto LABEL_12;
    case 4:
      v8 = NSStringFromICAttachmentType(objc_msgSend(v5, "attachmentType"));
      v7 = objc_claimAutoreleasedReturnValue(v8);
      goto LABEL_12;
    case 5:
      v9 = NSStringFromNotesVersion(objc_msgSend(v5, "minimumSupportedNotesVersion"));
      v7 = objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_12;
    case 6:
      objc_msgSend(v5, "originX");
      v11 = v10;
      objc_msgSend(v6, "originY");
      v13 = v12;
      objc_msgSend(v6, "sizeWidth");
      v15 = v14;
      objc_msgSend(v6, "sizeHeight");
      v25.size.height = v16;
      v25.origin.x = v11;
      v25.origin.y = v13;
      v25.size.width = v15;
      v17 = NSStringFromCGRect(v25);
      v7 = objc_claimAutoreleasedReturnValue(v17);
      goto LABEL_12;
    case 7:
      v18 = NSStringFromICImageClassOrientation((int)objc_msgSend(v5, "orientation"));
      v7 = objc_claimAutoreleasedReturnValue(v18);
      goto LABEL_12;
    case 8:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "croppingQuad"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "description"));
      v4 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ic_trimmedString"));

      goto LABEL_20;
    case 9:
      v7 = objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController subAttachmentIdentifiersString](v4, "subAttachmentIdentifiersString"));
LABEL_12:
      v4 = (ICAttachmentInspectorViewController *)v7;
      break;
    case 10:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentAttachment"));
      goto LABEL_16;
    case 11:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentAttachment"));
      goto LABEL_18;
    case 12:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));
LABEL_16:
      v19 = v21;
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
      goto LABEL_19;
    case 13:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));
LABEL_18:
      v19 = v22;
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
LABEL_19:
      v4 = (ICAttachmentInspectorViewController *)v23;
LABEL_20:

      break;
    default:
      break;
  }

  return v4;
}

- (id)spotlightAttributeValueToCopyAtRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController spotlightResults](self, "spotlightResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
  v8 = sub_10010E420(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController spotlightResults](self, "spotlightResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
  v13 = sub_10010E420(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v9, v14));

  return v15;
}

- (id)spotlightAttributeCellAtRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController dequeueOrRegisterCellWithIdentifier:style:](self, "dequeueOrRegisterCellWithIdentifier:style:", CFSTR("SectionSpotlightAttributeCell"), 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController spotlightResults](self, "spotlightResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "key"));
  v9 = sub_10010E420(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController spotlightResults](self, "spotlightResults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
  v15 = sub_10010E420(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailTextLabel"));
  objc_msgSend(v17, "setText:", v16);

  return v5;
}

- (id)attachmentInfoCellAtRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController dequeueOrRegisterCellWithIdentifier:style:](self, "dequeueOrRegisterCellWithIdentifier:style:", CFSTR("SectionInfoCell"), 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachmentInfoTypeAtRow:](self, "attachmentInfoTypeAtRow:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v7, "setText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachmentInfoAtRow:](self, "attachmentInfoAtRow:", a3));
  v9 = sub_10010E420(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailTextLabel"));
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v5, "setAccessoryType:", a3 == 9);
  return v5;
}

- (id)attachmentInfoTypeAtRow:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC)
    return CFSTR("Title");
  else
    return *(&off_1005553C8 + a3 - 1);
}

- (BOOL)canClear:(id)a3
{
  return (char *)objc_msgSend(a3, "section") - 1 < (char *)5;
}

- (BOOL)canCopy:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "section"))
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "row") != (id)9;
  if (objc_msgSend(v3, "row") == (id)8)
    v4 = 0;

  return v4;
}

- (void)clearAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  switch((unint64_t)objc_msgSend(v4, "section"))
  {
    case 0uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_8;
    case 1uLL:
      objc_msgSend(v5, "setSummary:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentAttachment"));
      objc_msgSend(v6, "setSummary:", 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentAttachment"));
      objc_msgSend(v7, "attachmentDidChange");

      goto LABEL_6;
    case 2uLL:
      objc_msgSend(v5, "setHandwritingSummary:", 0);
      goto LABEL_6;
    case 3uLL:
      objc_msgSend(v5, "setImageClassificationSummary:", 0);
      goto LABEL_6;
    case 4uLL:
      objc_msgSend(v5, "setOcrSummary:", 0);
LABEL_6:
      -[ICAttachmentInspectorViewController setRegenerateMetadataOnClose:](self, "setRegenerateMetadataOnClose:", 1);
      break;
    case 5uLL:
      objc_msgSend(v5, "setAdditionalIndexableText:", 0);
      break;
    default:
      break;
  }
  objc_msgSend(v5, "attachmentDidChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010E8EC;
  v13[3] = &unk_100550110;
  v9 = v8;
  v14 = v9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010E8F4;
  v10[3] = &unk_100550338;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  objc_msgSend(v9, "ic_performBlock:andPerformBlockOnMainThread:", v13, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

LABEL_8:
}

- (void)confirmShowSubAttachmentsIfNeeded
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location;
  _BYTE v26[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController subAttachments](self, "subAttachments"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Sub-attachments"), 0, 0));
    objc_initWeak(&location, self);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController subAttachments](self, "subAttachments"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10010ED14;
          v19[3] = &unk_100555318;
          objc_copyWeak(&v20, &location);
          v19[4] = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v19));
          objc_msgSend(v4, "addAction:", v11);

          objc_destroyWeak(&v20);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10010EDFC;
    v17[3] = &unk_100555340;
    objc_copyWeak(&v18, &location);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v17));
    objc_msgSend(v4, "addAction:", v12);
    -[ICAttachmentInspectorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForSelectedRow"));
    objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v14, 1);

  }
}

- (id)defaultCellForRowInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController dequeueOrRegisterCellWithIdentifier:style:](self, "dequeueOrRegisterCellWithIdentifier:style:", CFSTR("DefaultCell"), 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController defaultCellTextAtSection:](self, "defaultCellTextAtSection:", a3));
  v7 = sub_10010E420(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailTextLabel"));
  objc_msgSend(v9, "setText:", v8);

  return v5;
}

- (id)defaultCellTextAtSection:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v5 = v4;
  v6 = 0;
  switch(a3)
  {
    case 1:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "summary"));
      goto LABEL_9;
    case 2:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handwritingSummary"));
      goto LABEL_9;
    case 3:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageClassificationSummary"));
      goto LABEL_9;
    case 4:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ocrSummary"));
      goto LABEL_9;
    case 5:
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "additionalIndexableText"));
LABEL_9:
      v6 = (__CFString *)v7;
      break;
    case 6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "media"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mediaURL"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));

      break;
    case 8:
      v6 = CFSTR("Export Drawing");
      break;
    default:
      break;
  }

  return v6;
}

- (id)dequeueOrRegisterCellWithIdentifier:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v6));

  if (!v8)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", a4, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v9, "setNumberOfLines:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "detailTextLabel"));
    objc_msgSend(v10, "setNumberOfLines:", 0);

  }
  return v8;
}

- (void)doneAction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController presentingViewController](self, "presentingViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
  -[ICAttachmentInspectorViewController updateViews](self, "updateViews");
}

- (void)setUpViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneAction:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setRightBarButtonItem:", v6);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setEstimatedRowHeight:", 44.0);

  -[ICAttachmentInspectorViewController updateViews](self, "updateViews");
}

- (id)stringToCopyAtIndexPath:(id)a3
{
  id v4;
  id v5;
  ICAttachmentInspectorViewController *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  switch((unint64_t)v5)
  {
    case 0uLL:
      v6 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachmentInfoAtRow:](self, "attachmentInfoAtRow:", objc_msgSend(v4, "row", v5)));
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 8uLL:
      v6 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController defaultCellTextAtSection:](self, "defaultCellTextAtSection:", v5));
      goto LABEL_3;
    case 7uLL:
      v6 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController spotlightAttributeValueToCopyAtRow:](self, "spotlightAttributeValueToCopyAtRow:", objc_msgSend(v4, "row", v5)));
LABEL_3:
      self = v6;
      break;
    default:
      break;
  }

  return self;
}

- (NSSet)subAttachments
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parentAttachment"));
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = v2;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subAttachments"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010F330;
  v11[3] = &unk_100555368;
  v12 = v2;
  v8 = v2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_compactMap:", v11));

  return (NSSet *)v9;
}

- (NSSet)subAttachmentIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController subAttachments](self, "subAttachments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ic_compactMap:", &stru_1005553A8));

  return (NSSet *)v3;
}

- (NSString)subAttachmentIdentifiersString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController subAttachmentIdentifiers](self, "subAttachmentIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingSelector:", "compare:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n")));
  return (NSString *)v5;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  NSString *v6;

  switch(a3)
  {
    case 1:
      v3 = CFSTR("Summary");
      return v3;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v4, "handwritingSummaryVersion")));
      v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Handwriting Summary (v%@)"), v5);
      goto LABEL_7;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v4, "imageClassificationSummaryVersion")));
      v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Image Classification (v%@)"), v5);
      goto LABEL_7;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v4, "ocrSummaryVersion")));
      v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("OCR Summary (v%@)"), v5);
LABEL_7:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);

      break;
    case 5:
      v3 = CFSTR("Additional Indexable");
      break;
    case 6:
      v3 = CFSTR("Media URL");
      break;
    case 7:
      v3 = CFSTR("Spotlight Attributes");
      break;
    case 8:
      v3 = CFSTR("Export Drawing");
      break;
    default:
      v3 = CFSTR("Attachment");
      break;
  }
  return v3;
}

- (void)updateViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachmentImageView](self, "attachmentImageView"));
  objc_msgSend(v5, "setImage:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (void)startCoreSpotlightSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id from;
  id location;
  const __CFString *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController searchOperationQueue](self, "searchOperationQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController attachment](self, "attachment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchIndexingIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(_ICItemRelatedNoteUniqueIdentifier == \"%@\")"), v6));

  v8 = objc_alloc((Class)ICSearchQueryOperation);
  v17 = CFSTR("_kMDItemSDBInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v10 = objc_msgSend(v8, "initWithQueryString:rankingQueries:attributes:", v7, &__NSArray0__struct, v9);

  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010F86C;
  v12[3] = &unk_10054FC48;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  objc_msgSend(v10, "setCompletionBlock:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICAttachmentInspectorViewController searchOperationQueue](self, "searchOperationQueue"));
  objc_msgSend(v11, "addOperation:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (UIImageView)attachmentImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_attachmentImageView);
}

- (void)setAttachmentImageView:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentImageView, a3);
}

- (NSOperationQueue)searchOperationQueue
{
  return self->_searchOperationQueue;
}

- (void)setSearchOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_searchOperationQueue, a3);
}

- (NSArray)spotlightResults
{
  return self->_spotlightResults;
}

- (void)setSpotlightResults:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightResults, a3);
}

- (BOOL)regenerateMetadataOnClose
{
  return self->_regenerateMetadataOnClose;
}

- (void)setRegenerateMetadataOnClose:(BOOL)a3
{
  self->_regenerateMetadataOnClose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightResults, 0);
  objc_storeStrong((id *)&self->_searchOperationQueue, 0);
  objc_destroyWeak((id *)&self->_attachmentImageView);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
