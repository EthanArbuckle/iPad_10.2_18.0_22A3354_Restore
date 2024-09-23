@implementation UIPDFAnnotation

+ (id)newAnnotationWithPage:(id)a3 fromArchive:(id)a4
{
  uint64_t v6;
  UIPDFSelection *v7;
  UIPDFAnnotationParserDelegate *v8;
  uint64_t v9;
  void *v10;
  UIPDFAnnotation *v11;
  uint64_t v12;
  uint64_t v13;
  UIPDFSelection *v14;

  v6 = objc_msgSend(a4, "rangeOfString:", CFSTR("<UIPDFSelection"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
    goto LABEL_3;
  }
  v12 = v6;
  v13 = objc_msgSend(a4, "rangeOfString:", CFSTR("</UIPDFSelection>"));
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v14 = -[UIPDFSelection initWithPage:fromArchive:]([UIPDFSelection alloc], "initWithPage:fromArchive:", a3, objc_msgSend(a4, "substringWithRange:", v12, v13 - v12 + 17));
  v7 = v14;
  if (v14 && !-[UIPDFSelection CGSelection](v14, "CGSelection"))
  {

    return 0;
  }
LABEL_3:
  v8 = objc_alloc_init(UIPDFAnnotationParserDelegate);
  v9 = objc_msgSend(a4, "dataUsingEncoding:", 4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v9);
  objc_msgSend(v10, "setDelegate:", v8);
  objc_msgSend(v10, "parse");
  if (-[UIPDFAnnotationParserDelegate parseError](v8, "parseError"))
  {
    v11 = 0;
  }
  else
  {
    v11 = -[UIPDFAnnotationParserDelegate annotation](v8, "annotation");
    -[UIPDFAnnotation setEditable:](v11, "setEditable:", 1);
    -[UIPDFAnnotation setSelection:](v11, "setSelection:", v7);
  }

  return v11;
}

- (UIPDFAnnotation)init
{
  UIPDFAnnotation *v2;
  CGColorSpace *DeviceRGB;
  const __CFAllocator *v4;
  const __CFUUID *v5;
  objc_super v7;
  CGFloat components[2];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)UIPDFAnnotation;
  v2 = -[UIPDFAnnotation init](&v7, sel_init);
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_186683158;
    v9 = unk_186683168;
    v2->_color = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v2->_pdfContents = 0;
    v2->_index = -1;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v2->_annotationID = (NSString *)CFUUIDCreateString(v4, v5);
    CFRelease(v5);
    v2->_quadPoints = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  }
  return v2;
}

