@implementation UIPDFLinkAnnotation

- (id)newBaseURL
{
  id result;
  _BOOL4 Dictionary;
  _BOOL4 v4;
  id v5;
  CGPDFStringRef string;
  CGPDFDictionaryRef value;

  result = -[UIPDFDocument CGDocument](-[UIPDFPage document](-[UIPDFPageView page](-[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView"), "page"), "document"), "CGDocument");
  if (result)
  {
    result = CGPDFDocumentGetCatalog((CGPDFDocumentRef)result);
    if (result)
    {
      value = 0;
      Dictionary = CGPDFDictionaryGetDictionary((CGPDFDictionaryRef)result, "URI", &value);
      result = 0;
      if (Dictionary)
      {
        string = 0;
        v4 = CGPDFDictionaryGetString(value, "Base", &string);
        result = 0;
        if (v4)
        {
          result = (id)CGPDFStringGetBytePtr(string);
          if (result)
          {
            v5 = result;
            result = (id)CGPDFStringGetLength(string);
            if (result)
              return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v5, 30);
          }
        }
      }
    }
  }
  return result;
}

- (unint64_t)getDestination:(CGPDFDictionary *)a3
{
  CGPDFObjectType Type;
  _BOOL4 v6;
  unint64_t result;
  CGPDFObject *Destination;
  CGPDFObject *v9;
  CGPDFObjectType v10;
  UIPDFPageView *v11;
  unint64_t v12;
  CGPDFDocument *v13;
  CGPDFDictionary *v14;
  CGPDFDictionary *Catalog;
  _BOOL4 Integer;
  CGPDFDictionaryRef v18;
  CGPDFArrayRef array;
  CGPDFObjectRef value;
  CGPDFObjectRef object;
  CGPDFDictionaryRef v22;

  value = 0;
  if (!CGPDFDictionaryGetObject(a3, "D", &value) && !CGPDFDictionaryGetObject(a3, "Dest", &value))
    return 0;
  Type = CGPDFObjectGetType(value);
  array = 0;
  if (Type == kCGPDFObjectTypeArray)
  {
    v6 = CGPDFObjectGetValue(value, kCGPDFObjectTypeArray, &array);
    result = 0;
    if (!v6 || !array)
      return result;
    goto LABEL_17;
  }
  if ((Type - 5) > 1)
    return 0;
  v22 = 0;
  -[UIPDFDocument CGDocument](-[UIPDFPage document](-[UIPDFPageView page](-[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView"), "page"), "document"), "CGDocument");
  Destination = (CGPDFObject *)CGPDFDocumentGetDestination();
  object = Destination;
  if (Destination)
  {
    v9 = Destination;
    v10 = CGPDFObjectGetType(Destination);
    if (v10 == kCGPDFObjectTypeDictionary)
    {
      if (!CGPDFObjectGetValue(v9, kCGPDFObjectTypeDictionary, &v22)
        || CGPDFDictionaryGetObject(v22, "D", &object) && !CGPDFObjectGetValue(object, kCGPDFObjectTypeArray, &array))
      {
        return 0;
      }
    }
    else if (v10 == kCGPDFObjectTypeArray && !CGPDFObjectGetValue(v9, kCGPDFObjectTypeArray, &array))
    {
      return 0;
    }
  }
  if (!array)
    return 0;
LABEL_17:
  v11 = -[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView");
  v12 = -[UIPDFDocument numberOfPages](-[UIPDFPage document](-[UIPDFPageView page](v11, "page"), "document"), "numberOfPages");
  result = CGPDFArrayGetCount(array);
  if (!result)
    return result;
  v18 = 0;
  if (CGPDFArrayGetDictionary(array, 0, &v18))
  {
    v13 = -[UIPDFDocument CGDocument](-[UIPDFPage document](-[UIPDFPageView page](v11, "page"), "document"), "CGDocument");
    v14 = v18;
    v22 = 0;
    Catalog = CGPDFDocumentGetCatalog(v13);
    CGPDFDictionaryGetDictionary(Catalog, "Pages", &v22);
    object = 0;
    result = indexOfDictionary(v22, &object, v14);
  }
  else
  {
    v22 = 0;
    Integer = CGPDFArrayGetInteger(array, 0, (CGPDFInteger *)&v22);
    result = 0;
    if (!Integer)
      return result;
    result = (unint64_t)v22;
  }
  if (result > v12 || (uint64_t)result < 1)
    return 0;
  return result;
}

- (unint64_t)getNamedDestination:(CGPDFDictionary *)a3
{
  _BOOL4 Name;
  unint64_t result;
  UIPDFPageView *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  char *value;

  value = 0;
  Name = CGPDFDictionaryGetName(a3, "N", (const char **)&value);
  result = 0;
  if (Name)
  {
    v6 = -[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView");
    v7 = -[UIPDFDocument numberOfPages](-[UIPDFPageView document](v6, "document"), "numberOfPages");
    v8 = -[UIPDFPage pageNumber](-[UIPDFPageView page](v6, "page"), "pageNumber");
    v9 = value;
    if (!strcmp(value, "NextPage"))
    {
      if (!strcmp(v9, "PrevPage"))
      {
        if (!strcmp(v9, "FirstPage"))
        {
          if (!strcmp(v9, "LastPage"))
            v10 = 0;
          else
            v10 = v7;
        }
        else
        {
          v10 = 1;
        }
      }
      else
      {
        v10 = v8 - 1;
      }
    }
    else
    {
      v10 = v8 + 1;
    }
    if (v10 > v7 || v10 < 0)
      return 0;
    else
      return v10;
  }
  return result;
}

- (id)url
{
  _BOOL4 Dictionary;
  id result;
  _BOOL4 Name;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGPDFStringRef string;
  char *__s1;
  CGPDFDictionaryRef value;

  value = 0;
  Dictionary = CGPDFDictionaryGetDictionary(self->super.super._dictionary, "A", &value);
  result = 0;
  if (Dictionary)
  {
    __s1 = 0;
    Name = CGPDFDictionaryGetName(value, "S", (const char **)&__s1);
    result = 0;
    if (Name)
    {
      v6 = -[UIPDFLinkAnnotation newBaseURL](self, "newBaseURL");
      v7 = v6;
      if (v6 && objc_msgSend(v6, "length"))
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:encodingInvalidCharacters:", v7, 0);
      else
        v8 = 0;

      if (!strcmp(__s1, "URI"))
      {
        string = 0;
        if (!CGPDFDictionaryGetString(value, "URI", &string))
        {

          return 0;
        }
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", CGPDFStringGetBytePtr(string));
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:encodingInvalidCharacters:", v10, 0);
        if (!objc_msgSend(v9, "baseURL") && v8)
        {

          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:relativeToURL:", v10, v8);
        }
        if (!objc_msgSend(v9, "scheme"))
        {
          if (objc_msgSend(v10, "hasPrefix:", CFSTR("www.")))
          {

            v11 = objc_alloc(MEMORY[0x1E0C99E98]);
            v9 = (void *)objc_msgSend(v11, "initWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("http://%@"), v10));
          }
        }

      }
      else
      {
        v9 = 0;
      }

      return v9;
    }
  }
  return result;
}

- (unint64_t)pageNumber
{
  char *v3;
  CGPDFDictionary *dictionary;
  char *__s1;
  CGPDFDictionaryRef value;

  value = 0;
  if (!CGPDFDictionaryGetDictionary(self->super.super._dictionary, "A", &value))
  {
    dictionary = self->super.super._dictionary;
    return -[UIPDFLinkAnnotation getDestination:](self, "getDestination:", dictionary);
  }
  __s1 = 0;
  if (!CGPDFDictionaryGetName(value, "S", (const char **)&__s1))
    return 0;
  v3 = __s1;
  if (!strcmp(__s1, "GoTo"))
  {
    dictionary = value;
    return -[UIPDFLinkAnnotation getDestination:](self, "getDestination:", dictionary);
  }
  if (strcmp(v3, "Named"))
    return 0;
  return -[UIPDFLinkAnnotation getNamedDestination:](self, "getNamedDestination:", value);
}

- (CGRect)linkRectangle
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[UIPDFAnnotation Rect](self, "Rect");
  -[UIPDFPageView convertRectFromPDFPageSpace:](-[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView"), "convertRectFromPDFPageSpace:", v3, v4, v5, v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)quadPoints:(CGPDFArray *)a3 within:(CGRect)a4
{
  return 1;
}

- (BOOL)shouldRecognizeTapOrPress:(CGPoint)a3
{
  CGPDFDictionary *dictionary;
  double y;
  double x;
  CGPDFArrayRef v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t Count;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  double v40;
  CGPDFArrayRef value;
  CGPDFReal v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  double v47;
  CGPDFReal v48;
  CGPDFReal v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  double v53;
  CGPDFReal v54[3];
  CGPoint v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v54[1] = *(CGPDFReal *)MEMORY[0x1E0C80C00];
  dictionary = self->super.super._dictionary;
  if (dictionary)
  {
    y = a3.y;
    x = a3.x;
    value = 0;
    if (!CGPDFDictionaryGetArray(dictionary, "QuadPoints", &value)
      || (v7 = value,
          -[UIPDFAnnotation Rect](self, "Rect"),
          !-[UIPDFLinkAnnotation quadPoints:within:](self, "quadPoints:within:", v7))
      || (-[UIView convertPoint:fromView:](-[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView"), "convertPoint:fromView:", -[UIPDFAnnotation annotationView](self, "annotationView"), x, y), -[UIPDFPageView convertPointToPDFPageSpace:](-[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView"), "convertPointToPDFPageSpace:", v8, v9), v11 = v10, v13 = v12, Count = CGPDFArrayGetCount(value), (Count & 7) != 0))
    {
LABEL_5:
      LOBYTE(dictionary) = 1;
      return (char)dictionary;
    }
    v15 = Count;
    if (Count >= 1)
    {
      v16 = 0;
      while (1)
      {
        CGPDFArrayGetNumber(value, v16, &v49);
        CGPDFArrayGetNumber(value, v16 | 1, (CGPDFReal *)&v50);
        CGPDFArrayGetNumber(value, v16 | 2, (CGPDFReal *)&v50 + 1);
        CGPDFArrayGetNumber(value, v16 | 3, (CGPDFReal *)&v51);
        CGPDFArrayGetNumber(value, v16 | 4, (CGPDFReal *)&v51 + 1);
        CGPDFArrayGetNumber(value, v16 | 5, (CGPDFReal *)&v52);
        CGPDFArrayGetNumber(value, v16 | 6, &v53);
        CGPDFArrayGetNumber(value, v16 | 7, v54);
        v17 = 0;
        v18 = v49;
        v43 = v49;
        v19 = *(double *)&v50;
        v44 = v50;
        v45 = v51;
        v20 = v53;
        v21 = v54[0];
        v46 = v52;
        v47 = v53;
        v22 = *(double *)&v50;
        v23 = v49;
        v48 = v54[0];
        do
        {
          v25 = *(double *)((char *)&v44 + v17 + 8);
          v24 = *(double *)((char *)&v45 + v17);
          if (v25 > v18)
            v26 = *(double *)((char *)&v44 + v17 + 8);
          else
            v26 = v18;
          if (v25 >= v23)
            v18 = v26;
          else
            v23 = *(double *)((char *)&v44 + v17 + 8);
          if (v24 >= v22)
          {
            if (v24 > v19)
              v19 = *(double *)((char *)&v45 + v17);
          }
          else
          {
            v22 = *(double *)((char *)&v45 + v17);
          }
          v17 += 16;
        }
        while (v17 != 48);
        v27 = v19 - v22;
        v28 = v18 - v23;
        v56.origin.x = v23;
        v56.origin.y = v22;
        v56.size.width = v28;
        v56.size.height = v27;
        if (!CGRectIsNull(v56))
        {
          v57.origin.x = v23;
          v57.origin.y = v22;
          v57.size.width = v28;
          v57.size.height = v27;
          v58 = CGRectInset(v57, -0.00000011920929, -0.00000011920929);
          v55.x = v11;
          v55.y = v13;
          if (CGRectContainsPoint(v58, v55))
            break;
        }
LABEL_40:
        LOBYTE(dictionary) = 0;
        v16 += 8;
        if (v16 >= v15)
          return (char)dictionary;
      }
      v29 = 0;
      v30 = v20 - v11;
      v31 = v21 - v13;
      v32 = 0.0;
      while (1)
      {
        v33 = v30;
        v34 = v31;
        v30 = *(CGPDFReal *)((char *)&v43 + v29) - v11;
        v31 = *(CGPDFReal *)((char *)&v43 + v29 + 8) - v13;
        v35 = sqrt(v34 * v34 + v33 * v33);
        v36 = sqrt(v30 * v30 + v31 * v31);
        if (v35 < 0.00000011920929 || v36 < 0.00000011920929)
          goto LABEL_5;
        v38 = (v33 * v31 - v34 * v30) / v35 / v36;
        v39 = 1.57079633;
        if (v38 < 1.0)
        {
          if (v38 <= -1.0)
            v39 = -1.57079633;
          else
            v39 = asin(v38);
        }
        if (v33 * v30 + v34 * v31 < 0.0)
        {
          if (fabs(v39) < 0.00000011920929)
            goto LABEL_5;
          if (v39 <= 0.0)
            v40 = -3.14159265;
          else
            v40 = 3.14159265;
          v39 = v40 - v39;
        }
        v32 = v32 + v39;
        v29 += 16;
        if (v29 == 64)
        {
          if (fabs(v32) >= 3.14159265)
            goto LABEL_5;
          goto LABEL_40;
        }
      }
    }
    LOBYTE(dictionary) = 0;
  }
  return (char)dictionary;
}

- (BOOL)recognizeGestures
{
  return 1;
}

@end
