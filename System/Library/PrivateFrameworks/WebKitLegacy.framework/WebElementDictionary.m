@implementation WebElementDictionary

+ (void)initializeLookupTable
{
  __CFDictionary *Mutable;
  const void *v3;
  NSString *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;

  if ((_MergedGlobals_7 & 1) != 0)
  {
    if (qword_1F0166008)
      return;
  }
  else
  {
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], 0);
  if ((_MergedGlobals_7 & 1) == 0)
  {
    _MergedGlobals_7 = 1;
    qword_1F0166008 = (uint64_t)Mutable;
    goto LABEL_10;
  }
  v3 = (const void *)qword_1F0166008;
  qword_1F0166008 = (uint64_t)Mutable;
  if (!v3)
  {
LABEL_10:
    v4 = WebElementDOMNodeKey;
    goto LABEL_11;
  }
  CFRelease(v3);
  v4 = WebElementDOMNodeKey;
  if (_MergedGlobals_7 == 1)
  {
    Mutable = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    Mutable = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
LABEL_11:
  CFDictionaryAddValue(Mutable, v4, sel__domNode);
  if (_MergedGlobals_7 == 1)
  {
    v5 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v5 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v5, WebElementFrameKey, sel__webFrame);
  if (_MergedGlobals_7 == 1)
  {
    v6 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v6 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v6, WebElementImageAltStringKey, sel__altDisplayString);
  if (_MergedGlobals_7 == 1)
  {
    v7 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v7 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v7, WebElementImageURLKey, sel__absoluteImageURL);
  if (_MergedGlobals_7 == 1)
  {
    v8 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v8 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v8, WebElementIsSelectedKey, sel__isSelected);
  if (_MergedGlobals_7 == 1)
  {
    v9 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v9 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v9, WebElementMediaURLKey, sel__absoluteMediaURL);
  if (_MergedGlobals_7 == 1)
  {
    v10 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v10 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v10, WebElementSpellingToolTipKey, sel__spellingToolTip);
  if (_MergedGlobals_7 == 1)
  {
    v11 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v11 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v11, WebElementTitleKey, sel__title);
  if (_MergedGlobals_7 == 1)
  {
    v12 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v12 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v12, WebElementLinkURLKey, sel__absoluteLinkURL);
  if (_MergedGlobals_7 == 1)
  {
    v13 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v13 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v13, WebElementLinkTargetFrameKey, sel__targetWebFrame);
  if (_MergedGlobals_7 == 1)
  {
    v14 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v14 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v14, WebElementLinkTitleKey, sel__titleDisplayString);
  if (_MergedGlobals_7 == 1)
  {
    v15 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v15 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v15, WebElementLinkLabelKey, sel__textContent);
  if (_MergedGlobals_7 == 1)
  {
    v16 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v16 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v16, WebElementLinkIsLiveKey, sel__isLiveLink);
  if (_MergedGlobals_7 == 1)
  {
    v17 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v17 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v17, WebElementIsContentEditableKey, sel__isContentEditable);
  if (_MergedGlobals_7 == 1)
  {
    v18 = (__CFDictionary *)qword_1F0166008;
  }
  else
  {
    v18 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v18, WebElementIsInScrollBarKey, sel__isInScrollBar);
}

- (WebElementDictionary)initWithHitTestResult:(const void *)a3
{
  WebElementDictionary *v5;
  uint64_t v6;
  objc_super v8;

  objc_msgSend((id)objc_opt_class(), "initializeLookupTable");
  v8.receiver = self;
  v8.super_class = (Class)WebElementDictionary;
  v5 = -[WebElementDictionary init](&v8, sel_init);
  if (v5)
  {
    v6 = WTF::fastMalloc((WTF *)0x88);
    MEMORY[0x1D82A4424](v6, a3);
    v5->_result = (void *)v6;
  }
  return v5;
}

- (void)dealloc
{
  objc_class *v3;
  WTF *v4;
  void *v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if (self->_result)
    {
      v4 = (WTF *)MEMORY[0x1D82A4430]();
      WTF::fastFree(v4, v5);
    }

    v6.receiver = self;
    v6.super_class = (Class)WebElementDictionary;
    -[WebElementDictionary dealloc](&v6, sel_dealloc);
  }
}

- (void)_fillCache
{
  const __CFDictionary *v3;

  if (_MergedGlobals_7 == 1)
  {
    v3 = (const __CFDictionary *)qword_1F0166008;
  }
  else
  {
    v3 = 0;
    qword_1F0166008 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)cacheValueForKey, self);
  self->_cacheComplete = 1;
}

- (unint64_t)count
{
  NSMutableDictionary *cache;

  if (self->_cacheComplete)
  {
    cache = self->_cache;
  }
  else
  {
    -[WebElementDictionary _fillCache](self, "_fillCache");
    cache = self->_cache;
  }
  return -[NSMutableDictionary count](cache, "count");
}

- (id)keyEnumerator
{
  NSMutableDictionary *cache;

  if (self->_cacheComplete)
  {
    cache = self->_cache;
  }
  else
  {
    -[WebElementDictionary _fillCache](self, "_fillCache");
    cache = self->_cache;
  }
  return (id)-[NSMutableDictionary keyEnumerator](cache, "keyEnumerator");
}

