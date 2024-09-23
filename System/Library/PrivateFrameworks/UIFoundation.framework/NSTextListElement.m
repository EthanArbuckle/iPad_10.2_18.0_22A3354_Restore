@implementation NSTextListElement

- (NSArray)childElements
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (NSAttributedString)attributedString
{
  char **v3;
  objc_class *v4;
  NSDictionary *markerAttributes;
  uint64_t v7;
  uint64_t v8;
  uint64_t (**markerTextAttributeOverrides)(id, NSTextListElement *, NSDictionary *);
  uint64_t v10;
  int v11;
  void *v12;
  id v13;
  NSTextContentManager *v14;
  int v15;
  int v16;
  id v17;
  _BOOL4 v18;
  double v19;
  id v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  int64_t contentsLocationOffset;
  BOOL v27;
  int64_t v28;
  NSTextListElement *i;
  id v30;
  uint64_t v31;
  NSTextAttachment *v32;
  _BOOL4 v33;
  NSDictionary *v34;
  objc_super v35;
  objc_super v36;

  objc_sync_enter(self);
  v3 = &selRef_encodeBycopyObject_;
  if (!-[NSTextListElement isRepresentedElement](self, "isRepresentedElement"))
    goto LABEL_3;
  v36.receiver = self;
  v36.super_class = (Class)NSTextListElement;
  if (-[NSTextParagraph attributedString](&v36, sel_attributedString))
    goto LABEL_3;
  if (self->_markerTextAttributesForTextList || (markerAttributes = self->_markerAttributes) == 0)
    markerAttributes = -[NSTextListElement _markerTextAttributesForTextList:attributes:](self, "_markerTextAttributesForTextList:attributes:", self->_textList, -[NSAttributedString attributesAtIndex:effectiveRange:](self->_contents, "attributesAtIndex:effectiveRange:", 0, 0));
  v7 = -[NSDictionary objectForKeyedSubscript:](markerAttributes, "objectForKeyedSubscript:");
  v8 = -[NSDictionary objectForKeyedSubscript:](markerAttributes, "objectForKeyedSubscript:", CFSTR("CTAdaptiveImageProvider"));
  if (v7 | v8)
  {
    v34 = (NSDictionary *)-[NSDictionary mutableCopy](markerAttributes, "mutableCopy");
    if (v7)
      -[NSDictionary removeObjectForKey:](v34, "removeObjectForKey:", CFSTR("NSAttachment"));
    markerAttributes = v34;
    if (v8)
      -[NSDictionary removeObjectForKey:](v34, "removeObjectForKey:", CFSTR("CTAdaptiveImageProvider"));
  }
  else
  {
    v34 = 0;
  }
  markerTextAttributeOverrides = (uint64_t (**)(id, NSTextListElement *, NSDictionary *))self->_markerTextAttributeOverrides;
  if (markerTextAttributeOverrides
    && (v10 = markerTextAttributeOverrides[2](markerTextAttributeOverrides, self, markerAttributes)) != 0)
  {
    v11 = -[NSDictionary isEqualToDictionary:](markerAttributes, "isEqualToDictionary:", v10);
    if (!v11)
      markerAttributes = (NSDictionary *)v10;
  }
  else
  {
    v11 = 1;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", &stru_1E260C7D0, markerAttributes);
  v13 = -[NSDictionary objectForKeyedSubscript:](markerAttributes, "objectForKeyedSubscript:");
  v33 = -[NSTextListElement _appendsParagraphSeparator](self, "_appendsParagraphSeparator");
  if (self->_contentsOnly
    && (v14 = -[NSTextElement textContentManager](self, "textContentManager"),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = -[NSTextContentManager includesTextListMarkers](v14, "includesTextListMarkers") ^ 1;
  }
  else
  {
    v15 = 1;
  }
  if (v13)
    v16 = v11;
  else
    v16 = 1;
  if (v16 != 1)
  {
    objc_msgSend(v13, "defaultTabInterval");
    if (v19 <= 0.0)
    {
      v18 = objc_msgSend((id)objc_msgSend(v13, "tabStops"), "count") == 0;
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  v17 = -[NSTextListElement _createConfiguredParagraphStyleForParagraphStyle:](self, "_createConfiguredParagraphStyleForParagraphStyle:", v13);
  if (!v17)
  {
LABEL_30:
    v18 = 0;
    goto LABEL_32;
  }

  v18 = 0;
  v13 = v17;
LABEL_32:
  objc_msgSend(v12, "beginEditing");
  if (v15)
  {
    v32 = -[NSTextList markerTextAttachment](self->_textList, "markerTextAttachment");
    v20 = -[NSTextListElement _markerString](self, "_markerString");
    v31 = objc_msgSend(v20, "length");
    v21 = (void *)objc_msgSend(v12, "mutableString");
    if (v18)
      v22 = CFSTR("%@");
    else
      v22 = CFSTR("\t%@\t");
    objc_msgSend(v21, "appendFormat:", v22, v20);
    v23 = !v18;
    if ((-[NSTextList listOptions](self->_textList, "listOptions") & 1) != 0)
    {
      for (i = -[NSTextListElement parentElement](self, "parentElement");
            i;
            i = -[NSTextListElement parentElement](i, "parentElement"))
      {
        if (-[NSTextListElement isRepresentedElement](i, "isRepresentedElement"))
        {
          v30 = -[NSTextListElement _markerString](i, "_markerString");
          objc_msgSend((id)objc_msgSend(v12, "mutableString"), "replaceCharactersInRange:withString:", 1, 0, v30);
          v23 += objc_msgSend(v30, "length");
        }
      }
    }
    if (v32 && objc_msgSend(v20, "isEqualToString:", CFSTR("\uFFFC")))
      objc_msgSend(v12, "addAttribute:value:range:", CFSTR("NSAttachment"), v32, v23, v31);
  }
  self->_contentsLocationOffset = objc_msgSend(v12, "length");
  if (v33)
    objc_msgSend((id)objc_msgSend(v12, "mutableString"), "appendString:", CFSTR("\n"));
  objc_msgSend(v12, "addAttributes:range:", markerAttributes, 0, objc_msgSend(v12, "length"));
  if (-[NSAttributedString length](self->_contents, "length"))
  {
    objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", objc_msgSend(v12, "length") - v33, 0, self->_contents);
  }
  else if (!v18)
  {
    v24 = -[NSDictionary objectForKeyedSubscript:](self->_markerAttributes, "objectForKeyedSubscript:", CFSTR("NSFont"));
    if (v24)
    {
      if ((objc_msgSend(v24, "isEqual:", -[NSDictionary objectForKeyedSubscript:](markerAttributes, "objectForKeyedSubscript:", CFSTR("NSFont"))) & 1) == 0)objc_msgSend(v12, "addAttribute:value:range:", CFSTR("NSFont"), v24, self->_contentsLocationOffset - 1, 1);
    }
  }
  objc_msgSend(v12, "addAttribute:value:range:", CFSTR("NSParagraphStyle"), v13, 0, objc_msgSend(v12, "length"));
  objc_msgSend(v12, "endEditing");

  -[NSTextParagraph setAttributedString:](self, "setAttributedString:", v12);
  v25 = -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextElement textContentManager](self, "textContentManager"), "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"), -[NSTextRange location](-[NSTextParagraph paragraphContentRange](self, "paragraphContentRange"), "location"));
  v3 = &selRef_encodeBycopyObject_;
  if (v25 >= 1)
  {
    contentsLocationOffset = self->_contentsLocationOffset;
    v27 = contentsLocationOffset < v25;
    v28 = contentsLocationOffset - v25;
    if (!v27)
      self->_contentsLocationOffset = v28;
  }
LABEL_3:
  objc_sync_exit(self);
  v4 = (objc_class *)v3[97];
  v35.receiver = self;
  v35.super_class = v4;
  return -[NSTextParagraph attributedString](&v35, sel_attributedString);
}

- (BOOL)isRepresentedElement
{
  return self->_contents || self->_markerAttributes != 0;
}

uint64_t __92__NSTextListElement_initWithParentElement_textList_contents_markerAttributes_childElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_reparentWithTextListElement:itemNumber:", objc_loadWeak((id *)(a1 + 32)), *(_QWORD *)(a1 + 40) + a3);
}

