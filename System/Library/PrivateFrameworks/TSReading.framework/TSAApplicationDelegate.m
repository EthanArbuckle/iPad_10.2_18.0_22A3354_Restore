@implementation TSAApplicationDelegate

- (TSAApplicationDelegate)init
{
  TSAApplicationDelegate *v2;
  TSAApplicationDelegate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSAApplicationDelegate;
  v2 = -[TSABaseApplicationDelegate init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    +[TSWPURLDataDetector setInvalidURLSchemes:](TSWPURLDataDetector, "setInvalidURLSchemes:", -[TSABaseApplicationDelegate invalidURLSchemes](v2, "invalidURLSchemes"));
    +[TSWPDataDetectors registerDataDetectorClass:](TSWPDataDetectors, "registerDataDetectorClass:", objc_opt_class());
  }
  return v3;
}

+ (id)sharedDelegate
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSAApplicationDelegate;
  return objc_msgSendSuper2(&v3, sel_sharedDelegate);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAApplicationDelegate;
  -[TSABaseApplicationDelegate dealloc](&v3, sel_dealloc);
}

- (void)persistenceError:(id)a3
{
  NSLog((NSString *)CFSTR("A persistence error occurred: %@"), a2, a3);
}

- (id)previewImageNameForDocumentType:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSAApplicationDelegate previewImageNameForDocumentType:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSAApplicationDelegate.m"), 113, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSAApplicationDelegate previewImageNameForDocumentType:]"), 0));
}

- (id)previewImageNameForNativeDocument
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSAApplicationDelegate previewImageNameForNativeDocument]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSAApplicationDelegate.m"), 118, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSAApplicationDelegate previewImageNameForNativeDocument]"), 0));
}

- (id)previewImageNameForEncryptedNativeDocument
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSAApplicationDelegate previewImageNameForEncryptedNativeDocument]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSAApplicationDelegate.m"), 123, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSAApplicationDelegate previewImageNameForEncryptedNativeDocument]"), 0));
}

- (id)noDocumentsImagePath
{
  return (id)objc_msgSend((id)TSABundle(), "pathForResource:ofType:", CFSTR("TSAApplicationNoDocumentsImage"), CFSTR("png"));
}

- (id)image32IconForTXTFiles
{
  return CFSTR("TSA_Text_32.png");
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C78], "sharedManager", a3), "didReceiveMemoryWarning");
}

- (id)stringForImportingDocument
{
  return (id)objc_msgSend((id)TSABundle(), "localizedStringForKey:value:table:", CFSTR("Importing\\U2026"), &stru_24D82FEB0, CFSTR("TSApplication"));
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (BOOL)isActivating
{
  return self->_activating;
}

- (void)setActivating:(BOOL)a3
{
  self->_activating = a3;
}

- (BOOL)isInBackground
{
  return self->_inBackground;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (id)alertCompletionBlock
{
  return self->_alertCompletionBlock;
}

- (void)setAlertCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasNotifiedEnterBackground
{
  return self->_hasNotifiedEnterBackground;
}

- (void)setHasNotifiedEnterBackground:(BOOL)a3
{
  self->_hasNotifiedEnterBackground = a3;
}

@end
