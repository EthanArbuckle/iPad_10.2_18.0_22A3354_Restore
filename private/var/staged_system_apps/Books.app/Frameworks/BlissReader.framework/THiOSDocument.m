@implementation THiOSDocument

- (THiOSDocument)initWithBookDescription:(id)a3
{
  id v5;
  THiOSDocument *v6;
  THiOSDocument *v7;
  objc_super v9;

  v5 = objc_alloc_init((Class)TSUTemporaryDirectory);
  v9.receiver = self;
  v9.super_class = (Class)THiOSDocument;
  v6 = -[THiOSDocument initWithTemporaryFileURL:](&v9, "initWithTemporaryFileURL:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(objc_msgSend(v5, "path"), "stringByAppendingPathComponent:", CFSTR("tf-document"))));
  v7 = v6;
  if (v6)
  {
    -[THiOSDocument setTempDirectory:](v6, "setTempDirectory:", v5);
    objc_msgSend(-[THiOSDocument documentRoot](v7, "documentRoot"), "setBookDescription:", a3);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THiOSDocument;
  -[THiOSDocument dealloc](&v3, "dealloc");
}

- (id)name
{
  return objc_msgSend(objc_msgSend(-[THiOSDocument documentRoot](self, "documentRoot"), "bookDescription"), "bookTitle");
}

- (id)documentCachePath
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSDocument documentCachePath]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THiOSDocument.mm"), 59, CFSTR("no document cache path"));
  return 0;
}

- (CGSize)previewImageSize
{
  double width;
  double height;
  CGSize result;

  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSDocument previewImageSize]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THiOSDocument.mm"), 65, CFSTR("no preview images"));
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (Class)documentRootClass
{
  return (Class)objc_opt_class(THDocumentRoot, a2);
}

- (TSUTemporaryDirectory)tempDirectory
{
  return self->_tempDirectory;
}

- (void)setTempDirectory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
