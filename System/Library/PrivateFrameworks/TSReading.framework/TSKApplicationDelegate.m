@implementation TSKApplicationDelegate

- (TSKApplicationDelegate)init
{
  TSKApplicationDelegate *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKApplicationDelegate;
  v2 = -[TSKApplicationDelegate init](&v4, sel_init);
  if (v2)
  {
    +[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor");
    objc_msgSend(MEMORY[0x24BEB3C28], "installAsNSHandler");
    -[TSKApplicationDelegate setCompatibilityDelegate:](v2, "setCompatibilityDelegate:", -[TSKApplicationDelegate createCompatibilityDelegate](v2, "createCompatibilityDelegate"));
  }
  return v2;
}

- (void)setCompatibilityDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

+ (void)setSurrogateDelegate:(id)a3
{
  gSurrogateDelegate = (uint64_t)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKApplicationDelegate;
  -[TSKApplicationDelegate dealloc](&v3, sel_dealloc);
}

+ (BOOL)isUnitTesting
{
  return 0;
}

+ (id)sharedDelegate
{
  if (gSurrogateDelegate)
    return (id)gSurrogateDelegate;
  else
    return (id)objc_msgSend(a1, "platform_sharedDelegate");
}

- (NSString)applicationName
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate applicationName]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 114, CFSTR("Abstract method"));
  return 0;
}

- (NSString)documentTypeDisplayName
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate documentTypeDisplayName]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 120, CFSTR("Abstract method"));
  return 0;
}

- (NSString)templateTypeDisplayName
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate templateTypeDisplayName]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 126, CFSTR("Abstract method"));
  return 0;
}

+ (id)documentDirectoryPath
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", CFSTR("Documents"));
}

- (id)createCompatibilityDelegate
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate createCompatibilityDelegate]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 137, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKApplicationDelegate createCompatibilityDelegate]"), 0));
}

- (BOOL)centerOnInitialSelection
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate centerOnInitialSelection]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 142, CFSTR("Abstract method"));
  return 0;
}

- (BOOL)isCanvasFullScreen
{
  return 0;
}

- (CGRect)applicationToolbarFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldRenderContactShadow
{
  return 1;
}

- (BOOL)shouldRenderCurvedShadow
{
  return 1;
}

- (BOOL)supportsRTL
{
  return 0;
}

- (BOOL)supportsScrollingInPhoneCommentUI
{
  return 0;
}

- (BOOL)shouldValidateMasterLayoutWhileInsertingRows
{
  return 0;
}

- (id)previewImageForType:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate previewImageForType:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 193, CFSTR("Abstract method"));
  return 0;
}

- (id)appChartPropertyOverrides
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate appChartPropertyOverrides]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 200, CFSTR("Abstract method"));
  return 0;
}

- (id)invalidURLSchemes
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate invalidURLSchemes]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 206, CFSTR("Abstract method"));
  return 0;
}

- (id)validURLSchemes
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate validURLSchemes]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 212, CFSTR("Abstract method"));
  return 0;
}

- (BOOL)openURL:(id)a3
{
  return -[TSKApplicationDelegate openURL:sourceDocumentRoot:](self, "openURL:sourceDocumentRoot:", a3, 0);
}

- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate openURL:sourceDocumentRoot:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 224, CFSTR("Abstract method"));
  return 0;
}

- (id)defaultHyperlinkURL
{
  return 0;
}

- (BOOL)designModeEnabled
{
  return 0;
}

- (BOOL)performanceModeEnabled
{
  return 0;
}

- (BOOL)shouldGenerateGuidesForOffscreenLayouts
{
  return 1;
}

- (BOOL)isActivating
{
  return 0;
}

- (BOOL)isInBackground
{
  return 0;
}

- (id)toolbarButtonForModalDoneWithTarget:(id)a3 action:(SEL)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKApplicationDelegate toolbarButtonForModalDoneWithTarget:action:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKApplicationDelegate.m"), 279, CFSTR("Abstract method"));
  return 0;
}

- (TSKCompatibilityDelegate)compatibilityDelegate
{
  return self->_compatibilityDelegate;
}

- (BOOL)tableHeaderInspectorShowsFreezeHeaderRowsSwitch
{
  return 0;
}

- (BOOL)tableHeaderInspectorShowsFreezeHeaderColumnsSwitch
{
  return 0;
}

- (BOOL)tableHeaderInspectorShowsRepeatHeaderRowsSwitch
{
  return 0;
}

- (BOOL)tableCellInspectorShowsNaturalAlignment
{
  return 0;
}

- (BOOL)textInspectorShowsMoreSubpane
{
  return 0;
}

@end
