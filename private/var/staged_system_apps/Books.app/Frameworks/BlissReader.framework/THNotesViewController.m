@implementation THNotesViewController

+ (id)newNotesViewController
{
  return -[THNotesViewControllerPad initWithNibName:bundle:]([THNotesViewControllerPad alloc], "initWithNibName:bundle:", 0, 0);
}

- (THNotesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  THNotesViewController *v7;
  objc_super v9;

  v6 = THBundle();
  v9.receiver = self;
  v9.super_class = (Class)THNotesViewController;
  v7 = -[THNotesViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, v6);
  if (v7
    && -[THNotesViewController isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class(THNotesViewController)))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController initWithNibName:bundle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 54, CFSTR("Abstract class"));
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[THNotesViewController cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewController;
  -[THNotesViewController dealloc](&v3, "dealloc");
}

- (void)cleanup
{

  self->_selectedAnnotations = 0;
  self->_mutableSectionProviders = 0;

  self->_mailComposeViewController = 0;
  self->_activityController = 0;
  -[THNotesViewController p_releaseChildViewControllers](self, "p_releaseChildViewControllers");
}

- (void)setBookViewController:(id)a3
{
  if (self->_bookViewController != a3)
  {
    self->_bookViewController = (THBookViewController *)a3;
    -[THNotesDetailTableViewController setBookViewController:](self->_notesDetailViewController, "setBookViewController:");
  }
}

- (NSArray)sectionProviders
{
  return &self->_mutableSectionProviders->super;
}

