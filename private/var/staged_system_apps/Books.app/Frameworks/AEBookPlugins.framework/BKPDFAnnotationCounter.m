@implementation BKPDFAnnotationCounter

- (BKPDFAnnotationCounter)initWithDocument:(CGPDFDocument *)a3
{
  BKPDFAnnotationCounter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPDFAnnotationCounter;
  v4 = -[BKPDFAnnotationCounter init](&v6, "init");
  if (v4)
    v4->_document = CGPDFDocumentRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFDocumentRelease(self->_document);
  v3.receiver = self;
  v3.super_class = (Class)BKPDFAnnotationCounter;
  -[BKPDFAnnotationCounter dealloc](&v3, "dealloc");
}

- (void)setDocument:(CGPDFDocument *)a3
{
  if (self->_document != a3)
  {
    CGPDFDocumentRetain(a3);
    CGPDFDocumentRelease(self->_document);
    self->_document = a3;
  }
}

- (id)countMarkupAnnotations
{
  BKPDFAnnotationCounterResult *v3;
  CGPDFDictionary *Catalog;
  CGPDFDictionaryRef v5;
  _QWORD v7[5];
  BKPDFAnnotationCounterResult *v8;
  CGPDFDictionaryRef value;

  v3 = objc_alloc_init(BKPDFAnnotationCounterResult);
  value = 0;
  Catalog = CGPDFDocumentGetCatalog(self->_document);
  if (CGPDFDictionaryGetDictionary(Catalog, "Pages", &value))
  {
    v5 = value;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_823B8;
    v7[3] = &unk_1C0B00;
    v7[4] = self;
    v8 = v3;
    -[BKPDFAnnotationCounter _visitPageTree:visitBlock:](self, "_visitPageTree:visitBlock:", v5, v7);

  }
  return v3;
}

- (void)countMarkupAnnotationsWithCompletion:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(-2, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_824D4;
  block[3] = &unk_1BFE78;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_visitPageTree:(CGPDFDictionary *)a3 visitBlock:(id)a4
{
  id v5;
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  _QWORD *v8;
  CGPDFDictionary *ValueAtIndex;
  CGPDFArrayRef value;
  _QWORD v11[4];
  id v12;
  __CFArray *v13;

  v5 = a4;
  if (v5)
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v7 = Mutable;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_82704;
      v11[3] = &unk_1C0B28;
      v12 = v5;
      v13 = v7;
      v8 = objc_retainBlock(v11);
      CFArrayAppendValue(v7, a3);
      while (CFArrayGetCount(v7))
      {
        ValueAtIndex = (CGPDFDictionary *)CFArrayGetValueAtIndex(v7, 0);
        if (sub_82924(ValueAtIndex, "Pages"))
        {
          value = 0;
          if (CGPDFDictionaryGetArray(ValueAtIndex, "Kids", &value))
            CGPDFArrayApplyBlock(value, v8, 0);
        }
        CFArrayRemoveValueAtIndex(v7, 0);
      }
      CFRelease(v7);

    }
  }

}

- (void)_countMarkupAnnotationsInArray:(CGPDFArray *)a3 result:(id)a4
{
  id v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_82810;
  v7[3] = &unk_1C0B50;
  v8 = a4;
  v5 = v8;
  v6 = objc_retainBlock(v7);
  CGPDFArrayApplyBlock(a3, v6, 0);

}

- (CGPDFDocument)document
{
  return self->_document;
}

@end
