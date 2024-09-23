@implementation UIWebPDFSearchController

- (void)setDocumentToSearch:(id)a3
{
  id v5;

  if (self->_documentToSearch != a3)
  {
    v5 = a3;

    self->_documentToSearch = (UIPDFDocument *)a3;
    -[NSArray makeObjectsPerformSelector:withObject:](-[NSOperationQueue operations](self->_searchQueue, "operations"), "makeObjectsPerformSelector:withObject:", sel_setDocumentToSearch_, self->_documentToSearch);
  }
}

- (BOOL)searching
{
  NSUInteger v3;

  v3 = -[NSOperationQueue operationCount](self->_searchQueue, "operationCount");
  if (v3)
    LOBYTE(v3) = !-[UIWebPDFSearchController paused](self, "paused");
  return v3;
}

- (BOOL)paused
{
  return !-[NSOperationQueue isSuspended](self->_searchQueue, "isSuspended");
}

- (UIWebPDFSearchController)init
{
  UIWebPDFSearchController *v2;
  UIWebPDFSearchController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebPDFSearchController;
  v2 = -[UIWebPDFSearchController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIWebPDFSearchController setResultLimit:](v2, "setResultLimit:", 101);
    -[UIWebPDFSearchController setDocumentScale:](v3, "setDocumentScale:", 1.0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebPDFSearchController cancel](self, "cancel");
  -[UIWebPDFSearchController setDocumentToSearch:](self, "setDocumentToSearch:", 0);
  -[UIWebPDFSearchController setSearchString:](self, "setSearchString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchController;
  -[UIWebPDFSearchController dealloc](&v3, sel_dealloc);
}

- (unint64_t)_actualStartingPageIndex
{
  unint64_t pageIndexWhenLimitHit;
  unint64_t result;

  pageIndexWhenLimitHit = self->_pageIndexWhenLimitHit;
  result = -[UIWebPDFSearchController startingPageIndex](self, "startingPageIndex");
  if (pageIndexWhenLimitHit > result)
    return pageIndexWhenLimitHit;
  return result;
}

- (void)search:(id)a3
{
  NSOperationQueue *v5;
  UIWebPDFSearchOperation *v6;

  if (!-[NSString isEqualToString:](self->_searchString, "isEqualToString:"))
  {
    -[UIWebPDFSearchController cancel](self, "cancel");

    self->_searchString = (NSString *)a3;
  }
  if (-[UIWebPDFSearchController searchDelegate](self, "searchDelegate")
    && -[UIWebPDFSearchController documentToSearch](self, "documentToSearch")
    && objc_msgSend(a3, "length"))
  {
    if (!self->_searchQueue)
    {
      v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      self->_searchQueue = v5;
      -[NSOperationQueue setMaxConcurrentOperationCount:](v5, "setMaxConcurrentOperationCount:", 1);
    }
    if (!self->_results)
      self->_results = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_alloc_init(UIWebPDFSearchOperation);
    -[UIWebPDFSearchOperation setDocumentToSearch:](v6, "setDocumentToSearch:", -[UIWebPDFSearchController documentToSearch](self, "documentToSearch"));
    -[UIWebPDFSearchOperation setStartingPageIndex:](v6, "setStartingPageIndex:", -[UIWebPDFSearchController _actualStartingPageIndex](self, "_actualStartingPageIndex"));
    -[UIWebPDFSearchOperation setResultLimit:](v6, "setResultLimit:", -[UIWebPDFSearchController resultLimit](self, "resultLimit"));
    -[UIWebPDFSearchOperation setNumberOfResultsToSkip:](v6, "setNumberOfResultsToSkip:", self->_pageIndexWhenLimitHit);
    -[UIWebPDFSearchOperation setSearchString:](v6, "setSearchString:", a3);
    -[UIWebPDFSearchOperation setSearchDelegate:](v6, "setSearchDelegate:", self);
    -[UIWebPDFSearchController documentScale](self, "documentScale");
    -[UIWebPDFSearchOperation setDocumentScale:](v6, "setDocumentScale:");
    self->_notifiedThatSearchBegin = 0;
    -[NSOperationQueue addOperation:](self->_searchQueue, "addOperation:", v6);

  }
}

- (void)_clearSearchQueue
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSOperationQueue operations](self->_searchQueue, "operations", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setSearchDelegate:", 0);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSOperationQueue cancelAllOperations](self->_searchQueue, "cancelAllOperations");

  self->_searchQueue = 0;
}

- (void)cancel
{
  -[UIWebPDFSearchController _clearSearchQueue](self, "_clearSearchQueue");

  self->_results = 0;
}

- (void)pause
{
  -[NSOperationQueue setSuspended:](self->_searchQueue, "setSuspended:", 1);
}

- (void)resume
{
  -[NSOperationQueue setSuspended:](self->_searchQueue, "setSuspended:", 0);
  -[UIWebPDFSearchController search:](self, "search:", self->_searchString);
}

- (void)searchDidBegin:(id)a3
{
  if (!self->_notifiedThatSearchBegin)
  {
    self->_notifiedThatSearchBegin = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebPDFSearchControllerDelegate searchDidBegin:](self->searchDelegate, "searchDidBegin:", self);
  }
}

- (void)searchDidTimeOut:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFSearchControllerDelegate searchDidTimeOut:](self->searchDelegate, "searchDidTimeOut:", self);
}

- (void)searchWasCancelled:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFSearchControllerDelegate searchWasCancelled:](self->searchDelegate, "searchWasCancelled:", self);
}

- (void)searchLimitHit:(id)a3
{
  self->_pageIndexWhenLimitHit = objc_msgSend(a3, "currentPageIndex");
  self->_resultIndexWhenLimitHit = objc_msgSend(a3, "currentPageResultCount");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFSearchControllerDelegate searchLimitHit:](self->searchDelegate, "searchLimitHit:", self);
}

- (void)searchDidFinish:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFSearchControllerDelegate searchDidFinish:](self->searchDelegate, "searchDidFinish:", self);
  -[UIWebPDFSearchController _clearSearchQueue](self, "_clearSearchQueue");
  -[UIWebPDFSearchController setSearchString:](self, "setSearchString:", 0);
}

- (void)search:(id)a3 hasPartialResults:(id)a4
{
  -[NSMutableArray addObjectsFromArray:](self->_results, "addObjectsFromArray:", a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFSearchControllerDelegate search:hasPartialResults:](self->searchDelegate, "search:hasPartialResults:", self, a4);
}

- (UIPDFDocument)documentToSearch
{
  return self->_documentToSearch;
}

- (UIWebPDFSearchControllerDelegate)searchDelegate
{
  return self->searchDelegate;
}

- (void)setSearchDelegate:(id)a3
{
  self->searchDelegate = (UIWebPDFSearchControllerDelegate *)a3;
}

- (unint64_t)startingPageIndex
{
  return self->startingPageIndex;
}

- (void)setStartingPageIndex:(unint64_t)a3
{
  self->startingPageIndex = a3;
}

- (double)documentScale
{
  return self->documentScale;
}

- (void)setDocumentScale:(double)a3
{
  self->documentScale = a3;
}

- (unint64_t)resultLimit
{
  return self->resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->resultLimit = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSArray)results
{
  return &self->_results->super;
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