- (id)sizingDelegate
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THNotesViewController;
  -[THNotesViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "keyboardDidHide:", UIKeyboardDidHideNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "keyboardDidShow:", UIKeyboardDidShowNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THNotesViewController;
  -[THNotesViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIKeyboardDidHideNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIKeyboardDidShowNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewController;
  -[THNotesViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(-[THNotesViewController view](self, "view"), "setAutoresizingMask:", 18);
  -[THNotesViewController p_setupChildViewControllers](self, "p_setupChildViewControllers");
  self->_notesExist = 0;
}

- (id)p_allAnnotationsForSearchText:(id)a3
{
  id v5;
  THAnnotationStorageController *annotationController;
  id v7;

  v5 = objc_msgSend(a3, "length");
  annotationController = self->_annotationController;
  if (v5)
    v7 = -[THAnnotationStorageController annotationRequestForSearchText:](annotationController, "annotationRequestForSearchText:", a3);
  else
    v7 = -[THAnnotationStorageController annotationRequestForAllNotes](annotationController, "annotationRequestForAllNotes");
  return -[THAnnotationStorageController cachedAnnotationsForFetchRequest:migrateIfNecessary:](self->_annotationController, "cachedAnnotationsForFetchRequest:migrateIfNecessary:", v7, 0);
}

- (id)p_nonOrphanedAnnotationsForSearchText:(id)a3
{
  id v5;
  THAnnotationStorageController *annotationController;
  id v7;

  v5 = objc_msgSend(a3, "length");
  annotationController = self->_annotationController;
  if (v5)
    v7 = -[THAnnotationStorageController annotationRequestForNonOrphanedSearchText:](annotationController, "annotationRequestForNonOrphanedSearchText:", a3);
  else
    v7 = -[THAnnotationStorageController annotationRequestForNonOrphanedNotes](annotationController, "annotationRequestForNonOrphanedNotes");
  return -[THAnnotationStorageController cachedAnnotationsForFetchRequest:migrateIfNecessary:](self->_annotationController, "cachedAnnotationsForFetchRequest:migrateIfNecessary:", v7, 0);
}

- (id)p_orphanedAnnotationsForSearchText:(id)a3
{
  id v5;
  THAnnotationStorageController *annotationController;
  id v7;

  v5 = objc_msgSend(a3, "length");
  annotationController = self->_annotationController;
  if (v5)
    v7 = -[THAnnotationStorageController annotationRequestForOrphanedSearchText:](annotationController, "annotationRequestForOrphanedSearchText:", a3);
  else
    v7 = -[THAnnotationStorageController annotationRequestForOrphanedNotes](annotationController, "annotationRequestForOrphanedNotes");
  return -[THAnnotationStorageController cachedAnnotationsForFetchRequest:migrateIfNecessary:](self->_annotationController, "cachedAnnotationsForFetchRequest:migrateIfNecessary:", v7, 0);
}

- (void)p_updateNotesExist
{
  id v3;

  if (objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length"))
    v3 = objc_msgSend(-[THNotesViewController p_allAnnotationsForSearchText:](self, "p_allAnnotationsForSearchText:", &stru_43D7D8), "count");
  else
    v3 = -[THNotesViewController numberOfNotes](self, "numberOfNotes");
  self->_notesExist = v3 != 0;
}

- (void)updateSectionProviders
{
  id v3;
  id v4;
  id v5;
  NSMutableArray *mutableSectionProviders;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = -[THNotesViewController p_nonOrphanedAnnotationsForSearchText:](self, "p_nonOrphanedAnnotationsForSearchText:", -[THNotesViewController searchText](self, "searchText"));
  v4 = -[THNotesViewController p_orphanedAnnotationsForSearchText:](self, "p_orphanedAnnotationsForSearchText:", -[THNotesViewController searchText](self, "searchText"));
  v5 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot"), "navigationModel");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mutableSectionProviders = self->_mutableSectionProviders;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableSectionProviders, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(mutableSectionProviders);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "updateWithAllAnnotations:orphanedAnnotations:annotationController:navigationModel:", v3, v4, self->_annotationController, v5);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableSectionProviders, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[THNotesViewController p_updateNotesExist](self, "p_updateNotesExist");
  -[THNotesSidebarViewController updateVisibleIndexes](self->_notesSidebarViewController, "updateVisibleIndexes");
  if (-[THNotesSidebarViewController providerIndex](self->_notesSidebarViewController, "providerIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v11 = 0;
  else
    v11 = -[NSMutableArray objectAtIndex:](self->_mutableSectionProviders, "objectAtIndex:", -[THNotesSidebarViewController providerIndex](self->_notesSidebarViewController, "providerIndex"));
  -[THNotesDetailTableViewController reloadWithSections:force:](self->_notesDetailViewController, "reloadWithSections:force:", objc_msgSend(v11, "sectionArray"), 1);
  -[THNotesViewController sectionProvidersDidChange](self, "sectionProvidersDidChange");
}

- (void)noteWasDeleted
{
  objc_msgSend(-[THDocumentViewController canvasViewController](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "canvasViewController"), "layoutInvalidated");
  -[THNotesViewController updateSectionProviders](self, "updateSectionProviders");
}

- (unint64_t)numberOfNotes
{
  NSMutableArray *mutableSectionProviders;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  mutableSectionProviders = self->_mutableSectionProviders;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableSectionProviders, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(mutableSectionProviders);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
      v9 = objc_opt_class(THNotesViewAllChapters);
      *(_QWORD *)&v10 = TSUDynamicCast(v9, v8).n128_u64[0];
      if (!v11)
        v5 += (unint64_t)objc_msgSend(v8, "annotationCount", v10);
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mutableSectionProviders, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v10);
  }
  while (v4);
  return v5;
}

- (void)updateWithNavigationUnit:(id)a3
{
  THAnnotationStorageController *annotationController;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  THNotesViewChapter *v12;
  uint64_t v13;
  THNotesViewChapter *v14;
  THNotesViewAllChapters *v15;
  THNotesViewOrphans *v16;
  NSMutableArray *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  THNotesViewController *v21;

  annotationController = self->_annotationController;
  if (!annotationController)
  {
    annotationController = (THAnnotationStorageController *)objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot"), "annotationController");
    self->_annotationController = annotationController;
    if (!annotationController)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController updateWithNavigationUnit:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 265, CFSTR("expected to have an instantiated annotation controller"));
      annotationController = self->_annotationController;
    }
  }
  -[THAnnotationStorageController ensureNonSponsoredAnnotationsAreMigrated](annotationController, "ensureNonSponsoredAnnotationsAreMigrated");
  v6 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot"), "navigationModel");
  v21 = self;
  v7 = objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](-[THNotesViewController bookViewController](self, "bookViewController"), "documentViewController"), "documentRoot"), "tocModel");
  v8 = +[NSMutableArray array](NSMutableArray, "array");
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v10 = objc_msgSend(v6, "firstNavigationUnit");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = -[THNotesViewChapter initWithNavigationUnit:navigationModel:tocModel:chapterIndex:]([THNotesViewChapter alloc], "initWithNavigationUnit:navigationModel:tocModel:chapterIndex:", v11, v6, v7, v13);
      objc_msgSend(v9, "addObject:", v11);
      objc_msgSend(v8, "addObject:", v14);

      if (a3 && (!v12 || objc_msgSend(v11, "isEqual:", a3)))
        v12 = v14;
      v11 = objc_msgSend(v6, "navigationUnitFollowingNavigationUnit:", v11);
      ++v13;
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v15 = -[THNotesViewAllChapters initWithNavigationUnits:navigationModel:]([THNotesViewAllChapters alloc], "initWithNavigationUnits:navigationModel:", v9, v6);
  objc_msgSend(v8, "insertObject:atIndex:", v15, 0);

  v16 = objc_alloc_init(THNotesViewOrphans);
  objc_msgSend(v8, "addObject:", v16);

  v17 = (NSMutableArray *)v8;
  v21->_mutableSectionProviders = v17;
  v18 = -[THNotesSidebarViewController setSectionProviders:](v21->_notesSidebarViewController, "setSectionProviders:", v17);
  if (TSUPadUI(v18, v19))
    v20 = 1;
  else
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
    v20 = (uint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](v21->_mutableSectionProviders, "indexOfObjectIdenticalTo:", v12);
  -[THNotesSidebarViewController setProviderIndex:](v21->_notesSidebarViewController, "setProviderIndex:", v20);
  -[THNotesViewController updateSectionProviders](v21, "updateSectionProviders");
  -[THNotesDetailTableViewController scrollToTop](v21->_notesDetailViewController, "scrollToTop");
}

