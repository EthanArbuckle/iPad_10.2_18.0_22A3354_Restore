@implementation WebAccessibilityTextMarker

- (WebAccessibilityTextMarker)initWithTextMarker:(TextMarkerData *)a3 cache:(void *)a4
{
  WebAccessibilityTextMarker *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebAccessibilityTextMarker;
  result = -[WebAccessibilityTextMarker init](&v8, sel_init);
  if (result)
  {
    result->_cache = a4;
    v7 = *(_OWORD *)&a3->treeID;
    *(_OWORD *)((char *)&result->_textMarkerData.anchorType + 1) = *(_OWORD *)((char *)&a3->anchorType + 1);
    *(_OWORD *)&result->_textMarkerData.treeID = v7;
  }
  return result;
}

- (WebAccessibilityTextMarker)initWithData:(id)a3 cache:(void *)a4
{
  WebAccessibilityTextMarker *v6;
  WebAccessibilityTextMarker *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebAccessibilityTextMarker;
  v6 = -[WebAccessibilityTextMarker init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_cache = a4;
    objc_msgSend(a3, "getBytes:length:", &v6->_textMarkerData, 32);
  }
  return v7;
}

- (WebAccessibilityTextMarker)initWithData:(id)a3 accessibilityObject:(id)a4
{
  WebAccessibilityTextMarker *result;

  result = (WebAccessibilityTextMarker *)objc_msgSend(a4, "axBackingObject");
  if (result)
    return -[WebAccessibilityTextMarker initWithData:cache:](self, "initWithData:cache:", a3, (*((uint64_t (**)(WebAccessibilityTextMarker *))result->super.isa + 186))(result));
  return result;
}

+ (id)textMarkerWithVisiblePosition:(void *)a3 cache:(void *)a4
{
  WebAccessibilityTextMarker *v5;
  void *v7;
  SEL v8;
  void *v9;
  void *v10;
  _BYTE v11[32];
  char v12;

  WebCore::AXObjectCache::textMarkerDataForVisiblePosition((unsigned int *)a4, (VisiblePosition *)a3, (uint64_t)v11);
  if (!v12)
    return 0;
  v5 = [WebAccessibilityTextMarker alloc];
  if (v12)
    return (id)(id)CFMakeCollectable(-[WebAccessibilityTextMarker initWithTextMarker:cache:](v5, "initWithTextMarker:cache:", v11, a4));
  v7 = (void *)std::__throw_bad_optional_access[abi:sn180100]();
  return +[WebAccessibilityTextMarker textMarkerWithCharacterOffset:cache:](v7, v8, v9, v10);
}

+ (id)textMarkerWithCharacterOffset:(void *)a3 cache:(void *)a4
{
  id result;
  _DWORD v6[7];
  char v7;

  result = 0;
  if (a4 && *(_QWORD *)a3)
  {
    WebCore::AXObjectCache::textMarkerDataForCharacterOffset((WebCore::AXObjectCache *)a4, (CharacterOffset *)a3, (WebCore::TextMarkerData *)v6);
    if (v6[1] || v7)
      return (id)(id)CFMakeCollectable(-[WebAccessibilityTextMarker initWithTextMarker:cache:]([WebAccessibilityTextMarker alloc], "initWithTextMarker:cache:", v6, a4));
    else
      return 0;
  }
  return result;
}

+ (id)startOrEndTextMarkerForRange:(const void *)a3 isStart:(BOOL)a4 cache:(void *)a5
{
  id result;
  Node *var0;
  void *v8;
  _OWORD v9[2];
  CharacterOffset v10;

  result = 0;
  if (a5 && *((_BYTE *)a3 + 32))
  {
    WebCore::AXObjectCache::startOrEndCharacterOffsetForRange((WebCore::AXObjectCache *)a5, (const WebCore::SimpleRange *)a3, a4, 0, (uint64_t)&v10);
    var0 = v10.var0.var0;
    if (v10.var0.var0)
    {
      WebCore::AXObjectCache::textMarkerDataForCharacterOffset((WebCore::AXObjectCache *)a5, &v10, (WebCore::TextMarkerData *)v9);
      if (*((_DWORD *)var0 + 6) == 2)
      {
        if ((*((_WORD *)var0 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)var0, v8);
      }
      else
      {
        *((_DWORD *)var0 + 6) -= 2;
      }
    }
    else
    {
      memset(v9, 0, sizeof(v9));
    }
    if (DWORD1(v9[0]))
      return (id)(id)CFMakeCollectable(-[WebAccessibilityTextMarker initWithTextMarker:cache:]([WebAccessibilityTextMarker alloc], "initWithTextMarker:cache:", v9, a5));
    else
      return 0;
  }
  return result;
}

- (id)dataRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_textMarkerData, 32);
}

- (VisiblePosition)visiblePosition
{
  return (VisiblePosition *)WebCore::AXObjectCache::visiblePositionForTextMarkerData((unsigned int *)self->_cache, &self->_textMarkerData, (uint64_t)retstr);
}

- (CharacterOffset)characterOffset
{
  return (CharacterOffset *)WebCore::AXObjectCache::characterOffsetForTextMarkerData((unsigned int *)self->_cache, &self->_textMarkerData, (uint64_t)retstr);
}

- (BOOL)isIgnored
{
  return self->_textMarkerData.ignored;
}

- (void)accessibilityObject
{
  return (void *)WebCore::AXObjectCache::objectForTextMarkerData((WebCore::AXObjectCache *)self->_cache, &self->_textMarkerData);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[AXTextMarker %p] = objectID: %d offset: %d"), self, self->_textMarkerData.objectID, self->_textMarkerData.offset);
}

- (TextMarkerData)textMarkerData
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].treeID;
  *(_OWORD *)&retstr->treeID = *(_OWORD *)&self->affinity;
  *(_OWORD *)&retstr->affinity = v3;
  return self;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
