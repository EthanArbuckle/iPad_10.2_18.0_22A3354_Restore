@implementation TSABaseApplicationDelegate

- (id)invalidURLSchemes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D8FAB90);
}

- (TSABaseApplicationDelegate)init
{
  TSABaseApplicationDelegate *v2;
  TSABaseApplicationDelegate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSABaseApplicationDelegate;
  v2 = -[TSKApplicationDelegate init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TSABaseApplicationDelegate registerDefaults](v2, "registerDefaults");
  return v3;
}

- (void)registerDefaults
{
  +[TSWPUserDefaults registerUserDefaults:](TSWPUserDefaults, "registerUserDefaults:", 0);
}

+ (id)sharedDelegate
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSABaseApplicationDelegate;
  return objc_msgSendSuper2(&v3, sel_sharedDelegate);
}

- (void)dealloc
{
  objc_super v3;

  -[TSABaseApplicationDelegate setDownloadDelegate:](self, "setDownloadDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSABaseApplicationDelegate;
  -[TSKApplicationDelegate dealloc](&v3, sel_dealloc);
}

- (Class)documentRootClass
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate documentRootClass]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 61, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate documentRootClass]"), 0));
}

- (void)persistenceError:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate persistenceError:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 69, CFSTR("Got persistence error: %@"), a3);
}

- (NSString)nativeDocumentType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate nativeDocumentType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 76, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate nativeDocumentType]"), 0));
}

- (NSString)nativeDocumentExtension
{
  return (NSString *)-[NSString tsu_UTIFilenameExtension](-[TSABaseApplicationDelegate nativeDocumentType](self, "nativeDocumentType"), "tsu_UTIFilenameExtension");
}

- (NSString)templateDocumentType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate templateDocumentType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 86, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate templateDocumentType]"), 0));
}

- (NSString)templateSFFDocumentType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate templateSFFDocumentType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 91, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate templateSFFDocumentType]"), 0));
}

- (NSString)templateDocumentExtension
{
  return (NSString *)-[NSString tsu_UTIFilenameExtension](-[TSABaseApplicationDelegate templateDocumentType](self, "templateDocumentType"), "tsu_UTIFilenameExtension");
}

- (NSString)tangierEditingFormatDocumentType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate tangierEditingFormatDocumentType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 101, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate tangierEditingFormatDocumentType]"), 0));
}

- (NSString)nativeSFFDocumentType
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate nativeSFFDocumentType]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 106, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate nativeSFFDocumentType]"), 0));
}

- (NSArray)readableDocumentTypes
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v4[1] = -[TSABaseApplicationDelegate templateDocumentType](self, "templateDocumentType", -[TSABaseApplicationDelegate nativeDocumentType](self, "nativeDocumentType"));
  v4[2] = -[TSABaseApplicationDelegate templateSFFDocumentType](self, "templateSFFDocumentType");
  v4[3] = -[TSABaseApplicationDelegate tangierEditingFormatDocumentType](self, "tangierEditingFormatDocumentType");
  v4[4] = -[TSABaseApplicationDelegate nativeSFFDocumentType](self, "nativeSFFDocumentType");
  return (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5), "arrayByAddingObjectsFromArray:", -[TSABaseApplicationDelegate importableDocumentTypes](self, "importableDocumentTypes"));
}

- (NSArray)importableDocumentTypes
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate importableDocumentTypes]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 123, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate importableDocumentTypes]"), 0));
}

- (BOOL)isReadableDocumentType:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSABaseApplicationDelegate readableDocumentTypes](self, "readableDocumentTypes");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(a3, "tsu_conformsToUTI:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (NSArray)applicationTemplateVariants
{
  CFLocaleRef v3;
  NSArray *v4;

  v3 = CFLocaleCopyCurrent();
  v4 = -[TSABaseApplicationDelegate applicationTemplateVariantsForLocale:](self, "applicationTemplateVariantsForLocale:", v3);
  CFRelease(v3);
  return v4;
}

- (id)applicationTemplateVariantsForLocale:(__CFLocale *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSABaseApplicationDelegate applicationTemplateVariantsForLocale:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 152, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSABaseApplicationDelegate applicationTemplateVariantsForLocale:]"), 0));
}

- (double)mimimumAspectRatioForPreviewImage
{
  return 0.0;
}

- (double)maximumAspectRatioForPreviewImage
{
  return 1.79769313e308;
}

- (id)validURLSchemes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D8FABA8);
}

- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if ((v5
     || (v4 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://%@"), objc_msgSend(v4, "absoluteString"))), (v5 = objc_msgSend(v4, "scheme")) != 0))&& !objc_msgSend((id)objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "invalidURLSchemes"), "member:", v5))
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "openURL:", v4);
  }
  else
  {
    return 0;
  }
}

+ (void)presentAlertController:(id)a3 animated:(BOOL)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSABaseApplicationDelegate presentAlertController:animated:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSABaseApplicationDelegate.mm"), 240, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[TSABaseApplicationDelegate presentAlertController:animated:]"), 0));
}

- (BOOL)URLIsValidForImportedHyperlink:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "scheme");
  if (v4)
    LOBYTE(v4) = objc_msgSend(-[TSABaseApplicationDelegate invalidURLSchemes](self, "invalidURLSchemes"), "member:", v4) == 0;
  return v4;
}

- (id)existingNestedDocumentPathForPath:(id)a3
{
  void *v5;

  if (!objc_msgSend(a3, "tsu_pathConformsToUTI:", -[TSABaseApplicationDelegate tangierEditingFormatDocumentType](self, "tangierEditingFormatDocumentType")))return 0;
  v5 = (void *)objc_msgSend(a3, "stringByAppendingPathComponent:", -[TSKCompatibilityDelegate nestedDocumentFilename](-[TSKApplicationDelegate compatibilityDelegate](self, "compatibilityDelegate"), "nestedDocumentFilename"));
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v5) & 1) == 0)
    return 0;
  return v5;
}

- (TSADownloadDelegate)downloadDelegate
{
  return self->_downloadDelegate;
}

- (void)setDownloadDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