- (void)p_setupChildViewControllers
{
  THNotesSidebarViewController *notesSidebarViewController;

  notesSidebarViewController = self->_notesSidebarViewController;
  if (!notesSidebarViewController)
  {
    self->_notesSidebarViewController = -[THNotesSidebarViewController initWithNibName:bundle:]([THNotesSidebarViewController alloc], "initWithNibName:bundle:", 0, THBundle());
    -[THNotesSidebarViewController setSidebarDelegate:](self->_notesSidebarViewController, "setSidebarDelegate:", -[THNotesViewController sizingDelegate](self, "sizingDelegate"));
    notesSidebarViewController = self->_notesSidebarViewController;
  }
  -[THNotesSidebarViewController view](notesSidebarViewController, "view");
  -[UISearchBar setDelegate:](-[THNotesSidebarViewController searchBar](self->_notesSidebarViewController, "searchBar"), "setDelegate:", self);
  -[THNotesDetailTableViewController setBookViewController:](self->_notesDetailViewController, "setBookViewController:", -[THNotesViewController bookViewController](self, "bookViewController"));
}

- (void)p_releaseChildViewControllers
{
  -[THNotesDetailTableViewController setDelegate:](self->_notesDetailViewController, "setDelegate:", 0);
  -[THNotesDetailTableViewController setBookViewController:](self->_notesDetailViewController, "setBookViewController:", 0);

  self->_notesDetailViewController = 0;
  self->_notesSidebarViewController = 0;
}

- (void)finishedDismissing
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController finishedDismissing]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 358, CFSTR("Subclass must implement"));
}

- (id)searchText
{
  return -[THNotesSidebarViewController searchText](self->_notesSidebarViewController, "searchText");
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  objc_msgSend(a3, "setShowsCancelButton:animated:", 1, 1);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  objc_msgSend(a3, "setShowsCancelButton:animated:", 0, 1);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[THNotesViewController searchTextDidChange](self, "searchTextDidChange", a3, a4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  objc_msgSend(a3, "setText:", 0);
  objc_msgSend(a3, "resignFirstResponder");
  -[THNotesViewController searchTextDidChange](self, "searchTextDidChange");
}

- (id)sidebarContentViewController:(id)a3 viewControllerForSectionProvider:(id)a4
{
  return 0;
}

- (BOOL)isCollapsedForSidebarContentViewController:(id)a3
{
  return 0;
}

- (void)showWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a5, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController showWithPrepare:duration:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 467, CFSTR("Subclass must implement"));
}

