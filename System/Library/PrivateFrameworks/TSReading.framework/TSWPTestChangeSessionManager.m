@implementation TSWPTestChangeSessionManager

- (TSWPTestChangeSessionManager)initWithContext:(id)a3
{
  TSWPTestChangeSessionManager *v4;
  TSKAnnotationAuthor *v5;
  TSKAnnotationAuthor *v6;
  TSWPChangeSession *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPTestChangeSessionManager;
  v4 = -[TSWPTestChangeSessionManager init](&v9, sel_init);
  if (v4)
  {
    v5 = [TSKAnnotationAuthor alloc];
    v6 = -[TSKAnnotationAuthor initWithContext:name:color:](v5, "initWithContext:name:color:", a3, CFSTR("Testing Author"), objc_msgSend(MEMORY[0x24BEB3C40], "greenColor"));
    v7 = -[TSPObject initWithContext:]([TSWPChangeSession alloc], "initWithContext:", a3);
    v4->_currentSession = v7;
    -[TSWPChangeSession setSessionUID:](v7, "setSessionUID:", 1);
    -[TSWPChangeSession setAuthor:](v4->_currentSession, "setAuthor:", v6);
    -[TSWPChangeSession setDate:](v4->_currentSession, "setDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTestChangeSessionManager;
  -[TSWPTestChangeSessionManager dealloc](&v3, sel_dealloc);
}

- (id)changeSessionAuthorCreatedWithCommand:(id *)a3
{
  id result;
  void *v5;
  uint64_t v6;

  result = self->_currentSession;
  if (!result)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTestChangeSessionManager changeSessionAuthorCreatedWithCommand:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTestChangeSessionManager.mm"), 48, CFSTR("invalid nil value for '%s'"), "_currentSession");
    return self->_currentSession;
  }
  return result;
}

- (void)startNewChangeSessionIfNecessaryGettingInsertAuthorCommand:(id *)a3
{
  TSWPChangeSession *currentSession;
  void *v5;
  uint64_t v6;
  TSWPChangeSession *v7;

  currentSession = self->_currentSession;
  if (!currentSession)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTestChangeSessionManager startNewChangeSessionIfNecessaryGettingInsertAuthorCommand:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTestChangeSessionManager.mm"), 55, CFSTR("invalid nil value for '%s'"), "_currentSession");
    currentSession = self->_currentSession;
  }
  v7 = currentSession;
  self->_currentSession = -[TSPObject initWithContext:]([TSWPChangeSession alloc], "initWithContext:", -[TSPObject context](currentSession, "context"));
  -[TSWPChangeSession setSessionUID:](self->_currentSession, "setSessionUID:", -[TSWPChangeSession sessionUID](v7, "sessionUID") + 1);
  -[TSWPChangeSession setAuthor:](self->_currentSession, "setAuthor:", -[TSWPChangeSession author](v7, "author"));
  -[TSWPChangeSession setDate:](self->_currentSession, "setDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));

}

- (BOOL)isTrackingChanges
{
  return 1;
}

@end
