@implementation THNavigationHistoryStepperController

- (THNavigationHistoryStepperController)init
{
  THNavigationHistoryStepperController *v2;
  NSNotificationCenter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNavigationHistoryStepperController;
  v2 = -[THNavigationHistoryStepperController init](&v5, "init");
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", v2, "p_handleNavigationHistoryDidChange:", THNavigationHistoryDidChangeNotification, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[THNavigationHistoryStepperController bookspotHistoryStack](self, "bookspotHistoryStack"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationHistoryStepperController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THNavigationHistoryStepperController.m"), 37, CFSTR("should have been torn down"));
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  self->_pageIndexFormatter = 0;
  self->_bookspotHistoryStack = 0;
  self->_chrome = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNavigationHistoryStepperController;
  -[THNavigationHistoryStepperController dealloc](&v3, "dealloc");
}

- (void)teardown
{
  self->_pageIndexFormatter = 0;
  self->_bookspotHistoryStack = 0;
  self->_chrome = 0;
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
}

- (void)jumpToPrev:(id)a3
{
  -[THBookspotHistoryStack gotoPrevBookspot](-[THNavigationHistoryStepperController bookspotHistoryStack](self, "bookspotHistoryStack", a3), "gotoPrevBookspot");
}

- (void)jumpToNext:(id)a3
{
  -[THBookspotHistoryStack gotoNextBookspot](-[THNavigationHistoryStepperController bookspotHistoryStack](self, "bookspotHistoryStack", a3), "gotoNextBookspot");
}

- (void)updateHistoryNavigation
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  char v10;
  THNavigationHistoryStepperChrome *v11;

  if (-[THNavigationHistoryStepperController chrome](self, "chrome"))
  {
    v3 = -[THBookspotHistoryStack prevBookspot](-[THNavigationHistoryStepperController bookspotHistoryStack](self, "bookspotHistoryStack"), "prevBookspot");
    v4 = -[THBookspotHistoryStack nextBookspot](-[THNavigationHistoryStepperController bookspotHistoryStack](self, "bookspotHistoryStack"), "nextBookspot");
    v5 = v4;
    if (v3)
    {
      v6 = -[THBookPresentationPageIndexFormatter pageNumberStringForLocation:](-[THNavigationHistoryStepperController pageIndexFormatter](self, "pageIndexFormatter"), "pageNumberStringForLocation:", v3);
      if (v5)
      {
LABEL_4:
        v7 = -[THBookPresentationPageIndexFormatter pageNumberStringForLocation:](-[THNavigationHistoryStepperController pageIndexFormatter](self, "pageIndexFormatter"), "pageNumberStringForLocation:", v5);
        goto LABEL_8;
      }
    }
    else
    {
      v6 = 0;
      if (v4)
        goto LABEL_4;
    }
    v7 = 0;
LABEL_8:
    if (v3)
    {
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Back to page %@"), &stru_43D7D8, 0), v6);
      if (v5)
      {
LABEL_10:
        v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Go to page %@"), &stru_43D7D8, 0), v7);
        goto LABEL_13;
      }
    }
    else
    {
      v8 = &stru_43D7D8;
      if (v5)
        goto LABEL_10;
    }
    v9 = &stru_43D7D8;
LABEL_13:
    v10 = objc_opt_respondsToSelector(-[THNavigationHistoryStepperController chrome](self, "chrome"), "setPrevButtonTitle:andPrevButtonEnable:nextButtonTitle:andNextButtonEnabled:");
    v11 = -[THNavigationHistoryStepperController chrome](self, "chrome");
    if ((v10 & 1) != 0)
    {
      -[THNavigationHistoryStepperChrome setPrevButtonTitle:andPrevButtonEnable:nextButtonTitle:andNextButtonEnabled:](v11, "setPrevButtonTitle:andPrevButtonEnable:nextButtonTitle:andNextButtonEnabled:", v8, v3 != 0);
    }
    else
    {
      -[THNavigationHistoryStepperChrome setPrevButtonTitle:andEnable:](v11, "setPrevButtonTitle:andEnable:", v8, v3 != 0);
      -[THNavigationHistoryStepperChrome setNextButtonTitle:andEnable:](-[THNavigationHistoryStepperController chrome](self, "chrome"), "setNextButtonTitle:andEnable:", v9, v5 != 0);
    }
  }
}

- (THBookPresentationPageIndexFormatter)pageIndexFormatter
{
  return self->_pageIndexFormatter;
}

- (void)setPageIndexFormatter:(id)a3
{
  self->_pageIndexFormatter = (THBookPresentationPageIndexFormatter *)a3;
}

- (THBookspotHistoryStack)bookspotHistoryStack
{
  return self->_bookspotHistoryStack;
}

- (void)setBookspotHistoryStack:(id)a3
{
  self->_bookspotHistoryStack = (THBookspotHistoryStack *)a3;
}

- (THNavigationHistoryStepperChrome)chrome
{
  return self->_chrome;
}

- (void)setChrome:(id)a3
{
  self->_chrome = (THNavigationHistoryStepperChrome *)a3;
}

@end