- (void)setParentElement:(id)a3
{
  objc_storeWeak((id *)&self->_parentElement, a3);
}

- (void)setParagraphContentRange:(id)a3
{
  uint64_t v5;
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSTextListElement;
  -[NSTextParagraph setParagraphContentRange:](&v7, sel_setParagraphContentRange_);
  if (a3)
  {
    objc_msgSend(a3, "range");
    v6 = v5 == -[NSAttributedString length](self->_contents, "length");
  }
  else
  {
    v6 = 0;
  }
  self->_contentsOnly = v6;
}

- (void)setMarkerTextAttributeOverrides:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSTextListElement)parentElement
{
  return (NSTextListElement *)objc_loadWeak((id *)&self->_parentElement);
}

- (NSTextListElement)initWithParentElement:(NSTextListElement *)parent textList:(NSTextList *)textList contents:(NSAttributedString *)contents markerAttributes:(NSDictionary *)markerAttributes childElements:(NSArray *)children
{
  NSTextListElement *v14;
  void *v15;
  NSArray *childElements;
  int v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21[2];
  id location;
  objc_super v23;

  if ((unint64_t)contents | (unint64_t)markerAttributes || -[NSArray count](children, "count"))
  {
    v23.receiver = self;
    v23.super_class = (Class)NSTextListElement;
    v14 = -[NSTextParagraph initWithAttributedString:](&v23, sel_initWithAttributedString_, 0);
    if (v14)
    {
      objc_initWeak(&location, v14);
      -[NSTextListElement setParentElement:](v14, "setParentElement:", parent);
      v14->_textList = textList;
      v14->_contents = (NSAttributedString *)-[NSAttributedString copy](contents, "copy");
      v14->_markerAttributes = (NSDictionary *)-[NSDictionary copy](markerAttributes, "copy");
      v14->_childElements = (NSArray *)-[NSArray copy](children, "copy");
      v15 = -[NSTextList startingItemNumber](textList, "startingItemNumber");
      childElements = v14->_childElements;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __92__NSTextListElement_initWithParentElement_textList_contents_markerAttributes_childElements___block_invoke;
      v20[3] = &unk_1E26046C0;
      objc_copyWeak(v21, &location);
      v21[1] = v15;
      -[NSArray enumerateObjectsUsingBlock:](childElements, "enumerateObjectsUsingBlock:", v20);
      v14->_indentLevel = -1;
      v17 = -[NSTextElement coalescingType](v14, "coalescingType");
      v18 = v17 | 8u;
      if (!parent && !v14->_contents && -[NSArray count](v14->_childElements, "count"))
        v18 = v17 | 9 | objc_msgSend(-[NSArray lastObject](v14->_childElements, "lastObject"), "coalescingType") & 2;
      -[NSTextElement setCoalescingType:](v14, "setCoalescingType:", v18);
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (-[NSArray count](children, "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextListElement.m"), 435, CFSTR("%@: initializing with invalid arguments. contents:%@, markerAttributes:%@, childElements:%@"), self, 0, 0, children);

    return 0;
  }
  return v14;
}

- (void)_reparentWithTextListElement:(id)a3 itemNumber:(int64_t)a4
{
  objc_sync_enter(self);
  -[NSTextListElement setParentElement:](self, "setParentElement:", a3);
  self->_indentLevel = -1;
  self->_itemNumber = a4;
  -[NSTextParagraph setAttributedString:](self, "setAttributedString:", 0);
  objc_sync_exit(self);
}

- (id)_markerString
{
  return -[NSTextList markerForItemNumber:](self->_textList, "markerForItemNumber:", self->_itemNumber);
}

- (double)_markerOffset
{
  return 25.0;
}

- (double)_indentOffset
{
  return 36.0;
}

- (int64_t)_indentLevel
{
  int64_t result;

  result = self->_indentLevel;
  if (result < 0)
  {
    result = -[NSTextListElement parentElement](self, "parentElement");
    if (result)
      result = objc_msgSend((id)result, "_indentLevel") + 1;
    self->_indentLevel = result;
  }
  return result;
}

- (id)_createConfiguredParagraphStyleForParagraphStyle:(id)a3
{
  NSMutableParagraphStyle *v4;
  NSMutableParagraphStyle *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSTextListElement *i;

  if (a3)
    v4 = (NSMutableParagraphStyle *)objc_msgSend(a3, "mutableCopy");
  else
    v4 = objc_alloc_init(NSMutableParagraphStyle);
  v5 = v4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (double)-[NSTextListElement _indentLevel](self, "_indentLevel");
  -[NSTextListElement _indentOffset](self, "_indentOffset");
  v9 = v8 * v7;
  -[NSTextListElement _markerOffset](self, "_markerOffset");
  v11 = v9 - v10;
  -[NSMutableParagraphStyle setFirstLineHeadIndent:](v5, "setFirstLineHeadIndent:", 0.0);
  -[NSMutableParagraphStyle setHeadIndent:](v5, "setHeadIndent:", v9);
  v12 = (void *)objc_msgSend((id)objc_opt_class(), "_createUpdatedTextTabsForTextTabs:markerLocation:listLocation:", -[NSParagraphStyle tabStops](v5, "tabStops"), v11, v9);
  -[NSMutableParagraphStyle setTabStops:](v5, "setTabStops:", v12);

  for (i = self; -[NSTextListElement parentElement](i, "parentElement"); self = i)
  {
    objc_msgSend(v6, "insertObject:atIndex:", -[NSTextListElement textList](self, "textList"), 0);
    i = -[NSTextListElement parentElement](self, "parentElement");
  }
  -[NSMutableParagraphStyle setTextLists:](v5, "setTextLists:", v6);

  return v5;
}

- (BOOL)_appendsParagraphSeparator
{
  NSTextContentManager *v3;

  v3 = -[NSTextElement textContentManager](self, "textContentManager");
  return !objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](v3, "documentRange"), "endLocation"))|| -[NSTextContentManager containsExtraLineFragment](v3, "containsExtraLineFragment");
}

