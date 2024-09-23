@implementation UIPDFAnnotationParserDelegate

- (UIPDFAnnotationParserDelegate)init
{
  UIPDFAnnotationParserDelegate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFAnnotationParserDelegate;
  result = -[UIPDFAnnotationParserDelegate init](&v3, sel_init);
  if (result)
    result->_parseError = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIPDFAnnotationParserDelegate;
  -[UIPDFAnnotationParserDelegate dealloc](&v2, sel_dealloc);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  self->_parseError = 1;
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  NSMutableString *characters;

  characters = self->_characters;
  if (characters)
    -[NSMutableString appendString:](characters, "appendString:", a4);
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  void *v10;
  __objc2_class **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  CGColorSpace *DeviceRGB;
  CGColor *v22;
  UIPDFAnnotation *v23;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("UIPDFAnnotation")))
  {
    v10 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("type"));
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeCircle")) & 1) != 0)
    {
      v11 = off_1E167B108;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeFreeText")) & 1) != 0)
    {
      v11 = off_1E167B118;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeHighlight")) & 1) != 0)
    {
      v11 = off_1E167B120;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeLine")) & 1) != 0)
    {
      v11 = off_1E167B128;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeStamp")) & 1) != 0)
    {
      v11 = off_1E167B170;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeStrikeOut")) & 1) != 0)
    {
      v11 = off_1E167B178;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeText")) & 1) != 0)
    {
      v11 = off_1E167B180;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypeUnderline")) & 1) != 0)
    {
      v11 = off_1E167B188;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("UIPDFAnnotationTypePopup")))
      {
        v23 = 0;
        goto LABEL_33;
      }
      v11 = off_1E167B158;
    }
    v23 = (UIPDFAnnotation *)objc_alloc_init(*v11);
LABEL_33:
    self->_annotation = v23;
    return;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("ID")))
    goto LABEL_15;
  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("Color")))
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("Contents"))
      && !objc_msgSend(a4, "isEqualToString:", CFSTR("Tag"))
      && !objc_msgSend(a4, "isEqualToString:", CFSTR("Index"))
      && !objc_msgSend(a4, "isEqualToString:", CFSTR("PopupID"))
      && !objc_msgSend(a4, "isEqualToString:", CFSTR("ParentID")))
    {
      return;
    }
LABEL_15:
    self->_characters = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
    return;
  }
  v12 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("R"));
  v13 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("G"));
  v14 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("B"));
  v15 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("A"));
  objc_msgSend(v12, "floatValue");
  components[0] = v16;
  objc_msgSend(v13, "floatValue");
  components[1] = v17;
  objc_msgSend(v14, "floatValue");
  components[2] = v18;
  if (v15)
  {
    objc_msgSend(v15, "floatValue");
    v20 = v19;
  }
  else
  {
    v20 = 1.0;
  }
  components[3] = v20;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  -[UIPDFAnnotation setColor:](self->_annotation, "setColor:", v22);
  CGColorRelease(v22);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("ID")))
  {
    -[UIPDFAnnotation setAnnotationID:](self->_annotation, "setAnnotationID:", self->_characters);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("Contents")))
  {
    -[UIPDFAnnotation setContents:](self->_annotation, "setContents:", self->_characters);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("PopupID"))
         || objc_msgSend(a4, "isEqualToString:", CFSTR("ParentID")))
  {
    -[UIPDFAnnotation setAssociatedAnnotationID:](self->_annotation, "setAssociatedAnnotationID:", self->_characters);
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("Tag")))
  {
    -[UIPDFAnnotation setTag:](self->_annotation, "setTag:", -[NSMutableString integerValue](self->_characters, "integerValue"));
  }
  else if (objc_msgSend(a4, "isEqualToString:", CFSTR("Index")))
  {
    -[UIPDFAnnotation setIndex:](self->_annotation, "setIndex:", -[NSMutableString integerValue](self->_characters, "integerValue"));
  }

  self->_characters = 0;
}

- (UIPDFAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)parseError
{
  return self->_parseError;
}

@end
