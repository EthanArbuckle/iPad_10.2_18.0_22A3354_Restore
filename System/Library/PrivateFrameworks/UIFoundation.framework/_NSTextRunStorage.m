@implementation _NSTextRunStorage

- (uint64_t)_rangeFromTextRange:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = objc_msgSend(a2, "range");
    return v4 - objc_msgSend((id)a1, "baseIndex");
  }
  else if (*(_BYTE *)(a1 + 58))
  {
    v5 = objc_msgSend(*(id *)(a1 + 8), "offsetFromLocation:toLocation:", objc_msgSend((id)a1, "baseLocation"), objc_msgSend(a2, "location"));
    if ((objc_msgSend(a2, "isEmpty") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 8), "offsetFromLocation:toLocation:", objc_msgSend(a2, "location"), objc_msgSend(a2, "endLocation"));
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (id)enumerateObjectsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  char v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger ElementIndexForTextLocation;
  id v13;
  _QWORD v15[8];
  char v16;
  BOOL v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v6 = a4;
  objc_sync_enter(self);
  v9 = v6 & 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__13;
  v23 = __Block_byref_object_dispose__13;
  v24 = 0;
  if (self->_RLEArray)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke_2;
    v15[3] = &unk_1E2605BA8;
    v15[4] = a3;
    v15[5] = self;
    v16 = v6 & 1;
    v17 = (v6 & 2) != 0;
    v15[6] = a5;
    v15[7] = &v19;
    -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v15);
  }
  else
  {
    v10 = -[NSStorage count](self->_elements, "count");
    v11 = v10;
    if (a3 || !v9 || (ElementIndexForTextLocation = v10 - 1, v10 < 1))
      ElementIndexForTextLocation = __NSTextRunStorageGetElementIndexForTextLocation((uint64_t)self, a3, 0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke;
    v18[3] = &unk_1E2605B80;
    v18[4] = a5;
    v18[5] = &v19;
    __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, ElementIndexForTextLocation, v11 - ElementIndexForTextLocation, v9, (uint64_t)v18);
  }
  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);
  objc_sync_exit(self);
  return v13;
}

- (void)_performCountableRunStorageOperation:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 57))
      v4 = (id)objc_msgSend(*(id *)(a1 + 8), "baseLocation");
    else
      v4 = 0;
    *(_QWORD *)(a1 + 64) = v4;
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);

    *(_QWORD *)(a1 + 64) = 0;
  }
}

- (int64_t)baseIndex
{
  if (self->_isCountable)
    return -[NSTextLocation characterIndex](-[_NSTextRunStorage baseLocation](self, "baseLocation"), "characterIndex");
  else
    return 0;
}

- (NSTextLocation)baseLocation
{
  return self->_baseLocation;
}

- (uint64_t)_indexFromTextLocation:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    v2 = (void *)result;
    if (*(_BYTE *)(result + 56))
    {
      v3 = objc_msgSend(a2, "characterIndex");
      return v3 - objc_msgSend(v2, "baseIndex");
    }
    else if (*(_BYTE *)(result + 58))
    {
      return objc_msgSend(*(id *)(result + 8), "offsetFromLocation:toLocation:", objc_msgSend((id)result, "baseLocation"), a2);
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (NSCountableTextRange)_createTextRangeFromRange:(uint64_t)a3
{
  uint64_t v3;
  uint64_t v7;

  if (!a1)
    return 0;
  v3 = a3;
  if (*(_BYTE *)(a1 + 56))
    return -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", objc_msgSend((id)a1, "baseIndex") + a2, a3);
  if (!*(_BYTE *)(a1 + 58))
    return 0;
  v7 = objc_msgSend(*(id *)(a1 + 8), "locationFromLocation:withOffset:", objc_msgSend((id)a1, "baseLocation"), a2);
  if (v3)
    v3 = objc_msgSend(*(id *)(a1 + 8), "locationFromLocation:withOffset:", objc_msgSend((id)a1, "baseLocation"), a2 + v3);
  return (NSCountableTextRange *)-[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v7, v3);
}

- (NSCountableTextLocation)_createLocationFromOffset:(uint64_t)a1
{
  uint64_t v2;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v2 = objc_msgSend((id)a1, "baseIndex") + a2;
      if (v2 >= 0)
        return -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", v2);
    }
    else if (*(_BYTE *)(a1 + 58))
    {
      return (NSCountableTextLocation *)(id)objc_msgSend(*(id *)(a1 + 8), "locationFromLocation:withOffset:", objc_msgSend((id)a1, "baseLocation"), a2);
    }
  }
  return 0;
}

- (__NSTextRunStorageDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setObject:(id)a3 forRange:(id)a4
{
  NSUInteger ElementIndexForTextRange;
  id *v8;
  id *v9;
  _QWORD v10[7];

  objc_sync_enter(self);
  if (a3)
  {
    if (self->_RLEArray)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __40___NSTextRunStorage_setObject_forRange___block_invoke;
      v10[3] = &unk_1E2605BD0;
      v10[4] = a4;
      v10[5] = self;
      v10[6] = a3;
      -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v10);
    }
    else
    {
      ElementIndexForTextRange = __NSTextRunStorageGetElementIndexForTextRange((NSUInteger)self, a4, 0);
      if (ElementIndexForTextRange != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = -[NSStorage elementAtIndex:](self->_elements, "elementAtIndex:", ElementIndexForTextRange);
        v9 = v8;
        if (v8)
        {

          v9[1] = a3;
          *v9 = a4;
        }
      }
    }
  }
  else
  {
    -[_NSTextRunStorage invalidateElementsInRange:delta:](self, "invalidateElementsInRange:delta:", a4, 0);
  }

  self->_contentRange = 0;
  objc_sync_exit(self);
}