+ (id)_rootTextListElementFromAttributedString:(id)a3 atIndex:(int64_t)a4 options:(unint64_t)a5 effectiveRange:(_NSRange *)a6 textListElementInstantiationCallback:(id)a7
{
  char v9;
  id result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;

  v9 = a5;
  if (objc_msgSend(a3, "length") <= (unint64_t)a4)
    return 0;
  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:effectiveRange:", a4, 0), "objectForKeyedSubscript:", CFSTR("NSParagraphStyle")), "textLists"), "firstObject");
  if (!result)
    return result;
  v14 = objc_msgSend(a3, "rangeOfTextList:atIndex:", result, a4);
  if (!v15)
    return 0;
  v16 = v14;
  v17 = v15;
  v22 = v14;
  v23 = v15;
  do
  {
    v18 = (void *)objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSAttachment"), v16, &v22, v16, v17);
    if (!v18)
      break;
    if (objc_msgSend(v18, "embeddingType") != 1)
      break;
    v19 = v17 + v16;
    v16 = v23 + v22;
    v17 = v19 - (v23 + v22);
  }
  while (v19 != v23 + v22);
  v22 = v16;
  if (v16 < v17 + v16)
  {
    v20 = v16;
    while (1)
    {
      v21 = (void *)objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSAttachment"), v20, &v22, v16, v17);
      if (v21)
      {
        if (objc_msgSend(v21, "embeddingType") == 1)
          break;
      }
      v20 = v22 + v23;
      v22 = v20;
      if (v20 >= v17 + v16)
        goto LABEL_17;
    }
    v17 = v22 - v16;
  }
LABEL_17:
  result = 0;
  if (a4 >= v16 && a4 - v16 < v17)
  {
    result = (id)objc_msgSend(a1, "_createTextListElementFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", a3, v16, v17, -1, v9 & 1, a6, a7);
    if (result)
      return result;
  }
  return result;
}