- (UIPDFAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3
{
  UIPDFAnnotation *v4;
  UIPDFAnnotation *v5;
  size_t Count;
  CGColorSpace *DeviceCMYK;
  CGPDFArray *v8;
  CGPDFReal *v9;
  size_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  const __CFAllocator *v14;
  const __CFUUID *v15;
  const unsigned __int8 *BytePtr;
  uint64_t v18;
  CGPDFReal v19;
  CGPDFReal v20;
  CGPDFArrayRef array;
  CGPDFArrayRef value;
  objc_super v23;
  CGPDFReal components[2];
  CGPDFReal v25[3];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)UIPDFAnnotation;
  v4 = -[UIPDFAnnotation init](&v23, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v4->_hidden = 0;
  v4->_pdfContents = 0;
  v4->_dictionary = a3;
  v4->_color = 0;
  v4->_index = -1;
  v4->_quadPoints = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  value = 0;
  *(_OWORD *)components = xmmword_186683158;
  *(_OWORD *)v25 = unk_186683168;
  if (CGPDFDictionaryGetArray(a3, "C", &value))
  {
    Count = CGPDFArrayGetCount(value);
    switch(Count)
    {
      case 4uLL:
        DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
        CGPDFArrayGetNumber(value, 0, components);
        CGPDFArrayGetNumber(value, 1uLL, &components[1]);
        CGPDFArrayGetNumber(value, 2uLL, v25);
        v8 = value;
        v9 = &v25[1];
        v10 = 3;
        break;
      case 3uLL:
        DeviceCMYK = CGColorSpaceCreateDeviceRGB();
        CGPDFArrayGetNumber(value, 0, components);
        CGPDFArrayGetNumber(value, 1uLL, &components[1]);
        v8 = value;
        v9 = v25;
        v10 = 2;
        break;
      case 1uLL:
        DeviceCMYK = CGColorSpaceCreateDeviceGray();
        v8 = value;
        v9 = components;
        v10 = 0;
        break;
      default:
        goto LABEL_12;
    }
    CGPDFArrayGetNumber(v8, v10, v9);
  }
  else
  {
    DeviceCMYK = CGColorSpaceCreateDeviceRGB();
  }
  v5->_color = CGColorCreate(DeviceCMYK, components);
  CGColorSpaceRelease(DeviceCMYK);
LABEL_12:
  array = 0;
  if (CGPDFDictionaryGetArray(a3, "QuadPoints", &array))
  {
    v11 = CGPDFArrayGetCount(array);
    v12 = v11 - 1;
    if (v11 >= 1 && (v11 & 7) == 0)
    {
      v19 = 0.0;
      v20 = 0.0;
      if ((unint64_t)v11 >= 2)
      {
        v13 = 0;
        do
        {
          CGPDFArrayGetNumber(array, v13, &v20);
          CGPDFArrayGetNumber(array, v13 + 1, &v19);
          -[NSMutableArray addObject:](v5->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v20, v19));
          v13 += 2;
        }
        while (v13 < v12);
      }
    }
  }
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v15 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v5->_annotationID = (NSString *)CFUUIDCreateString(v14, v15);
  CFRelease(v15);
  v5->_appearanceStream = 0;
  v20 = 0.0;
  if (CGPDFDictionaryGetDictionary(a3, "AP", (CGPDFDictionaryRef *)&v20))
  {
    v18 = 0;
    v19 = 0.0;
    if (CGPDFDictionaryGetObject(*(CGPDFDictionaryRef *)&v20, "N", (CGPDFObjectRef *)&v19)
      && CGPDFObjectGetValue(*(CGPDFObjectRef *)&v19, kCGPDFObjectTypeStream, &v18))
    {
      v5->_appearanceStream = (void *)CGPDFFormCreate();
    }
  }
  v19 = 0.0;
  if (CGPDFDictionaryGetString(a3, "Contents", (CGPDFStringRef *)&v19))
  {
    BytePtr = CGPDFStringGetBytePtr(*(CGPDFStringRef *)&v19);
    v5->_contents = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", BytePtr, CGPDFStringGetLength(*(CGPDFStringRef *)&v19), 1);
  }
  return v5;
}

- (void)dealloc
{
  NSString *annotationID;
  UIPDFAnnotationView *v4;
  CALayer *v5;
  CALayer *v6;
  objc_super v7;

  -[UIPDFAnnotation setPopup:](self, "setPopup:", 0);
  CGColorRelease(self->_color);
  CGPDFFormRelease();
  annotationID = self->_annotationID;
  if (annotationID)
    CFRelease(annotationID);
  v4 = -[UIPDFAnnotation annotationView](self, "annotationView");
  if (v4)
  {
    -[UIView removeFromSuperview](v4, "removeFromSuperview");
    -[UIPDFAnnotation setAnnotationView:](self, "setAnnotationView:", 0);
  }
  v5 = -[UIPDFAnnotation drawingLayer](self, "drawingLayer");
  if (v5)
  {
    v6 = v5;
    -[CALayer setDelegate:](v5, "setDelegate:", 0);
    -[CALayer removeFromSuperlayer](v6, "removeFromSuperlayer");
    -[UIPDFAnnotation setDrawingLayer:](self, "setDrawingLayer:", 0);
  }

  v7.receiver = self;
  v7.super_class = (Class)UIPDFAnnotation;
  -[UIPDFAnnotation dealloc](&v7, sel_dealloc);
}

