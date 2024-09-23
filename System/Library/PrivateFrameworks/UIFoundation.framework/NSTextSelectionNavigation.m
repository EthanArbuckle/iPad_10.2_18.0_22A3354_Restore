@implementation NSTextSelectionNavigation

- (id)_lineFragmentInfoForRange:(id)a3
{
  void *v5;
  unint64_t v6;
  __NSTextSelectionLineFragmentInfo **lineFragmentInfoCache;
  Class *v8;
  Class v9;
  __NSTextSelectionLineFragmentInfo *v10;
  unint64_t v11;
  __NSTextSelectionLineFragmentInfo *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v5 = (void *)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
  if ((objc_msgSend(v5, "containsRange:", a3) & 1) == 0
    && (!objc_msgSend(a3, "isEmpty")
     || !objc_msgSend((id)objc_msgSend(v5, "endLocation"), "isEqual:", objc_msgSend(a3, "location"))))
  {
    return 0;
  }
  v6 = 0;
  lineFragmentInfoCache = self->_lineFragmentInfoCache;
  do
  {
    v8 = &self->super.isa + v6;
    v9 = v8[2];
    if (!v9)
    {
      v11 = v6;
      goto LABEL_16;
    }
    if (objc_msgSend((id)-[objc_class textRange](v9, "textRange"), "isEqualToTextRange:", a3))
      v10 = (__NSTextSelectionLineFragmentInfo *)v8[2];
    else
      v10 = 0;
    v11 = v6 + 1;
    if (v10)
      break;
  }
  while (v6++ < 7);
  if (v10)
    return v10;
LABEL_16:
  v10 = -[__NSTextSelectionLineFragmentInfo initWithTextSelectionNavigation:range:]([__NSTextSelectionLineFragmentInfo alloc], "initWithTextSelectionNavigation:range:", self, a3);
  if (v11 >= 8)
  {
    v13 = self->_lineFragmentInfoCache[0];
    v14 = *(_OWORD *)&self->_lineFragmentInfoCache[1];
    v15 = *(_OWORD *)&self->_lineFragmentInfoCache[3];
    v16 = *(_OWORD *)&self->_lineFragmentInfoCache[5];
    self->_lineFragmentInfoCache[6] = self->_lineFragmentInfoCache[7];
    *(_OWORD *)&self->_lineFragmentInfoCache[2] = v15;
    *(_OWORD *)&self->_lineFragmentInfoCache[4] = v16;
    *(_OWORD *)lineFragmentInfoCache = v14;
    v11 = 7;
  }
  lineFragmentInfoCache[v11] = v10;
  return v10;
}

- (double)_caretOffsetForTextLocation:(id)a3 affinity:(int64_t)a4
{
  id v5;
  double result;

  v5 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", a3, a4);
  if (!v5)
    return -1.0;
  objc_msgSend(v5, "offsetForLocation:", a3);
  return result;
}

- (id)_lineFragmentInfoForLocation:(id)a3 affinity:(int64_t)a4
{
  NSTextRange *v6;
  NSTextRange *v7;
  id v8;

  v6 = -[NSTextSelectionNavigation _copyRangeForTextLineFragmentAtLocation:affinity:](self, "_copyRangeForTextLineFragmentAtLocation:affinity:", a3, a4);
  v7 = v6;
  if (v6
    && (-[NSTextRange containsLocation:](v6, "containsLocation:", a3)
     || (objc_msgSend(a3, "isEqual:", -[NSTextRange endLocation](v7, "endLocation")) & 1) != 0
     || !objc_msgSend(a3, "isEqual:", objc_msgSend((id)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange"), "endLocation"))|| (v7, (v7 = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", a3)) != 0)))
  {
    v8 = -[NSTextSelectionNavigation _lineFragmentInfoForRange:](self, "_lineFragmentInfoForRange:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_copyRangeForTextLineFragmentAtLocation:(id)a3 affinity:(int64_t)a4 copyEnclosingRange:(id *)a5
{
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t *v16;
  NSTextRange *v17;
  _QWORD v19[8];
  char v20;
  _QWORD v21[9];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;

  v9 = objc_msgSend(a3, "isEqual:", objc_msgSend((id)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange"), "endLocation"));
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v10 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke;
  v21[3] = &unk_1E2603600;
  v21[4] = a3;
  v21[5] = &v28;
  v21[7] = a4;
  v21[8] = a5;
  v21[6] = &v22;
  objc_msgSend(v10, "enumerateSubstringsFromLocation:options:usingBlock:", a3, 512, v21);
  v12 = (void *)v29[5];
  if (!v12 || objc_msgSend(a3, "compare:", objc_msgSend(v12, "location")) == -1)
  {
    v13 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
    v14 = (void *)v29[5];
    v15 = a3;
    if (v14)
      v15 = (id)objc_msgSend(v14, "location", a3);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke_2;
    v19[3] = &unk_1E2603628;
    v20 = v9;
    v19[4] = a3;
    v19[5] = &v28;
    v19[6] = &v22;
    v19[7] = a5;
    objc_msgSend(v13, "enumerateSubstringsFromLocation:options:usingBlock:", v15, 768, v19);
  }
  v16 = v29;
  v17 = (NSTextRange *)v29[5];
  if (!v17 && v9)
  {
    v17 = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", a3);
    v16 = v29;
    v29[5] = (uint64_t)v17;
  }
  if (a5)
  {
    *a5 = (id)v23[5];
    v17 = (NSTextRange *)v16[5];
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v17;
}

- (id)textSelectionDataSource
{
  return objc_loadWeak((id *)&self->_textSelectionDataSource);
}

- (id)_copyRangeForTextLineFragmentAtLocation:(id)a3 affinity:(int64_t)a4
{
  return -[NSTextSelectionNavigation _copyRangeForTextLineFragmentAtLocation:affinity:copyEnclosingRange:](self, "_copyRangeForTextLineFragmentAtLocation:affinity:copyEnclosingRange:", a3, a4, 0);
}

id __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  id result;

  if (!*(_BYTE *)(a1 + 64)
    || (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
     || (result = (id)objc_msgSend((id)objc_msgSend(a3, "endLocation"), "isEqual:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "endLocation")), (_DWORD)result))&& (result = (id)objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a3, "endLocation")), (_DWORD)result))
  {
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    if (*(_QWORD *)(a1 + 56))
    {

      result = a4;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
  }
  *a5 = 1;
  return result;
}

uint64_t __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  uint64_t result;

  if (a1[7] == 1 || (result = objc_msgSend((id)objc_msgSend(a3, "location"), "isEqual:", a1[4]), (result & 1) == 0))
  {
    result = a3;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
    if (a1[8])
    {
      result = a4;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
    }
  }
  *a5 = 1;
  return result;
}

+ (void)initialize
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "registerDefaults:", &unk_1E26316A8);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTextSelectionNavigation setTextSelectionDataSource:](self, "setTextSelectionDataSource:", 0);
  -[NSTextSelectionNavigation flushLayoutCache](self, "flushLayoutCache");
  v3.receiver = self;
  v3.super_class = (Class)NSTextSelectionNavigation;
  -[NSTextSelectionNavigation dealloc](&v3, sel_dealloc);
}

- (NSTextSelectionNavigation)initWithDataSource:(id)dataSource
{
  NSTextSelectionNavigation *v4;
  NSTextSelectionNavigation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSTextSelectionNavigation;
  v4 = -[NSTextSelectionNavigation init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[NSTextSelectionNavigation setTextSelectionDataSource:](v4, "setTextSelectionDataSource:", dataSource);
    v5->_supportsContainer = objc_opt_respondsToSelector() & 1;
    v5->_supportsLayoutOrientation = objc_opt_respondsToSelector() & 1;
    v5->_allowsNonContiguousRanges = 1;
  }
  return v5;
}

- (void)setTextSelectionDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_textSelectionDataSource, a3);
}

- (void)flushLayoutCache
{
  uint64_t v2;
  __NSTextSelectionLineFragmentInfo **lineFragmentInfoCache;
  __NSTextSelectionLineFragmentInfo *v4;

  v2 = 0;
  lineFragmentInfoCache = self->_lineFragmentInfoCache;
  do
  {
    v4 = lineFragmentInfoCache[v2];
    if (!v4)
      break;

    ++v2;
  }
  while (v2 != 8);
  *((_OWORD *)lineFragmentInfoCache + 2) = 0u;
  *((_OWORD *)lineFragmentInfoCache + 3) = 0u;
  *(_OWORD *)lineFragmentInfoCache = 0u;
  *((_OWORD *)lineFragmentInfoCache + 1) = 0u;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textSelectionDataSource);
}

+ (id)_substringRangeForEnumerationType:(unint64_t)a3 location:(id)a4 dataSource:(id)a5 string:(id *)a6 enclosingRange:(id *)a7
{
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[8];
  _QWORD v24[9];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;

  v43 = 0;
  v44 = &v43;
  v45 = 0x3052000000;
  v46 = __Block_byref_object_copy__1;
  v47 = __Block_byref_object_dispose__1;
  v11 = 1024;
  v48 = 0;
  if (!a6)
    v11 = 1536;
  v37 = 0;
  v38 = &v37;
  v12 = v11 | a3 & 0xFFFFFFFFFFFFFEFFLL;
  v39 = 0x3052000000;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke;
  v24[3] = &unk_1E2603590;
  v24[4] = a4;
  v24[5] = &v37;
  v24[6] = &v31;
  v24[7] = &v25;
  v24[8] = &v43;
  objc_msgSend(a5, "enumerateSubstringsFromLocation:options:usingBlock:", a4, v12, v24);
  if (!v26[5])
  {
    v14 = (void *)v38[5];
    if (v14)
    {
      if (!objc_msgSend(a4, "isEqual:", objc_msgSend(v14, "location")))
        goto LABEL_13;
      if (!v32[5])
        goto LABEL_11;
      v15 = (void *)objc_msgSend((id)v38[5], "location");
      if (!objc_msgSend(v15, "isEqual:", objc_msgSend((id)v32[5], "location")))
        goto LABEL_13;
      v16 = (void *)v32[5];
      if (!v16)
LABEL_11:
        v16 = (void *)v38[5];
    }
    else
    {
      v16 = (void *)objc_msgSend(a5, "documentRange");
    }
    v17 = (id)objc_msgSend(v16, "endLocation");
    v26[5] = (uint64_t)v17;
  }
LABEL_13:
  v18 = v26[5];
  if (v18)
  {
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke_2;
    v23[3] = &unk_1E26035B8;
    v23[4] = a4;
    v23[5] = &v37;
    v23[6] = &v31;
    v23[7] = &v43;
    objc_msgSend(a5, "enumerateSubstringsFromLocation:options:usingBlock:", v18, v12 | 0x100, v23);

  }
  v19 = (void *)v44[5];
  if (a6)
    *a6 = v19;
  else

  v20 = (void *)v32[5];
  if (a7)
    *a7 = v20;
  else

  v21 = (id)v38[5];
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  return v21;
}

id __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  NSTextRange *v10;
  id result;

  if (objc_msgSend(a3, "containsLocation:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
    v10 = a4;
LABEL_3:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v10;
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a3, "location")) == -1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)objc_msgSend(a3, "location");
    if (objc_msgSend(a4, "containsLocation:", *(_QWORD *)(a1 + 32)))
    {
      v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(a4, "location"), objc_msgSend(a3, "location"));
      goto LABEL_3;
    }
  }