+ (id)_createUpdatedTextTabsForTextTabs:(id)a3 markerLocation:(double)a4 listLocation:(double)a5
{
  void *v8;
  NSTextTab *v9;
  NSTextTab *v10;
  NSTextTab *v11;
  NSTextTab *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  v15 = 0;
  v16 = &v15;
  v17 = 0x3010000000;
  v19 = 0;
  v20 = 0;
  v18 = "";
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__NSTextListElement__createUpdatedTextTabsForTextTabs_markerLocation_listLocation___block_invoke;
  v14[3] = &unk_1E2604670;
  *(double *)&v14[5] = a5;
  v14[4] = &v15;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v14);
  v9 = [NSTextTab alloc];
  v10 = -[NSTextTab initWithTextAlignment:location:options:](v9, "initWithTextAlignment:location:options:", 4, MEMORY[0x1E0C9AA70], a4);
  v11 = [NSTextTab alloc];
  v12 = -[NSTextTab initWithTextAlignment:location:options:](v11, "initWithTextAlignment:location:options:", 4, MEMORY[0x1E0C9AA70], a5);
  v21[0] = v10;
  v21[1] = v12;
  objc_msgSend(v8, "replaceObjectsInRange:withObjectsFromArray:", v16[4], v16[5], objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2));

  _Block_object_dispose(&v15, 8);
  return v8;
}