- (void)setPageView:(id)a3
{
  self->_annotationController = (UIPDFAnnotationController *)objc_msgSend(a3, "annotationController");
}

- (id)annotationID
{
  return self->_annotationID;
}

- (void)setAnnotationID:(id)a3
{
  NSString *annotationID;

  annotationID = self->_annotationID;
  if (annotationID)

  self->_annotationID = (NSString *)a3;
}

- (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (int)annotationType
{
  return 10;
}

- (id)archive
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  NSString *v11;
  NSString *v12;
  UIPDFPopupAnnotation *popup;
  uint64_t v14;
  uint64_t v15;

  v3 = -[UIPDFAnnotation newSelection](self, "newSelection");
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "archive");
  else
    v5 = 0;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v7 = -[UIPDFAnnotation annotationType](self, "annotationType");
  if (v7 > 0xA)
    v8 = CFSTR("UIPDFAnnotationTypeOther");
  else
    v8 = *(&off_1E16E0540 + v7);
  objc_msgSend(v6, "appendString:", CFSTR("<UIPDFAnnotation type=\"));
  objc_msgSend(v6, "appendString:", v8);
  objc_msgSend(v6, "appendString:", CFSTR("\">"));
  objc_msgSend(v6, "appendString:", CFSTR("<ID>"));
  objc_msgSend(v6, "appendString:", self->_annotationID);
  objc_msgSend(v6, "appendString:", CFSTR("</ID>"));
  ColorSpace = CGColorGetColorSpace(self->_color);
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB)
  {
    Components = CGColorGetComponents(self->_color);
    objc_msgSend(v6, "appendFormat:", CFSTR("<Color R=\"%g\" G=\"%g\" B=\"%g\"), *(_QWORD *)Components, *((_QWORD *)Components + 1), *((_QWORD *)Components + 2));
    if (CGColorGetNumberOfComponents(self->_color) == 4)
      objc_msgSend(v6, "appendFormat:", CFSTR(" A=\"%g\"), *((_QWORD *)Components + 3));
    objc_msgSend(v6, "appendString:", CFSTR("/>"));
  }
  if (v5)
    objc_msgSend(v6, "appendString:", v5);
  v11 = -[UIPDFAnnotation contents](self, "contents");
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v6, "appendString:", CFSTR("<Contents>"));
    objc_msgSend(v6, "appendString:", v12);
    objc_msgSend(v6, "appendString:", CFSTR("</Contents>"));
  }
  popup = self->_popup;
  if (popup)
  {
    v14 = -[UIPDFAnnotation annotationID](popup, "annotationID");
    objc_msgSend(v6, "appendString:", CFSTR("<PopupID>"));
    objc_msgSend(v6, "appendString:", v14);
    objc_msgSend(v6, "appendString:", CFSTR("</PopupID>"));
  }
  objc_msgSend(v6, "appendString:", CFSTR("<Tag>"));
  objc_msgSend(v6, "appendFormat:", CFSTR("%ld"), -[UIPDFAnnotation tag](self, "tag"));
  objc_msgSend(v6, "appendString:", CFSTR("</Tag>"));
  objc_msgSend(v6, "appendString:", CFSTR("<Index>"));
  objc_msgSend(v6, "appendFormat:", CFSTR("%ld"), -[UIPDFAnnotation index](self, "index"));
  objc_msgSend(v6, "appendString:", CFSTR("</Index>"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[UIPDFAnnotation parent](self, "parent"))
  {
    v15 = objc_msgSend((id)-[UIPDFAnnotation parent](self, "parent"), "annotationID");
    objc_msgSend(v6, "appendString:", CFSTR("<ParentID>"));
    objc_msgSend(v6, "appendString:", v15);
    objc_msgSend(v6, "appendString:", CFSTR("</ParentID>"));
  }
  objc_msgSend(v6, "appendString:", CFSTR("</UIPDFAnnotation>"));
  return v6;
}

- (id)getImageNamed:(id)a3 ofType:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", a3);
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", v5, a4);

  return +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v6);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (CGRect)rectIn:(CGPDFArray *)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPDFReal v9;
  CGPDFReal v10;
  CGPDFReal value;
  CGRect result;

  if (CGPDFArrayGetCount(a3) == 4
    && (v10 = 0.0, value = 0.0, v8 = 0.0, v9 = 0.0, CGPDFArrayGetNumber(a3, 0, &value))
    && CGPDFArrayGetNumber(a3, 1uLL, &v10)
    && CGPDFArrayGetNumber(a3, 2uLL, &v9)
    && CGPDFArrayGetNumber(a3, 3uLL, &v8))
  {
    v5 = v10;
    v4 = value;
    v6 = v9 - value;
    v7 = v8 - v10;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)Rect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPDFArrayRef value;
  CGRect result;

  value = 0;
  if (CGPDFDictionaryGetArray(self->_dictionary, "Rect", &value))
  {
    -[UIPDFAnnotation rectIn:](self, "rectIn:", value);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[UIPDFAnnotation Rect](self, "Rect");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)setColor:(CGColor *)a3
{
  CGColor *color;

  color = self->_color;
  if (color)
    CGColorRelease(color);
  self->_color = a3;
  CGColorRetain(a3);
}

- (CGColor)color
{
  return self->_color;
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;

  if (self->_appearanceStream)
  {
    CGPDFFormGetStream();
    CGPDFFormGetResources();
    CGPDFDrawingContextCreateWithStream();
    -[UIPDFAnnotation Rect](self, "Rect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    memset(&v22, 0, sizeof(v22));
    CGPDFFormGetMatrix();
    CGPDFFormGetBBox();
    memset(&v21, 0, sizeof(v21));
    v24 = CGRectApplyAffineTransform(v23, &v21);
    v13 = v10 / v24.size.width;
    v14 = v12 / v24.size.height;
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, v6 - v24.origin.x * v13, v8 - v24.origin.y * v14);
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeScale(&v20, v13, v14);
    t1 = v21;
    v17 = v20;
    CGAffineTransformConcat(&v19, &t1, &v17);
    v15 = *(_OWORD *)&v19.c;
    v21 = v19;
    v16 = *(_OWORD *)&v19.a;
    *(_OWORD *)&t1.tx = *(_OWORD *)&v19.tx;
    memset(&v19, 0, sizeof(v19));
    *(_OWORD *)&t1.a = v16;
    *(_OWORD *)&t1.c = v15;
    v17 = v22;
    CGAffineTransformConcat(&v19, &t1, &v17);
    CGContextSaveGState(a3);
    t1 = v19;
    CGContextConcatCTM(a3, &t1);
    CGPDFDrawingContextDraw();
    CGContextRestoreGState(a3);
    CGPDFDrawingContextRelease();
  }
}

- (BOOL)hasPopUp
{
  CGPDFString **p_pdfContents;
  _BOOL4 String;

  p_pdfContents = &self->_pdfContents;
  String = CGPDFDictionaryGetString(self->_dictionary, "Contents", &self->_pdfContents);
  if (String)
    LOBYTE(String) = CGPDFStringGetLength(*p_pdfContents) != 0;
  return String;
}

- (const)pdfContents
{
  CGPDFString *pdfContents;
  CGPDFString **p_pdfContents;

  p_pdfContents = &self->_pdfContents;
  pdfContents = self->_pdfContents;
  if (!pdfContents)
  {
    CGPDFDictionaryGetString(self->_dictionary, "Contents", p_pdfContents);
    pdfContents = self->_pdfContents;
  }
  return (const char *)CGPDFStringGetBytePtr(pdfContents);
}

- (CGRect)popUpAnnotationRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPDFArrayRef v7;
  CGPDFDictionaryRef value;
  CGRect result;

  value = 0;
  if (CGPDFDictionaryGetDictionary(self->_dictionary, "Popup", &value)
    && (v7 = 0, CGPDFDictionaryGetArray(value, "Rect", &v7)))
  {
    -[UIPDFAnnotation rectIn:](self, "rectIn:", v7);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)descriptionHOLD
{
  UIPDFSelection *v3;
  uint64_t TextRange;
  uint64_t NumberOfTextRanges;
  uint64_t v6;
  uint64_t v7;
  UIPDFAnnotationView *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  id v18;
  CGRect v20;

  v3 = -[UIPDFAnnotation selection](self, "selection");
  if (!v3)
  {
    TextRange = 0;
    goto LABEL_6;
  }
  TextRange = -[UIPDFSelection CGSelection](v3, "CGSelection");
  if (!TextRange)
  {
LABEL_6:
    NumberOfTextRanges = 0;
    goto LABEL_8;
  }
  NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
  if (NumberOfTextRanges >= 1)
  {
    TextRange = CGPDFSelectionGetTextRange();
    v7 = v6 - 1;
    goto LABEL_9;
  }
  TextRange = 0;
LABEL_8:
  v7 = -1;
LABEL_9:
  v8 = -[UIPDFAnnotation annotationView](self, "annotationView");
  if (v8)
  {
    -[UIView frame](v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = -[UIPDFAnnotation annotationID](self, "annotationID");
  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  return (id)objc_msgSend(v17, "stringWithFormat:", CFSTR("Annotation %@ Ranges: %ld Indexes (inclusive) <%ld,%ld>; view frame: %@"),
               v18,
               NumberOfTextRanges,
               TextRange,
               TextRange + v7,
               NSStringFromCGRect(v20));
}

- (void)setSelection:(id)a3
{
  UIPDFSelection *selection;

  -[UIPDFAnnotation makeQuadpointsFrom:](self, "makeQuadpointsFrom:");
  selection = self->_selection;
  if (selection != a3)

  self->_selection = (UIPDFSelection *)a3;
}

- (UIPDFSelection)selection
{
  UIPDFSelection *result;

  result = self->_selection;
  if (!result)
  {
    result = -[UIPDFAnnotation newSelection](self, "newSelection");
    self->_selection = result;
  }
  return result;
}

- (UIPDFAnnotationView)annotationView
{
  return self->_annotationView;
}

- (void)setAnnotationView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (UIPDFAnnotationController)annotationController
{
  return self->_annotationController;
}

- (void)setAnnotationController:(id)a3
{
  self->_annotationController = (UIPDFAnnotationController *)a3;
}

- (BOOL)editable
{
  return self->editable;
}

- (void)setEditable:(BOOL)a3
{
  self->editable = a3;
}

- (id)data
{
  return self->data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (UIPDFPopupAnnotation)popup
{
  return self->_popup;
}

- (void)setPopup:(id)a3
{
  self->_popup = (UIPDFPopupAnnotation *)a3;
}

- (NSString)associatedAnnotationID
{
  return self->_associatedAnnotationID;
}

- (void)setAssociatedAnnotationID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (CALayer)drawingLayer
{
  return self->_drawingLayer;
}

- (void)setDrawingLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (UIPDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  self->_page = (UIPDFPage *)a3;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (id)newSelection
{
  CGPath *v3;
  const CGPath *v4;
  uint64_t v5;
  UIPDFSelection *v6;

  v3 = -[UIPDFAnnotation newPathFromQuadPoints](self, "newPathFromQuadPoints");
  if (v3)
  {
    v4 = v3;
    -[UIPDFPage CGPage](-[UIPDFAnnotation page](self, "page"), "CGPage");
    v5 = CGPDFSelectionCreateInPath();
    if (v5)
    {
      v6 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", -[UIPDFAnnotation page](self, "page"), v5);
      CGPathRelease(v4);
      CGPDFSelectionRelease();
      return v6;
    }
    CGPathRelease(v4);
  }
  return 0;
}

- (void)makeQuadpointsFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGPoint origin;
  double MinX;
  double MaxY;
  double MaxX;
  double v12;
  double v13;
  CGFloat MinY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGRect v26;

  -[NSMutableArray removeAllObjects](self->_quadPoints, "removeAllObjects");
  v5 = objc_msgSend(a3, "numberOfRectangles");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    memset(&v26, 0, sizeof(v26));
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    do
    {
      objc_msgSend(a3, "getBounds:transform:index:", &v26, &v23, v7);
      origin = v26.origin;
      MinX = CGRectGetMinX(v26);
      MaxY = CGRectGetMaxY(v26);
      MaxX = CGRectGetMaxX(v26);
      v12 = CGRectGetMaxY(v26);
      v13 = CGRectGetMaxX(v26);
      MinY = CGRectGetMinY(v26);
      v15 = *(double *)&v25 + origin.x * *(double *)&v23 + origin.y * *(double *)&v24;
      v16 = *((double *)&v25 + 1) + origin.x * *((double *)&v23 + 1) + origin.y * *((double *)&v24 + 1);
      v17 = *(double *)&v25 + MinX * *(double *)&v23 + MaxY * *(double *)&v24;
      v18 = *((double *)&v25 + 1) + MinX * *((double *)&v23 + 1) + MaxY * *((double *)&v24 + 1);
      v19 = *(double *)&v25 + MaxX * *(double *)&v23 + v12 * *(double *)&v24;
      v20 = *((double *)&v25 + 1) + MaxX * *((double *)&v23 + 1) + v12 * *((double *)&v24 + 1);
      v21 = *(double *)&v25 + v13 * *(double *)&v23 + MinY * *(double *)&v24;
      v22 = *((double *)&v25 + 1) + v13 * *((double *)&v23 + 1) + MinY * *((double *)&v24 + 1);
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v17, v18));
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v19, v20));
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v15, v16));
      -[NSMutableArray addObject:](self->_quadPoints, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v21, v22));
      ++v7;
    }
    while (v6 != v7);
  }
}