LABEL_7:
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

id __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  void *v10;
  id result;

  if (objc_msgSend(a3, "containsLocation:", a1[4]))
  {

    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a3;
LABEL_3:
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a4;
    goto LABEL_8;
  }
  if (!objc_msgSend(a4, "containsLocation:", a1[4]))
    goto LABEL_8;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    goto LABEL_3;
  if (objc_msgSend((id)objc_msgSend(a3, "endLocation"), "compare:", a1[4]) != 1)
  {
    v10 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(a3, "endLocation"), objc_msgSend(v10, "endLocation"));

  }
LABEL_8:

  result = a2;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  *a5 = 1;
  return result;
}

+ (void)_setupCharacterSets
{
  if (_setupCharacterSets_onceToken != -1)
    dispatch_once(&_setupCharacterSets_onceToken, &__block_literal_global_110);
}

void __48__NSTextSelectionNavigation__setupCharacterSets__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"), "mutableCopy");
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet"));
  __NSNonSkippableSet = objc_msgSend(v0, "copy");
  objc_msgSend(v0, "invert");
  __NSSkippableSet = objc_msgSend(v0, "copy");

}

- (id)_rangesWithDirectionalFormatAdjustmentsForRanges:(id)a3
{
  return a3;
}

- (int64_t)_horizontalDirectionForDirection:(int64_t)a3 location:(id)a4
{
  uint64_t v5;
  unint64_t v6;

  if (self->_supportsLayoutOrientation)
  {
    v5 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textLayoutOrientationAtLocation:", a4);
    v6 = a3 - 2;
    if (a3 >= 2 && v5 == 1)
    {
      if (v6 > 3)
        return 5;
      else
        return qword_18D6CBDB0[v6];
    }
  }
  return a3;
}

- (int64_t)_logicalDirectionForDirection:(int64_t)a3 textSelection:(id)a4
{
  int64_t v4;
  uint64_t v7;
  uint64_t v8;
  NSWritingDirection v9;

  v4 = a3;
  if (a3 >= 2)
  {
    v7 = -[NSTextSelectionNavigation _horizontalDirectionForDirection:location:](self, "_horizontalDirectionForDirection:location:", a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "textRanges"), "firstObject"), "location"));
    v8 = v7;
    if (v7 > 3)
    {
      return v7 == 4;
    }
    else
    {
      v9 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "textRanges"), "firstObject"), "location"));
      if (v9 == NSWritingDirectionNatural)
        v9 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
      if (v9 == NSWritingDirectionRightToLeft)
        return v8 == 2;
      else
        return v8 != 2;
    }
  }
  return v4;
}

- (id)_lineFragmentInfoForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 bounds:(CGRect)a5 layoutOrientation:(int64_t)a6 beforeLineFragment:(BOOL *)a7 afterLineFragment:(BOOL *)a8 lineFragmentRange:(id *)a9
{
  double height;
  double width;
  double y;
  double x;
  double v18;
  double v19;
  NSTextSelectionDataSourcePrivate *v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v37[6];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  NSRect v53;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v18 = a3.y;
  v19 = a3.x;
  v21 = -[NSTextSelectionNavigation textSelectionDataSourcePrivate](self, "textSelectionDataSourcePrivate");
  v22 = (void *)-[NSTextSelectionDataSourcePrivate documentRange](v21, "documentRange");
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  if (!NSIsEmptyRect(v53))
  {
    if (a6 && self->_rotatesCoordinateSystemForLayoutOrientation)
    {
      v23 = v19 >= x + width;
      if (v19 >= x)
        goto LABEL_5;
    }
    else
    {
      v23 = v18 >= y + height;
      if (v18 >= y)
      {
LABEL_5:
        if (v23)
        {
          v24 = 0;
          v23 = 1;
          goto LABEL_22;
        }
        goto LABEL_7;
      }
    }
    v28 = objc_msgSend(v22, "location");
    v29 = MEMORY[0x1E0C809B0];
    if (self->_supportsContainer)
    {
      v41 = 0;
      v42 = &v41;
      v43 = 0x3052000000;
      v44 = __Block_byref_object_copy__1;
      v45 = __Block_byref_object_dispose__1;
      v46 = 0;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke;
      v40[3] = &unk_1E2603650;
      v40[4] = &v41;
      -[NSTextSelectionDataSourcePrivate enumerateContainerBoundariesFromLocation:reverse:usingBlock:](v21, "enumerateContainerBoundariesFromLocation:reverse:usingBlock:", a4, 1, v40);
      v30 = (void *)v42[5];
      if (v30 && (objc_msgSend(v30, "isEqual:", v28) & 1) == 0)
        v28 = v42[5];
      _Block_object_dispose(&v41, 8);
      v29 = MEMORY[0x1E0C809B0];
    }
    v39[0] = v29;
    v39[1] = 3221225472;
    v39[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_2;
    v39[3] = &unk_1E2603678;
    v39[4] = &v47;
    -[NSTextSelectionDataSourcePrivate enumerateSubstringsFromLocation:options:usingBlock:](v21, "enumerateSubstringsFromLocation:options:usingBlock:", v28, 512, v39);
    v24 = 1;
    goto LABEL_22;
  }
LABEL_7:
  v25 = -[NSTextSelectionDataSourcePrivate lineFragmentRangeForPoint:inContainerAtLocation:](v21, "lineFragmentRangeForPoint:inContainerAtLocation:", a4, v19, v18);
  v48[5] = v25;
  if (v25)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_12;
    v26 = -[NSTextSelectionDataSourcePrivate placementOfPoint:inContainerAtLocation:](v21, "placementOfPoint:inContainerAtLocation:", a4, v19, v18) & 6;
    if (v26 == 2)
    {
      v23 = 0;
      v24 = 1;
      goto LABEL_13;
    }
    if (v26 == 4)
    {
      v24 = 0;
      v23 = 1;
    }
    else
    {
LABEL_12:
      v24 = 0;
      v23 = 0;
    }
LABEL_13:
    v27 = -[NSTextSelectionNavigation _copyRangeForTextLineFragmentAtLocation:affinity:](self, "_copyRangeForTextLineFragmentAtLocation:affinity:", objc_msgSend((id)v48[5], "location"), 1);
    v48[5] = (uint64_t)v27;
    goto LABEL_22;
  }
  v24 = 0;
  v23 = 0;
LABEL_22:
  if (!v48[5])
  {
    v31 = objc_msgSend(v22, "endLocation");
    if (self->_supportsContainer)
    {
      v41 = 0;
      v42 = &v41;
      v43 = 0x3052000000;
      v44 = __Block_byref_object_copy__1;
      v45 = __Block_byref_object_dispose__1;
      v46 = 0;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_3;
      v38[3] = &unk_1E2603650;
      v38[4] = &v41;
      -[NSTextSelectionDataSourcePrivate enumerateContainerBoundariesFromLocation:reverse:usingBlock:](v21, "enumerateContainerBoundariesFromLocation:reverse:usingBlock:", a4, 0, v38);
      v32 = (void *)v42[5];
      if (v32 && (objc_msgSend(v32, "isEqual:", v31) & 1) == 0)
        v31 = v42[5];
      _Block_object_dispose(&v41, 8);
    }
    v33 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_4;
    v37[3] = &unk_1E26036A0;
    v37[4] = v31;
    v37[5] = &v47;
    objc_msgSend(v33, "enumerateSubstringsFromLocation:options:usingBlock:", v31, 768, v37);
    v23 = 1;
  }
  if (a7)
    *a7 = v24;
  if (a8)
    *a8 = v23;
  if (v48[5])
    v34 = -[NSTextSelectionNavigation _lineFragmentInfoForRange:](self, "_lineFragmentInfoForRange:");
  else
    v34 = 0;
  v35 = (void *)v48[5];
  if (a9)
    *a9 = v35;
  else

  _Block_object_dispose(&v47, 8);
  return v34;
}

uint64_t __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = a2;
  *a3 = 1;
  return result;
}

id __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

uint64_t __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_3(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = a2;
  *a3 = 1;
  return result;
}

NSTextRange *__157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  NSTextRange *result;

  if (a4
    && objc_msgSend((id)objc_msgSend(a4, "endLocation"), "isEqual:", *(_QWORD *)(a1 + 32))
    && objc_msgSend((id)objc_msgSend(a3, "endLocation"), "compare:", objc_msgSend(a4, "endLocation")) == -1)
  {
    result = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", objc_msgSend(a4, "endLocation"));
  }
  else
  {
    result = a3;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_adjustLocationForNearestCaretPosition:(id)a3 direction:(int64_t)a4
{
  void *v7;
  id v8;
  id v9;
  int64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  id v20;

  v7 = (void *)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
  v8 = a3;
  if ((objc_msgSend((id)objc_msgSend(v7, "location"), "isEqual:", a3) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v7, "endLocation"), "isEqual:", a3) & 1) == 0)
  {
    v20 = 0;
    v9 = -[NSTextSelectionNavigation _copyRangeForTextLineFragmentAtLocation:affinity:copyEnclosingRange:](self, "_copyRangeForTextLineFragmentAtLocation:affinity:copyEnclosingRange:", a3, 1, &v20);
    if (v9)
    {
      v10 = -[NSTextSelectionNavigation _horizontalDirectionForDirection:location:](self, "_horizontalDirectionForDirection:location:", a4, a3);
      if (!v20
        || (objc_msgSend(v9, "containsLocation:", a3) & 1) != 0
        || (objc_msgSend((id)objc_msgSend(v9, "endLocation"), "isEqual:", a3) & 1) != 0
        || !objc_msgSend(v20, "containsLocation:", a3)
        || (v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
        if ((objc_msgSend((id)objc_msgSend(v9, "location"), "isEqual:", a3) & 1) != 0)
          goto LABEL_24;
        v12 = -[NSTextSelectionNavigation _lineFragmentInfoForRange:](self, "_lineFragmentInfoForRange:", v9);
        if (!v12)
          goto LABEL_24;
        v13 = v12;
        v14 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", a3);
        switch(v10)
        {
          case 0:
          case 5:
            if (v14 == 1)
              v10 = 3;
            else
              v10 = 2;
            break;
          case 1:
          case 4:
            if (v14 == 1)
              v10 = 2;
            else
              v10 = 3;
            break;
          default:
            break;
        }
        v19 = 1;
        v15 = objc_msgSend(v13, "caretPositionClosestToLocation:visualDirection:matchLocation:", a3, v10, &v19);
        if (!v15)
          goto LABEL_24;
        v16 = v15;

        v17 = 8;
        if (!v19)
          v17 = 16;
        v11 = *(id *)(v16 + v17);
      }
      else
      {

        v11 = (id)objc_msgSend(v20, "endLocation");
      }
      v8 = v11;
    }
LABEL_24:

  }
  return v8;
}