+ (id)_createTextListElementFromAttributedString:(id)a3 inRange:(_NSRange)a4 indentLevel:(int64_t)a5 includesTextListMarkers:(BOOL)a6 effectiveRange:(_NSRange *)a7 textListElementInstantiationCallback:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  int64_t v13;
  NSRange v14;
  NSRange v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  void (**v23)(id, NSTextListElement *, id, NSUInteger, NSUInteger, NSUInteger, NSUInteger);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSTextListElement *v27;
  NSUInteger v28;
  NSUInteger v29;
  BOOL v30;
  _BOOL4 v33;
  id v34;
  char v35;
  NSRange v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSRange v40;
  NSRange v41;
  NSRange v42;
  NSRange v43;
  NSRange v44;

  v33 = a6;
  length = a4.length;
  location = a4.location;
  v39 = 0;
  v13 = a5 + 1;
  v37 = 0;
  v38 = 0;
  objc_msgSend((id)objc_msgSend(a3, "string"), "getParagraphStart:end:contentsEnd:forRange:", &v39, &v37, &v38, a4.location, 1);
  v43.location = v39;
  v43.length = v37 - v39;
  v41.location = location;
  v41.length = length;
  v14 = NSIntersectionRange(v41, v43);
  v40 = v14;
  v44.location = v39;
  v44.length = v38 - v39;
  v42.location = location;
  v42.length = length;
  v15 = NSIntersectionRange(v42, v44);
  v34 = a3;
  v16 = (void *)objc_msgSend(a3, "attributesAtIndex:effectiveRange:", location, 0);
  v17 = (void *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle")), "textLists");
  v18 = objc_msgSend(v17, "count");
  if (v18 == v13)
  {
    v19 = 0;
    v36.location = 0;
    v36.length = 0;
    if (v14.length + v14.location >= location && v14.length + v14.location - location < length)
    {
      v19 = 0;
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "attributesAtIndex:effectiveRange:", v14.length + v14.location, 0), "objectForKeyedSubscript:", CFSTR("NSParagraphStyle")), "textLists"), "count") > (unint64_t)v13)v19 = (void *)objc_msgSend(a1, "_createChildElementsFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v34, v14.length + v14.location, location + length - (v14.length + v14.location), v13, v33, &v36, a8);
    }
    v35 = 0;
    if (v33)
    {
      v20 = objc_msgSend(a1, "_textListElementContentsRangeForRange:inAttributedString:hadMarker:", v15.location, v15.length, v34, &v35);
      v22 = v21;
    }
    else
    {
      v20 = v15.location;
      v22 = v15.length;
    }
    if (v22)
      v26 = objc_msgSend(v34, "attributedSubstringFromRange:", v20, v22);
    else
      v26 = 0;
    v27 = -[NSTextListElement initWithParentElement:textList:contents:markerAttributes:childElements:]([NSTextListElement alloc], "initWithParentElement:textList:contents:markerAttributes:childElements:", 0, objc_msgSend(v17, "lastObject"), v26, v16, v19);
    if (v19)
    {
      v28 = v20 + v22 - v14.location;
      v40 = NSUnionRange(v14, v36);

      v29 = v14.location;
      v23 = (void (**)(id, NSTextListElement *, id, NSUInteger, NSUInteger, NSUInteger, NSUInteger))a8;
    }
    else
    {
      v29 = v15.location;
      v28 = v15.length;
      v30 = v15.length == v22 && v15.location == v20;
      v23 = (void (**)(id, NSTextListElement *, id, NSUInteger, NSUInteger, NSUInteger, NSUInteger))a8;
      if (!v30 && !v35)
      {
        v28 = v22;
        v29 = v20;
      }
    }
  }
  else
  {
    if (v18 <= v13)
      return 0;
    v23 = (void (**)(id, NSTextListElement *, id, NSUInteger, NSUInteger, NSUInteger, NSUInteger))a8;
    v24 = (void *)objc_msgSend(a1, "_createChildElementsFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v34, location, length, v13, v33, &v40, a8);
    if (objc_msgSend(v24, "count"))
    {
      if (a5 < 0)
        v25 = objc_msgSend(v17, "firstObject");
      else
        v25 = objc_msgSend(v17, "objectAtIndexedSubscript:", a5);
      v29 = v15.location;
      v28 = v15.length;
      v27 = (NSTextListElement *)objc_msgSend(a1, "_createElementWithChildElements:textList:nestingLevel:", v24, v25, 0);
    }
    else
    {
      v27 = 0;
      v29 = v15.location;
      v28 = v15.length;
    }

  }
  if (v27)
  {
    if (v23)
      v23[2](v23, v27, v34, v40.location, v40.length, v29, v28);
    if (a7)
      *a7 = v40;
  }
  return v27;
}

+ (id)_createElementWithChildElements:(id)a3 textList:(id)a4 nestingLevel:(int64_t)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithParentElement:textList:contents:markerAttributes:childElements:", 0, a4, 0, 0, a3);
  v10 = (void *)v9;
  if (a5 < 1)
  {
    if (a5 < 0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      v14 = objc_opt_class();
      objc_msgSend(v12, "raise:format:", v13, CFSTR("-[%@ %@] receiving negative nesting level %ld"), v14, NSStringFromSelector(a2), a5);
    }
  }
  else
  {
    v16[0] = v9;
    v11 = (void *)objc_msgSend(a1, "_createElementWithChildElements:textList:nestingLevel:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1), a4, a5 - 1);

    return v11;
  }
  return v10;
}