- (id)objectForKey:(id)a3
{
  void *v5;
  const void *Value;
  CFIndex Count;
  NSMutableDictionary *cache;
  NSMutableSet *nilValues;
  uint64_t v11;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:");
  if (!v5)
  {
    if (!self->_cacheComplete && (-[NSMutableSet containsObject:](self->_nilValues, "containsObject:", a3) & 1) == 0)
    {
      if (_MergedGlobals_7 == 1)
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)qword_1F0166008, a3);
        if (Value)
          goto LABEL_6;
      }
      else
      {
        qword_1F0166008 = 0;
        _MergedGlobals_7 = 1;
        Value = CFDictionaryGetValue(0, a3);
        if (Value)
        {
LABEL_6:
          v5 = (void *)-[WebElementDictionary performSelector:](self, "performSelector:", Value);
          if (_MergedGlobals_7 == 1)
          {
            Count = CFDictionaryGetCount((CFDictionaryRef)qword_1F0166008);
            if (v5)
            {
LABEL_8:
              cache = self->_cache;
              if (!cache)
              {
                cache = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", Count);
                self->_cache = cache;
              }
              -[NSMutableDictionary setObject:forKey:](cache, "setObject:forKey:", v5, a3);
LABEL_18:
              v11 = -[NSMutableDictionary count](self->_cache, "count");
              self->_cacheComplete = -[NSMutableSet count](self->_nilValues, "count") + v11 == Count;
              return v5;
            }
          }
          else
          {
            qword_1F0166008 = 0;
            _MergedGlobals_7 = 1;
            Count = CFDictionaryGetCount(0);
            if (v5)
              goto LABEL_8;
          }
          nilValues = self->_nilValues;
          if (!nilValues)
          {
            nilValues = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", Count);
            self->_nilValues = nilValues;
          }
          -[NSMutableSet addObject:](nilValues, "addObject:", a3);
          goto LABEL_18;
        }
      }
    }
    return 0;
  }
  return v5;
}

- (id)_domNode
{
  return kit(*((WebCore::Node **)self->_result + 10));
}

- (id)_webFrame
{
  return (id)objc_msgSend((id)objc_msgSend(-[WebElementDictionary _domNode](self, "_domNode"), "ownerDocument"), "webFrame");
}

- (id)_altDisplayString
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::altDisplayString((WebCore::HitTestResult *)self->_result);
  if (!v5)
    return 0;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)_spellingToolTip
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::spellingToolTip();
  if (!v5)
    return 0;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)_absoluteImageURL
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::absoluteImageURL((WebCore::HitTestResult *)self->_result);
  v3 = (void *)WTF::URL::operator NSURL *();
  if (!v5)
    return v3;
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v5, v2);
  return v3;
}

- (id)_absoluteMediaURL
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::absoluteMediaURL((WebCore::HitTestResult *)self->_result);
  v3 = (void *)WTF::URL::operator NSURL *();
  if (!v5)
    return v3;
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v5, v2);
  return v3;
}

- (id)_isSelected
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WebCore::HitTestResult::isSelected((WebCore::HitTestResult *)self->_result));
}

- (id)_title
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::title();
  if (!v5)
    return 0;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)_absoluteLinkURL
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::absoluteLinkURL((WebCore::HitTestResult *)self->_result);
  v3 = (void *)WTF::URL::operator NSURL *();
  if (!v5)
    return v3;
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v5, v2);
  return v3;
}

- (id)_targetWebFrame
{
  id result;
  id *v3;

  result = (id)WebCore::HitTestResult::targetFrame((WebCore::HitTestResult *)self->_result);
  if (result)
  {
    v3 = *(id **)(*((_QWORD *)result + 35) + 16);
    if (((*((uint64_t (**)(id *))*v3 + 134))(v3) & 1) != 0)
      return 0;
    else
      return v3[2];
  }
  return result;
}

- (id)_titleDisplayString
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::titleDisplayString((WebCore::HitTestResult *)self->_result);
  if (!v5)
    return 0;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)_textContent
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::HitTestResult::textContent((WebCore::HitTestResult *)self->_result);
  if (!v5)
    return 0;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)_isLiveLink
{
  WebCore *v2;
  void *v3;
  uint64_t isDraggableLink;
  void *v5;

  v2 = (WebCore *)*((_QWORD *)self->_result + 13);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  if (v2)
  {
    isDraggableLink = WebCore::isDraggableLink(v2, (const Element *)a2);
    v5 = v3;
  }
  else
  {
    isDraggableLink = 0;
    v5 = (void *)MEMORY[0x1E0CB37E8];
  }
  return (id)objc_msgSend(v5, "numberWithBool:", isDraggableLink);
}

- (id)_isContentEditable
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WebCore::HitTestResult::isContentEditable((WebCore::HitTestResult *)self->_result));
}

- (id)_isInScrollBar
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_QWORD *)self->_result + 14) != 0);
}

@end