- (BOOL)_location:(id)a3 withAffinity:(int64_t)a4 isAtBoundaryOfDestination:(int64_t)a5 onSide:(int64_t)a6
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  if ((unint64_t)a6 >= 2)
    -[NSTextSelectionNavigation _location:withAffinity:isAtBoundaryOfDestination:onSide:].cold.1();
  v8 = 1;
  switch(a5)
  {
    case 1:
      v8 = 3;
      goto LABEL_8;
    case 2:
      if ((a6 == 1) != a4)
        return 0;
      v8 = 0;
LABEL_8:
      v16 = 0;
      v17 = &v16;
      v18 = 0x3052000000;
      v19 = __Block_byref_object_copy__1;
      v20 = __Block_byref_object_dispose__1;
      v21 = 0;
      v9 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource", a3, a4);
      v10 = 512;
      if (!a6)
        v10 = 768;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __85__NSTextSelectionNavigation__location_withAffinity_isAtBoundaryOfDestination_onSide___block_invoke;
      v15[3] = &unk_1E2603678;
      v15[4] = &v16;
      objc_msgSend(v9, "enumerateSubstringsFromLocation:options:usingBlock:", a3, v8 | v10, v15);
      v11 = (void *)v17[5];
      if (v11)
      {
        if (a6 == 1)
          v12 = (void *)objc_msgSend(v11, "location");
        else
          v12 = (void *)objc_msgSend(v11, "endLocation");
        v13 = objc_msgSend(v12, "isEqual:", a3);

      }
      else
      {
        v13 = 0;
      }
      _Block_object_dispose(&v16, 8);
      return v13;
    case 3:
      v8 = 4;
      goto LABEL_8;
    case 4:
      goto LABEL_8;
    default:
      v8 = 2;
      goto LABEL_8;
  }
}

id __85__NSTextSelectionNavigation__location_withAffinity_isAtBoundaryOfDestination_onSide___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_logicalDestinationLocationForTextSelection:(id)a3 originLocation:(id)a4 direction:(int64_t)a5 destination:(int64_t)a6 extending:(BOOL)a7 confined:(BOOL)a8 affinity:(int64_t *)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  int64_t v15;
  void *v16;
  int v17;
  id v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[5];
  _QWORD v39[7];
  BOOL v40;
  BOOL v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  uint64_t v54;

  v9 = a8;
  v10 = a7;
  v15 = -[NSTextSelectionNavigation _logicalDirectionForDirection:textSelection:](self, "_logicalDirectionForDirection:textSelection:", a5, a3);
  v16 = (void *)objc_msgSend(a3, "textRanges");
  v17 = objc_msgSend((id)objc_msgSend(v16, "firstObject"), "isEmpty");
  v49 = 0;
  v50 = &v49;
  v51 = 0x3052000000;
  v52 = __Block_byref_object_copy__1;
  v53 = __Block_byref_object_dispose__1;
  v54 = 0;
  if ((unint64_t)(a6 - 5) <= 1)
  {
    if (a6 == 5 && self->_supportsContainer)
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x3052000000;
      v46 = __Block_byref_object_copy__1;
      v47 = __Block_byref_object_dispose__1;
      v48 = 0;
      v18 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke;
      v42[3] = &unk_1E2603650;
      v42[4] = &v43;
      objc_msgSend(v18, "enumerateContainerBoundariesFromLocation:reverse:usingBlock:", a4, v15 == 1, v42);
      a4 = (id)v44[5];
      _Block_object_dispose(&v43, 8);
    }
    else
    {
      v21 = (void *)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
      if (v15)
        v22 = (void *)objc_msgSend(v21, "location");
      else
        v22 = (void *)objc_msgSend(v21, "endLocation");
      a4 = v22;
    }
    goto LABEL_47;
  }
  v19 = v17;
  if (!v9
    || (!v17 ? (v20 = objc_msgSend(a3, "affinity") == 0) : (v20 = objc_msgSend(a3, "affinity")),
        (v23 = -[NSTextSelectionNavigation _location:withAffinity:isAtBoundaryOfDestination:onSide:](self, "_location:withAffinity:isAtBoundaryOfDestination:onSide:", a4, v20, a6, v15), a4)? (v24 = v23): (v24 = 0), !v24))
  {
    if (a6 < 1)
    {
      if (((v19 | v10) & 1) != 0)
      {
        v26 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
        if (v15 == 1)
          v27 = 773;
        else
          v27 = 517;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_3;
        v38[3] = &unk_1E2603678;
        v38[4] = &v49;
        objc_msgSend(v26, "enumerateSubstringsFromLocation:options:usingBlock:", a4, v27, v38);
      }
      else
      {
        if (v15 == 1)
          v28 = (void *)objc_msgSend(v16, "firstObject");
        else
          v28 = (void *)objc_msgSend(v16, "lastObject");
        v50[5] = (uint64_t)v28;
        v31 = v28;
      }
    }
    else
    {
      if (((v19 | v10) & 1) == 0)
      {
        if (v15 == 1)
          v25 = (void *)objc_msgSend((id)objc_msgSend(v16, "firstObject"), "location");
        else
          v25 = (void *)objc_msgSend((id)objc_msgSend(v16, "lastObject"), "endLocation");
        a4 = v25;
      }
      v29 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
      if ((unint64_t)a6 > 4)
        v30 = 2;
      else
        v30 = qword_18D6CBDD0[a6 - 1];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_2;
      v39[3] = &unk_1E26036C8;
      v40 = a6 == 1;
      v41 = v15 == 1;
      v39[4] = a4;
      v39[5] = &v49;
      v39[6] = a6;
      objc_msgSend(v29, "enumerateSubstringsFromLocation:options:usingBlock:", a4, ((unint64_t)(v15 == 1) << 8) | ((unint64_t)(a6 != 1) << 9) | v30, v39);
    }
    v32 = (id)v50[5];
    if (v32)
    {
      if (!v9)
      {
LABEL_42:
        v33 = (void *)v50[5];
        if (v15 == 1)
          v34 = (void *)objc_msgSend(v33, "location");
        else
          v34 = (void *)objc_msgSend(v33, "endLocation");
        a4 = v34;
        if (a6 == 2)
          *a9 = v15 == 1;
        goto LABEL_47;
      }
    }
    else
    {
      v32 = (id)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
      v50[5] = (uint64_t)v32;
      if (!v9)
        goto LABEL_42;
    }
    if ((objc_msgSend(v32, "containsLocation:", a4) & 1) == 0
      && !objc_msgSend((id)objc_msgSend((id)v50[5], "endLocation"), "isEqual:", a4))
    {
      goto LABEL_47;
    }
    goto LABEL_42;
  }
LABEL_47:
  v35 = a4;

  v36 = a4;
  _Block_object_dispose(&v49, 8);
  return v36;
}

id __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a3 = 1;
  return result;
}

id __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v10;
  id result;
  uint64_t v12;

  if (!*(_BYTE *)(a1 + 56)
    || (v10 = objc_msgSend(a2, "length"),
        +[NSTextSelectionNavigation _setupCharacterSets](NSTextSelectionNavigation, "_setupCharacterSets"),
        result = (id)objc_msgSend(a2, "rangeOfCharacterFromSet:options:range:", __NSSkippableSet, 8, 0, v10),
        v12 != v10))
  {
    if (*(_BYTE *)(a1 + 57)
      || !a4
      || *(_QWORD *)(a1 + 48) != 2
      || (result = (id)objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a3, "endLocation")), result == (id)-1))
    {
      result = a3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
      *a5 = 1;
    }
  }
  return result;
}