+ (id)_createChildElementsFromAttributedString:(id)a3 inRange:(_NSRange)a4 indentLevel:(int64_t)a5 includesTextListMarkers:(BOOL)a6 effectiveRange:(_NSRange *)a7 textListElementInstantiationCallback:(id)a8
{
  _BOOL8 v9;
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  void *v23;
  NSUInteger v24;
  NSUInteger v25;
  NSRange v26;
  void *v28;
  id v30;
  NSRange v31;
  NSRange v32;

  v9 = a6;
  length = a4.length;
  location = a4.location;
  v31.location = 0;
  v31.length = 0;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = a1;
  v16 = a1;
  v17 = a3;
  v18 = a3;
  v19 = a5;
  v20 = a5;
  v21 = v9;
  v22 = objc_msgSend(v16, "_createTextListElementFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v18, location, length, v20, v9, &v31, a8);
  if (v22)
  {
    v23 = (void *)v22;
    v24 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = v31.location;
        v24 = v31.length;
      }
      else
      {
        v32.location = v25;
        v32.length = v24;
        v26 = NSUnionRange(v32, v31);
        v25 = v26.location;
        v24 = v26.length;
      }
      objc_msgSend(v30, "addObject:", v23);

      if (v31.length + v31.location < location || v31.length + v31.location - location >= length)
        break;
      v23 = (void *)objc_msgSend(v15, "_createTextListElementFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v17, v31.length + v31.location, location + length - (v31.length + v31.location), v19, v21, &v31, a8);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v28 = v30;
  if (objc_msgSend(v30, "count"))
  {
    if (a7)
    {
      a7->location = v25;
      a7->length = v24;
    }
  }
  else
  {

    return 0;
  }
  return v28;
}

uint64_t __83__NSTextListElement__createUpdatedTextTabsForTextTabs_markerLocation_listLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v7;

  result = objc_msgSend(a2, "location");
  if (v7 <= *(double *)(a1 + 40))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  else
    *a4 = 1;
  return result;
}

+ (void)_fillTextListElement:(id)a3 toAttributedString:(id)a4
{
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v7 = objc_msgSend(a3, "attributedString");
  if (v7)
    objc_msgSend(a4, "appendAttributedString:", v7);
  v8 = (void *)objc_msgSend(a3, "childElements");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__NSTextListElement__fillTextListElement_toAttributedString___block_invoke;
  v9[3] = &unk_1E2604698;
  v9[4] = a1;
  v9[5] = a4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
}

uint64_t __61__NSTextListElement__fillTextListElement_toAttributedString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fillTextListElement:toAttributedString:", a2, *(_QWORD *)(a1 + 40));
}

+ (id)_formattedAttributedStringForRootTextListElement:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v5, "beginEditing");
  objc_msgSend(a1, "_fillTextListElement:toAttributedString:", a3, v5);
  objc_msgSend(v5, "endEditing");
  return v5;
}

+ (_NSRange)_textListElementContentsRangeForRange:(_NSRange)a3 inAttributedString:(id)a4 hadMarker:(BOOL *)a5
{
  int64_t length;
  CFIndex location;
  const __CFString *v8;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v11;
  UniChar v12;
  CFRange v13;
  uint64_t v15;
  CFIndex v16;
  UniChar v17;
  int64_t v18;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  _OWORD v23[8];
  CFStringRef theString;
  const UniChar *v25;
  const char *v26;
  CFIndex v27;
  int64_t v28;
  uint64_t v29;
  CFIndex v30;
  _NSRange result;
  CFRange v32;

  length = a3.length;
  location = a3.location;
  v8 = (const __CFString *)objc_msgSend(a4, "string");
  theString = v8;
  v27 = location;
  v28 = length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  v25 = CharactersPtr;
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
  v29 = 0;
  v30 = 0;
  v26 = CStringPtr;
  if (length > 0)
  {
    memset(v23, 0, sizeof(v23));
    if (CharactersPtr)
    {
      v11 = 0;
      v12 = CharactersPtr[location];
    }
    else if (CStringPtr)
    {
      v11 = 0;
      v12 = CStringPtr[location];
    }
    else
    {
      v13.length = (unint64_t)length >= 0x40 ? 64 : length;
      v30 = v13.length;
      v13.location = location;
      CFStringGetCharacters(v8, v13, (UniChar *)v23);
      v11 = v29;
      v12 = *((_WORD *)v23 - v29);
    }
    if (v12 == 9 && (unint64_t)length >= 2)
    {
      v15 = 1;
      do
      {
        v16 = v28;
        if (v28 <= v15)
        {
          v18 = v15 + 1;
        }
        else
        {
          if (v25)
          {
            v17 = v25[v27 + v15];
          }
          else if (v26)
          {
            v17 = v26[v27 + v15];
          }
          else
          {
            if (v30 <= v15 || v11 > v15)
            {
              v20 = v15 - 4;
              if (v15 < 4)
                v20 = 0;
              if (v20 + 64 < v28)
                v16 = v20 + 64;
              v29 = v20;
              v30 = v16;
              v32.location = v27 + v20;
              v32.length = v16 - v20;
              CFStringGetCharacters(theString, v32, (UniChar *)v23);
              v11 = v29;
            }
            v17 = *((_WORD *)v23 + v15 - v11);
          }
          v18 = v15 + 1;
          if (v17 == 9)
          {
            length -= v18;
            location += v18;
            *a5 = (unint64_t)v15 > 1;
            break;
          }
        }
        v15 = v18;
      }
      while (v18 < length);
    }
  }
  v21 = location;
  v22 = length;
  result.length = v22;
  result.location = v21;
  return result;
}