- (void)hideWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a5, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController hideWithPrepare:duration:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 472, CFSTR("Subclass must implement"));
}

- (void)showForExitStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a5, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController showForExitStudyModeWithPrepare:duration:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 477, CFSTR("Subclass must implement"));
}

- (void)hideForEnterStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a5, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController hideForEnterStudyModeWithPrepare:duration:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 482, CFSTR("Subclass must implement"));
}

- (id)annotationsForIndexPaths:(id)a3 updateChapterTitle:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSString *v14;
  _BOOL4 v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a4;
  v18 = +[NSMutableArray array](NSMutableArray, "array");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = a3;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v16 = v4;
    do
    {
      v11 = 0;
      v17 = v9;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
        v13 = -[THNotesDetailTableViewController cachedAnnotationForIndexPath:](self->_notesDetailViewController, "cachedAnnotationForIndexPath:", v12);
        if (v4)
        {
          v14 = -[THNotesDetailTableViewController sectionTitleForIndexPath:](self->_notesDetailViewController, "sectionTitleForIndexPath:", v12);
          if (!v14)
          {
            v4 = v16;
            v9 = v17;
            v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Chapter %lu: %@"), &stru_43D7D8, 0), (char *)-[THNotesSidebarViewController providerIndex](self->_notesSidebarViewController, "providerIndex")+ 1, objc_msgSend(-[NSMutableArray objectAtIndex:](self->_mutableSectionProviders, "objectAtIndex:", -[THNotesSidebarViewController providerIndex](self->_notesSidebarViewController, "providerIndex")),
                      "title"));
          }
          v13 = -[THAnnotationStorageController modifiedAnnotation:withChapterTitle:physicalPageNumber:](-[THNotesViewController annotationController](self, "annotationController"), "modifiedAnnotation:withChapterTitle:physicalPageNumber:", v13, v14, -[THBookViewController pageNumberStringForAnnotation:](self->_bookViewController, "pageNumberStringForAnnotation:", v13));
        }
        if (v13)
          objc_msgSend(v18, "addObject:", v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  return v18;
}

- (void)handleEmail:(id)a3
{
  id v4;
  NSMutableArray *selectedAnnotations;
  id v6;
  UIAlertController *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  NSMutableArray *v11;
  id v12;

  if (+[MFMailComposeViewController canSendMail](MFMailComposeViewController, "canSendMail", a3))
  {
    v4 = -[NSMutableDictionary allKeys](-[THNotesDetailTableViewController selectedNotes](self->_notesDetailViewController, "selectedNotes"), "allKeys");
    if (objc_msgSend(v4, "count"))
    {
      selectedAnnotations = (NSMutableArray *)objc_msgSend(-[THNotesViewController annotationsForIndexPaths:updateChapterTitle:](self, "annotationsForIndexPaths:updateChapterTitle:", v4, 1), "mutableCopy");
      self->_selectedAnnotations = selectedAnnotations;
    }
    else
    {
      selectedAnnotations = self->_selectedAnnotations;
    }
    v10 = -[NSMutableArray count](selectedAnnotations, "count");
    v11 = self->_selectedAnnotations;
    if (v10)
    {
      if (v11)
      {
        -[THNotesViewController p_finishHandleEmail](self, "p_finishHandleEmail");
        return;
      }
    }
    else
    {

      self->_selectedAnnotations = 0;
    }
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController handleEmail:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 540, CFSTR("Should not be able to attempt to email annotations unless some were chosen"));
    v12 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Email Notes"), &stru_43D7D8, 0);
    v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Cannot email notes; no valid annotations were selected"),
             &stru_43D7D8,
             0),
           1);
    v8 = (void *)THBundle();
    v9 = CFSTR("Cancel");
  }
  else
  {
    v6 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("No email accounts configured"), &stru_43D7D8, 0);
    v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Add a mail account in Settings to send mail from Apple Books."), &stru_43D7D8, 0), 1);
    v8 = (void *)THBundle();
    v9 = CFSTR("OK");
  }
  -[UIAlertController addAction:](v7, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_43D7D8, 0), 1, 0));
  -[THNotesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (id)p_subject
{
  THBookDescription *v3;
  unint64_t v4;
  id v5;
  NSString *v6;
  void *v7;
  const __CFString *v8;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[THBookViewController bookDescription](-[THNotesViewController bookViewController](self, "bookViewController"), "bookDescription");
  v4 = -[THNotesSidebarViewController providerIndex](self->_notesSidebarViewController, "providerIndex");
  v5 = -[NSMutableArray objectAtIndex:](self->_mutableSectionProviders, "objectAtIndex:", v4);
  v6 = -[THBookDescription bookTitle](v3, "bookTitle");
  if (!v6)
    v6 = (NSString *)objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("untitled book"), CFSTR("Untitled"), 0);
  if (objc_msgSend(v5, "isAllNotes"))
  {
    v7 = (void *)THBundle();
    v8 = CFSTR("Notes from \\U201C%@,\\U201D All Chapters");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_43D7D8, 0), v6, v11, v12);
  }
  if (objc_msgSend(v5, "isOrphanedNotes"))
  {
    v7 = (void *)THBundle();
    v8 = CFSTR("Old Notes from \\U201C%@\\U201D");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_43D7D8, 0), v6, v11, v12);
  }
  v10 = objc_msgSend(v5, "title");
  if (!v10)
    v10 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("untitled chapter"), CFSTR("Untitled"), 0);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Notes from \\U201C%@,\\U201D Chapter %lu: %@"), &stru_43D7D8, 0), v6, v4 + 1, v10);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[THNotesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5);

  self->_mailComposeViewController = 0;
}