id __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_visualDestinationLocationForTextSelection:(id)a3 originLocation:(id *)a4 direction:(int64_t)a5 destination:(int64_t)a6 extending:(BOOL)a7 confined:(BOOL)a8 affinity:(int64_t *)a9 crossedLine:(BOOL *)a10
{
  _BOOL4 v10;
  id v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int v20;
  BOOL v21;
  char v22;
  double v23;
  double v24;
  int v25;
  char v26;
  void *v27;
  void *v28;
  int64_t v29;
  _BOOL4 v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  BOOL v38;
  uint64_t v39;
  id v40;
  _BOOL4 v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  id v48;
  uint64_t v49;
  char v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  id v54;
  id v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  NSWritingDirection v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  int v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  id *v83;
  _BOOL4 v84;
  uint64_t v85;
  void *v86;
  BOOL v87;
  id v88;
  _BOOL4 v89;
  uint64_t v90;
  _BOOL4 v91;
  int v92;
  id v93;
  _QWORD v94[5];
  _QWORD v95[6];
  _QWORD v96[8];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  void (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  uint64_t v106;
  _QWORD v107[3];

  v91 = a8;
  v10 = a7;
  v107[1] = *MEMORY[0x1E0C80C00];
  v16 = *a4;
  v17 = (void *)objc_msgSend(a3, "textRanges");
  v18 = -[NSTextSelectionNavigation _horizontalDirectionForDirection:location:](self, "_horizontalDirectionForDirection:location:", a5, v16);
  v19 = v18 & 0xFFFFFFFFFFFFFFFELL;
  v20 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty");
  if (a6)
    v21 = 1;
  else
    v21 = v18 < 2;
  v22 = v21;
  if (v19 == 2 || (v22 & 1) == 0)
  {
    v87 = v19 != 2;
    objc_msgSend(a3, "anchorPositionOffset");
    if ((a6 | 2) == 2)
    {
      v24 = v23;
      v89 = v10;
      v25 = v20 | v10;
      if (a6)
        v26 = 1;
      else
        v26 = v25;
      v27 = v16;
      if ((v26 & 1) == 0)
      {
        v27 = v16;
        if (v19 != 2)
        {
          v28 = (void *)(v18 == 4
                       ? objc_msgSend((id)objc_msgSend(v17, "firstObject"), "location")
                       : objc_msgSend((id)objc_msgSend(v17, "lastObject"), "endLocation"));
          v27 = v28;
          if (objc_msgSend(v28, "isEqual:", v16))
            v27 = v16;
        }
      }
      v29 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty") ? *a9 : 1;
      v93 = -[NSTextSelectionNavigation _copyRangeForTextLineFragmentAtLocation:affinity:](self, "_copyRangeForTextLineFragmentAtLocation:affinity:", v27, v29);
      if (v93)
      {
        v85 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", v16);
        v83 = a4;
        v30 = (objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty") & 1) != 0
           || *a9 != 1
           || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "firstObject"), "location"), "compare:", objc_msgSend(v93, "location")) != -1;
        v84 = v30;
        if (a6 || v19 == 2)
          goto LABEL_87;
        v32 = (void *)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
        v86 = v32;
        if (v18 == 4)
        {
          v36 = objc_msgSend((id)objc_msgSend(v32, "location"), "compare:", objc_msgSend(v93, "location"));
          v34 = v86;
          if (v36)
            goto LABEL_37;
          v35 = objc_msgSend(v86, "location");
        }
        else
        {
          v33 = objc_msgSend((id)objc_msgSend(v32, "endLocation"), "compare:", objc_msgSend(v93, "endLocation"));
          v34 = v86;
          if (v33)
            goto LABEL_37;
          v35 = objc_msgSend(v86, "endLocation");
        }
        v31 = (_QWORD *)v35;
        v34 = v86;
        if (v35)
        {
LABEL_162:

          return v31;
        }
LABEL_37:
        v101 = 0;
        v102 = &v101;
        v103 = 0x3052000000;
        v104 = __Block_byref_object_copy__1;
        v105 = __Block_byref_object_dispose__1;
        v106 = 0;
        if (objc_msgSend(v16, "isEqual:", objc_msgSend(v34, "endLocation")))
        {
          v37 = objc_msgSend(v16, "isEqual:", objc_msgSend(v93, "endLocation")) ^ 1;
          if (v18 != 4)
            LOBYTE(v37) = 0;
          if ((v37 & 1) != 0)
            goto LABEL_50;
        }
        v38 = v18 == 4 || v89;
        if (!v38 && objc_msgSend(v27, "isEqual:", objc_msgSend(v93, "location")) && (!v25 || !*a9))
        {
LABEL_50:
          v40 = v93;
          v102[5] = (uint64_t)v40;
          v41 = v89;
          if (v40)
            goto LABEL_64;
        }
        else
        {
          if (v18 == 4)
            v39 = objc_msgSend(v93, "location");
          else
            v39 = objc_msgSend(v93, "endLocation");
          v41 = v89;
          v42 = v39;
          v97 = 0;
          v98 = &v97;
          v99 = 0x2020000000;
          v100 = 0;
          if (!v38
            && objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty")
            && (objc_msgSend(v93, "isEmpty") & 1) == 0
            && objc_msgSend(v27, "isEqual:", objc_msgSend(v93, "endLocation"))
            && !*a9)
          {
            *((_BYTE *)v98 + 24) = 1;
          }
          v43 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
          v96[0] = MEMORY[0x1E0C809B0];
          if (v18 == 4)
            v44 = 768;
          else
            v44 = 512;
          v96[1] = 3221225472;
          v96[2] = __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke;
          v96[3] = &unk_1E26036F0;
          v96[4] = v27;
          v96[5] = v42;
          v96[6] = &v97;
          v96[7] = &v101;
          objc_msgSend(v43, "enumerateSubstringsFromLocation:options:usingBlock:", v42, v44, v96);
          _Block_object_dispose(&v97, 8);
          v40 = (id)v102[5];
          if (v40)
          {
LABEL_64:
            if (v24 <= 0.0)
            {
              v45 = objc_msgSend(a3, "affinity");
              if (v41)
                v46 = 1;
              else
                v46 = v45;
              -[NSTextSelectionNavigation _anchorPositionOffsetForLocation:textSelection:affinity:](self, "_anchorPositionOffsetForLocation:textSelection:affinity:", v16, a3, v46);
              v24 = v47;
              v40 = (id)v102[5];
            }
            v48 = -[NSTextSelectionNavigation _lineFragmentInfoForRange:](self, "_lineFragmentInfoForRange:", v40);
            v49 = objc_msgSend(v48, "caretPositionClosestToOffset:", v24);
            if (v49
              || (v53 = objc_msgSend(v48, "numberOfCaretPositions"), v53 >= 1)
              && (v49 = objc_msgSend(v48, "caretPositionAtIndex:", v53 - 1)) != 0)
            {
              v31 = *(_QWORD **)(v49 + 8);
              if (v41)
              {
                v50 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty");
                v51 = v18 != 4;
                if ((v50 & 1) == 0)
                  goto LABEL_82;
              }
              else
              {
                if ((objc_msgSend((id)v102[5], "isEmpty") & 1) != 0)
                  v52 = 0;
                else
                  v52 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v48, "textRange"), "endLocation"), "isEqual:", v31);
                v51 = v52 ^ 1;
              }
              *a9 = v51;
            }
            else
            {
              v31 = 0;
            }
LABEL_82:

LABEL_83:
            if (a10 && v31)
            {
              *a10 = 1;
              _Block_object_dispose(&v101, 8);
              goto LABEL_162;
            }
            _Block_object_dispose(&v101, 8);
            if (v31)
              goto LABEL_162;
LABEL_87:
            if ((objc_msgSend(v93, "isEmpty") & 1) != 0)
              goto LABEL_161;
            if (!-[NSTextSelectionNavigation allowsNonContiguousRanges](self, "allowsNonContiguousRanges"))
              goto LABEL_161;
            v54 = -[NSTextSelectionNavigation _lineFragmentInfoForRange:](self, "_lineFragmentInfoForRange:", v93);
            v55 = v54;
            if (!v54 || (objc_msgSend(v54, "isMonotonicDirection") & 1) != 0)
              goto LABEL_161;
            if (a6)
              v56 = 1;
            else
              v56 = v87;
            if ((v56 & 1) != 0)
            {
              if ((a6 | 2) != 2)
              {
                v63 = v85 != (v18 != 2) && v84;
                v31 = -[NSTextSelectionNavigation _logicalDestinationLocationForTextSelection:originLocation:direction:destination:extending:confined:affinity:](self, "_logicalDestinationLocationForTextSelection:originLocation:direction:destination:extending:confined:affinity:", a3, *v83, v63, a6, v89, v91, a9);
                if (!v31 || !objc_msgSend(v93, "containsLocation:", v31))
                  goto LABEL_162;
                if (a6 == 2)
                {
                  if (v18 == 3)
                    v64 = 0;
                  else
                    v64 = objc_msgSend(v55, "numberOfCaretPositions") - 1;
                  v82 = objc_msgSend(v55, "caretPositionAtIndex:", v64);
                  if (v82)
                  {
                    v31 = *(_QWORD **)(v82 + 8);
                    if (!objc_msgSend(v31, "compare:", objc_msgSend(v93, "endLocation")))
                      *a9 = 0;
                    goto LABEL_162;
                  }
                  goto LABEL_161;
                }
LABEL_99:
                v57 = objc_msgSend(v55, "caretIndexForEdgeLocationInTextRanges:leftEdge:", v17, (v85 == 0) ^ (*a9 != 0));
                if (v57 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v88 = 0;
                  if (!a6)
                  {
LABEL_150:
                    if (v18 == 3)
                      v79 = v57 - 1;
                    else
                      v79 = v57 + 1;
                    if ((v79 & 0x8000000000000000) == 0 && v79 < objc_msgSend(v55, "numberOfCaretPositions"))
                    {
                      v80 = objc_msgSend(v55, "caretPositionAtIndex:", v79);
                      if (v80)
                      {
                        v31 = *(_QWORD **)(v80 + 8);
LABEL_157:
                        if (v31)
                        {
                          *v83 = v88;
                          if (objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty"))
                            *a9 = (v18 == 3) ^ (v85 == 0);
                          goto LABEL_162;
                        }
                      }
                    }
                    goto LABEL_160;
                  }
                }
                else
                {
                  v62 = objc_msgSend(v55, "caretPositionAtIndex:", v57);
                  if (v62)
                    v88 = *(id *)(v62 + 8);
                  else
                    v88 = 0;
                  if (!a6)
                    goto LABEL_150;
                  if (v57 < 0)
                  {
LABEL_160:

                    goto LABEL_161;
                  }
                }
                v92 = v18 == 3;
                v65 = -1;
                if (v18 != 3)
                  v65 = 1;
                v90 = v65;
                v66 = a6 - 1;
                while (v57 < objc_msgSend(v55, "numberOfCaretPositions"))
                {
                  v67 = objc_msgSend(v55, "caretPositionAtIndex:", v57);
                  v31 = (_QWORD *)v67;
                  if (v67)
                  {
                    v101 = 0;
                    v102 = &v101;
                    v103 = 0x3052000000;
                    v104 = __Block_byref_object_copy__1;
                    v105 = __Block_byref_object_dispose__1;
                    v106 = 0;
                    v68 = *(unsigned __int8 *)(v67 + 25);
                    v69 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
                    if (v66 > 3)
                      v70 = 2;
                    else
                      v70 = qword_18D6CBDD0[v66];
                    v71 = v31[1];
                    v95[0] = MEMORY[0x1E0C809B0];
                    v95[1] = 3221225472;
                    v95[2] = __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_2;
                    v95[3] = &unk_1E2603718;
                    v95[4] = &v101;
                    v95[5] = a6;
                    objc_msgSend(v69, "enumerateSubstringsFromLocation:options:usingBlock:", v71, v70 | ((unint64_t)(v68 != v92) << 8), v95);
                    if (v68 == v92)
                      v72 = 768;
                    else
                      v72 = 512;
                    v73 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
                    v74 = (void *)v102[5];
                    if (v68 == v92)
                      v75 = objc_msgSend(v74, "endLocation");
                    else
                      v75 = objc_msgSend(v74, "location");
                    if (v66 > 3)
                      v76 = 2;
                    else
                      v76 = qword_18D6CBDD0[v66];
                    v94[0] = MEMORY[0x1E0C809B0];
                    v94[1] = 3221225472;
                    v94[2] = __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_3;
                    v94[3] = &unk_1E2603678;
                    v94[4] = &v101;
                    objc_msgSend(v73, "enumerateSubstringsFromLocation:options:usingBlock:", v75, v76 | v72, v94);
                    v107[0] = v102[5];
                    v77 = objc_msgSend(v55, "caretIndexForEdgeLocationInTextRanges:leftEdge:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 1), v18 == 3);
                    if (v57 == v77)
                    {
                      v31 = 0;
                      v57 += v90;
                    }
                    else
                    {
                      v78 = objc_msgSend(v55, "caretPositionAtIndex:", v77);
                      if (v78)
                        v31 = *(_QWORD **)(v78 + 8);
                      else
                        v31 = 0;
                    }

                    _Block_object_dispose(&v101, 8);
                  }
                  if (v31 || v57 < 0)
                    goto LABEL_157;
                }
                goto LABEL_160;
              }
              if (!a6)
                goto LABEL_99;
            }
            else
            {
              if (((objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty") | v89) & 1) != 0)
                goto LABEL_99;
              if (!v84)
              {
                v58 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "location");
                v59 = -[NSTextSelectionNavigation _copyRangeForTextLineFragmentAtLocation:affinity:](self, "_copyRangeForTextLineFragmentAtLocation:affinity:", v58, 1);
                if (v59)
                {
                  v60 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", v58);
                  if (v60 == NSWritingDirectionNatural)
                    v60 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
                  if ((v18 == 3) != (v60 != NSWritingDirectionLeftToRight))
                    v55 = -[NSTextSelectionNavigation _lineFragmentInfoForRange:](self, "_lineFragmentInfoForRange:", v59);

                }
              }
              v61 = objc_msgSend(v55, "caretPositionAtIndex:", objc_msgSend(v55, "caretIndexForEdgeLocationInTextRanges:leftEdge:", v17, v18 == 3));
              if (v61)
              {
                v31 = *(_QWORD **)(v61 + 8);
                goto LABEL_162;
              }
            }
LABEL_161:
            v31 = 0;
            goto LABEL_162;
          }
        }
        if (v18 == 4)
        {
          _Block_object_dispose(&v101, 8);
          goto LABEL_87;
        }
        v31 = (_QWORD *)objc_msgSend(v86, "endLocation");
        goto LABEL_83;
      }
    }
  }
  v31 = 0;
  return v31;
}

id __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  id result;

  result = (id)objc_msgSend(a4, "containsLocation:", *(_QWORD *)(a1 + 32));
  if (!(_DWORD)result
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && (result = (id)objc_msgSend(*(id *)(a1 + 40), "isEqual:", objc_msgSend(a4, "location")), (_DWORD)result))
  {
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
    *a5 = 1;
  }
  return result;
}