- (CGPath)newPathFromQuadPoints
{
  uint64_t v3;
  unint64_t v4;
  CGPath *Mutable;
  unint64_t i;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  CGFloat v20;
  float v21;
  CGFloat v22;
  float v23;
  float v24;
  float v25;
  CGFloat v26;
  float v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;

  v3 = -[NSMutableArray count](self->_quadPoints, "count");
  if (!v3)
    return 0;
  v4 = v3;
  Mutable = CGPathCreateMutable();
  for (i = 0; i < v4; i += 4)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i), "CGPointValue");
    v8 = v7;
    v10 = v9;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i + 1), "CGPointValue");
    v12 = v11;
    v14 = v13;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i + 2), "CGPointValue");
    v16 = v15;
    v18 = v17;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_quadPoints, "objectAtIndex:", i + 3), "CGPointValue");
    v19 = v8;
    v20 = (float)(truncf(v19) + -1.0);
    v21 = v10;
    v22 = (float)(ceilf(v21) + 1.0);
    v23 = v16;
    v24 = v18;
    v25 = v12;
    v26 = (float)(ceilf(v25) + 1.0);
    v27 = v14;
    v28 = (float)(ceilf(v27) + 1.0);
    *(float *)&v29 = v29;
    v30 = (float)(ceilf(*(float *)&v29) + 1.0);
    *(float *)&v29 = v31;
    v32 = (float)(truncf(*(float *)&v29) + -1.0);
    CGPathMoveToPoint(Mutable, 0, (float)(truncf(v23) + -1.0), (float)(truncf(v24) + -1.0));
    CGPathAddLineToPoint(Mutable, 0, v30, v32);
    CGPathAddLineToPoint(Mutable, 0, v26, v28);
    CGPathAddLineToPoint(Mutable, 0, v20, v22);
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (BOOL)recognizeGestures
{
  return 0;
}

@end