- (void)dismissActivityController:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = sub_125AAC;
  v4[4] = sub_125ABC;
  v4[5] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_125AC8;
  v3[3] = &unk_426FA8;
  v3[4] = v4;
  objc_msgSend(-[IMActivityController viewController](-[THNotesViewController activityController](self, "activityController"), "viewController"), "dismissViewControllerAnimated:completion:", a3, v3);
  _Block_object_dispose(v4, 8);
}

- (void)handleAction:(id)a3
{
  id v5;
  char *v6;
  char *v7;
  THBookViewController *v8;
  THBookViewController *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  _QWORD v17[5];
  _QWORD v18[6];
  id v19;

  -[THNotesViewController dismissActivityController:](self, "dismissActivityController:", 1);
  v5 = -[THNotesViewController annotationsForIndexPaths:updateChapterTitle:](self, "annotationsForIndexPaths:updateChapterTitle:", -[NSMutableDictionary allKeys](-[THNotesDetailTableViewController selectedNotes](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "selectedNotes"), "allKeys"), 1);
  v6 = (char *)objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = -[THNotesViewController bookViewController](self, "bookViewController");
    v9 = v8;
    v10 = v7 == (_BYTE *)&dword_0 + 1
        ? -[THBookViewController activityItemProviderWithCachedAnnotation:](v8, "activityItemProviderWithCachedAnnotation:", objc_msgSend(v5, "objectAtIndex:", 0)): -[THBookViewController activityItemProviderWithCachedAnnotations:](v8, "activityItemProviderWithCachedAnnotations:", v5);
    if (v10)
    {
      v19 = v10;
      v11 = objc_msgSend(objc_alloc((Class)IMActivityController), "initWithActivityItems:applicationActivities:shareType:propertySource:tracker:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1), 0, objc_msgSend(v10, "shareType"), objc_msgSend(v10, "propertySource"), -[THNotesViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
      -[THNotesViewController setActivityController:](self, "setActivityController:", v11);
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3052000000;
      v18[3] = sub_125AAC;
      v18[4] = sub_125ABC;
      v18[5] = self;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_125DE0;
      v17[3] = &unk_429DB8;
      v17[4] = v18;
      -[IMActivityController setCompletionHandler:](-[THNotesViewController activityController](self, "activityController"), "setCompletionHandler:", v17);

      -[IMActivityController setManagedBook:](-[THNotesViewController activityController](self, "activityController"), "setManagedBook:", objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](v9, "documentViewController"), "documentRoot"), "bookDescription"), "asset"), "isManagedBook"));
      v12 = -[IMActivityController viewController](-[THNotesViewController activityController](self, "activityController"), "viewController");
      objc_msgSend(v12, "setModalPresentationStyle:", 7);
      objc_msgSend(v12, "setOverrideUserInterfaceStyle:", -[THNotesViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
      v13 = objc_msgSend(v12, "popoverPresentationController");
      objc_msgSend(v13, "setPermittedArrowDirections:", 15);
      v14 = objc_opt_class(UIBarButtonItem);
      *(_QWORD *)&v16 = TSUDynamicCast(v14, a3).n128_u64[0];
      if (v15)
      {
        objc_msgSend(v13, "setBarButtonItem:", v15, v16);
      }
      else if ((objc_opt_respondsToSelector(a3, "frame") & 1) != 0)
      {
        objc_msgSend(v13, "setSourceView:", objc_msgSend(a3, "superview"));
        objc_msgSend(a3, "frame");
        objc_msgSend(v13, "setSourceRect:");
      }
      objc_msgSend(v13, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", self);
      -[THNotesViewController bc_presentViewController:animated:tintColor:completion:](self, "bc_presentViewController:animated:tintColor:completion:", v12, 1, +[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"), 0);
      _Block_object_dispose(v18, 8);
    }
  }
}

- (void)endEditingDidDelete:(BOOL)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewController endEditingDidDelete:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewController.m"), 695, CFSTR("subclass responsibility"));
}

- (void)p_deleteSelectedNotes
{
  -[THNotesDetailTableViewController deleteSelectedNotes](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "deleteSelectedNotes");
  -[THNotesViewController endEditingDidDelete:](self, "endEditingDidDelete:", 1);
}

- (void)handleDelete:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  UIAlertController *v11;
  _QWORD v12[5];

  -[THNotesViewController dismissActivityController:](self, "dismissActivityController:", 1);
  if (-[THNotesDetailTableViewController countOfUserNotesToDelete](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "countOfUserNotesToDelete"))
  {
    v4 = -[THNotesDetailTableViewController countOfItemsToDelete](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "countOfItemsToDelete");
    if (v4)
    {
      if (v4 == 1)
        v5 = CFSTR("Delete Highlight");
      else
        v5 = CFSTR("Delete Highlights");
      if (v4 == 1)
        v6 = CFSTR("The associated note will also be deleted.");
      else
        v6 = CFSTR("Any associated notes will also be deleted.");
      v7 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", v5, &stru_43D7D8, 0);
      v8 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", v6, &stru_43D7D8, 0);
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
    v9 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_43D7D8, 0);
    v10 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_43D7D8, 0);
    v11 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    -[UIAlertController addAction:](v11, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 1, 0));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_12605C;
    v12[3] = &unk_427300;
    v12[4] = self;
    -[UIAlertController addAction:](v11, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 2, v12));
    -[THNotesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }
  else
  {
    -[THNotesViewController p_deleteSelectedNotes](self, "p_deleteSelectedNotes");
  }
}