- (id)_markerTextAttributesForTextList:(id)a3 attributes:(id)a4
{
  uint64_t (**markerTextAttributesForTextList)(id, id);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  const __CTFontDescriptor *v12;
  CTFontDescriptorRef CopyWithSymbolicTraits;
  UIFont *v14;

  markerTextAttributesForTextList = (uint64_t (**)(id, id))self->_markerTextAttributesForTextList;
  if (markerTextAttributesForTextList)
    v6 = (void *)markerTextAttributesForTextList[2](markerTextAttributesForTextList, a3);
  else
    v6 = 0;
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(a4, "count");
  if (v7 < 1)
  {
    v9 = 0;
  }
  else if (v8 < 1)
  {
    v9 = 0;
    a4 = v6;
  }
  else
  {
    v9 = (void *)objc_msgSend(a4, "mutableCopy");
    objc_msgSend(v9, "addEntriesFromDictionary:", v6);
    a4 = v9;
  }
  if (!objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSFont")))
  {
    v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NSFont"));
    v12 = (const __CTFontDescriptor *)objc_msgSend(v11, "fontDescriptor");
    if ((CTFontDescriptorGetSymbolicTraits() & 3) != 0)
    {
      CopyWithSymbolicTraits = CTFontDescriptorCreateCopyWithSymbolicTraits(v12, 0, 3u);
      objc_msgSend(v11, "pointSize");
      v14 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", CopyWithSymbolicTraits);
      CFRelease(CopyWithSymbolicTraits);
      if (v14)
      {
        if ((-[UIFont isEqual:](v14, "isEqual:", v11) & 1) == 0)
        {
          if (!v9)
          {
            v9 = (void *)objc_msgSend(a4, "mutableCopy");
            a4 = v9;
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("NSFont"));
        }
      }
    }
  }
  return a4;
}

- (int64_t)indentLevel
{
  int64_t v3;

  objc_sync_enter(self);
  v3 = -[NSTextListElement _indentLevel](self, "_indentLevel");
  objc_sync_exit(self);
  return v3;
}

- (int64_t)itemNumber
{
  return self->_itemNumber;
}

- (int64_t)_contentsLocationOffset
{
  if (!self->_contentsOnly)
    return 0;
  -[NSTextListElement attributedString](self, "attributedString");
  return self->_contentsLocationOffset;
}

- (BOOL)contentsOnly
{
  return self->_contentsOnly;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTextListElement setParentElement:](self, "setParentElement:", 0);

  v3.receiver = self;
  v3.super_class = (Class)NSTextListElement;
  -[NSTextParagraph dealloc](&v3, sel_dealloc);
}

+ (NSTextListElement)textListElementWithContents:(NSAttributedString *)contents markerAttributes:(NSDictionary *)markerAttributes textList:(NSTextList *)textList childElements:(NSArray *)children
{
  id v10;
  NSAttributedString *v11;

  v10 = objc_alloc((Class)a1);
  if (-[NSAttributedString length](contents, "length"))
    v11 = contents;
  else
    v11 = 0;
  return (NSTextListElement *)(id)objc_msgSend(v10, "initWithParentElement:textList:contents:markerAttributes:childElements:", 0, textList, v11, markerAttributes, children);
}

+ (NSTextListElement)textListElementWithChildElements:(NSArray *)children textList:(NSTextList *)textList nestingLevel:(NSInteger)nestingLevel
{
  return (NSTextListElement *)(id)objc_msgSend(a1, "_createElementWithChildElements:textList:nestingLevel:", children, textList, nestingLevel);
}