- (_NSTextRunStorage)initWithDataSource:(id)a3
{
  _NSTextRunStorage *v4;
  _NSTextRunStorage *v5;
  char v6;
  char v7;
  NSStorage *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_NSTextRunStorage;
  v4 = -[_NSTextRunStorage init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_dataSource = (__NSTextRunStorageDataSource *)a3;
    v4->_isCountable = objc_msgSend(a3, "isCountableDataSource");
    v6 = objc_opt_respondsToSelector();
    v5->_hasBaseLocation = v6 & 1;
    if ((v6 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_opt_respondsToSelector();
    else
      v7 = 0;
    v5->_mapsLocationOffset = v7 & 1;
    if (v5->_isCountable || (v7 & 1) != 0)
    {
      v8 = (NSStorage *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3790]), "init");
      v9 = 16;
    }
    else
    {
      v8 = -[NSStorage initWithElementSize:capacity:]([NSStorage alloc], "initWithElementSize:capacity:", 16, 0);
      v9 = 24;
    }
    *(Class *)((char *)&v5->super.isa + v9) = (Class)v8;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  __NSTextRunStorageReleaseElementContentsInRange((NSUInteger)self, 0x7FFFFFFFFFFFFFFFuLL, 0);

  v3.receiver = self;
  v3.super_class = (Class)_NSTextRunStorage;
  -[_NSTextRunStorage dealloc](&v3, sel_dealloc);
}

- (NSTextRange)contentRange
{
  NSTextRange *v3;
  NSTextRange *contentRange;
  NSTextRange *v5;
  NSTextRange *v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  objc_sync_enter(self);
  v3 = (NSTextRange *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  contentRange = self->_contentRange;
  if (!contentRange)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__13;
    v17 = __Block_byref_object_dispose__13;
    v18 = 0;
    if (self->_RLEArray)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __33___NSTextRunStorage_contentRange__block_invoke_3;
      v10[3] = &unk_1E2605B58;
      v10[4] = self;
      v10[5] = &v13;
      -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v10);
    }
    else
    {
      v8 = -[NSStorage count](self->_elements, "count");
      if (v8 >= 1)
      {
        v9 = MEMORY[0x1E0C809B0];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __33___NSTextRunStorage_contentRange__block_invoke;
        v12[3] = &unk_1E2605B30;
        v12[4] = &v13;
        __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, 0, 1uLL, 0, (uint64_t)v12);
        if (v14[5])
        {
          if ((unint64_t)v8 >= 2)
          {
            v11[0] = v9;
            v11[1] = 3221225472;
            v11[2] = __33___NSTextRunStorage_contentRange__block_invoke_2;
            v11[3] = &unk_1E2605B30;
            v11[4] = &v13;
            __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, v8 - 1, 1uLL, 0, (uint64_t)v11);
          }
        }
      }
    }
    v5 = (NSTextRange *)v14[5];
    if (!v5)
    {
      v5 = v3;
      v14[5] = (uint64_t)v5;
    }
    self->_contentRange = v5;
    _Block_object_dispose(&v13, 8);
    contentRange = self->_contentRange;
  }
  if (v3 == contentRange)
    v6 = 0;
  else
    v6 = contentRange;
  objc_sync_exit(self);
  return v6;
}

- (BOOL)isEmpty
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28___NSTextRunStorage_isEmpty__block_invoke;
  v4[3] = &unk_1E2605B08;
  v4[4] = &v5;
  -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](self, "enumerateObjectsFromLocation:options:usingBlock:", 0, 2, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)invalidateElementsInRange:(id)a3 delta:(int64_t)a4
{
  int64_t ElementIndexForTextRange;
  int64_t v8;
  _QWORD v9[7];
  _QWORD v10[6];

  objc_sync_enter(self);
  if (self->_RLEArray)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke_2;
    v9[3] = &unk_1E2605C20;
    v9[4] = a3;
    v9[5] = self;
    v9[6] = a4;
    -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v9);
  }
  else
  {
    ElementIndexForTextRange = __NSTextRunStorageGetElementIndexForTextRange((NSUInteger)self, a3, 1);
    v8 = -[NSStorage count](self->_elements, "count");
    if (ElementIndexForTextRange != 0x7FFFFFFFFFFFFFFFLL && v8 > ElementIndexForTextRange)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke;
      v10[3] = &unk_1E2605BF8;
      v10[4] = self;
      v10[5] = a4;
      __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, ElementIndexForTextRange, v8 - ElementIndexForTextRange, 0, (uint64_t)v10);
    }
  }

  self->_contentRange = 0;
  objc_sync_exit(self);
}

- (id)description
{
  void *v3;
  NSTextLocation *v4;
  _QWORD v6[5];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>(\n"), objc_opt_class(), self);
  v4 = -[_NSTextRunStorage baseLocation](self, "baseLocation");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32___NSTextRunStorage_description__block_invoke;
  v6[3] = &unk_1E2605AE0;
  v6[4] = v3;
  -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](self, "enumerateObjectsFromLocation:options:usingBlock:", v4, 0, v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(")"));
  return v3;
}

- (NSCountableTextLocation)_locationFromLocation:(uint64_t)a3 withOffset:
{
  if (result)
  {
    if (LOBYTE(result[3]._characterIndex))
      return -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", objc_msgSend(a2, "characterIndex") + a3);
    else
      return (NSCountableTextLocation *)objc_msgSend((id)result->_characterIndex, "locationFromLocation:withOffset:", a2, a3);
  }
  return result;
}

@end