- (THAnnotationStorageController)annotationController
{
  return self->_annotationController;
}

- (void)setAnnotationController:(id)a3
{
  self->_annotationController = (THAnnotationStorageController *)a3;
}

- (THNotesSidebarViewController)notesSidebarViewController
{
  return self->_notesSidebarViewController;
}

- (void)setNotesSidebarViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THNotesDetailTableViewController)notesDetailViewController
{
  return self->_notesDetailViewController;
}

- (void)setNotesDetailViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THBookViewController)bookViewController
{
  return self->_bookViewController;
}

- (BOOL)shouldDismissAfterRotate
{
  return self->_shouldDismissAfterRotate;
}

- (void)setShouldDismissAfterRotate:(BOOL)a3
{
  self->_shouldDismissAfterRotate = a3;
}

- (UIViewController)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
  self->_originalViewController = (UIViewController *)a3;
}

- (BOOL)notesExist
{
  return self->_notesExist;
}

- (NSMutableArray)mutableSectionProviders
{
  return self->_mutableSectionProviders;
}

- (void)setMutableSectionProviders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (MFMailComposeViewController)mailComposeViewController
{
  return self->_mailComposeViewController;
}

- (void)setMailComposeViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)selectedAnnotations
{
  return self->_selectedAnnotations;
}

- (void)setSelectedAnnotations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (IMActivityController)activityController
{
  return self->_activityController;
}

- (void)setActivityController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