id __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  id result;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    +[NSTextSelectionNavigation _setupCharacterSets](NSTextSelectionNavigation, "_setupCharacterSets");
    objc_msgSend(a2, "rangeOfCharacterFromSet:options:", __NSSkippableSet, 8);
    if (v9)
      a3 = 0;
  }
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

uint64_t __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqualToTextRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a3, "containsRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    if ((_DWORD)result)
    {

      result = a3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    }
  }
  *a5 = 1;
  return result;
}

- (id)_rangeOfCombinedLineFragmentsInRanges:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSTextRange *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  v5 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
  v6 = objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location");
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke;
  v20[3] = &unk_1E2603678;
  v20[4] = &v21;
  objc_msgSend(v5, "enumerateSubstringsFromLocation:options:usingBlock:", v6, 0, v20);
  if ((objc_msgSend((id)objc_msgSend(a3, "firstObject"), "isEmpty") & 1) == 0
    && objc_msgSend((id)objc_msgSend((id)v22[5], "endLocation"), "compare:", objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation")) == -1)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3052000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    v19 = 0;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke_2;
    v13[3] = &unk_1E2603678;
    v13[4] = &v14;
    objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "enumerateSubstringsFromLocation:options:usingBlock:", objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation"), 256, v13);
    if (v15[5])
    {

      v8 = [NSTextRange alloc];
      v9 = objc_msgSend((id)v22[5], "location");
      v10 = -[NSTextRange initWithLocation:endLocation:](v8, "initWithLocation:endLocation:", v9, v15[5]);
      v22[5] = v10;
    }
    _Block_object_dispose(&v14, 8);
  }
  v11 = (id)v22[5];
  _Block_object_dispose(&v21, 8);
  return v11;
}

id __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

id __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = (id)objc_msgSend(a3, "endLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_rangesForSelectionStartingOffset:(double)a3 inLineFragmentInfo:(id)a4 endingOffset:(double)a5 inLineFragmentInfo:(id)a6 contiguous:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  uint64_t v13;
  uint64_t v14;
  id v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  NSTextRange *v33;
  void *v34;
  double v35;
  id v36;
  uint64_t v37;
  _QWORD v39[9];
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v7 = a7;
  v9 = a4;
  v42[1] = *MEMORY[0x1E0C80C00];
  if (a4 == a6)
  {
    v14 = 0;
    v15 = a4;
  }
  else
  {
    v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "textRange"), "location"), "compare:", objc_msgSend((id)objc_msgSend(a6, "textRange"), "location"));
    if (v13 == 1)
      v14 = -1;
    else
      v14 = v13;
    if (v13 == 1)
      v15 = a6;
    else
      v15 = v9;
    if (v13 == 1)
    {
      v16 = a3;
    }
    else
    {
      v9 = a6;
      v16 = a5;
    }
    if (v13 == 1)
      a3 = a5;
    a5 = v16;
  }
  v17 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
  if (v7)
  {
    v18 = objc_msgSend(v17, "baseWritingDirectionAtLocation:", objc_msgSend((id)objc_msgSend(v15, "textRange"), "location"));
    if (v18 == 1)
      v19 = 0.0;
    else
      v19 = a3;
    v20 = 1.79769313e308;
    if (v18 == 1)
      v20 = a3;
    if (a5 >= a3)
      v21 = a5;
    else
      v21 = a3;
    if (a5 >= a3)
      v22 = a3;
    else
      v22 = a5;
    if (v18 == 1)
      v23 = v21;
    else
      v23 = v22;
    if (v18 != 1)
      v22 = v21;
    if (v14)
      v24 = v20;
    else
      v24 = v22;
    if (v14)
      v25 = v19;
    else
      v25 = v23;
    if (v14)
      v26 = a5;
    else
      v26 = v21;
    v27 = (void *)objc_msgSend(v15, "rangesBetweenStartingOffset:endOffset:continuous:", -[NSTextSelectionNavigation _usesVisualBidiSelection](self, "_usesVisualBidiSelection") ^ 1, v25, v24);
    if (v14)
    {
      v28 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", objc_msgSend((id)objc_msgSend(v9, "textRange"), "location"));
      v29 = v28 == 1 ? v26 : 0.0;
      v30 = v28 == 1 ? 1.79769313e308 : v26;
      v31 = (void *)objc_msgSend(v9, "rangesBetweenStartingOffset:endOffset:continuous:", -[NSTextSelectionNavigation _usesVisualBidiSelection](self, "_usesVisualBidiSelection") ^ 1, v29, v30);
      if (v31)
      {
        if (v27)
        {
          v32 = v31;
          v33 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend((id)objc_msgSend(v27, "lastObject"), "location"), objc_msgSend((id)objc_msgSend(v31, "firstObject"), "endLocation"));
          if ((unint64_t)objc_msgSend(v27, "count") <= 1 && (unint64_t)objc_msgSend(v32, "count") < 2)
          {
            v42[0] = v33;
            v34 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
          }
          else
          {
            v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            if ((unint64_t)objc_msgSend(v27, "count") >= 2)
              objc_msgSend(v34, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v27, 0, objc_msgSend(v27, "count") - 1);
            objc_msgSend(v34, "addObject:", v33);
            if ((unint64_t)objc_msgSend(v32, "count") >= 2)
              objc_msgSend(v34, "replaceObjectsInRange:withObjectsFromArray:range:", objc_msgSend(v34, "count"), 0, v32, 1, objc_msgSend(v32, "count") - 1);
          }

          return v34;
        }
      }
    }
  }
  else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "textRange"), "location"), "isEqual:", objc_msgSend((id)objc_msgSend(v17, "documentRange"), "endLocation")))
  {
    v40 = objc_msgSend(v15, "textRange");
    v41 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  }
  else
  {
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (a3 >= a5)
      v35 = a5;
    else
      v35 = a3;
    if (a3 >= a5)
      a5 = a3;
    v36 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
    v37 = objc_msgSend((id)objc_msgSend(v15, "textRange"), "location");
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __125__NSTextSelectionNavigation__rangesForSelectionStartingOffset_inLineFragmentInfo_endingOffset_inLineFragmentInfo_contiguous___block_invoke;
    v39[3] = &unk_1E2603740;
    *(double *)&v39[7] = v35;
    *(double *)&v39[8] = a5;
    v39[4] = self;
    v39[5] = v27;
    v39[6] = v9;
    objc_msgSend(v36, "enumerateSubstringsFromLocation:options:usingBlock:", v37, 0, v39);
  }
  return v27;
}

uint64_t __125__NSTextSelectionNavigation__rangesForSelectionStartingOffset_inLineFragmentInfo_endingOffset_inLineFragmentInfo_contiguous___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  uint64_t v9;
  uint64_t result;

  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "_lineFragmentInfoForRange:");
  if (v8)
  {
    v9 = objc_msgSend(v8, "rangesBetweenStartingOffset:endOffset:continuous:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
    if (v9)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }
  result = objc_msgSend((id)objc_msgSend(a3, "location"), "compare:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "textRange"), "location"));
  if (result != -1)
    *a5 = 1;
  return result;
}

- (double)_anchorPositionOffsetForLocation:(id)a3 textSelection:(id)a4 affinity:(int64_t)a5
{
  void *v8;
  id v9;
  double v10;
  double *v11;

  v8 = (void *)objc_msgSend(a4, "textRanges");
  v9 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", a3, a5);
  if ((objc_msgSend((id)objc_msgSend(v8, "firstObject"), "isEmpty") & 1) == 0
    && objc_msgSend((id)objc_msgSend(v9, "textRange"), "isEqual:", a3)
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "lastObject"), "endLocation"), "isEqual:", a3))
  {
    v9 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", a3, 0);
  }
  v10 = 0.0;
  if (v9)
  {
    v11 = (double *)objc_msgSend(v9, "caretPositionAtIndex:", objc_msgSend(v9, "caretIndexForPrimaryLocation:", a3));
    if (v11)
      return *v11;
  }
  return v10;
}

- (id)_findAnchorInfoForTextSelection:(id)a3 anchorPositionOffset:(double *)a4 anchorLocation:(id *)a5
{
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a4)
  {
    v9 = *a4;
  }
  else
  {
    objc_msgSend(a3, "anchorPositionOffset");
    v9 = v10;
  }
  v11 = (void *)objc_msgSend(a3, "selectionAnchorLocation");
  v12 = (uint64_t)v11;
  if (!v11)
    v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "textRanges"), "firstObject"), "location");
  v13 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", v12, objc_msgSend(a3, "affinity"));
  v14 = v13;
  if (v11 || !v13)
    goto LABEL_16;
  if (v9 != 0.0)
  {
    v17 = objc_msgSend(v13, "caretPositionClosestToOffset:", v9);
    if (!v17)
      goto LABEL_21;
    v11 = *(void **)(v17 + 8);
LABEL_16:
    if (!a4)
      goto LABEL_18;
    goto LABEL_17;
  }
  v15 = objc_msgSend(v13, "caretIndexForPrimaryLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "textRanges"), "firstObject"), "location"));
  if (v15 != 0x7FFFFFFFFFFFFFFFLL && (v16 = objc_msgSend(v14, "caretPositionAtIndex:", v15)) != 0
    || (v16 = objc_msgSend(v14, "caretPositionClosestToOffset:", v9)) != 0)
  {
    v11 = *(void **)(v16 + 8);
    v9 = *(double *)v16;
    if (!a4)
      goto LABEL_18;
LABEL_17:
    *a4 = v9;
    goto LABEL_18;
  }
LABEL_21:
  v11 = 0;
  if (a4)
    goto LABEL_17;
LABEL_18:
  if (a5)
    *a5 = v11;
  return v14;
}

- (unsigned)_bidiLevelAtLocation:(id)a3 affinity:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", a3, a4);
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "caretIndexForPrimaryLocation:", a3);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = objc_msgSend(v6, "caretPositionAtIndex:", v7);
  if (v8)
    LOBYTE(v8) = *(_BYTE *)(v8 + 25) != 0;
  return v8;
}

- (BOOL)_usesVisualBidiSelection
{
  if (visualBidiSelectionEnabled_once != -1)
    dispatch_once(&visualBidiSelectionEnabled_once, &__block_literal_global_220);
  return visualBidiSelectionEnabled_result
      && -[NSTextSelectionNavigation allowsNonContiguousRanges](self, "allowsNonContiguousRanges");
}