+ (void)initialize
{
  __NSTextListElementEditedRangeValidator *v2;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(__NSTextListElementEditedRangeValidator);
    +[NSTextContentStorage registerEditedRangeValidator:](NSTextContentStorage, "registerEditedRangeValidator:", v2);

  }
}

- (id)markerAttributedString
{
  NSAttributedString *v3;
  NSAttributedString *v4;
  unint64_t contentsLocationOffset;

  v3 = -[NSTextListElement attributedString](self, "attributedString");
  if (self->_contentsOnly
    && (v4 = v3,
        contentsLocationOffset = self->_contentsLocationOffset,
        contentsLocationOffset <= -[NSAttributedString length](v3, "length")))
  {
    return -[NSAttributedString attributedSubstringFromRange:](v4, "attributedSubstringFromRange:", 0, self->_contentsLocationOffset);
  }
  else
  {
    return 0;
  }
}

- (id)locationForCharacterIndex:(int64_t)a3 dataSourceLocationsOnly:(BOOL)a4 actualRange:(_NSRange *)a5
{
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  _NSTextElementLocation *v14;
  NSUInteger v15;
  objc_super v17;

  v9 = -[NSTextListElement _contentsLocationOffset](self, "_contentsLocationOffset");
  v10 = -[NSAttributedString length](-[NSTextListElement attributedString](self, "attributedString"), "length");
  if (v10 < a3)
    return 0;
  v11 = v10;
  v12 = __OFSUB__(a3, v9);
  v13 = a3 - v9;
  if (v13 < 0 == v12)
  {
    v17.receiver = self;
    v17.super_class = (Class)NSTextListElement;
    v14 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](&v17, sel_locationForCharacterIndex_dataSourceLocationsOnly_actualRange_, v13, 0, 0);
    if (!a5)
      return v14;
    goto LABEL_11;
  }
  if (a4)
    return 0;
  objc_sync_enter(self);
  v14 = -[NSTextParagraph _textElementLocationForCharacterIndex:](self, "_textElementLocationForCharacterIndex:", a3);
  if (!v14)
  {
    v14 = -[_NSTextElementLocation initWithTextElement:baseLocation:offset:]([_NSTextElementLocation alloc], "initWithTextElement:baseLocation:offset:", self, -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"), v13);
    -[NSTextParagraph _setElementTextLocation:forCharacterIndex:](self, "_setElementTextLocation:forCharacterIndex:", v14, a3);

  }
  objc_sync_exit(self);
  if (a5)
  {
LABEL_11:
    if (v14)
    {
      if (v11 == a3)
        v15 = 0;
      else
        a3 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](-[NSAttributedString string](-[NSTextListElement attributedString](self, "attributedString"), "string"), "rangeOfComposedCharacterSequenceAtIndex:", a3);
      a5->location = a3;
      a5->length = v15;
    }
  }
  return v14;
}

- (_NSRange)rangeForLocation:(id)a3 allowsTrailingEdge:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  int64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  __int128 v11;
  _NSRange result;

  v11 = xmmword_18D6CBB80;
  if (a3
    && ((v4 = a4,
         -[NSTextRange containsLocation:](-[NSTextElement elementRange](self, "elementRange"), "containsLocation:", a3))
     || v4
     && objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"), "isEqual:", a3)))
  {
    v7 = -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextElement textContentManager](self, "textContentManager", v11), "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"), a3);
    v8 = -[NSTextListElement _contentsLocationOffset](self, "_contentsLocationOffset") + v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (NSTextListElement *)objc_msgSend(a3, "textElement") == self)
      v8 += objc_msgSend(a3, "offset");
    -[NSTextListElement locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](self, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v8, 0, &v11);
    v10 = *((_QWORD *)&v11 + 1);
    v9 = v11;
  }
  else
  {
    v10 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (NSTextListElement)textListElementWithChildElements:(id)a3
{
  return (NSTextListElement *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentElement:textList:contents:markerAttributes:childElements:", -[NSTextListElement parentElement](self, "parentElement"), self->_textList, self->_contents, self->_markerAttributes, a3);
}

- (NSTextList)textList
{
  return (NSTextList *)objc_getProperty(self, a2, 160, 1);
}

- (NSAttributedString)contents
{
  return (NSAttributedString *)objc_getProperty(self, a2, 168, 1);
}

- (id)markerTextAttributeOverrides
{
  return objc_getProperty(self, a2, 184, 1);
}

- (NSDictionary)markerAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (id)markerTextAttributesForTextList
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setMarkerTextAttributesForTextList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentElement);
}

@end