- (NSTextSelection)destinationSelectionForTextSelection:(NSTextSelection *)textSelection direction:(NSTextSelectionNavigationDirection)direction destination:(NSTextSelectionNavigationDestination)destination extending:(BOOL)extending confined:(BOOL)confined
{
  _BOOL8 v7;
  _BOOL8 v8;
  NSTextSelection *v11;
  NSArray *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSArray *v22;
  NSArray *v23;
  id v24;
  id v25;
  id v26;
  NSArray *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSArray *v34;
  NSArray *v35;
  NSTextRange *v36;
  uint64_t v37;
  NSTextSelection *v38;
  NSTextRange *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSArray *v45;
  NSTextSelection *v46;
  NSTextSelection *v47;
  id v49;
  void *context;
  _QWORD v51[8];
  BOOL v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  uint64_t v62;
  char v63;
  uint64_t v64;
  id v65;
  _QWORD v66[3];

  v7 = confined;
  v8 = extending;
  v11 = textSelection;
  v66[1] = *MEMORY[0x1E0C80C00];
  v13 = -[NSTextSelection textRanges](textSelection, "textRanges");
  v65 = 0;
  v14 = -[NSTextSelection affinity](v11, "affinity");
  v64 = v14;
  v63 = 0;
  context = (void *)MEMORY[0x18D7917B4]();
  if (objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "isEmpty"))
  {
    v15 = (void *)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
    v16 = -[NSTextSelectionNavigation _logicalDirectionForDirection:textSelection:](self, "_logicalDirectionForDirection:textSelection:", direction, v11)? objc_msgSend(v15, "location"): objc_msgSend(v15, "endLocation");
    if ((objc_msgSend((id)objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "location"), "isEqual:", v16) & 1) != 0)
      goto LABEL_59;
  }
  v17 = (void *)(v8 && v14
               ? objc_msgSend(-[NSArray lastObject](v13, "lastObject"), "endLocation")
               : objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "location"));
  v65 = v17;
  v18 = -[NSTextSelectionNavigation _visualDestinationLocationForTextSelection:originLocation:direction:destination:extending:confined:affinity:crossedLine:](self, "_visualDestinationLocationForTextSelection:originLocation:direction:destination:extending:confined:affinity:crossedLine:", v11, &v65, direction, destination, v8, v7, &v64, &v63);
  v19 = v18;
  if (!v18)
  {
    v19 = -[NSTextSelectionNavigation _logicalDestinationLocationForTextSelection:originLocation:direction:destination:extending:confined:affinity:](self, "_logicalDestinationLocationForTextSelection:originLocation:direction:destination:extending:confined:affinity:", v11, v65, direction, destination, v8, v7, &v64);
    if (!v19)
      goto LABEL_59;
  }
  v20 = v65;
  v21 = objc_msgSend(v65, "compare:", v19);
  v49 = -[NSTextSelectionNavigation _adjustLocationForNearestCaretPosition:direction:](self, "_adjustLocationForNearestCaretPosition:direction:", v19, direction);
  if (!v8)
    goto LABEL_31;
  if (!v21)
    goto LABEL_59;
  v22 = -[NSTextSelection textRanges](v11, "textRanges");
  v23 = v22;
  if (v21 == 1)
  {
    v19 = v65;
    v24 = v49;
  }
  else
  {
    v24 = v20;
  }
  if (!v18)
  {
    v57 = 0;
    v58 = &v57;
    v59 = 0x3052000000;
    v60 = __Block_byref_object_copy__1;
    v61 = __Block_byref_object_dispose__1;
    v62 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0x7FFFFFFFFFFFFFFFLL;
    v35 = v22;
    if (objc_msgSend(v49, "compare:", objc_msgSend(-[NSArray firstObject](v22, "firstObject"), "location")) == -1)
    {
      v39 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v49, objc_msgSend(-[NSArray firstObject](v23, "firstObject"), "endLocation"));
      v58[5] = (uint64_t)v39;
      v54[3] = 0;
      v64 = 0;
    }
    else if (objc_msgSend((id)objc_msgSend(-[NSArray lastObject](v23, "lastObject"), "endLocation"), "compare:", v49) == -1)
    {
      v36 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(-[NSArray lastObject](v23, "lastObject"), "location"), v49);
      v58[5] = (uint64_t)v36;
      v37 = -[NSArray count](v23, "count");
      v54[3] = v37 - 1;
      v64 = 1;
    }
    if (v58[5])
    {
      v34 = (NSArray *)-[NSArray mutableCopy](v23, "mutableCopy");
      -[NSArray replaceObjectAtIndex:withObject:](v34, "replaceObjectAtIndex:withObject:", v54[3], v58[5]);

      v27 = v34;
    }
    else
    {
      v40 = objc_msgSend(v65, "compare:", objc_msgSend(-[NSArray firstObject](v23, "firstObject"), "location"));
      v41 = 1;
      v51[0] = MEMORY[0x1E0C809B0];
      if (!v40)
        v41 = -1;
      v51[1] = 3221225472;
      v51[2] = __107__NSTextSelectionNavigation_destinationSelectionForTextSelection_direction_destination_extending_confined___block_invoke;
      v51[3] = &unk_1E2603768;
      v52 = v40 != 0;
      v51[4] = v49;
      v51[5] = &v57;
      v51[6] = &v53;
      v51[7] = v41;
      -[NSArray enumerateObjectsWithOptions:usingBlock:](v23, "enumerateObjectsWithOptions:usingBlock:", 2 * (v40 != 0), v51);
      if (v58[5])
      {
        v42 = v54[3];
        if (v40)
        {
          v43 = 0;
        }
        else
        {
          v44 = -[NSArray count](v23, "count");
          v43 = v42 + 1;
          v42 = v44 + ~v54[3];
        }
        if (v42)
        {
          v45 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v34 = v45;
          if (v40)
            -[NSArray replaceObjectsInRange:withObjectsFromArray:range:](v45, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v35, v43, v42);
          -[NSArray addObject:](v34, "addObject:", v58[5]);
          if (!v40)
            -[NSArray replaceObjectsInRange:withObjectsFromArray:range:](v34, "replaceObjectsInRange:withObjectsFromArray:range:", -[NSArray count](v34, "count"), 0, v35, v43, v42);
          v27 = v34;
        }
        else
        {
          v66[0] = v58[5];
          v34 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
          v27 = 0;
        }

      }
      else
      {
        v34 = 0;
        v27 = 0;
        v64 = 1;
      }
    }
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    if (!v34)
      goto LABEL_31;
    goto LABEL_51;
  }
  v25 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", v24, 1);
  v26 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", v19, 1);
  v27 = 0;
  if (v25)
  {
    v28 = v26;
    if (v26)
    {
      objc_msgSend(v25, "offsetForLocation:", v24);
      v30 = v29;
      objc_msgSend(v28, "offsetForLocation:", v19);
      v32 = 0.0;
      if (v30 >= 0.0)
        v33 = v30;
      else
        v33 = 0.0;
      if (v31 >= 0.0)
        v32 = v31;
      v27 = 0;
      v34 = +[NSTextRange combineTextRanges:withTextRanges:usingOperator:](NSTextRange, "combineTextRanges:withTextRanges:usingOperator:", -[NSTextSelectionNavigation _rangesForSelectionStartingOffset:inLineFragmentInfo:endingOffset:inLineFragmentInfo:contiguous:](self, "_rangesForSelectionStartingOffset:inLineFragmentInfo:endingOffset:inLineFragmentInfo:contiguous:", v25, v28, 1, v33, v32), v23, 3);
      if (!v34)
        goto LABEL_31;
LABEL_51:
      v46 = [NSTextSelection alloc];
      v38 = -[NSTextSelection initWithRanges:affinity:granularity:](v46, "initWithRanges:affinity:granularity:", v34, v64, -[NSTextSelection granularity](v11, "granularity"));

      goto LABEL_52;
    }
  }
  v34 = v23;
  if (v23)
    goto LABEL_51;
LABEL_31:
  v38 = 0;
LABEL_52:
  if (!v38 && v49)
  {
    v47 = [NSTextSelection alloc];
    v38 = -[NSTextSelection initWithLocation:affinity:](v47, "initWithLocation:affinity:", v49, v64);
  }
  if (v38)
  {
    -[NSTextSelection anchorPositionOffset](v11, "anchorPositionOffset");
    if (v8)
    {
      if (destination == NSTextSelectionNavigationDestinationCharacter)
        goto LABEL_63;
    }
    else if (destination)
    {
      goto LABEL_62;
    }
    if (v63)
    {
LABEL_63:
      -[NSTextSelection setAnchorPositionOffset:](v38, "setAnchorPositionOffset:");
      objc_autoreleasePoolPop(context);
      return v38;
    }
LABEL_62:
    -[NSTextSelectionNavigation _anchorPositionOffsetForLocation:textSelection:affinity:](self, "_anchorPositionOffsetForLocation:textSelection:affinity:", v49, v38, -[NSTextSelection affinity](v38, "affinity"));
    goto LABEL_63;
  }
LABEL_59:
  objc_autoreleasePoolPop(context);
  return v11;
}

uint64_t __107__NSTextSelectionNavigation_destinationSelectionForTextSelection_direction_destination_extending_confined___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  NSTextRange *v12;
  uint64_t v13;
  uint64_t v14;
  NSTextRange *v15;
  uint64_t v16;

  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
    v9 = objc_msgSend(a2, "location");
  else
    v9 = objc_msgSend(a2, "endLocation");
  result = objc_msgSend(v8, "compare:", v9);
  if (result == *(_QWORD *)(a1 + 56))
  {
    v11 = *(unsigned __int8 *)(a1 + 64);
    v12 = [NSTextRange alloc];
    if (v11)
    {
      v13 = objc_msgSend(a2, "location");
      v14 = *(_QWORD *)(a1 + 32);
      v15 = v12;
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 32);
      v14 = objc_msgSend(a2, "endLocation");
      v15 = v12;
      v13 = v16;
    }
    result = -[NSTextRange initWithLocation:endLocation:](v15, "initWithLocation:endLocation:", v13, v14);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)textSelectionForSelectionGranularity:(int64_t)a3 enclosingPoint:(CGPoint)a4 inContainerAtLocation:(id)a5 bounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  uint64_t v15;
  id v16;
  void *v17;
  double *v18;
  NSTextSelection *v19;
  double v20;
  uint64_t v21;
  NSTextSelection *v22;
  NSTextSelection *v23;
  __int16 v26;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4.y;
  v12 = a4.x;
  if (self->_supportsLayoutOrientation)
    v15 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textLayoutOrientationAtLocation:", a5);
  else
    v15 = 0;
  v26 = 0;
  v16 = -[NSTextSelectionNavigation _lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:](self, "_lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:", a5, v15, (char *)&v26 + 1, &v26, 0, v12, v11, x, y, width, height);
  if (!v16)
    return 0;
  v17 = v16;
  if (HIBYTE(v26))
  {
    v18 = (double *)objc_msgSend(v16, "logicalFirstCaret");
  }
  else
  {
    if (!(_BYTE)v26)
    {
      if (!self->_rotatesCoordinateSystemForLayoutOrientation || v15 == 0)
        v20 = v12;
      else
        v20 = v11;
      goto LABEL_11;
    }
    v18 = (double *)objc_msgSend(v16, "logicalLastCaret");
  }
  v20 = *v18;
LABEL_11:
  v21 = objc_msgSend(v17, "textRangeOfCharacterAtOffset:fractionOfDistanceThroughGlyph:", 0, v20);
  if (v21)
  {
    v22 = -[NSTextSelection initWithRange:affinity:granularity:]([NSTextSelection alloc], "initWithRange:affinity:granularity:", v21, 0, 0);
    v23 = -[NSTextSelectionNavigation textSelectionForSelectionGranularity:enclosingTextSelection:](self, "textSelectionForSelectionGranularity:enclosingTextSelection:", a3, v22);

    v19 = v23;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSTextSelection)textSelectionForSelectionGranularity:(NSTextSelectionGranularity)selectionGranularity enclosingPoint:(CGPoint)point inContainerAtLocation:(id)location
{
  return (NSTextSelection *)-[NSTextSelectionNavigation textSelectionForSelectionGranularity:enclosingPoint:inContainerAtLocation:bounds:](self, "textSelectionForSelectionGranularity:enclosingPoint:inContainerAtLocation:bounds:", selectionGranularity, location, point.x, point.y, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (NSArray)textSelectionsInteractingAtPoint:(CGPoint)point inContainerAtLocation:(id)containerLocation anchors:(NSArray *)anchors modifiers:(NSTextSelectionNavigationModifier)modifiers selecting:(BOOL)selecting bounds:(CGRect)bounds
{
  double height;
  double width;
  double y;
  double x;
  char v13;
  double v16;
  double v17;
  uint64_t v19;
  BOOL v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  double v30;
  id v31;
  double v32;
  id v33;
  int v34;
  int v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  NSTextSelection *v40;
  NSTextSelection *v41;
  double v42;
  int64_t multipleSelectionAnchor;
  _BOOL4 v44;
  char v45;
  void *v46;
  uint64_t v47;
  _BOOL8 v48;
  NSArray *v49;
  void *v51;
  void *v52;
  NSTextSelection *v53;
  _QWORD v54[5];
  BOOL v55;
  _QWORD v56[6];
  _QWORD v57[7];
  BOOL v58;
  _QWORD v59[7];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  uint64_t v65;
  _QWORD v66[6];
  _QWORD v67[9];
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t);
  __int128 v73;
  double v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  id v80;
  id v81;
  __int16 v82;
  NSTextSelection *v83;
  NSTextSelection *v84;
  uint64_t v85;
  _QWORD v86[3];

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v13 = modifiers;
  v16 = point.y;
  v17 = point.x;
  v86[1] = *MEMORY[0x1E0C80C00];
  if (self->_supportsLayoutOrientation)
    v19 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textLayoutOrientationAtLocation:", containerLocation);
  else
    v19 = 0;
  v20 = !self->_rotatesCoordinateSystemForLayoutOrientation || v19 == 0;
  if (v20)
    v21 = v17;
  else
    v21 = v16;
  v82 = 0;
  v81 = 0;
  v22 = -[NSTextSelectionNavigation _lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:](self, "_lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:", containerLocation, v19, (char *)&v82 + 1, &v82, &v81, v17, v16, x, y, width, height);
  v80 = 0;
  if (-[NSArray count](anchors, "count") <= 1)
    self->_multipleSelectionAnchor = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v23 = MEMORY[0x1E0C809B0];
  v79 = 0;
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke;
  v75[3] = &unk_1E2603790;
  v75[4] = &v76;
  -[NSArray enumerateObjectsUsingBlock:](anchors, "enumerateObjectsUsingBlock:", v75);
  if (*((_BYTE *)v77 + 24))
  {
    if (v22)
      goto LABEL_14;
LABEL_17:
    v25 = 0;
    goto LABEL_66;
  }
  self->_multipleSelectionAnchor = 0;
  if (!v22)
    goto LABEL_17;
LABEL_14:
  if (HIBYTE(v82))
  {
    v24 = objc_msgSend(v22, "logicalFirstCaret");
  }
  else if ((_BYTE)v82)
  {
    v24 = objc_msgSend(v22, "logicalLastCaret");
  }
  else
  {
    v24 = objc_msgSend(v22, "caretPositionClosestToOffset:", v21);
  }
  v26 = v24;
  v27 = v22;
  if (v26)
  {
    if (self->_multipleSelectionAnchor)
      v28 = -[NSArray firstObject](anchors, "firstObject");
    else
      v28 = -[NSArray lastObject](anchors, "lastObject");
    v29 = v28;
    objc_msgSend(v28, "anchorPositionOffset");
    v74 = v30;
    if (v29)
      v31 = -[NSTextSelectionNavigation _findAnchorInfoForTextSelection:anchorPositionOffset:anchorLocation:](self, "_findAnchorInfoForTextSelection:anchorPositionOffset:anchorLocation:", v29, &v74, &v80);
    else
      v31 = 0;
    v32 = *(double *)v26;
    v33 = v31;
    if ((v13 & 3) == 0
      || !v31
      || !objc_msgSend(v29, "granularity")
      && ((v34 = objc_msgSend((id)objc_msgSend(v22, "textRange"), "isEqualToTextRange:", objc_msgSend(v31, "textRange")),
           v74 == v32)
        ? (v35 = v34)
        : (v35 = 0),
          v35 == 1))
    {
      if ((objc_msgSend(v81, "isEmpty") & 1) != 0)
        v36 = 1;
      else
        v36 = objc_msgSend((id)objc_msgSend(v81, "endLocation"), "isEqual:", *(_QWORD *)(v26 + 8)) ^ 1;
      v40 = -[NSTextSelection initWithLocation:affinity:]([NSTextSelection alloc], "initWithLocation:affinity:", *(_QWORD *)(v26 + 8), v36);
      v41 = v40;
      if ((v13 & 2) != 0)
        v42 = v21;
      else
        v42 = v32;
      -[NSTextSelection setAnchorPositionOffset:](v40, "setAnchorPositionOffset:", v42);
      -[NSTextSelection setSecondarySelectionLocation:](v41, "setSecondarySelectionLocation:", *(_QWORD *)(v26 + 16));
      -[NSTextSelection setLogical:](v41, "setLogical:", 0);
      if ((v13 & 4) != 0 && *((_BYTE *)v77 + 24))
      {
        v69 = 0;
        v70 = &v69;
        v71 = 0x3010000000;
        v72 = (void (*)(uint64_t, uint64_t))"";
        v73 = xmmword_18D6CBB80;
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        LOBYTE(v63) = 0;
        multipleSelectionAnchor = self->_multipleSelectionAnchor;
        v20 = multipleSelectionAnchor == 0;
        v44 = multipleSelectionAnchor != 0;
        v45 = v20;
        v67[0] = v23;
        v67[1] = 3221225472;
        v67[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_2;
        v67[3] = &unk_1E26037B8;
        v67[7] = &v60;
        v67[8] = v26;
        v68 = v45;
        v67[5] = anchors;
        v67[6] = &v69;
        v67[4] = self;
        -[NSArray enumerateObjectsWithOptions:usingBlock:](anchors, "enumerateObjectsWithOptions:usingBlock:", 2 * v44, v67);
        v46 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        objc_msgSend(v46, "addObject:", v41);
        objc_msgSend(v46, "replaceObjectsInRange:withObjectsFromArray:range:", *((_BYTE *)v61 + 24) == 0, 0, anchors, v70[4], v70[5]);
        v25 = v46;
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v69, 8);
        goto LABEL_64;
      }
      v86[0] = v41;
      v47 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 1);
      goto LABEL_56;
    }
    if ((v13 & 6) != 0)
    {
      v37 = -[NSTextSelectionNavigation _rangesForSelectionStartingOffset:inLineFragmentInfo:endingOffset:inLineFragmentInfo:contiguous:](self, "_rangesForSelectionStartingOffset:inLineFragmentInfo:endingOffset:inLineFragmentInfo:contiguous:", v31, v22, 0, v74, v21);
      v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v57[0] = v23;
      v57[1] = 3221225472;
      v57[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_5;
      v57[3] = &unk_1E2603830;
      v58 = (v13 & 2) == 0;
      v57[4] = v38;
      v57[5] = 0;
      *(double *)&v57[6] = v74;
      objc_msgSend(v37, "enumerateObjectsUsingBlock:", v57);
      if ((v13 & 2) != 0)
      {
        v41 = -[NSTextSelection initWithRanges:affinity:granularity:]([NSTextSelection alloc], "initWithRanges:affinity:granularity:", v38, 1, 0);
        -[NSTextSelection setAnchorPositionOffset:](v41, "setAnchorPositionOffset:", v74);
        -[NSTextSelection setLogical:](v41, "setLogical:", 0);
        v83 = v41;
        v25 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);

        goto LABEL_64;
      }
      v25 = (NSArray *)v38;
      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      LOBYTE(v72) = 0;
      if (!v80)
        v80 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "textRanges"), "firstObject"), "location");
      v39 = (void *)objc_msgSend(-[NSArray firstObject](v25, "firstObject"), "textRanges");
      v56[0] = v23;
      v56[1] = 3221225472;
      v56[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_6;
      v56[3] = &unk_1E26037E0;
      v56[4] = v80;
      v56[5] = &v69;
      objc_msgSend(v39, "enumerateObjectsUsingBlock:", v56);
      if (!*((_BYTE *)v70 + 24))
        self->_multipleSelectionAnchor = 1;
      _Block_object_dispose(&v69, 8);
    }
    else
    {
      v25 = -[NSTextSelectionNavigation _rangesForSelectionStartingOffset:inLineFragmentInfo:endingOffset:inLineFragmentInfo:contiguous:](self, "_rangesForSelectionStartingOffset:inLineFragmentInfo:endingOffset:inLineFragmentInfo:contiguous:", v31, v22, 1, v74, v32);
      if (v25)
      {
        v48 = (!v80 || objc_msgSend(v80, "compare:", *(_QWORD *)(v26 + 8)) != 1)
           && !objc_msgSend((id)objc_msgSend(v81, "endLocation"), "isEqual:", *(_QWORD *)(v26 + 8));
        if (objc_msgSend(v29, "granularity")
          && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "textRanges"), "firstObject"), "isEmpty") & 1) == 0)
        {
          v69 = 0;
          v70 = &v69;
          v71 = 0x3052000000;
          v72 = __Block_byref_object_copy__1;
          *(_QWORD *)&v73 = __Block_byref_object_dispose__1;
          *((_QWORD *)&v73 + 1) = 0;
          v51 = (void *)objc_msgSend(v29, "textRanges");
          v66[0] = v23;
          v66[1] = 3221225472;
          v66[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_3;
          v66[3] = &unk_1E26037E0;
          v66[4] = v80;
          v66[5] = &v69;
          objc_msgSend(v51, "enumerateObjectsUsingBlock:", v66);
          if (v70[5])
          {
            if (objc_msgSend(-[NSArray firstObject](v25, "firstObject"), "isEmpty"))
            {
              v85 = v70[5];
              v25 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
            }
            else
            {
              v60 = 0;
              v61 = &v60;
              v62 = 0x3052000000;
              v63 = __Block_byref_object_copy__1;
              v64 = __Block_byref_object_dispose__1;
              v65 = 0;
              v59[0] = v23;
              v59[1] = 3221225472;
              v59[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_4;
              v59[3] = &unk_1E2603808;
              v59[5] = &v69;
              v59[6] = &v60;
              v59[4] = v25;
              -[NSArray enumerateObjectsUsingBlock:](v25, "enumerateObjectsUsingBlock:", v59);
              v52 = (void *)v61[5];
              if (v52)
                v25 = v52;
              _Block_object_dispose(&v60, 8);
            }

          }
          _Block_object_dispose(&v69, 8);
        }
        v41 = -[NSTextSelection initWithRanges:affinity:granularity:]([NSTextSelection alloc], "initWithRanges:affinity:granularity:", v25, v48, objc_msgSend(v29, "granularity"));
        if (-[NSTextSelection granularity](v41, "granularity"))
        {
          v53 = -[NSTextSelectionNavigation textSelectionForSelectionGranularity:enclosingTextSelection:](self, "textSelectionForSelectionGranularity:enclosingTextSelection:", objc_msgSend(v29, "granularity"), v41);

          v41 = v53;
        }
        -[NSTextSelection setAnchorPositionOffset:](v41, "setAnchorPositionOffset:", v74);
        -[NSTextSelection setLogical:](v41, "setLogical:", 0);
        v84 = v41;
        v47 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
LABEL_56:
        v25 = (NSArray *)v47;
LABEL_64:

        goto LABEL_65;
      }
    }
    v41 = 0;
    goto LABEL_64;
  }
  v25 = 0;
LABEL_65:

LABEL_66:
  v54[0] = v23;
  v54[1] = 3221225472;
  v54[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_7;
  v54[3] = &unk_1E2603858;
  v55 = selecting;
  v54[4] = v80;
  -[NSArray enumerateObjectsUsingBlock:](v25, "enumerateObjectsUsingBlock:", v54);
  if (!selecting)
    self->_multipleSelectionAnchor = 0;

  if (v25)
    v49 = v25;
  else
    v49 = (NSArray *)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v76, 8);
  return v49;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isTransient");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "_rangeOfCombinedLineFragmentsInRanges:", objc_msgSend(a2, "textRanges"));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "compare:", objc_msgSend(v7, "location"));
  v9 = result;
  if (*(_BYTE *)(a1 + 72))
  {
    if (result == 1)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "compare:", objc_msgSend(v7, "endLocation"));
      if (result != -1)
        return result;
      goto LABEL_12;
    }
    if (a3 || result != -1)
    {
LABEL_12:
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_QWORD *)(v11 + 32) = 0;
      *(_QWORD *)(v11 + 40) = a3;
      goto LABEL_14;
    }
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = xmmword_18D6CBD40;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 8), "compare:", objc_msgSend(v7, "endLocation"));
    if (result == -1)
      return result;
    result = objc_msgSend(*(id *)(a1 + 40), "count");
    if (result - 1 != a3 || v9 == -1)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "count");
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_QWORD *)(v12 + 32) = a3;
      *(_QWORD *)(v12 + 40) = result - a3;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_QWORD *)(v10 + 32) = a3;
      *(_QWORD *)(v10 + 40) = 1;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    }
  }
LABEL_14:
  *a4 = 1;
  return result;
}

id __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = (id)objc_msgSend(a2, "containsLocation:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  if ((objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "location"), "isEqual:", objc_msgSend(a2, "endLocation")) & 1) != 0|| (result = objc_msgSend((id)objc_msgSend(a2, "location"), "isEqual:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endLocation")), (_DWORD)result))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "textRangeByFormingUnionWithTextRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
    *a4 = 1;
  }
  return result;
}

void __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSTextSelection *v7;

  if (*(_BYTE *)(a1 + 56))
  {
    v7 = -[NSTextSelection initWithRanges:affinity:granularity:]([NSTextSelection alloc], "initWithRanges:affinity:granularity:", *(_QWORD *)(a1 + 32), 1, 0);
    objc_msgSend(*(id *)(a1 + 40), "setAnchorPositionOffset:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setLogical:", 0);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

    return;
  }
  v4 = (void *)objc_msgSend(a2, "firstObject");
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
      return;
    if (v6 == 1)
    {
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "firstObject"), "isEmpty"))
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", 0);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsLocation:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_7(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setTransient:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(a2, "setSelectionAnchorLocation:", *(_QWORD *)(a1 + 32));
}

- (id)textSelectionsInteractingAtPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 anchors:(id)a5 modifiers:(unint64_t)a6 selecting:(BOOL)a7
{
  return -[NSTextSelectionNavigation textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:](self, "textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:", a4, a5, a6, a7, a3.x, a3.y, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (NSTextSelection)textSelectionForSelectionGranularity:(NSTextSelectionGranularity)selectionGranularity enclosingTextSelection:(NSTextSelection *)textSelection
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = -[NSArray lastObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "lastObject");
  v8 = (void *)objc_msgSend(-[NSArray firstObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "firstObject"), "location");
  v9 = objc_msgSend(v7, "endLocation");
  v10 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textRangeForSelectionGranularity:enclosingLocation:", selectionGranularity, v8);
  if (v10
    && ((v11 = (void *)v10, (objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
     || (objc_msgSend(v11, "containsLocation:", v9) & 1) != 0
     || (v12 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textRangeForSelectionGranularity:enclosingLocation:", selectionGranularity, objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "locationFromLocation:withOffset:", v9, -1))) == 0|| (v11 = (void *)objc_msgSend(v11, "textRangeByFormingUnionWithTextRange:", v12)) != 0))
  {
    return -[NSTextSelection initWithRange:affinity:granularity:]([NSTextSelection alloc], "initWithRange:affinity:granularity:", v11, 1, selectionGranularity);
  }
  else
  {
    return textSelection;
  }
}

- (id)resolvedInsertionLocationForTextSelection:(NSTextSelection *)textSelection writingDirection:(NSTextSelectionNavigationWritingDirection)writingDirection
{
  if (!objc_msgSend(-[NSArray firstObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "firstObject"), "isEmpty"))return 0;
  if ((-[NSTextSelectionNavigation _bidiLevelAtLocation:affinity:](self, "_bidiLevelAtLocation:affinity:", objc_msgSend(-[NSArray firstObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "firstObject"), "location"), -[NSTextSelection affinity](textSelection, "affinity")) & 1) == writingDirection)return (id)objc_msgSend(-[NSArray firstObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "firstObject"), "location");
  return -[NSTextSelection secondarySelectionLocation](textSelection, "secondarySelectionLocation");
}

- (id)deletionRangesForTextSelection:(id)a3 direction:(int64_t)a4 destination:(int64_t)a5 allowsDecomposition:(BOOL)a6 confined:(BOOL)a7
{
  _BOOL8 v7;
  NSArray *v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  _QWORD v28[2];

  v7 = a7;
  v28[1] = *MEMORY[0x1E0C80C00];
  v13 = (NSArray *)objc_msgSend(a3, "textRanges");
  if (-[NSArray count](v13, "count") == 1
    && objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "isEmpty"))
  {
    if (a5)
    {
      v13 = -[NSTextSelection textRanges](-[NSTextSelectionNavigation destinationSelectionForTextSelection:direction:destination:extending:confined:](self, "destinationSelectionForTextSelection:direction:destination:extending:confined:", a3, a4, a5, 1, v7), "textRanges");
    }
    else
    {
      v14 = -[NSTextSelectionNavigation _logicalDirectionForDirection:textSelection:](self, "_logicalDirectionForDirection:textSelection:", a4, a3);
      v15 = objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "location");
      v22 = 0;
      v23 = &v22;
      v24 = 0x3052000000;
      v25 = __Block_byref_object_copy__1;
      v26 = __Block_byref_object_dispose__1;
      v27 = 0;
      v16 = -[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource");
      v17 = 2;
      v21[0] = MEMORY[0x1E0C809B0];
      if (v14 == 1)
        v17 = 262;
      v18 = 512;
      v21[1] = 3221225472;
      v21[2] = __111__NSTextSelectionNavigation_deletionRangesForTextSelection_direction_destination_allowsDecomposition_confined___block_invoke;
      v21[3] = &unk_1E2603880;
      if (v14 == 1 && a6)
        v18 = 0;
      v21[5] = &v22;
      v21[6] = v18;
      v21[4] = self;
      objc_msgSend(v16, "enumerateSubstringsFromLocation:options:usingBlock:", v15, v18 | v17, v21, COERCE_DOUBLE(3221225472));
      v19 = (void *)v23[5];
      if (v19)
      {
        v28[0] = v23[5];
        v13 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v19 = (void *)v23[5];
      }

      _Block_object_dispose(&v22, 8);
    }
  }
  return -[NSTextSelectionNavigation _rangesWithDirectionalFormatAdjustmentsForRanges:](self, "_rangesWithDirectionalFormatAdjustmentsForRanges:", v13);
}

uint64_t __111__NSTextSelectionNavigation_deletionRangesForTextSelection_direction_destination_allowsDecomposition_confined___block_invoke(uint64_t result, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v7 = result;
  if (!*(_QWORD *)(result + 48))
  {
    result = objc_msgSend(a2, "length");
    if (result >= 1)
    {
      v9 = result;
      if ((unint64_t)result >= 3 && (objc_msgSend(a2, "characterAtIndex:", result - 1) & 0xFC00) == 0xDC00)
      {
        if ((objc_msgSend(a2, "characterAtIndex:", v9 - 2) & 0xFC00) == 0xD800)
          v10 = -2;
        else
          v10 = -1;
      }
      else
      {
        v10 = -1;
      }
      result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend((id)objc_msgSend(*(id *)(v7 + 32), "textSelectionDataSource"), "locationFromLocation:withOffset:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40), "endLocation"), v10), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40), "endLocation"));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40) = result;
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40))
  {
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 40) = result;
  }
  *a5 = 1;
  return result;
}

- (NSArray)deletionRangesForTextSelection:(NSTextSelection *)textSelection direction:(NSTextSelectionNavigationDirection)direction destination:(NSTextSelectionNavigationDestination)destination allowsDecomposition:(BOOL)allowsDecomposition
{
  return (NSArray *)-[NSTextSelectionNavigation deletionRangesForTextSelection:direction:destination:allowsDecomposition:confined:](self, "deletionRangesForTextSelection:direction:destination:allowsDecomposition:confined:", textSelection, direction, destination, allowsDecomposition, destination == NSTextSelectionNavigationDestinationLine);
}

- (BOOL)allowsNonContiguousRanges
{
  return self->_allowsNonContiguousRanges;
}

- (void)setAllowsNonContiguousRanges:(BOOL)allowsNonContiguousRanges
{
  self->_allowsNonContiguousRanges = allowsNonContiguousRanges;
}

- (BOOL)rotatesCoordinateSystemForLayoutOrientation
{
  return self->_rotatesCoordinateSystemForLayoutOrientation;
}

- (void)setRotatesCoordinateSystemForLayoutOrientation:(BOOL)rotatesCoordinateSystemForLayoutOrientation
{
  self->_rotatesCoordinateSystemForLayoutOrientation = rotatesCoordinateSystemForLayoutOrientation;
}

- (id)destinationForTextSelection:(id)a3 direction:(int64_t)a4 destination:(int64_t)a5 extending:(BOOL)a6
{
  return -[NSTextSelectionNavigation destinationSelectionForTextSelection:direction:destination:extending:confined:](self, "destinationSelectionForTextSelection:direction:destination:extending:confined:", a3, a4, a5, a6, 0);
}

- (void)_location:withAffinity:isAtBoundaryOfDestination:onSide:.cold.1()
{
  __assert_rtn("-[NSTextSelectionNavigation _location:withAffinity:isAtBoundaryOfDestination:onSide:]", "NSTextSelectionNavigation.m", 1407, "side == NSTextSelectionNavigationDirectionForward || side == NSTextSelectionNavigationDirectionBackward");
}

@end
