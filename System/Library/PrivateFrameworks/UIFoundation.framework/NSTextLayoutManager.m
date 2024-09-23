@implementation NSTextLayoutManager

- (CGRect)usageBoundsForLastTextContainer
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[NSTextLayoutManager usageBoundsInTextContainerAtIndex:](self, "usageBoundsInTextContainerAtIndex:", 0x7FFFFFFFFFFFFFFFLL);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

- (NSTextRange)documentRange
{
  NSTextContentManager *v3;

  v3 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  if (v3)
    return -[NSTextContentManager documentRange](v3, "documentRange");
  NSLog((NSString *)CFSTR("%@: .documentRange called while .textContentManager is nil."), self);
  if (NSTextLayoutManagerBreakOnNilContentManager_onceToken != -1)
    dispatch_once(&NSTextLayoutManagerBreakOnNilContentManager_onceToken, &__block_literal_global_4);
  return -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", +[NSNotATextLocation notATextLocation](NSNotATextLocation, "notATextLocation"));
}

- (id)enumerateTextLayoutFragmentsFromLocation:(id)location options:(NSTextLayoutFragmentEnumerationOptions)options usingBlock:(void *)block
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;
  NSTextLocation *softInvalidationLocation;
  NSTextRange *v15;
  NSTextRange *v16;
  uint64_t v17;
  NSTextContentManager *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t *v22;
  _BOOL4 v23;
  uint64_t *v24;
  id v25;
  BOOL v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSTextRange *v32;
  id v33;
  id v34;
  NSTextRange *v35;
  id *v37;
  id *v38;
  $2B150901B53E279622BCD82FC26F074A *activeEnumerationCache;
  _BOOL4 v40;
  NSTextRange *v41;
  _QWORD v43[9];
  char v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  _QWORD v52[6];
  char v53;
  _QWORD v54[2];
  uint64_t (*v55)(uint64_t, void *);
  void *v56;
  NSTextLayoutManager *v57;
  _QWORD v58[2];
  BOOL (*v59)(uint64_t, void *);
  void *v60;
  NSTextLayoutManager *v61;
  id v62;
  void *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  id v67[2];
  BOOL v68;
  BOOL v69;
  char v70;
  id locationa;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  const char *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BOOL8 v89;

  v41 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange");
  v8 = -[NSTextLayoutManager delegate](self, "delegate");
  if (v8)
  {
    v9 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  objc_sync_enter(self);
  v40 = -[NSTextRange isNotEmpty](v41, "isNotEmpty");
  v11 = -[NSTextLayoutManager usesContiguousLayout](self, "usesContiguousLayout");
  activeEnumerationCache = self->_activeEnumerationCache;
  v82 = 0;
  v83 = &v82;
  v84 = 0x5810000000;
  v87 = 0u;
  v88 = 0u;
  v86 = 0u;
  *(_QWORD *)&v88 = 0x7FFFFFFFFFFFFFFFLL;
  v89 = (options & 4) != 0;
  *(_DWORD *)((char *)&v89 + 1) = options & 1;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3052000000;
  v75 = __Block_byref_object_copy__2;
  v76 = __Block_byref_object_dispose__2;
  v77 = location;
  objc_initWeak(&locationa, self);
  v12 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v59 = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke;
  v60 = &unk_1E2603C30;
  v37 = v67;
  objc_copyWeak(v67, &locationa);
  v68 = (options & 4) != 0;
  v69 = v11;
  v70 = options & 1;
  v61 = self;
  v62 = v10;
  v67[1] = (id)options;
  v63 = block;
  v64 = &v82;
  v65 = &v72;
  v66 = &v78;
  v54[0] = v12;
  v54[1] = 3221225472;
  v55 = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_4;
  v56 = &unk_1E2603C58;
  v57 = self;
  self->_activeEnumerationCache = ($2B150901B53E279622BCD82FC26F074A *)(v83 + 4);
  if (v40)
    -[NSTextLayoutManager _invalidateTextParagraphForEmptyDocument](self, "_invalidateTextParagraphForEmptyDocument", v67);
  -[NSTextContentManager synchronizeTextLayoutManagers:](-[NSTextLayoutManager textContentManager](self, "textContentManager", v37), "synchronizeTextLayoutManagers:", 0);
  if ((options & 4) != 0 && v11)
  {
    if (v73[5])
    {
      v13 = -[NSTextRange location](v41, "location");
      if (objc_msgSend(v13, "compare:", v73[5]) == -1)
      {
        if (!activeEnumerationCache || !activeEnumerationCache->var8)
        {
          if (-[NSTextLayoutManager hasNonSimpleRectangularTextContainer](self, "hasNonSimpleRectangularTextContainer"))
          {
            softInvalidationLocation = self->_softInvalidationLocation;
            if (softInvalidationLocation)
            {
              if (-[NSTextLocation compare:](softInvalidationLocation, "compare:", v73[5]) == -1)
              {
                v15 = [NSTextRange alloc];
                v16 = -[NSTextRange initWithLocation:endLocation:](v15, "initWithLocation:endLocation:", self->_softInvalidationLocation, v73[5]);
                -[NSTextLayoutManager invalidateLayoutForRange:](self, "invalidateLayoutForRange:", v16);

              }
            }
          }
          -[NSTextLayoutManager _fillLayoutToLocation:enumerationCache:](self, "_fillLayoutToLocation:enumerationCache:", v73[5], v83 + 4);
        }
        if (!-[NSTextLayoutManager lastContainerFilled](self, "lastContainerFilled"))
        {
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_5;
          v52[3] = &unk_1E2603C80;
          v52[4] = &v72;
          v52[5] = &v82;
          v53 = options & 1;
          -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", 0, 0, v52);
        }
      }
    }
  }
  if (!v73[5])
  {
    if ((options & 1) != 0)
      v17 = -[NSTextRange endLocation](v41, "endLocation");
    else
      v17 = -[NSTextRange location](v41, "location");
    v73[5] = v17;
  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x3052000000;
  v49 = __Block_byref_object_copy__2;
  v50 = __Block_byref_object_dispose__2;
  v51 = 0;
  while (1)
  {
    v18 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
    v19 = v73[5];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_6;
    v43[3] = &unk_1E2603CA8;
    v44 = (options & 4) >> 2;
    v45 = options & 1;
    v43[7] = &v46;
    v43[8] = &v72;
    v43[4] = v41;
    v43[5] = v54;
    v43[6] = v58;
    v20 = -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](v18, "enumerateTextElementsFromLocation:options:usingBlock:", v19, options, v43);
    v21 = (void *)v83[5];
    if (v21 && objc_msgSend(v21, "compare:", v20) == -1)
      v20 = (id)v83[5];
    v22 = v79;
    if (!*((_BYTE *)v79 + 24))
      break;
    if (!-[NSTextLayoutManager lastContainerFilled](self, "lastContainerFilled"))
    {
      v22 = v79;
      break;
    }
    v23 = -[NSTextLayoutManager _appendTextContainer](self, "_appendTextContainer");
    v22 = v79;
    if (!v23)
      break;
    v24 = v83;
    v83[6] = 0;
    v24[7] = 0;
    v24[8] = 0x7FFFFFFFFFFFFFFFLL;
    v47[5] = 0;
    v73[5] = (uint64_t)v20;
    *((_BYTE *)v22 + 24) = 0;
  }
  if ((options & 8) != 0
    && !*((_BYTE *)v22 + 24)
    && (!v20 || objc_msgSend(v20, "isEqual:", v73[5]))
    && -[NSTextRange isEmpty](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "isEmpty"))
  {
    v25 = -[NSTextLayoutManager _textParagraphForEmptyDocument](self, "_textParagraphForEmptyDocument");
    v26 = v59((uint64_t)v58, v25);
    *((_BYTE *)v79 + 24) = !v26;
  }
  if ((options & 4) != 0 && !*((_BYTE *)v79 + 24) && (v47[5] || v73[5]))
  {
    if ((options & 1) != 0)
    {
      v27 = -[NSTextRange location](v41, "location");
      v30 = (void *)v47[5];
      if (v30)
      {
        v29 = objc_msgSend(v30, "location");
        goto LABEL_50;
      }
    }
    else
    {
      v27 = -[NSTextRange endLocation](v41, "endLocation");
      v28 = (void *)v47[5];
      if (v28)
      {
        v29 = objc_msgSend(v28, "endLocation");
LABEL_50:
        v31 = v29;
LABEL_52:
        if ((objc_msgSend(v27, "isEqual:", v31) & 1) == 0
          && -[NSTextRange containsLocation:](v41, "containsLocation:", v31))
        {
          v32 = [NSTextRange alloc];
          if ((options & 1) != 0)
            v33 = (id)v31;
          else
            v33 = v27;
          if ((options & 1) != 0)
            v34 = v27;
          else
            v34 = (id)v31;
          v35 = -[NSTextRange initWithLocation:endLocation:](v32, "initWithLocation:endLocation:", v34, v33);
          v55((uint64_t)v54, v35);

        }
        goto LABEL_61;
      }
    }
    v31 = v73[5];
    goto LABEL_52;
  }
LABEL_61:
  _Block_object_dispose(&v46, 8);
  self->_activeEnumerationCache = activeEnumerationCache;
  objc_destroyWeak(v38);
  objc_destroyWeak(&locationa);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);
  objc_sync_exit(self);
  return v20;
}

- (NSTextContentManager)textContentManager
{
  return (NSTextContentManager *)objc_loadWeak((id *)&self->_textContentManager);
}

- (id)delegate
{
  id Weak;

  objc_sync_enter(self);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_sync_exit(self);
  return Weak;
}

uint64_t __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD *Weak;
  _QWORD *v27;

  result = objc_msgSend(a2, "rangeInElement");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    || (v8 = (void *)result, result = objc_msgSend((id)result, "isNotEmpty"), !(_DWORD)result)
    || (!*(_BYTE *)(a1 + 96)
      ? (v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40),
         v10 = objc_msgSend(v8, "endLocation"),
         v9 = v11)
      : (void *)(v9 = (void *)objc_msgSend(v8, "location"),
                 v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)),
        result = objc_msgSend(v9, "compare:", v10),
        result == -1))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = a2;
    if (*(_BYTE *)(a1 + 97))
    {
      if (*(_BYTE *)(a1 + 98) && !*(_BYTE *)(a1 + 96) && objc_msgSend(a2, "state") != 3)
      {
        objc_msgSend(a2, "layoutFragmentFrameOrigin");
        objc_msgSend(a2, "setLayoutFragmentFrameOrigin:");
      }
      if ((objc_msgSend(objc_loadWeak((id *)(a1 + 80)), "lastContainerFilled") & 1) == 0)
      {
        v12 = objc_msgSend(objc_loadWeak((id *)(a1 + 80)), "maximumNumberOfLinesForLastContainer");
        if (v12 < 1 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56) < v12)
          objc_msgSend(a2, "layout");
      }
      v13 = objc_msgSend(a2, "state");
      if (v13 == 3)
      {
        objc_msgSend(a2, "layoutFragmentFrame");
        v15 = v14;
        v17 = v16;
        v18 = (void *)objc_msgSend(a2, "rangeInElement");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56) += objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "count");
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v20 = -0.0;
        if (!*(_BYTE *)(v19 + 81))
          v20 = v17;
        *(double *)(v19 + 48) = v15 + v20;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 81))
          v21 = objc_msgSend(v18, "location");
        else
          v21 = objc_msgSend(v18, "endLocation");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v21;
      }
      result = objc_msgSend(objc_loadWeak((id *)(a1 + 80)), "lastContainerFilled");
      v22 = 1;
      if ((result & 1) != 0 || v13 != 3)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        v22 = v13 == 3;
      }
    }
    else
    {
      if ((*(_BYTE *)(a1 + 88) & 2) != 0)
      {
        if (!objc_msgSend(a2, "state"))
          objc_msgSend(objc_loadWeak((id *)(a1 + 80)), "_setSoftInvalidationLocation:onlyIfUpstream:", objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location"), 1);
        result = objc_msgSend(a2, "estimateSize");
      }
      v22 = 1;
    }
    v23 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v23 + 128))
    {
      if (*(_QWORD *)(v23 + 280))
      {
        result = objc_msgSend(a2, "_isRenderingAttributesValidated");
        if ((result & 1) == 0)
        {
          (*(void (**)(_QWORD, uint64_t, void *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), objc_msgSend(a2, "textLayoutManager"), a2);
          result = objc_msgSend(a2, "set_renderingAttributesValidated:", 1);
        }
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = 0;
    if (v22)
    {
      if (*(_BYTE *)(a1 + 97))
      {
        v24 = (void *)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location");
        v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if (!v25 || (objc_msgSend(*(id *)(v25 + 16), "containsLocation:", v24) & 1) == 0)
        {
          Weak = objc_loadWeak((id *)(a1 + 80));
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(Weak, v24);
        }
        v27 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if (v27)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 72) = *v27;
      }
      result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result ^ 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 72) = 0;
    }
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  return result;
}

- (BOOL)usesContiguousLayout
{
  id *TextContainerEntryAtIndex;
  id v4;
  double v5;
  BOOL v6;

  objc_sync_enter(self);
  TextContainerEntryAtIndex = (id *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(self, 0x7FFFFFFFFFFFFFFFuLL, 1);
  if (TextContainerEntryAtIndex)
  {
    v4 = *TextContainerEntryAtIndex;
    objc_msgSend(*TextContainerEntryAtIndex, "size");
    v6 = v5 > 0.0 && v5 < 10000000.0
      || -[NSTextLayoutManager hasNonSimpleRectangularTextContainer](self, "hasNonSimpleRectangularTextContainer")
      || objc_msgSend(v4, "maximumNumberOfLines") != 0;
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(self);
  return v6;
}

- (BOOL)lastContainerFilled
{
  NSTextContainer *textContainer;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  NSTextContainer *var0;
  double v7;
  BOOL containerFilled;

  objc_sync_enter(self);
  if ((self->_textContainerEntriesCount & 0x8000000000000000) != 0)
  {
    textContainerEntries = self->_textContainerEntries;
    var0 = (NSTextContainer *)textContainerEntries[-1].var0;
    p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&textContainerEntries[-1];
    textContainer = var0;
  }
  else
  {
    p_lastTextContainerEntry = &self->_lastTextContainerEntry;
    textContainer = self->_lastTextContainerEntry.textContainer;
    if (!textContainer)
    {
LABEL_9:
      containerFilled = 0;
      goto LABEL_10;
    }
  }
  -[NSTextContainer size](textContainer, "size");
  if ((v7 <= 0.0 || v7 >= 10000000.0)
    && !-[NSTextContainer maximumNumberOfLines](p_lastTextContainerEntry->textContainer, "maximumNumberOfLines"))
  {
    goto LABEL_9;
  }
  containerFilled = p_lastTextContainerEntry->containerFilled;
LABEL_10:
  objc_sync_exit(self);
  return containerFilled;
}

BOOL __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  _QWORD *Weak;
  void *v6;
  NSTextRange *v7;
  uint64_t v8;
  char *__ptr32 *v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  char v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  unint64_t v33;
  double v34;
  unint64_t v35;
  NSTextRange *v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSTextLayoutFragment *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  _QWORD v49[6];
  int8x16_t v50;
  uint64_t *v51;
  uint64_t *v52;
  id v53[2];
  char v54;
  __int16 v55;
  _QWORD v56[6];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char *TextContainerEntryAndIndexForLocation;
  NSTextLayoutFragment *v73;
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;

  v75 = *MEMORY[0x1E0C80C00];
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  TextContainerEntryAndIndexForLocation = 0;
  v4 = (id *)(a1 + 80);
  Weak = objc_loadWeak((id *)(a1 + 80));
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(Weak, (void *)objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location"));
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  if (v70[3])
  {
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", a2);
    v7 = (NSTextRange *)objc_msgSend(v6, "lastObject");
    v8 = MEMORY[0x1E0C809B0];
    v9 = &off_18D6CB000;
    if (v7)
    {
      if (!*(_BYTE *)(a1 + 96) || !*(_BYTE *)(a1 + 97) || *(_BYTE *)(a1 + 98))
        goto LABEL_51;
      v10 = *(_QWORD *)(v70[3] + 56);
      v11 = objc_loadWeak(v4);
      v12 = v11[31];
      if (v11[19])
        ++v12;
      if (v10 + 1 >= v12)
        goto LABEL_51;
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v13)
        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v62;
LABEL_13:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v62 != v15)
            objc_enumerationMutation(v6);
          v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v16);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "rangeInElement"), "location"), "compare:", v13) != -1)
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
            if (v14)
              goto LABEL_13;
            goto LABEL_35;
          }
        }
        if (v17)
        {
          if ((unint64_t)objc_msgSend(v17, "state") >= 3)
          {
            objc_msgSend(v17, "layoutFragmentFrame");
            v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            if (*(_QWORD *)(v24 + 40))
            {
              v25 = v20;
              v26 = v21;
              v27 = v22;
              v28 = v23;
              v29 = *(double *)(v24 + 48);
              if (v29 != CGRectGetMinY(*(CGRect *)&v20))
              {
                if ((objc_msgSend(v17, "hasPartialLayout") & 1) != 0)
                  goto LABEL_26;
                v30 = *(void **)v70[3];
                if (v30
                  && ((unint64_t)objc_msgSend(v6, "count") > 1
                   || (unint64_t)objc_msgSend((id)objc_msgSend(v17, "textLineFragments"), "count") >= 2))
                {
                  objc_msgSend(v30, "size");
                  v32 = v31;
                  v33 = objc_msgSend(v30, "maximumNumberOfLines");
                  if (v32 <= 0.0 || v32 >= 10000000.0)
                  {
                    v34 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
                    v76.origin.x = v25;
                    v76.origin.y = v26;
                    v76.size.width = v27;
                    v76.size.height = v28;
                    if (v34 + CGRectGetHeight(v76) > v32)
                      goto LABEL_26;
                  }
                  if (v33)
                  {
                    v57 = 0;
                    v58 = &v57;
                    v59 = 0x2020000000;
                    v60 = 0;
                    v60 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56);
                    v56[0] = MEMORY[0x1E0C809B0];
                    v56[1] = 3221225472;
                    v56[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_2;
                    v56[3] = &unk_1E2603BE0;
                    v56[4] = &v57;
                    v56[5] = v33;
                    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v56);
                    v35 = v58[3];
                    _Block_object_dispose(&v57, 8);
                    if (v35 > v33)
                    {
LABEL_26:
                      objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutForRange:", objc_msgSend(a2, "elementRange"));
                      v6 = 0;
                      v7 = 0;
                      v8 = MEMORY[0x1E0C809B0];
                      v9 = &off_18D6CB000;
                      goto LABEL_38;
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_35:
      if (!*(_BYTE *)(v70[3] + 64) || !-[NSTextRange hasPartialLayout](v7, "hasPartialLayout"))
      {
        v8 = MEMORY[0x1E0C809B0];
        v9 = &off_18D6CB000;
LABEL_51:
        v44 = *(unsigned __int8 *)(a1 + 98);
        v49[0] = v8;
        v49[1] = *((_QWORD *)v9 + 364);
        v49[2] = __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_3;
        v49[3] = &unk_1E2603C08;
        v54 = v44;
        v50 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
        v55 = *(_WORD *)(a1 + 96);
        objc_copyWeak(v53, v4);
        v53[1] = *(id *)(a1 + 88);
        v45 = *(_QWORD *)(a1 + 32);
        v51 = &v65;
        v52 = &v69;
        v46 = *(_QWORD *)(a1 + 48);
        v49[4] = v45;
        v49[5] = v46;
        objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2 * v44, v49);
        objc_destroyWeak(v53);
        v18 = (char *)(v66 + 3);
        v19 = *((_BYTE *)v66 + 24);
        goto LABEL_52;
      }
      v36 = [NSTextRange alloc];
      v8 = MEMORY[0x1E0C809B0];
      v9 = &off_18D6CB000;
      v7 = -[NSTextRange initWithLocation:endLocation:](v36, "initWithLocation:endLocation:", objc_msgSend((id)-[NSTextRange rangeInElement](v7, "rangeInElement"), "endLocation"), objc_msgSend((id)objc_msgSend(a2, "elementRange"), "endLocation"));
    }
LABEL_38:
    v37 = *(void **)(a1 + 40);
    if (!v37)
      goto LABEL_42;
    v38 = objc_loadWeak(v4);
    v39 = -[NSTextRange location](v7, "location");
    if (!v39)
      v39 = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
    v40 = (NSTextLayoutFragment *)(id)objc_msgSend(v37, "textLayoutManager:textLayoutFragmentForLocation:inTextElement:", v38, v39, a2);
    if (!v40)
LABEL_42:
      v40 = -[NSTextLayoutFragment initWithTextElement:range:]([NSTextLayoutFragment alloc], "initWithTextElement:range:", a2, v7);
    -[NSTextLayoutFragment setTextLayoutManager:](v40, "setTextLayoutManager:", objc_loadWeak(v4));
    if (v6)
    {
      v41 = objc_msgSend(v6, "arrayByAddingObject:", v40);
    }
    else
    {
      v73 = v40;
      v41 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    }
    v6 = (void *)v41;
    v42 = objc_loadWeak(v4);
    v43 = (id)*((_QWORD *)v42 + 11);
    if (!v43)
    {
      v43 = (id)objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      *((_QWORD *)v42 + 11) = v43;
    }
    if (!*((_QWORD *)v42 + 10))
    {
      *((_QWORD *)v42 + 10) = -[_NSTextRunStorage initWithDataSource:]([_NSTextLayoutFragmentStorage alloc], "initWithDataSource:", v42);
      v43 = (id)*((_QWORD *)v42 + 11);
    }
    objc_msgSend(v43, "setObject:forKey:", v6, a2);
    objc_msgSend(*((id *)v42 + 10), "setTextLayoutFragments:", v6);

    goto LABEL_51;
  }
  v18 = &v68;
  v19 = 1;
  v68 = 1;
LABEL_52:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v19;
  v47 = *v18 == 0;
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  return v47;
}

- (int64_t)maximumNumberOfLinesForLastContainer
{
  id *TextContainerEntryAtIndex;
  int64_t v4;

  objc_sync_enter(self);
  TextContainerEntryAtIndex = (id *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(self, 0x7FFFFFFFFFFFFFFFuLL, 1);
  if (TextContainerEntryAtIndex)
    v4 = objc_msgSend(*TextContainerEntryAtIndex, "maximumNumberOfLines");
  else
    v4 = 0;
  objc_sync_exit(self);
  return v4;
}

- (id)_textParagraphForEmptyDocument
{
  NSTextParagraph *textParagraphForEmptyDocument;
  id v4;
  id v5;
  id v6;
  NSTextParagraph *v7;
  id v8;
  NSTextContentManager *v9;

  objc_sync_enter(self);
  textParagraphForEmptyDocument = self->_textParagraphForEmptyDocument;
  if (!textParagraphForEmptyDocument)
  {
    v4 = -[NSArray firstObject](-[NSTextLayoutManager textSelections](self, "textSelections"), "firstObject");
    if (v4)
      v5 = (id)objc_msgSend(v4, "typingAttributes");
    else
      v5 = -[NSTextContainer attributesForExtraLineFragment](-[NSTextLayoutManager textContainer](self, "textContainer"), "attributesForExtraLineFragment");
    v6 = v5;
    v7 = [NSTextParagraph alloc];
    if (v6)
      v8 = v6;
    else
      v8 = (id)MEMORY[0x1E0C9AA70];
    textParagraphForEmptyDocument = -[NSTextParagraph initWithString:attributes:](v7, "initWithString:attributes:", &stru_1E260C7D0, v8);
    v9 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
    -[NSTextElement setTextContentManager:](textParagraphForEmptyDocument, "setTextContentManager:", v9);
    -[NSTextParagraph setElementRange:](textParagraphForEmptyDocument, "setElementRange:", -[NSTextContentManager documentRange](v9, "documentRange"));
    -[NSTextParagraph setParagraphContentRange:](textParagraphForEmptyDocument, "setParagraphContentRange:", -[NSTextContentManager documentRange](v9, "documentRange"));
    -[NSTextParagraph setParagraphSeparatorRange:](textParagraphForEmptyDocument, "setParagraphSeparatorRange:", -[NSTextContentManager documentRange](v9, "documentRange"));
    self->_textParagraphForEmptyDocument = textParagraphForEmptyDocument;
  }
  objc_sync_exit(self);
  return textParagraphForEmptyDocument;
}

- (BOOL)hasNonSimpleRectangularTextContainer
{
  NSTextContainer *templateTextContainer;
  unint64_t textContainerEntriesCount;
  uint64_t v5;
  unint64_t i;
  $93589CBA8E1B80577C20324DFAADD895 *v7;
  BOOL v8;

  objc_sync_enter(self);
  templateTextContainer = self->_templateTextContainer;
  if (templateTextContainer
    && !-[NSTextContainer isSimpleRectangularTextContainer](templateTextContainer, "isSimpleRectangularTextContainer")
    || self->_delegateWithSimpleTextContainerQuery
    && !objc_msgSend(-[NSTextLayoutManager delegate](self, "delegate"), "textLayoutManagerAllowsSimpleRectangularTextContainerOnly:", self))
  {
LABEL_19:
    v8 = 1;
    goto LABEL_20;
  }
  if (self->_lastTextContainerEntry.textContainer)
    textContainerEntriesCount = self->_textContainerEntriesCount + 1;
  else
    textContainerEntriesCount = self->_textContainerEntriesCount;
  if (textContainerEntriesCount)
  {
    v5 = 0;
    for (i = 0; i != textContainerEntriesCount; ++i)
    {
      if (self->_textContainerEntriesCount <= i)
        v7 = self->_lastTextContainerEntry.textContainer ? &self->_lastTextContainerEntry : 0;
      else
        v7 = ($93589CBA8E1B80577C20324DFAADD895 *)&self->_textContainerEntries[v5];
      if (v7->textContainer
        && !-[NSTextContainer isSimpleRectangularTextContainer](v7->textContainer, "isSimpleRectangularTextContainer"))
      {
        goto LABEL_19;
      }
      ++v5;
    }
  }
  v8 = 0;
LABEL_20:
  objc_sync_exit(self);
  return v8;
}

- (void)_invalidateTextParagraphForEmptyDocument
{
  char *textContainerEntries;
  __int128 v4;

  objc_sync_enter(self);
  if (self->_textParagraphForEmptyDocument)
  {
    if (objc_msgSend(-[NSMapTable objectForKey:](self->_textLayoutFragmentTable, "objectForKey:"), "count"))
    {
      if (self->_textContainerEntriesCount)
      {
        textContainerEntries = (char *)self->_textContainerEntries;
      }
      else if (self->_lastTextContainerEntry.textContainer)
      {
        textContainerEntries = (char *)&self->_lastTextContainerEntry;
      }
      else
      {
        textContainerEntries = 0;
      }
      -[NSMapTable removeObjectForKey:](self->_textLayoutFragmentTable, "removeObjectForKey:", self->_textParagraphForEmptyDocument);
      if (textContainerEntries)
      {
        textContainerEntries[64] = 0;
        if (!-[NSMapTable count](self->_textLayoutFragmentTable, "count"))
        {
          v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
          *(_OWORD *)(textContainerEntries + 24) = *MEMORY[0x1E0C9D648];
          *(_OWORD *)(textContainerEntries + 40) = v4;
        }
      }
    }

    self->_textParagraphForEmptyDocument = 0;
  }
  objc_sync_exit(self);
}

uint64_t __44__NSTextLayoutManager_ensureLayoutForRange___block_invoke()
{
  return 0;
}

- (void)enumerateTextSegmentsInRange:(NSTextRange *)textRange type:(NSTextLayoutManagerSegmentType)type options:(NSTextLayoutManagerSegmentOptions)options usingBlock:(void *)block
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__NSTextLayoutManager_enumerateTextSegmentsInRange_type_options_usingBlock___block_invoke;
  v6[3] = &unk_1E2603E30;
  v6[4] = block;
  -[NSTextLayoutManager _enumerateTextSegmentAndCategoryInRange:type:options:allowsZeroWidthExtensions:usingBlock:](self, "_enumerateTextSegmentAndCategoryInRange:type:options:allowsZeroWidthExtensions:usingBlock:", textRange, type, options, 0, v6);
}

- (id)textContainerForLocation:(id)a3
{
  char *TextContainerEntryAndIndexForLocation;
  void *v6;

  objc_sync_enter(self);
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a3);
  if (TextContainerEntryAndIndexForLocation)
    v6 = *(void **)TextContainerEntryAndIndexForLocation;
  else
    v6 = 0;
  objc_sync_exit(self);
  return v6;
}

- (int64_t)_fallbackWritingDirection
{
  if (-[NSTextLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext") == 2)
    return +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
  else
    return 0;
}

- (int64_t)applicationFrameworkContext
{
  int64_t applicationFrameworkContext;

  objc_sync_enter(self);
  applicationFrameworkContext = self->_applicationFrameworkContext;
  objc_sync_exit(self);
  return applicationFrameworkContext;
}

- (void)ensureLayoutForRange:(NSTextRange *)range
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[5];

  objc_sync_enter(self);
  v5 = -[NSTextRange location](range, "location");
  v6 = -[NSTextRange endLocation](range, "endLocation");
  if (-[NSTextRange location](range, "location") && v6)
  {
    if ((objc_msgSend(v5, "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")) & 1) != 0)
    {
      v7 = &__block_literal_global_119;
      v8 = 13;
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__NSTextLayoutManager_ensureLayoutForRange___block_invoke_2;
      v9[3] = &unk_1E2603A58;
      v9[4] = v6;
      v7 = v9;
      v8 = 12;
    }
    -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v5, v8, v7);
    __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, -[NSTextRange endLocation](range, "endLocation"), 1.79769313e308);
  }
  objc_sync_exit(self);
}

- (id)enumerateTextLayoutFragmentsInTextRange:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v9;
  char v10;
  uint64_t v11;
  _QWORD v13[6];
  char v14;
  char v15;

  v9 = a4 & 1;
  v10 = objc_msgSend(a3, "isEmpty");
  if ((a4 & 1) != 0)
    v11 = objc_msgSend(a3, "endLocation");
  else
    v11 = objc_msgSend(a3, "location");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__NSTextLayoutManager_enumerateTextLayoutFragmentsInTextRange_options_usingBlock___block_invoke;
  v13[3] = &unk_1E2603CD0;
  v14 = v9;
  v15 = v10;
  v13[4] = a3;
  v13[5] = a5;
  return -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v11, a4, v13);
}

uint64_t __82__NSTextLayoutManager_enumerateTextLayoutFragmentsInTextRange_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  char v6;

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "representedRange"), "endLocation"), "compare:", objc_msgSend(*(id *)(a1 + 32), "location"));
    v6 = v4 != 1;
    if (v4 != 1)
      return 0;
    goto LABEL_8;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "endLocation"), "compare:", objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location")) == 1)
  {
    v6 = 0;
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return v6 == 0;
  }
  if (!*(_BYTE *)(a1 + 49))
    return 0;
  result = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", objc_msgSend(*(id *)(a1 + 32), "location"));
  v6 = result ^ 1;
  if ((result & 1) != 0)
    goto LABEL_8;
  return result;
}

BOOL __44__NSTextLayoutManager_ensureLayoutForRange___block_invoke_2(uint64_t a1, void *a2)
{
  return !a2
      || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location"), "compare:", *(_QWORD *)(a1 + 32)) == -1;
}

BOOL __80__NSTextLayoutManager_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = 0;
  if (!a2)
    return 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v3 == 0;
}

uint64_t __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  return __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange(*(id **)(a1 + 32), a2, 0);
}

BOOL __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke_2(uint64_t a1, void *a2)
{
  double v4;
  double v5;

  objc_msgSend(a2, "layoutFragmentFrame");
  return v4 + v5 < *(double *)(a1 + 48) + *(double *)(a1 + 64)
      && objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation")) == 1;
}

uint64_t __53__NSTextLayoutManager__textLayoutFragmentAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

uint64_t __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;

  objc_msgSend(a2, "layoutFragmentFrame");
  if (v4 + v5 < *(double *)(a1 + 48) + *(double *)(a1 + 64))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location");
  return 0;
}

- (BOOL)_appendTextContainer
{
  NSTextContainer *textContainer;
  unint64_t textContainerEntriesCount;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  unint64_t v6;
  unint64_t v7;

  textContainer = self->_lastTextContainerEntry.textContainer;
  textContainerEntriesCount = self->_textContainerEntriesCount;
  if ((textContainerEntriesCount & 0x8000000000000000) != 0)
  {
    p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&self->_textContainerEntries[-1];
  }
  else if (textContainer)
  {
    p_lastTextContainerEntry = &self->_lastTextContainerEntry;
  }
  else
  {
    p_lastTextContainerEntry = 0;
  }
  if (-[NSTextLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext") == 2
    && (-[NSTextLayoutManager templateTextContainer](self, "templateTextContainer")
     || self->_delegateWithTextContainerQuery)
    && p_lastTextContainerEntry
    && -[NSTextContainer lineBreakMode](p_lastTextContainerEntry->textContainer, "lineBreakMode") <= NSLineBreakByCharWrapping
    && p_lastTextContainerEntry->containerFilled
    && -[NSTextRange isNotEmpty](p_lastTextContainerEntry->textRange, "isNotEmpty")
    && objc_msgSend(-[NSTextRange endLocation](p_lastTextContainerEntry->textRange, "endLocation"), "compare:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")) == -1)
  {
    -[NSTextLayoutManager _addTextContainerForLocation:](self, "_addTextContainerForLocation:", -[NSTextRange endLocation](p_lastTextContainerEntry->textRange, "endLocation"));
  }
  if (textContainer)
    v6 = textContainerEntriesCount + 1;
  else
    v6 = textContainerEntriesCount;
  v7 = self->_textContainerEntriesCount;
  if (self->_lastTextContainerEntry.textContainer)
    ++v7;
  return v7 > v6;
}

uint64_t __53__NSTextLayoutManager_textLayoutFragmentForLocation___block_invoke(uint64_t a1, void *a2)
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "containsLocation:", *(_QWORD *)(a1 + 32));
  if (v4)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return v4 ^ 1u;
}

- (void)setTextContentManager:(id)a3
{
  NSTextContentManager **p_textContentManager;
  void *v6;
  NSArray *v7;
  _QWORD v8[5];

  p_textContentManager = &self->_textContentManager;
  if (objc_loadWeak((id *)&self->_textContentManager) != a3)
  {
    v6 = (void *)objc_msgSend(objc_loadWeak((id *)p_textContentManager), "documentRange");
    if (objc_msgSend(v6, "isNotEmpty"))
    {
      -[NSTextLayoutManager _invalidateLayoutForTextRange:hard:](self, "_invalidateLayoutForTextRange:hard:", v6, 1);
      -[NSTextLayoutManager invalidateTemporaryAttributesForTextRange:](self, "invalidateTemporaryAttributesForTextRange:", v6);
    }
    objc_storeWeak((id *)p_textContentManager, a3);
    v7 = -[NSTextLayoutManager textContainers](self, "textContainers");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__NSTextLayoutManager_setTextContentManager___block_invoke;
    v8[3] = &unk_1E2603930;
    v8[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v8);
  }
}

- (int64_t)baseWritingDirectionAtLocation:(id)a3
{
  NSTextContentManager *v5;
  NSTextRange *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSWritingDirection v11;
  void *v12;
  NSParagraphStyle *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v5 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  v6 = -[NSTextContentManager documentRange](v5, "documentRange");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v7 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke;
  v16[3] = &unk_1E2603FB8;
  v16[4] = &v17;
  -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](v5, "enumerateTextElementsFromLocation:options:usingBlock:", a3, 0, v16);
  if (v18[5] || !objc_msgSend(-[NSTextRange endLocation](v6, "endLocation"), "isEqual:", a3))
    goto LABEL_11;
  v8 = -[NSArray firstObject](-[NSTextLayoutManager textSelections](self, "textSelections"), "firstObject");
  if (!-[NSTextRange isEmpty](v6, "isEmpty"))
  {
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke_2;
    v15[3] = &unk_1E2603FB8;
    v15[4] = &v17;
    -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](v5, "enumerateTextElementsFromLocation:options:usingBlock:", a3, 1, v15);
  }
  if (v8
    && (v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "textRanges"), "firstObject"),
        objc_msgSend(v9, "isEmpty"))
    && objc_msgSend((id)objc_msgSend(v9, "location"), "isEqual:", a3)
    && objc_msgSend(v8, "typingAttributes")
    && ((v10 = (void *)v18[5]) == 0
     || (objc_msgSend((id)objc_msgSend(v10, "paragraphSeparatorRange"), "isEmpty") & 1) == 0))
  {
    v14 = (NSParagraphStyle *)objc_msgSend((id)objc_msgSend(v8, "typingAttributes"), "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
    if (!v14)
      v14 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
    v11 = -[NSParagraphStyle baseWritingDirection](v14, "baseWritingDirection");
    if (v11 == NSWritingDirectionNatural)
      v11 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
    v18[5] = 0;
  }
  else
  {
LABEL_11:
    v11 = NSWritingDirectionLeftToRight;
  }
  v12 = (void *)v18[5];
  if (v12)
    v11 = objc_msgSend(v12, "_resolvedBaseWritingDirectionWithFallbackDirection:", -[NSTextLayoutManager _fallbackWritingDirection](self, "_fallbackWritingDirection"));
  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)enumerateCaretOffsetsInLineFragmentAtLocation:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSTextContentManager *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  double MinX;
  _QWORD v15[6];
  uint64_t v16;
  id v17;
  CGRect v18;

  v17 = 0;
  v16 = 0;
  v6 = -[NSTextLayoutManager _textLineFragmentAtLocation:textLayoutFragment:rangeDelta:](self, "_textLineFragmentAtLocation:textLayoutFragment:rangeDelta:", a3, &v17, &v16);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v17, "textParagraph");
    if (v8)
    {
      v9 = objc_msgSend(v8, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v16, 0, 0);
    }
    else
    {
      v10 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
      v11 = objc_msgSend((id)objc_msgSend(v17, "rangeInElement"), "location");
      v9 = -[NSTextContentManager locationFromLocation:withOffset:](v10, "locationFromLocation:withOffset:", v11, v16);
    }
    v12 = v9;
    v13 = +[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled](NSTextLayoutFragment, "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled");
    MinX = 0.0;
    if (!v13)
    {
      objc_msgSend(v17, "layoutFragmentFrame", 0.0);
      MinX = CGRectGetMinX(v18);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__NSTextLayoutManager_enumerateCaretOffsetsInLineFragmentAtLocation_usingBlock___block_invoke;
    v15[3] = &unk_1E2604080;
    v15[4] = a4;
    *(double *)&v15[5] = MinX;
    objc_msgSend(v7, "enumerateCaretOffsetsWithTextSelectionDataSource:baseLocation:usingBlock:", self, v12, v15);
  }
}

uint64_t __80__NSTextLayoutManager_enumerateCaretOffsetsInLineFragmentAtLocation_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40) + a2);
}

- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4
{
  return -[NSTextContentManager locationFromLocation:withOffset:](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "locationFromLocation:withOffset:", a3, a4);
}

- (id)_textLineFragmentAtLocation:(id)a3 textLayoutFragment:(id *)a4 rangeDelta:(int64_t *)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  _QWORD v18[7];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  v9 = -[NSTextLayoutManager _textLayoutFragmentAtLocation:](self, "_textLayoutFragmentAtLocation:");
  v10 = v9;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (v9)
  {
    v11 = (void *)objc_msgSend(v9, "textParagraph");
    if (v11)
      v12 = objc_msgSend(v11, "rangeForLocation:allowsTrailingEdge:", a3, 1);
    else
      v12 = -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "offsetFromLocation:toLocation:", objc_msgSend((id)objc_msgSend(v10, "rangeInElement"), "location"), a3);
    v13 = v12;
    v14 = objc_msgSend(a3, "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation"));
    v15 = (void *)objc_msgSend(v10, "textLineFragments");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__NSTextLayoutManager__textLineFragmentAtLocation_textLayoutFragment_rangeDelta___block_invoke;
    v18[3] = &unk_1E2603F40;
    v19 = v14;
    v18[4] = &v20;
    v18[5] = &v24;
    v18[6] = v13;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);
  }
  if (a4)
    *a4 = v10;
  if (a5)
    *a5 = v21[3];
  v16 = (void *)v25[5];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)_textLayoutFragmentAtLocation:(id)a3
{
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  if (objc_msgSend(-[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation"), "isEqual:", a3))v5 = 5;
  else
    v5 = 4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NSTextLayoutManager__textLayoutFragmentAtLocation___block_invoke;
  v8[3] = &unk_1E2603B68;
  v8[4] = &v9;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", a3, v5, v8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)textContainerChangedGeometry:(id)a3
{
  unint64_t textContainerEntriesCount;
  NSTextContainer *textContainer;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  NSTextContainer *var0;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *v13;
  NSTextRange *v14;
  NSTextRange *textRange;
  NSTextRange *v16;
  NSTextRange *v17;
  NSTextRange *v18;
  void *v19;
  CGSize v20;
  NSTextSelectionNavigation *textSelectionNavigation;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;

  objc_sync_enter(self);
  textContainerEntriesCount = self->_textContainerEntriesCount;
  if ((textContainerEntriesCount & 0x8000000000000000) != 0)
  {
    textContainerEntries = self->_textContainerEntries;
    var0 = (NSTextContainer *)textContainerEntries[-1].var0;
    p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&textContainerEntries[-1];
    textContainer = var0;
  }
  else
  {
    p_lastTextContainerEntry = &self->_lastTextContainerEntry;
    textContainer = self->_lastTextContainerEntry.textContainer;
    if (!textContainer)
    {
      p_lastTextContainerEntry = 0;
      goto LABEL_7;
    }
  }
  if (textContainer == a3)
  {
LABEL_20:
    v14 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange");
    if (p_lastTextContainerEntry == &self->_lastTextContainerEntry
      && (v18 = self->_lastTextContainerEntry.textRange) != 0
      && (objc_msgSend(-[NSTextRange endLocation](v18, "endLocation"), "isEqual:", -[NSTextRange endLocation](v14, "endLocation")) & 1) == 0&& objc_msgSend(-[NSTextRange location](self->_lastTextContainerEntry.textRange, "location"), "compare:", -[NSTextRange endLocation](v14, "endLocation")) == -1)
    {
      v16 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", -[NSTextRange location](self->_lastTextContainerEntry.textRange, "location"), -[NSTextRange endLocation](v14, "endLocation"));
    }
    else
    {
      textRange = p_lastTextContainerEntry->textRange;
      if (!textRange)
        textRange = v14;
      v16 = textRange;
    }
    v17 = v16;
    if (-[NSTextLayoutManager usesContiguousLayout](self, "usesContiguousLayout"))
    {
      __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v17, 0);
    }
    else
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x3052000000;
      v26 = __Block_byref_object_copy__2;
      v27 = __Block_byref_object_dispose__2;
      v28 = 0;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__NSTextLayoutManager_textContainerChangedGeometry___block_invoke;
      v22[3] = &unk_1E26039C0;
      v22[4] = &v23;
      if (objc_msgSend(-[NSTextRange endLocation](v17, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", -[NSTextRange location](v17, "location"), 2, v22);
      else
        -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", v17, 2, v22);
      v19 = (void *)v24[5];
      if (v19)
        __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v19, 0);
      _Block_object_dispose(&v23, 8);
    }
    -[NSTextLayoutManager _invalidateTextParagraphForEmptyDocument](self, "_invalidateTextParagraphForEmptyDocument");

    v20 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    p_lastTextContainerEntry->usageBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    p_lastTextContainerEntry->usageBounds.size = v20;

    p_lastTextContainerEntry->textRange = 0;
    p_lastTextContainerEntry->containerFilled = 0;

    self->_softInvalidationLocation = 0;
    goto LABEL_37;
  }
  textContainer = self->_lastTextContainerEntry.textContainer;
LABEL_7:
  if (textContainer)
    v10 = textContainerEntriesCount + 1;
  else
    v10 = self->_textContainerEntriesCount;
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      if (textContainerEntriesCount <= v12)
      {
        p_lastTextContainerEntry = &self->_lastTextContainerEntry;
        if (textContainer)
          goto LABEL_16;
      }
      else
      {
        v13 = self->_textContainerEntries;
        if (v13)
        {
          p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&v13[v11];
LABEL_16:
          if (p_lastTextContainerEntry->textContainer == a3)
            goto LABEL_20;
        }
      }
      ++v12;
      ++v11;
      if (v10 == v12)
        goto LABEL_37;
    }
  }
  if (p_lastTextContainerEntry)
    goto LABEL_20;
LABEL_37:
  textSelectionNavigation = self->_textSelectionNavigation;
  if (textSelectionNavigation)
    -[NSTextSelectionNavigation flushLayoutCache](textSelectionNavigation, "flushLayoutCache");
  objc_sync_exit(self);
}

- (void)updateLayoutWithTextLayoutFragment:(id)a3 addition:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  NSTextRange *v9;
  char *TextContainerEntryAndIndexForLocation;
  $93589CBA8E1B80577C20324DFAADD895 *v11;
  CGFloat v12;
  double v13;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  CGFloat v15;
  double v16;
  NSTextRange *textRange;
  int v18;
  NSTextRange *v19;
  NSTextRange *v20;
  $2B150901B53E279622BCD82FC26F074A *activeEnumerationCache;
  _BOOL4 var7;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id var1;
  uint64_t v36;
  NSTextRange *v37;
  uint64_t v38;
  uint64_t v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  uint64_t v53;
  NSRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  NSRect v58;

  v4 = a4;
  v7 = objc_sync_enter(self);
  v8 = (void *)MEMORY[0x18D7917B4](v7);
  v9 = (NSTextRange *)objc_msgSend(a3, "rangeInElement");
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, -[NSTextRange location](v9, "location"));
  v11 = ($93589CBA8E1B80577C20324DFAADD895 *)TextContainerEntryAndIndexForLocation;
  if (!TextContainerEntryAndIndexForLocation)
    goto LABEL_88;
  v12 = *((double *)TextContainerEntryAndIndexForLocation + 3);
  v13 = *((double *)TextContainerEntryAndIndexForLocation + 4);
  p_lastTextContainerEntry = &self->_lastTextContainerEntry;
  v15 = *((double *)TextContainerEntryAndIndexForLocation + 5);
  v16 = *((double *)TextContainerEntryAndIndexForLocation + 6);
  if (v4)
  {
    if ((unint64_t)objc_msgSend(a3, "state") <= 2)
    {
      v11->containerFilled = 1;
      goto LABEL_88;
    }
    -[_NSTextLayoutFragmentStorage revalidateLayoutFragmentRangeForLocation:](self->_textLayoutFragmentStorage, "revalidateLayoutFragmentRangeForLocation:", -[NSTextRange location](v9, "location"));
  }
  else
  {
    if (TextContainerEntryAndIndexForLocation == (char *)p_lastTextContainerEntry
      && (objc_msgSend(*((id *)TextContainerEntryAndIndexForLocation + 2), "containsRange:", v9) & 1) == 0)
    {
      goto LABEL_88;
    }
    v11->containerFilled = 0;
  }
  textRange = v11->textRange;
  if (textRange && !-[NSTextRange isEmpty](textRange, "isEmpty"))
  {
    if (v4)
    {
      v19 = -[NSTextRange textRangeByFormingUnionWithTextRange:](v11->textRange, "textRangeByFormingUnionWithTextRange:", v9);
      v18 = 0;
    }
    else if (objc_msgSend(-[NSTextRange location](v9, "location"), "compare:", -[NSTextRange location](v11->textRange, "location")) == 1&& objc_msgSend(-[NSTextRange endLocation](v9, "endLocation"), "compare:", -[NSTextRange endLocation](v11->textRange, "endLocation")) == -1)
    {
      v18 = 0;
      v19 = v11->textRange;
    }
    else
    {
      if (-[NSTextRange containsRange:](v9, "containsRange:", v11->textRange))
      {
        v19 = 0;
      }
      else
      {
        if (objc_msgSend(-[NSTextRange location](v11->textRange, "location"), "compare:", -[NSTextRange location](v9, "location")) == -1)
        {
          v37 = [NSTextRange alloc];
          v38 = -[NSTextRange location](v11->textRange, "location");
          v39 = -[NSTextRange location](v9, "location");
        }
        else
        {
          v37 = [NSTextRange alloc];
          v38 = -[NSTextRange endLocation](v9, "endLocation");
          v39 = -[NSTextRange endLocation](v11->textRange, "endLocation");
        }
        v19 = -[NSTextRange initWithLocation:endLocation:](v37, "initWithLocation:endLocation:", v38, v39);
      }
      v18 = 1;
    }
  }
  else
  {
    v18 = 0;
    if (v4)
      v19 = v9;
    else
      v19 = 0;
  }
  v20 = v11->textRange;
  if (v19 != v20)
  {

    v11->textRange = v19;
  }
  if (!v4)
  {
    if (v18)
    {
      v54.origin.x = v12;
      v54.origin.y = v13;
      v54.size.width = v15;
      v54.size.height = v16;
      if (!NSIsEmptyRect(v54))
      {
        objc_msgSend(a3, "layoutFragmentFrame");
        v25 = v24;
        v27 = v26;
        if (self->_softInvalidationLocation
          && objc_msgSend(-[NSTextRange location](v9, "location"), "compare:", self->_softInvalidationLocation) == -1)
        {
          __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, -[NSTextRange endLocation](v9, "endLocation"), 1.79769313e308);
        }
        v28 = v13 + v16;
        v29 = v13 + v16 - (v25 + v27);
        if (v13 >= v25)
          v13 = v25 + v27;
        else
          v29 = v16;
        if (v28 > v25 + v27 || v29 <= 0.0)
          v16 = v29;
        else
          v16 = v25 - v13;
        if (v16 <= 0.0)
        {
          v12 = *MEMORY[0x1E0CB3438];
          v13 = *(double *)(MEMORY[0x1E0CB3438] + 8);
          v15 = *(double *)(MEMORY[0x1E0CB3438] + 16);
          v16 = *(double *)(MEMORY[0x1E0CB3438] + 24);
        }
      }
    }
    goto LABEL_79;
  }
  activeEnumerationCache = self->_activeEnumerationCache;
  if (!activeEnumerationCache || !activeEnumerationCache->var6)
  {
    if (self->_softInvalidationLocation)
    {
      if (objc_msgSend(-[NSTextRange location](v9, "location"), "compare:", self->_softInvalidationLocation) == -1)
        goto LABEL_48;
    }
    else
    {
      v48 = 0;
      v49 = &v48;
      v50 = 0x3052000000;
      v51 = __Block_byref_object_copy__2;
      v52 = __Block_byref_object_dispose__2;
      v53 = 0;
      v31 = -[NSTextRange endLocation](v11->textRange, "endLocation");
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __67__NSTextLayoutManager_updateLayoutWithTextLayoutFragment_addition___block_invoke;
      v47[3] = &unk_1E26039C0;
      v47[4] = &v48;
      -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v31, 3, v47);
      if (v49[5])
      {
        v32 = -[NSTextRange location](v9, "location");
        v33 = objc_msgSend(v32, "compare:", objc_msgSend((id)objc_msgSend((id)v49[5], "rangeInElement"), "location"));
        _Block_object_dispose(&v48, 8);
        if (v33 != 1)
        {
LABEL_48:
          -[NSTextLayoutManager _setSoftInvalidationLocation:onlyIfUpstream:](self, "_setSoftInvalidationLocation:onlyIfUpstream:", -[NSTextRange location](v9, "location"), 0);
          goto LABEL_68;
        }
      }
      else
      {
        _Block_object_dispose(&v48, 8);
      }
    }
    if (-[NSTextLocation compare:](self->_softInvalidationLocation, "compare:", -[NSTextRange location](v9, "location")) != 1)__NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, -[NSTextRange endLocation](v9, "endLocation"), 1.79769313e308);
    goto LABEL_68;
  }
  var7 = activeEnumerationCache->var7;
  if (activeEnumerationCache->var7)
    v23 = -[NSTextRange endLocation](v9, "endLocation");
  else
    v23 = -[NSTextRange location](v9, "location");
  v34 = v23;
  var1 = self->_activeEnumerationCache->var1;
  if (var1 && objc_msgSend(var1, "isEqual:", v34))
  {
    objc_msgSend(a3, "layoutFragmentFrame");
    objc_msgSend(a3, "setLayoutFragmentFrameOrigin:");
    if (var7)
      v36 = -[NSTextRange location](v9, "location");
    else
      v36 = -[NSTextRange endLocation](v9, "endLocation");
    -[NSTextLayoutManager _setSoftInvalidationLocation:onlyIfUpstream:](self, "_setSoftInvalidationLocation:onlyIfUpstream:", v36, -[NSTextLocation compare:](self->_softInvalidationLocation, "compare:", v34) == -1);
  }
  else if ((objc_msgSend(-[NSTextRange location](v9, "location"), "isEqual:", -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location")) & 1) != 0)
  {
    -[NSTextLayoutManager _setSoftInvalidationLocation:onlyIfUpstream:](self, "_setSoftInvalidationLocation:onlyIfUpstream:", -[NSTextRange endLocation](v9, "endLocation"), 1);
  }
  else
  {
    -[NSTextLayoutManager _setSoftInvalidationLocation:onlyIfUpstream:](self, "_setSoftInvalidationLocation:onlyIfUpstream:", -[NSTextRange location](v9, "location"), 1);
    __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, -[NSTextRange endLocation](v9, "endLocation"), 1.79769313e308);
  }
LABEL_68:
  v55.origin.x = v12;
  v55.origin.y = v13;
  v55.size.width = v15;
  v55.size.height = v16;
  if (CGRectIsEmpty(v55))
  {
    objc_msgSend(a3, "layoutFragmentFrame");
  }
  else
  {
    objc_msgSend(a3, "layoutFragmentFrame");
    v57.origin.x = v12;
    v57.origin.y = v13;
    v57.size.width = v15;
    v57.size.height = v16;
    *(CGRect *)&v40 = CGRectUnion(v56, v57);
  }
  v12 = v40;
  v15 = v42;
  if (v41 == 0.0)
    v44 = -0.0;
  else
    v44 = v41;
  if (v41 == 0.0)
    v13 = v41;
  else
    v13 = 0.0;
  v16 = v43 + v44;
  if (objc_msgSend(a3, "hasPartialLayout"))
    v11->containerFilled = 1;
LABEL_79:
  v45 = -0.0;
  if (v13 < 0.0)
    v45 = v13;
  v46 = v16 + v45;
  if (v13 < 0.0)
    v13 = 0.0;
  v58.origin.x = v12;
  v58.origin.y = v13;
  v58.size.width = v15;
  v58.size.height = v46;
  if (!NSEqualRects(v11->usageBounds, v58))
  {
    if (v11 == p_lastTextContainerEntry)
    {
      -[NSTextLayoutManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("usageBoundsForTextContainer"));
      -[NSTextLayoutManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("usageBoundsForLastTextContainer"));
      v11->usageBounds.origin.x = v12;
      v11->usageBounds.origin.y = v13;
      v11->usageBounds.size.width = v15;
      v11->usageBounds.size.height = v46;
      -[NSTextLayoutManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usageBoundsForTextContainer"));
      -[NSTextLayoutManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("usageBoundsForLastTextContainer"));
    }
    else
    {
      v11->usageBounds.origin.x = v12;
      v11->usageBounds.origin.y = v13;
      v11->usageBounds.size.width = v15;
      v11->usageBounds.size.height = v46;
    }
    -[NSTextContainer invalidateTextContainerOrigin](v11->textContainer, "invalidateTextContainerOrigin");
  }
LABEL_88:
  objc_autoreleasePoolPop(v8);
  objc_sync_exit(self);
}

- (BOOL)_setSoftInvalidationLocation:(id)a3 onlyIfUpstream:(BOOL)a4
{
  BOOL v6;
  NSTextLocation *softInvalidationLocation;

  if (a3 && a4 && self->_softInvalidationLocation && objc_msgSend(a3, "compare:") != -1)
  {
    v6 = 0;
    softInvalidationLocation = self->_softInvalidationLocation;
  }
  else
  {

    softInvalidationLocation = (NSTextLocation *)a3;
    self->_softInvalidationLocation = softInvalidationLocation;
    v6 = 1;
  }
  if (-[NSTextLocation isEqual:](softInvalidationLocation, "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))
  {

    self->_softInvalidationLocation = 0;
  }
  return v6;
}

- (BOOL)requiresCTLineRef
{
  return self->_requiresCTLineRef;
}

- (void)_configureCoreTypesetter:(id)a3 forTextParagraph:(id)a4 textContainer:(id)a5
{
  uint64_t v9;

  objc_msgSend(a3, "setApplicationFrameworkContext:", -[NSTextLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext"));
  objc_msgSend(a3, "setUsesFontLeading:", -[NSTextLayoutManager usesFontLeading](self, "usesFontLeading"));
  objc_msgSend(a3, "setUsesDefaultHyphenation:", -[NSTextLayoutManager usesHyphenation](self, "usesHyphenation"));
  objc_msgSend(a3, "setAllowsFontSubstitutionAffectingVerticalMetrics:", -[NSTextLayoutManager allowsFontSubstitutionAffectingVerticalMetrics](self, "allowsFontSubstitutionAffectingVerticalMetrics"));
  objc_msgSend(a3, "setLimitsLayoutForSuspiciousContents:", -[NSTextLayoutManager limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents"));
  objc_msgSend(a3, "set_extraLineFragmentAttributes:", objc_msgSend(a4, "attributes"));
  objc_msgSend(a3, "setDefaultParagraphStyle:", objc_msgSend(a5, "defaultParagraphStyle"));
  if (a4)
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "elementRange"), "location"), "isEqual:", -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location"));
  else
    v9 = 1;
  objc_msgSend(a3, "setBeginningOfDocument:", v9);
  objc_msgSend(a3, "setBreaksLinesForInteractiveText:", -[NSTextLayoutManager breaksLinesForInteractiveText](self, "breaksLinesForInteractiveText"));
}

- (BOOL)usesFontLeading
{
  BOOL usesFontLeading;

  objc_sync_enter(self);
  usesFontLeading = self->_usesFontLeading;
  objc_sync_exit(self);
  return usesFontLeading;
}

- (BOOL)allowsFontSubstitutionAffectingVerticalMetrics
{
  BOOL allowsFontSubstitutionAffectingVerticalMetrics;

  objc_sync_enter(self);
  allowsFontSubstitutionAffectingVerticalMetrics = self->_allowsFontSubstitutionAffectingVerticalMetrics;
  objc_sync_exit(self);
  return allowsFontSubstitutionAffectingVerticalMetrics;
}

- (BOOL)usesHyphenation
{
  BOOL usesHyphenation;

  objc_sync_enter(self);
  usesHyphenation = self->_usesHyphenation;
  objc_sync_exit(self);
  return usesHyphenation;
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  BOOL limitsLayoutForSuspiciousContents;

  objc_sync_enter(self);
  limitsLayoutForSuspiciousContents = self->_limitsLayoutForSuspiciousContents;
  objc_sync_exit(self);
  return limitsLayoutForSuspiciousContents;
}

- (BOOL)breaksLinesForInteractiveText
{
  return self->_breaksLinesForInteractiveText;
}

- (id)baseLocation
{
  return -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location");
}

uint64_t __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_2(uint64_t result, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;

  v6 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    goto LABEL_16;
  v7 = a3;
  if (!a3)
    v7 = (void *)objc_msgSend(a2, "rangeInElement");
  result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 32), "endLocation"), "compare:", objc_msgSend(v7, "location"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24) = result != 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24))
  {
LABEL_16:
    if (*(_BYTE *)(v6 + 64))
      return objc_msgSend(a2, "invalidateLayout");
    *a4 = 1;
  }
  else
  {
    if (!*(_BYTE *)(v6 + 65))
      return objc_msgSend(a2, "invalidateLayout");

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 56) + 8) + 40) = 0;
    result = objc_msgSend(a2, "textElement");
    if (result)
    {
      if (!v7)
        v7 = (void *)objc_msgSend(a2, "rangeInElement");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 56) + 8) + 40) = (id)objc_msgSend(v7, "endLocation");
      return objc_msgSend(*(id *)(v6 + 40), "updateLayoutWithTextLayoutFragment:addition:", a2, 0);
    }
  }
  return result;
}

- (void)_fixSelectionAfterChangeInCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  NSArray *v8;
  id v9;
  NSCountableTextRange *v10;

  length = a3.length;
  location = a3.location;
  v8 = -[NSTextLayoutManager textSelections](self, "textSelections");
  if (v8)
  {
    v9 = -[NSTextLayoutManager adjustedTextSelectionsForEditingContextFromTextSelections:](self, "adjustedTextSelectionsForEditingContextFromTextSelections:", v8);
    if (v9)
      -[NSTextLayoutManager setTextSelections:](self, "setTextSelections:", v9);
  }

  if (self->_temporaryAttributesTable)
  {
    v10 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", location, length - a4);
    -[_NSTextRunStorage invalidateElementsInRange:delta:](self->_temporaryAttributesTable, "invalidateElementsInRange:delta:", v10, a4);

  }
}

BOOL __76__NSTextLayoutManager__estimatedVerticalSizeForTextRange_adjustedTextRange___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  _BOOL8 v10;

  v4 = (void *)objc_msgSend(a2, "elementRange");
  v5 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && (objc_msgSend((id)objc_msgSend(v4, "location"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "location")) & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)objc_msgSend(v5, "location");
  }
  v6 = objc_msgSend((id)objc_msgSend(v5, "endLocation"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v7 + 24) + 1;
  *(_QWORD *)(v7 + 24) = v8;
  if (v8 >= *(_QWORD *)(a1 + 80))
  {
    v10 = 0;
LABEL_10:
    if (v6)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = (id)objc_msgSend(v5, "location");
    return v10;
  }
  if (objc_msgSend((id)objc_msgSend(v5, "location"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation")) == -1)
  {
    objc_msgSend(a2, "estimatedIntrinsicContentSizeForTextLayoutManager:", *(_QWORD *)(a1 + 40));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v9
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
  }
  v10 = v6 == -1;
  if (v6 != -1)
    goto LABEL_10;
  return v10;
}

- (id)_selectionAndMarkedTextAttributesForLocation:(id)a3 inTextRange:(id)a4 effectiveTextRange:(id *)a5
{
  id v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSTextRange *v16;
  NSTextContentManager *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  NSTextContentManager *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSTextRange *v28;
  char v29;
  NSTextRange *v30;
  uint64_t v31;
  NSTextRange *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSTextRange *v37;
  id v38;
  void *v39;
  void *v40;
  NSTextRange *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = -[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:");
  if (!v8)
    return 0;
  v9 = v8;
  v10 = -[NSTextLayoutManager textSelections](self, "textSelections");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, &v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(a3, "compare:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "textRanges"), "firstObject"), "location")) != -1)
        {
          v16 = (NSTextRange *)objc_msgSend(v15, "textRangeContainingLocation:", a3);
          goto LABEL_12;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v44, &v48, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:
  v17 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  v18 = -[NSTextLayoutManager offsetFromLocation:toLocation:](self, "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextContentManager documentRange](v17, "documentRange"), "location"), a3);
  v48 = 0;
  v49 = 0;
  v19 = objc_msgSend(v9, "markedTextAttributesAtCharacterIndex:effectiveRange:", v18, &v48);
  if (v49)
  {
    v20 = v19;
    v42 = v16;
    v21 = a5;
    v22 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
    v23 = -[NSTextRange location](-[NSTextContentManager documentRange](v17, "documentRange"), "location");
    v25 = v48;
    v24 = v49;
    v26 = -[NSTextContentManager locationFromLocation:withOffset:](v22, "locationFromLocation:withOffset:", v23, v48);
    if (v24)
      v27 = -[NSTextContentManager locationFromLocation:withOffset:](v22, "locationFromLocation:withOffset:", v23, v24 + v25);
    else
      v27 = 0;
    v30 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v26, v27);
    v28 = -[NSTextRange textRangeByIntersectingWithTextRange:](v30, "textRangeByIntersectingWithTextRange:", a4);

    a5 = v21;
    if (v28)
    {
      v29 = 0;
      v16 = v42;
      if (!-[NSTextRange isEmpty](v28, "isEmpty"))
        goto LABEL_22;
    }
    else
    {
      v29 = 1;
      v16 = v42;
    }
  }
  else
  {
    v28 = 0;
    v29 = 1;
  }
  v20 = 0;
LABEL_22:
  v31 = 0;
  if (v20 || !v16)
    goto LABEL_37;
  v32 = -[NSTextRange textRangeByIntersectingWithTextRange:](v16, "textRangeByIntersectingWithTextRange:", a4);
  v16 = v32;
  if (v32 && !-[NSTextRange isEmpty](v32, "isEmpty"))
  {
    v31 = objc_msgSend(v9, "selectedTextAttributes");
    if (objc_msgSend((id)v31, "count"))
    {
      if (!objc_msgSend((id)v31, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor")))
      {
LABEL_32:
        v33 = 0;
LABEL_33:
        v34 = objc_msgSend((id)v31, "objectForKeyedSubscript:", CFSTR("NSColor"));
        if (v34)
        {
          v35 = v34;
          if (!v33)
            v33 = (id)objc_msgSend((id)v31, "mutableCopy");
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, 0x1E2610C50);
          objc_msgSend(v33, "removeObjectForKey:", CFSTR("NSColor"));
          v31 = (uint64_t)v33;
        }
        goto LABEL_37;
      }
      if ((unint64_t)objc_msgSend((id)v31, "count") >= 2)
      {
        v31 = (uint64_t)(id)objc_msgSend((id)v31, "mutableCopy");
        objc_msgSend((id)v31, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NSBackgroundColor"));
        v33 = (id)v31;
        goto LABEL_33;
      }
    }
    v31 = 0;
    goto LABEL_32;
  }
  v31 = 0;
LABEL_37:
  if (v20 | v31)
  {
    if (v20 && v31)
    {
      v36 = (id)objc_msgSend((id)v31, "mutableCopy");
      objc_msgSend(v36, "addEntriesFromDictionary:", v20);
      v37 = -[NSTextRange textRangeByIntersectingWithTextRange:](v16, "textRangeByIntersectingWithTextRange:", v16);
    }
    else
    {
      if (v31)
        v37 = v16;
      else
        v37 = v28;
      if (v31)
        v36 = (id)v31;
      else
        v36 = (id)v20;
    }
    goto LABEL_60;
  }
  v38 = (id)objc_msgSend(a4, "endLocation");
  if ((v29 & 1) == 0
    && !-[NSTextRange isEmpty](v28, "isEmpty")
    && objc_msgSend(a3, "compare:", -[NSTextRange location](v28, "location")) == -1
    && objc_msgSend(-[NSTextRange location](v28, "location"), "compare:", v38) == -1)
  {
    v38 = -[NSTextRange location](v28, "location");
  }
  v39 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](-[NSTextLayoutManager textSelections](self, "textSelections"), "firstObject"), "textRanges"), "firstObject");
  if (v39)
  {
    v40 = v39;
    if ((objc_msgSend(v39, "isEmpty") & 1) == 0
      && objc_msgSend(a3, "compare:", objc_msgSend(v40, "location")) == -1
      && objc_msgSend((id)objc_msgSend(v40, "location"), "compare:", v38) == -1)
    {
      v38 = (id)objc_msgSend(v40, "location");
    }
  }
  if ((objc_msgSend(v38, "isEqual:", objc_msgSend(a4, "endLocation")) & 1) == 0)
  {
    v37 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", a3, v38);
    v36 = 0;
LABEL_60:
    *a5 = v37;
    return v36;
  }
  return 0;
}

- (NSArray)textSelections
{
  NSArray *v3;

  objc_sync_enter(self);
  v3 = self->_textSelections;
  objc_sync_exit(self);
  return v3;
}

- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4
{
  return -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "offsetFromLocation:toLocation:", a3, a4);
}

- (void)setTextSelections:(NSArray *)textSelections
{
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSTextParagraph *textParagraphForEmptyDocument;
  NSTextRange *v9;
  NSTextRange *v10;
  void *v11;
  void *v12;
  NSTextLineFragment *v13;
  void *v14;

  objc_sync_enter(self);
  v5 = self->_textSelections;
  if (v5 != textSelections && !-[NSArray isEqualToArray:](v5, "isEqualToArray:", textSelections))
  {
    if (!self->_delegateWithTextSelectionNotification
      || (v6 = (NSArray *)objc_msgSend(objc_loadWeak((id *)&self->_delegate), "textLayoutManager:willChangeFromTextSelections:toTextSelections:", self, self->_textSelections, textSelections), !-[NSArray count](v6, "count"))|| (v7 = self->_textSelections, v7 != v6)&& (textSelections = v6, !-[NSArray isEqualToArray:](v7, "isEqualToArray:", v6)))
    {
      -[NSTextLayoutManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("textSelections"));

      self->_textSelections = (NSArray *)-[NSArray copy](textSelections, "copy");
      textParagraphForEmptyDocument = self->_textParagraphForEmptyDocument;
      if (textParagraphForEmptyDocument
        && !-[NSDictionary isEqualToDictionary:](-[NSTextParagraph attributes](textParagraphForEmptyDocument, "attributes"), "isEqualToDictionary:", objc_msgSend(-[NSArray firstObject](self->_textSelections, "firstObject"), "typingAttributes")))
      {
        -[NSTextLayoutManager _invalidateTextParagraphForEmptyDocument](self, "_invalidateTextParagraphForEmptyDocument");
      }
      v9 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange");
      v10 = v9;
      if (v9)
      {
        if (!-[NSTextRange isEmpty](v9, "isEmpty"))
        {
          v11 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_textSelections, "firstObject"), "textRanges"), "firstObject");
          v12 = v11;
          if (v11)
          {
            if (objc_msgSend(v11, "isEmpty"))
            {
              if (objc_msgSend(-[NSTextRange endLocation](v10, "endLocation"), "isEqual:", objc_msgSend(v12, "location")))
              {
                v13 = -[NSTextLayoutManager _extraTextLineFragment](self, "_extraTextLineFragment");
                if (v13)
                {
                  v14 = (void *)objc_msgSend(-[NSArray firstObject](self->_textSelections, "firstObject"), "typingAttributes");
                  if (objc_msgSend(v14, "count"))
                  {
                    if ((objc_msgSend(v14, "isEqualToDictionary:", -[NSTextLayoutFragment extraLineFragmentAttributes](-[NSTextLineFragment textLayoutFragment](v13, "textLayoutFragment"), "extraLineFragmentAttributes")) & 1) == 0)-[NSTextLayoutFragment invalidateExtraLineFragment](-[NSTextLineFragment textLayoutFragment](-[NSTextLayoutManager _extraTextLineFragment](self, "_extraTextLineFragment"), "textLayoutFragment"), "invalidateExtraLineFragment");
                  }
                }
              }
            }
          }
        }
      }
      -[NSTextLayoutManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("textSelections"));
    }
  }
  objc_sync_exit(self);
}

- (CGRect)usageBoundsInTextContainerAtIndex:(int64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  objc_sync_enter(self);
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (self->_textContainerEntriesCount <= a3)
  {
    p_lastTextContainerEntry = &self->_lastTextContainerEntry;
    if (self->_lastTextContainerEntry.textContainer)
      goto LABEL_5;
  }
  else
  {
    textContainerEntries = self->_textContainerEntries;
    if (textContainerEntries)
    {
      p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&textContainerEntries[a3];
LABEL_5:
      x = p_lastTextContainerEntry->usageBounds.origin.x;
      y = p_lastTextContainerEntry->usageBounds.origin.y;
      width = p_lastTextContainerEntry->usageBounds.size.width;
      height = p_lastTextContainerEntry->usageBounds.size.height;
    }
  }
  objc_sync_exit(self);
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBreaksLinesForInteractiveText:(BOOL)a3
{
  self->_breaksLinesForInteractiveText = a3;
}

- (BOOL)isCountableDataSource
{
  return -[NSTextContentManager isCountableDataSource](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "isCountableDataSource");
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__NSTextLayoutManager_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
  v5[3] = &unk_1E26040A8;
  v5[4] = a5;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", a3, a4 | 8, v5);
}

- (void)processLayoutInvalidationForTextRange:(id)a3 synchronizing:(BOOL)a4
{
  -[NSTextLayoutManager _invalidateLayoutForTextRange:hard:](self, "_invalidateLayoutForTextRange:hard:", a3, 1);
  -[NSTextViewportLayoutController setNeedsLayout](-[NSTextLayoutManager textViewportLayoutController](self, "textViewportLayoutController"), "setNeedsLayout");
}

BOOL __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSTextRange *v39;
  NSTextRange *v40;
  uint64_t v41;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *context;
  uint64_t v49;
  _QWORD v50[11];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  NSTextRange *v62;
  _QWORD v63[5];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;

  v4 = objc_msgSend(a2, "textParagraph");
  if (v4)
  {
    v5 = (void *)v4;
    v64 = 0;
    v65 = &v64;
    v66 = 0x2020000000;
    v67 = 0;
    v47 = a1;
    if (*(_BYTE *)(a1 + 64))
    {
      v6 = (void *)objc_msgSend(a2, "textLineFragments");
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_2;
      v63[3] = &unk_1E2602FC8;
      v63[4] = &v64;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v63);
    }
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v7)
      v8 = objc_msgSend(v5, "rangeForLocation:allowsTrailingEdge:", v7, 1);
    else
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = (void *)objc_msgSend(v5, "paragraphContentRange");
    v46 = v5;
    v10 = (void *)objc_msgSend(v5, "paragraphSeparatorRange");
    v11 = v10;
    if (*(_BYTE *)(a1 + 64)
      || (v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) == 0
      || objc_msgSend(v43, "compare:", objc_msgSend(v10, "location"))
      || objc_msgSend(v9, "isEmpty"))
    {
      v44 = (objc_msgSend(v11, "isEmpty") & 1) != 0
          ? 0x7FFFFFFFFFFFFFFFLL
          : objc_msgSend(v46, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v11, "location"), 1);
      v12 = (void *)objc_msgSend(a2, "textLineFragments");
      v13 = objc_msgSend(v12, "count");
      v14 = v13 - 1;
      if (v13 >= 1)
      {
        v15 = 0;
        v45 = v12;
        while (1)
        {
          v16 = MEMORY[0x18D7917B4]();
          if (*(_BYTE *)(v47 + 64))
            v17 = v14;
          else
            v17 = v15;
          v18 = (void *)objc_msgSend(v12, "objectAtIndex:", v17);
          v19 = objc_msgSend(v18, "characterRange");
          v21 = v19;
          v22 = v20;
          context = (void *)v16;
          if (v19)
          {
            v23 = 0;
            v24 = *(unsigned __int8 *)(v47 + 64);
          }
          else
          {
            v24 = *(unsigned __int8 *)(v47 + 64);
            if (*(_BYTE *)(v47 + 64))
              v25 = v20;
            else
              v25 = 0;
            v23 = v65[3] - v25;
          }
          if (v24)
            v26 = -(uint64_t)v20;
          else
            v26 = v20;
          v65[3] += v26;
          v49 = 0x7FFFFFFFFFFFFFFFLL;
          if (v8 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_38;
          v27 = v8 - v23;
          if (v8 - v23 < v19 || v8 - v23 - v19 >= v20)
          {
            if (!v24)
            {
              v49 = v8;
              goto LABEL_38;
            }
            v49 = v8;
            if (v19 + v20 != v27)
              goto LABEL_38;
          }
          v8 = 0x7FFFFFFFFFFFFFFFLL;
          if (!v24 || v27 != v19)
          {
            v49 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_38:
            if (v19 + v20 <= v44 - v23)
              v30 = v20;
            else
              v30 = v44 - v23 - v19;
            if (v44 - v23 >= v19)
              v31 = v30;
            else
              v31 = v20;
            if (v44 == 0x7FFFFFFFFFFFFFFFLL)
              v32 = v20;
            else
              v32 = v31;
            if (v49 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((*(_BYTE *)(v47 + 57) & 2) == 0)
              {
                v33 = (void *)objc_msgSend((id)objc_msgSend(v18, "attributedString"), "string");
                v34 = v33;
                if (v21 || v32 != objc_msgSend(v33, "length"))
                  objc_msgSend(v34, "substringWithRange:", v21, v32);
              }
              v35 = v23 + v21;
              v36 = objc_msgSend(v46, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v23 + v21, 0, 0);
              v37 = objc_msgSend(v46, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v32 + v23 + v21, 0, 0);
              v57 = 0;
              v58 = &v57;
              v59 = 0x3052000000;
              v60 = __Block_byref_object_copy__2;
              v61 = __Block_byref_object_dispose__2;
              v62 = 0;
              v62 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v36, v37);
              v51 = 0;
              v52 = &v51;
              v53 = 0x3052000000;
              v54 = __Block_byref_object_copy__2;
              v55 = __Block_byref_object_dispose__2;
              v56 = 0;
              if (!v23 && v32 == v22
                || (v36 = objc_msgSend(v46, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v21, 0, 0), v38 = objc_msgSend(v46, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v21 + v22, 0, 0), (id)v52[5], v39 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v36, v38), (v52[5] = (uint64_t)v39) == 0))
              {
                v39 = (NSTextRange *)v58[5];
              }
              v40 = v39;
              v41 = *(_QWORD *)(v47 + 56) | 0x200;
              v50[0] = MEMORY[0x1E0C809B0];
              v50[1] = 3221225472;
              v50[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_3;
              v50[3] = &unk_1E2603FE0;
              v50[4] = v40;
              v50[5] = v18;
              v50[8] = &v51;
              v50[9] = v35;
              v50[10] = v32;
              v50[6] = v46;
              v50[7] = &v57;
              objc_msgSend(v46, "enumerateSubstringsFromLocation:options:usingBlock:", v36, v41, v50);
              (*(void (**)(void))(*(_QWORD *)(v47 + 32) + 16))();
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v47 + 48) + 8) + 24) = 0;

              _Block_object_dispose(&v51, 8);
              _Block_object_dispose(&v57, 8);
            }
            v29 = 0;
            v8 = v49;
            goto LABEL_60;
          }
          v29 = 4;
LABEL_60:
          objc_autoreleasePoolPop(context);
          v12 = v45;
          if ((v29 | 4) == 4)
          {
            ++v15;
            if (--v14 != -1)
              continue;
          }
          break;
        }
      }
    }
    _Block_object_dispose(&v64, 8);
    a1 = v47;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0;
}

- (void)_fillLayoutToLocation:(id)a3 enumerationCache:(id *)a4
{
  char *TextContainerEntryAndIndexForLocation;
  char *v8;
  NSTextLocation *softInvalidationLocation;
  void *v10;
  NSTextRange *v11;

  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a3);
  v8 = TextContainerEntryAndIndexForLocation;
  if (TextContainerEntryAndIndexForLocation
    && (softInvalidationLocation = (NSTextLocation *)*((_QWORD *)TextContainerEntryAndIndexForLocation + 1)) != 0
    || (softInvalidationLocation = -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location"), v8))
  {
    v10 = (void *)*((_QWORD *)v8 + 2);
  }
  else
  {
    v10 = 0;
  }
  if (self->_softInvalidationLocation
    && objc_msgSend((id)objc_msgSend(v10, "location"), "compare:", self->_softInvalidationLocation) == -1)
  {
    softInvalidationLocation = self->_softInvalidationLocation;
  }
  if (-[NSTextLocation compare:](softInvalidationLocation, "compare:", a3) == -1)
  {
    v11 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", softInvalidationLocation, a3);
    a4->var8 = 1;
    -[NSTextLayoutManager ensureLayoutForRange:](self, "ensureLayoutForRange:", v11);
    a4->var8 = 0;

  }
}

- (void)enumerateTemporaryAttributesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  NSTextRange *v9;
  NSTextRange *v10;
  id v11;
  id v12;
  uint64_t v13;
  _NSTextAttributeStorage *temporaryAttributesTable;
  void *v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v6 = a4;
  objc_sync_enter(self);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  self->_isProcessingRenderingAttributesMethod = 1;
  v9 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange");
  v10 = [NSTextRange alloc];
  if (v6)
  {
    v11 = -[NSTextRange location](v9, "location");
    v12 = a3;
  }
  else
  {
    v12 = -[NSTextRange endLocation](v9, "endLocation");
    v11 = a3;
  }
  v13 = -[NSTextRange initWithLocation:endLocation:](v10, "initWithLocation:endLocation:", v11, v12);
  v18[5] = v13;
  temporaryAttributesTable = self->_temporaryAttributesTable;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__NSTextLayoutManager_enumerateTemporaryAttributesFromLocation_reverse_usingBlock___block_invoke;
  v16[3] = &unk_1E2603E80;
  v16[5] = a5;
  v16[6] = &v17;
  v16[4] = self;
  -[_NSTextAttributeStorage enumerateAttributesFromLocation:reverse:usingBlock:](temporaryAttributesTable, "enumerateAttributesFromLocation:reverse:usingBlock:", a3, v6, v16);
  v15 = (void *)v18[5];
  if (v15)

  self->_isProcessingRenderingAttributesMethod = 0;
  _Block_object_dispose(&v17, 8);
  objc_sync_exit(self);
}

uint64_t __76__NSTextLayoutManager_enumerateTextSegmentsInRange_type_options_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSTextViewportLayoutController)textViewportLayoutController
{
  return (NSTextViewportLayoutController *)-[NSTextContainer textViewportLayoutController](-[NSTextLayoutManager textContainer](self, "textContainer"), "textViewportLayoutController");
}

- (NSTextContainer)textContainer
{
  return (NSTextContainer *)-[NSArray lastObject](-[NSTextLayoutManager textContainers](self, "textContainers"), "lastObject");
}

- (NSArray)textContainers
{
  uint64_t v3;
  NSArray *textContainers;
  unint64_t textContainerEntriesCount;
  uint64_t v6;
  unint64_t i;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  NSArray *v9;

  objc_sync_enter(self);
  if (-[NSTextLayoutManager textContentManager](self, "textContentManager"))
  {
    v3 = self->_lastTextContainerEntry.textContainer ? -1 : 0;
    if (self->_textContainerEntriesCount == v3)
      -[NSTextLayoutManager _addTextContainerForLocation:](self, "_addTextContainerForLocation:", -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location"));
  }
  textContainers = self->_textContainers;
  if (!textContainers)
  {
    textContainers = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (self->_lastTextContainerEntry.textContainer)
      textContainerEntriesCount = self->_textContainerEntriesCount + 1;
    else
      textContainerEntriesCount = self->_textContainerEntriesCount;
    if (textContainerEntriesCount)
    {
      v6 = 0;
      for (i = 0; i != textContainerEntriesCount; ++i)
      {
        if (self->_textContainerEntriesCount <= i)
        {
          if (self->_lastTextContainerEntry.textContainer)
            p_lastTextContainerEntry = &self->_lastTextContainerEntry;
          else
            p_lastTextContainerEntry = 0;
        }
        else
        {
          p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&self->_textContainerEntries[v6];
        }
        -[NSArray addObject:](textContainers, "addObject:", p_lastTextContainerEntry->textContainer);
        ++v6;
      }
    }
    self->_textContainers = textContainers;
  }
  v9 = textContainers;
  objc_sync_exit(self);
  return v9;
}

- (NSTextSelectionNavigation)textSelectionNavigation
{
  NSTextSelectionNavigation *textSelectionNavigation;

  objc_sync_enter(self);
  textSelectionNavigation = self->_textSelectionNavigation;
  if (!textSelectionNavigation)
  {
    textSelectionNavigation = -[NSTextSelectionNavigation initWithDataSource:]([NSTextSelectionNavigation alloc], "initWithDataSource:", self);
    self->_textSelectionNavigation = textSelectionNavigation;
  }
  objc_sync_exit(self);
  return textSelectionNavigation;
}

- (void)enumerateSubstringsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  NSTextContentManager *v10;
  _QWORD v11[9];
  char v12;
  _QWORD v13[8];
  char v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[2];
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = (a4 >> 8) & 1;
  v9 = a4;
  v17[0] = 0;
  v17[1] = v17;
  if ((_BYTE)a4)
  {
    v18 = 0x2020000000;
    LOBYTE(v19) = 1;
    v10 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_4;
    v11[3] = &unk_1E2604058;
    v11[6] = v17;
    v11[7] = v9;
    v12 = v8;
    v11[8] = a4;
    v11[4] = a3;
    v11[5] = a5;
    -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](v10, "enumerateTextElementsFromLocation:options:usingBlock:", a3, v8, v11);
  }
  else
  {
    v18 = 0x3052000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v21 = a3;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke;
    v13[3] = &unk_1E2604008;
    v14 = BYTE1(a4) & 1;
    v13[4] = a5;
    v13[5] = v17;
    v13[6] = v15;
    v13[7] = a4;
    -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", a3, v8 | 4, v13);
    _Block_object_dispose(v15, 8);
  }
  _Block_object_dispose(v17, 8);
}

- (BOOL)rendersBackgroundColorAttribute
{
  return self->_rendersBackgroundColorAttribute;
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)limitsLayoutForSuspiciousContents
{
  _BOOL4 v3;

  v3 = limitsLayoutForSuspiciousContents;
  objc_sync_enter(self);
  if (self->_limitsLayoutForSuspiciousContents != v3)
  {
    self->_limitsLayoutForSuspiciousContents = v3;
    -[NSTextLayoutManager invalidateLayoutForRange:](self, "invalidateLayoutForRange:", -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"));
  }
  objc_sync_exit(self);
}

- (void)setUsesFontLeading:(BOOL)usesFontLeading
{
  _BOOL4 v3;

  v3 = usesFontLeading;
  objc_sync_enter(self);
  if (self->_usesFontLeading != v3)
  {
    self->_usesFontLeading = v3;
    -[NSTextLayoutManager invalidateLayoutForRange:](self, "invalidateLayoutForRange:", -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"));
  }
  objc_sync_exit(self);
}

- (void)invalidateLayoutForRange:(NSTextRange *)range
{
  if (-[NSTextRange isNotEmpty](range, "isNotEmpty"))
    -[NSTextLayoutManager _invalidateLayoutForTextRange:hard:](self, "_invalidateLayoutForTextRange:hard:", range, 0);
}

uint64_t __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "characterRange");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v4;
  return result;
}

- (id)_textViewportLayoutControllerForTextContainer:(id)a3
{
  id v5;
  id result;

  v5 = -[NSTextLayoutManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewportLayoutControllerClass")), "initWithTextContainer:", a3);
  result = (id)objc_msgSend(v5, "textLayoutManager:textViewportLayoutControllerForTextContainer:", self, a3);
  if (!result)
    return (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewportLayoutControllerClass")), "initWithTextContainer:", a3);
  return result;
}

+ (Class)viewportLayoutControllerClass
{
  return (Class)objc_opt_class();
}

uint64_t __52__NSTextLayoutManager_textContainerChangedGeometry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "_resetLayoutFragmentFrame");
  result = objc_msgSend(a2, "hasPartialLayout");
  if ((_DWORD)result)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "textElement"), "elementRange");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

- (NSTextLayoutManager)init
{
  NSTextLayoutManager *v2;
  NSTextLayoutManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSTextLayoutManager;
  v2 = -[NSTextLayoutManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSTextLayoutManager _commonInit](v2, "_commonInit");
    v3->_usesHyphenation = objc_msgSend((id)objc_opt_class(), "usesHyphenation");
    v3->_rendersBackgroundColorAttribute = 1;
  }
  return v3;
}

- (void)_commonInit
{
  self->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
  self->_usesFontLeading = 1;
}

+ (BOOL)usesHyphenation
{
  if (usesHyphenation_onceToken != -1)
    dispatch_once(&usesHyphenation_onceToken, &__block_literal_global_71);
  return usesHyphenation_hyphenationEnabled;
}

uint64_t __38__NSTextLayoutManager_usesHyphenation__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSUsesDefaultHyphenation"));
  usesHyphenation_hyphenationEnabled = result;
  return result;
}

uint64_t __45__NSTextLayoutManager_setTextContentManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "textLayoutManager");
  if (result == *(_QWORD *)(a1 + 32))
    return objc_msgSend(a2, "setTextLayoutManager:", result);
  return result;
}

- (id)rangeForTextContainerAtIndex:(int64_t)a3
{
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  NSTextRange *textRange;

  objc_sync_enter(self);
  if (self->_textContainerEntriesCount <= a3)
  {
    p_lastTextContainerEntry = &self->_lastTextContainerEntry;
    if (self->_lastTextContainerEntry.textContainer)
      goto LABEL_5;
LABEL_6:
    textRange = 0;
    goto LABEL_7;
  }
  textContainerEntries = self->_textContainerEntries;
  if (!textContainerEntries)
    goto LABEL_6;
  p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&textContainerEntries[a3];
LABEL_5:
  textRange = p_lastTextContainerEntry->textRange;
LABEL_7:
  objc_sync_exit(self);
  return textRange;
}

- (void)setTextContainer:(NSTextContainer *)textContainer
{
  objc_sync_enter(self);
  -[NSTextLayoutManager _removeTextContainersToCondition:](self, "_removeTextContainersToCondition:", &__block_literal_global_112);
  -[NSTextLayoutManager _addTextContainer:](self, "_addTextContainer:", textContainer);
  objc_sync_exit(self);
}

- (void)_removeTextContainersToCondition:(id)a3
{
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  uint64_t v6;
  unint64_t textContainerEntriesCount;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  -[NSTextLayoutManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("textContainers"));
  objc_sync_enter(self);
  p_lastTextContainerEntry = &self->_lastTextContainerEntry;
  if (self->_lastTextContainerEntry.textContainer)
    v6 = -1;
  else
    v6 = 0;
  if (self->_textContainerEntriesCount != v6)
  {
    do
    {
      if (((*((uint64_t (**)(id))a3 + 2))(a3) & 1) != 0)
        break;
      __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
      textContainerEntriesCount = self->_textContainerEntriesCount;
      if (textContainerEntriesCount)
      {
        self->_textContainerEntriesCount = --textContainerEntriesCount;
        v8 = &self->_textContainerEntries[textContainerEntriesCount];
        *(_OWORD *)&p_lastTextContainerEntry->textContainer = *(_OWORD *)&v8->var0;
        v9 = *(_OWORD *)&v8->var2;
        v10 = *(_OWORD *)&v8->var3.origin.y;
        v11 = *(_OWORD *)&v8->var3.size.height;
        *(_QWORD *)&self->_lastTextContainerEntry.containerFilled = *(_QWORD *)&v8->var5;
        *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.origin.y = v10;
        *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.size.height = v11;
        *(_OWORD *)&self->_lastTextContainerEntry.textRange = v9;
        self->_textContainerEntriesAccessHint = 0;
      }
      v12 = p_lastTextContainerEntry->textContainer ? -1 : 0;
    }
    while (textContainerEntriesCount != v12);
  }

  self->_textContainers = 0;
  objc_sync_exit(self);
  -[NSTextLayoutManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("textContainers"));
}

- (void)_addTextContainer:(id)a3
{
  -[NSTextLayoutManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("textContainers"));
  objc_sync_enter(self);
  __NSTextLayoutManagerAddTextContainerEntry((uint64_t)self, a3);

  self->_textContainers = 0;
  objc_sync_exit(self);
  -[NSTextLayoutManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("textContainers"));
}

- (void)dealloc
{
  unint64_t i;
  unint64_t v4;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  objc_super v6;

  objc_storeWeak((id *)&self->_textContentManager, 0);
  __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
  for (i = self->_textContainerEntriesCount; i; i = self->_textContainerEntriesCount)
  {
    v4 = i - 1;
    self->_textContainerEntriesCount = v4;
    __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_textContainerEntries[v4]);
  }
  textContainerEntries = self->_textContainerEntries;
  if (textContainerEntries)
    NSZoneFree(0, textContainerEntries);

  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)NSTextLayoutManager;
  -[NSTextLayoutManager dealloc](&v6, sel_dealloc);
}

- (void)_invalidateLayoutForTextRange:(id)a3 hard:(BOOL)a4
{
  NSTextContentManager *v6;
  NSTextRange *v7;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v11;
  char *TextContainerEntryAndIndexForLocation;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSTextRange *v18;
  NSTextRange *v19;
  uint64_t v20;
  NSTextRange *v21;
  void *v22;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *p_lastTextContainerEntry;
  id var2;
  uint64_t v25;
  BOOL v26;
  int v27;
  BOOL v28;
  unint64_t var4;
  unint64_t v30;
  unint64_t textContainerEntriesCount;
  NSTextContainer *textContainer;
  unint64_t v33;
  $93589CBA8E1B80577C20324DFAADD895 *v34;
  NSTextRange *textRange;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSTextRange *v40;
  NSTextLocation *startLocation;
  NSTextLocation *v42;
  id v43;
  void *v44;
  void *v45;
  objc_class *v46;
  NSString *v47;
  int v48;
  size_t v49;
  uint64_t v50;
  $93589CBA8E1B80577C20324DFAADD895 *v51;
  NSTextContainer *v52;
  unint64_t v53;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  _BOOL4 v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  NSTextLocation *softInvalidationLocation;
  id v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL4 v69;
  _BOOL4 v70;
  int64_t v71;
  NSTextContentManager *v72;
  void *v73;
  _QWORD v74[5];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  _QWORD v81[6];
  _QWORD v82[8];
  BOOL v83;
  BOOL v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  uint64_t v90;
  _QWORD v91[3];
  char v92;
  _QWORD v93[6];

  v69 = a4;
  objc_sync_enter(self);
  v6 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  v7 = -[NSTextContentManager documentRange](v6, "documentRange");
  v8 = -[_NSTextLayoutFragmentStorage adjustedTextRangeWithTextRange:adjustment:](self->_textLayoutFragmentStorage, "adjustedTextRangeWithTextRange:adjustment:", a3, 6);
  v9 = -[NSTextLayoutManager hasNonSimpleRectangularTextContainer](self, "hasNonSimpleRectangularTextContainer");
  if (v7)
    v10 = v69;
  else
    v10 = 0;
  v70 = v10;
  if (v8)
    v11 = v8;
  else
    v11 = a3;
  v73 = v11;
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, (void *)objc_msgSend(v11, "location"));
  v72 = v6;
  if (TextContainerEntryAndIndexForLocation)
  {
    v13 = *((_QWORD *)TextContainerEntryAndIndexForLocation + 7);
    if (v9)
    {
      v14 = objc_msgSend(*((id *)TextContainerEntryAndIndexForLocation + 2), "location");
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke;
      v93[3] = &unk_1E2603A80;
      v93[4] = v14;
      -[NSTextLayoutManager _removeTextContainersToCondition:](self, "_removeTextContainersToCondition:", v93);
    }
  }
  else
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  v92 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3052000000;
  v88 = __Block_byref_object_copy__2;
  v89 = __Block_byref_object_dispose__2;
  v90 = 0;
  v15 = objc_msgSend(v73, "location");
  v82[0] = MEMORY[0x1E0C809B0];
  if (v69)
    v16 = 0;
  else
    v16 = 2;
  v82[1] = 3221225472;
  v82[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_2;
  v82[3] = &unk_1E2603AA8;
  v83 = v9;
  v84 = v69;
  v82[6] = v91;
  v82[7] = &v85;
  v82[4] = v73;
  v82[5] = self;
  -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v15, v16, v82);
  v17 = v86[5];
  if (v69)
  {
    if (!v17)
    {
      v18 = v73;
      goto LABEL_19;
    }
  }
  else if (!v17)
  {
    goto LABEL_90;
  }
  v19 = [NSTextRange alloc];
  v20 = objc_msgSend(v73, "location");
  v18 = -[NSTextRange initWithLocation:endLocation:](v19, "initWithLocation:endLocation:", v20, v86[5]);
LABEL_19:
  v21 = v18;
  v71 = -[_NSTextLayoutFragmentStorage offsetDeltaForLastTextLayoutFragment](self->_textLayoutFragmentStorage, "offsetDeltaForLastTextLayoutFragment");
  if (v86[5])
    v22 = 0;
  else
    v22 = &__block_literal_global_120;
  __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v21, (uint64_t)v22);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_lastTextContainerEntry = ($CD956B2ACB38B728AB2E3DF9A3B345A0 *)__NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, (void *)objc_msgSend(v73, "location"));
    goto LABEL_26;
  }
  if (self->_textContainerEntriesCount > v13)
  {
    p_lastTextContainerEntry = &self->_textContainerEntries[v13];
LABEL_26:
    if (!p_lastTextContainerEntry)
      goto LABEL_85;
    goto LABEL_29;
  }
  p_lastTextContainerEntry = ($CD956B2ACB38B728AB2E3DF9A3B345A0 *)&self->_lastTextContainerEntry;
  if (!self->_lastTextContainerEntry.textContainer)
    goto LABEL_85;
LABEL_29:
  var2 = p_lastTextContainerEntry->var2;
  if (!var2)
    goto LABEL_85;
  v66 = a3;
  v25 = objc_msgSend((id)objc_msgSend(var2, "location"), "compare:", -[NSTextRange endLocation](v21, "endLocation"));
  v26 = v25 != -1;
  if ((objc_msgSend(p_lastTextContainerEntry->var2, "containsLocation:", -[NSTextRange endLocation](v21, "endLocation")) & 1) != 0)LOBYTE(v27) = 1;
  else
    LOBYTE(v27) = objc_msgSend((id)objc_msgSend(p_lastTextContainerEntry->var2, "endLocation"), "isEqual:", -[NSTextRange endLocation](v21, "endLocation"));
  v28 = v25 == 0;
  var4 = p_lastTextContainerEntry->var4;
  v30 = var4;
  v68 = 0x7FFFFFFFFFFFFFFFLL;
  v67 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    textContainerEntriesCount = self->_textContainerEntriesCount;
    textContainer = self->_lastTextContainerEntry.textContainer;
    v33 = textContainer ? textContainerEntriesCount + 1 : self->_textContainerEntriesCount;
    if (var4 >= v33)
      break;
    if (textContainerEntriesCount <= var4)
    {
      if (textContainer)
        v34 = &self->_lastTextContainerEntry;
      else
        v34 = 0;
      if ((v27 & 1) != 0)
      {
LABEL_46:
        v27 = 1;
        goto LABEL_47;
      }
    }
    else
    {
      v34 = ($93589CBA8E1B80577C20324DFAADD895 *)&self->_textContainerEntries[v30];
      if ((v27 & 1) != 0)
        goto LABEL_46;
    }
    if (-[NSTextRange containsLocation:](v34->textRange, "containsLocation:", -[NSTextRange endLocation](v21, "endLocation")))
    {
      goto LABEL_46;
    }
    v27 = objc_msgSend(-[NSTextRange endLocation](v34->textRange, "endLocation"), "isEqual:", -[NSTextRange endLocation](v21, "endLocation"));
    if (v28)
    {
      __NSTextLayoutManagerClearTextContainerEntry((uint64_t)v34);
      v38 = v68;
      if (v68 == 0x7FFFFFFFFFFFFFFFLL)
        v38 = var4;
      v67 = var4;
      v68 = v38;
    }
LABEL_47:
    textRange = v34->textRange;
    if (!v7)
    {

      v34->textRange = 0;
      v34->startLocation = 0;
      goto LABEL_75;
    }
    if (textRange)
    {
      if (v26)
      {
        v36 = -[NSTextContentManager locationFromLocation:withOffset:](v72, "locationFromLocation:withOffset:", -[NSTextRange location](v34->textRange, "location"), v71);
        if ((v27 & 1) == 0)
        {
          v37 = -[NSTextRange endLocation](textRange, "endLocation");
          goto LABEL_60;
        }
LABEL_58:
        v37 = -[NSTextContentManager locationFromLocation:withOffset:](v72, "locationFromLocation:withOffset:", -[NSTextRange endLocation](textRange, "endLocation"), v71);
      }
      else
      {
        v36 = -[NSTextRange location](v34->textRange, "location");
        if (v27)
          goto LABEL_58;
        v37 = -[NSTextRange location](v21, "location");
      }
LABEL_60:
      v39 = v37;
      if (v36)
      {
        if (!v37)
LABEL_64:
          v39 = -[NSTextRange endLocation](v7, "endLocation");
      }
      else
      {
        v36 = -[NSTextRange location](v7, "location");
        if (!v39)
          goto LABEL_64;
      }
      if (objc_msgSend(v36, "compare:", v39) == -1)
        v40 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v36, v39);
      else
        v40 = 0;

      v34->textRange = v40;
      if (v26)
      {
        startLocation = v34->startLocation;
        if (startLocation)
        {
          v42 = (NSTextLocation *)-[NSTextContentManager locationFromLocation:withOffset:](v72, "locationFromLocation:withOffset:", startLocation, v71);

          v34->startLocation = v42;
        }
      }
      if (v70)
      {
        v43 = -[NSTextContainer textViewportLayoutController](v34->textContainer, "textViewportLayoutController");
        v44 = (void *)objc_msgSend(v73, "location");
        v45 = (void *)objc_msgSend(v43, "viewportRange");
        if (v45)
        {
          if (objc_msgSend(v44, "compare:", objc_msgSend(v45, "location")) == -1)
            objc_msgSend(v43, "_resetLayout");
        }
      }
    }
LABEL_75:
    v34->containerFilled = 0;
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    if (v34->textRange && !-[NSTextRange containsRange:](v7, "containsRange:"))
    {
      v48 = 0;
    }
    else if (v34->startLocation)
    {
      v48 = -[NSTextRange containsLocation:](v7, "containsLocation:");
    }
    else
    {
      v48 = 1;
    }
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_4;
    v81[3] = &unk_1E2603AF0;
    ++v30;
    ++var4;
    v26 = 1;
    v81[4] = v7;
    v81[5] = v34;
    _UIFoundationAssert(self, v47, v48, v81);
    v28 = 1;
  }
  a3 = v66;
  if (v68 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v49 = 72 * (textContainerEntriesCount - (v67 + 1));
    self->_textContainerEntriesCount = v68 + ~v67 + textContainerEntriesCount;
    if (v49)
      memmove(&self->_textContainerEntries[v68], &self->_textContainerEntries[v67 + 1], v49);
  }
LABEL_85:
  if (v69)
  {
    v75 = 0;
    v76 = &v75;
    v77 = 0x3052000000;
    v78 = __Block_byref_object_copy__2;
    v79 = __Block_byref_object_dispose__2;
    v80 = 0;
    v50 = objc_msgSend(v73, "endLocation");
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_5;
    v74[3] = &unk_1E26039C0;
    v74[4] = &v75;
    -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v50, 2, v74);
    if (v76[5]
      || (softInvalidationLocation = self->_softInvalidationLocation) != 0
      && -[NSTextLocation compare:](softInvalidationLocation, "compare:", objc_msgSend(v73, "location")) != -1)
    {
      -[NSTextLayoutManager _setSoftInvalidationLocation:onlyIfUpstream:](self, "_setSoftInvalidationLocation:onlyIfUpstream:");
    }
    _Block_object_dispose(&v75, 8);
  }

LABEL_90:
  -[NSTextLayoutManager _invalidateTextParagraphForEmptyDocument](self, "_invalidateTextParagraphForEmptyDocument");
  v51 = &self->_lastTextContainerEntry;
  v52 = self->_lastTextContainerEntry.textContainer;
  if (-[_NSTextRunStorage isEmpty](self->_textLayoutFragmentStorage, "isEmpty"))
  {
    while (1)
    {
      v53 = self->_textContainerEntriesCount;
      if (!v53)
        break;
      textContainerEntries = self->_textContainerEntries;
      v55 = v53 - 1;
      self->_textContainerEntriesCount = v55;
      __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&textContainerEntries[v55]);
    }
    v51->textContainer = 0;
    __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
    v51->textContainer = v52;
  }
  else if (a3)
  {
    if (v69)
    {
      if (v7)
      {
        v56 = (void *)objc_msgSend(a3, "location");
        v57 = objc_msgSend(v56, "compare:", -[NSTextRange endLocation](v7, "endLocation"));
        if (v57 != 1)
        {
          v58 = -[_NSTextLayoutFragmentStorage textLayoutFragmentForTextLocation:allowsTrailingEdge:](self->_textLayoutFragmentStorage, "textLayoutFragmentForTextLocation:allowsTrailingEdge:", v56, 1);
          v59 = v58;
          if (v57 == -1
            && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v58, "textLineFragments"), "lastObject"), "isExtra"))
          {
            v59 = 0;
          }
          objc_msgSend(v59, "invalidateExtraLineFragment");
        }
      }
    }
  }
  if (v52)
    v60 = v70;
  else
    v60 = 0;
  if (v60)
  {
    if (objc_msgSend((id)objc_msgSend(v73, "location"), "compare:", -[NSTextRange endLocation](v7, "endLocation")) == -1)
      v61 = objc_msgSend(v73, "location");
    else
      v61 = -[NSTextRange endLocation](v7, "endLocation");
    v62 = (void *)v61;
    v63 = -[NSTextContainer textViewportLayoutController](v52, "textViewportLayoutController");
    v64 = (void *)objc_msgSend(v63, "viewportRange");
    if (v64 && objc_msgSend(v62, "compare:", objc_msgSend(v64, "location")) == -1)
      objc_msgSend(v63, "_resetLayout");
  }
  -[NSTextSelectionNavigation flushLayoutCache](self->_textSelectionNavigation, "flushLayoutCache");

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(v91, 8);
  objc_sync_exit(self);
}

- (void)setDelegate:(id)delegate
{
  char v5;
  char v6;

  objc_sync_enter(self);
  if (objc_loadWeak((id *)&self->_delegate) != delegate)
  {
    objc_storeWeak((id *)&self->_delegate, delegate);
    self->_delegateWithTextSelectionNotification = objc_opt_respondsToSelector() & 1;
    v5 = objc_opt_respondsToSelector();
    self->_delegateWithTextContainerQuery = v5 & 1;
    if ((v5 & 1) != 0)
      v6 = objc_opt_respondsToSelector();
    else
      v6 = 0;
    self->_delegateWithSimpleTextContainerQuery = v6 & 1;
    self->_delegateWithTruncationToken = objc_opt_respondsToSelector() & 1;
  }
  objc_sync_exit(self);
}

unint64_t __81__NSTextLayoutManager__textLineFragmentAtLocation_textLayoutFragment_rangeDelta___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t result;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;

  result = objc_msgSend(a2, "characterRange");
  if (!result)
    result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = v9 < result || v9 - result >= v8;
  if (!v10 || (v9 == result ? (v11 = *(_BYTE *)(a1 + 56) == 0) : (v11 = 1), !v11 ? (v12 = v8 == 0) : (v12 = 0), v12))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v8;
  }
  return result;
}

NSTextRange *__74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  void *v9;
  NSTextRange *result;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;

  if (a4)
    v9 = a4;
  else
    v9 = a3;
  result = (NSTextRange *)objc_msgSend(*(id *)(a1 + 32), "isEqual:", v9);
  if ((_DWORD)result)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a3;
    result = a4;
    v11 = *(_QWORD *)(a1 + 64);
LABEL_6:
    *(_QWORD *)(*(_QWORD *)(v11 + 8) + 40) = result;
    goto LABEL_9;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    result = (NSTextRange *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "endLocation"), "compare:", objc_msgSend(v9, "endLocation"));
    if (result == (NSTextRange *)-1)
    {
      v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "attributedString"), "string");
      v13 = *(_QWORD *)(a1 + 80) + *(_QWORD *)(a1 + 72);
      result = (NSTextRange *)objc_msgSend(v12, "characterAtIndex:", v13 - 1);
      if ((int)result > 132)
      {
        if (((_DWORD)result - 8232) >= 2 && (_DWORD)result != 133)
          goto LABEL_9;
      }
      else if ((_DWORD)result != 10 && (_DWORD)result != 12)
      {
        if ((_DWORD)result != 13)
          goto LABEL_9;
        if (v13 < objc_msgSend(0, "length"))
        {
          result = (NSTextRange *)objc_msgSend(0, "characterAtIndex:", v13);
          if ((_DWORD)result == 10)
            goto LABEL_9;
        }
      }
      v14 = objc_msgSend(*(id *)(a1 + 48), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 80) - 1, 0, 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 40);
      result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "location"), v14);
      v11 = *(_QWORD *)(a1 + 56);
      goto LABEL_6;
    }
  }
LABEL_9:
  *a5 = 1;
  return result;
}

- (void)ensureLayoutForBounds:(CGRect)bounds
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  NSTextRange *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[9];
  _QWORD v13[9];
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v8 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange");
  objc_sync_enter(self);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v9 = -[NSTextRange endLocation](v8, "endLocation");
  v14 = 0;
  __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, 0, y + height);
  v10 = -[NSTextLayoutManager _estimatedTextLocationForVerticalOffset:originLocation:originOffset:deltaFromOffset:](self, "_estimatedTextLocationForVerticalOffset:originLocation:originOffset:deltaFromOffset:", 0, &v14, y, 0.0);
  v16[5] = (uint64_t)v10;
  v11 = MEMORY[0x1E0C809B0];
  if (!v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke;
    v13[3] = &unk_1E2603B18;
    *(CGFloat *)&v13[5] = x;
    *(double *)&v13[6] = y;
    *(CGFloat *)&v13[7] = width;
    *(double *)&v13[8] = height;
    v13[4] = &v15;
    -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v9, 13, v13);
    v10 = (id)v16[5];
  }
  v12[0] = v11;
  v12[1] = 3221225472;
  v12[2] = __45__NSTextLayoutManager_ensureLayoutForBounds___block_invoke_2;
  v12[3] = &unk_1E2603B40;
  *(CGFloat *)&v12[5] = x;
  *(double *)&v12[6] = y;
  *(CGFloat *)&v12[7] = width;
  *(double *)&v12[8] = height;
  v12[4] = v9;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v10, 12, v12);
  __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, 0, y + height);
  _Block_object_dispose(&v15, 8);
  objc_sync_exit(self);
}

- (id)_estimatedTextLocationForVerticalOffset:(double)a3 originLocation:(id)a4 originOffset:(double)a5 deltaFromOffset:(double *)a6
{
  id v10;
  id *TextContainerEntryAndIndexForLocation;
  id *v12;
  uint64_t LayoutFragmentForPosition;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  NSTextContentManager *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD *v35;
  _QWORD v36[5];
  _QWORD v37[16];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[5];
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  uint64_t v64;

  v59 = 0;
  v60 = &v59;
  v61 = 0x3052000000;
  v62 = __Block_byref_object_copy__2;
  v63 = __Block_byref_object_dispose__2;
  v64 = 0;
  v10 = a4;
  if (!a4)
    v10 = -[NSTextRange location](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "location");
  v53 = 0;
  v54 = &v53;
  v55 = 0x3052000000;
  v56 = __Block_byref_object_copy__2;
  v57 = __Block_byref_object_dispose__2;
  v58 = 0;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  TextContainerEntryAndIndexForLocation = (id *)__NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, v10);
  v12 = TextContainerEntryAndIndexForLocation;
  if (TextContainerEntryAndIndexForLocation)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3052000000;
    v46 = __Block_byref_object_copy__2;
    v47 = __Block_byref_object_dispose__2;
    v48 = 0;
    if (a4)
    {
      if (objc_msgSend(TextContainerEntryAndIndexForLocation[2], "containsLocation:", v10))
      {
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke;
        v42[3] = &unk_1E2603998;
        v42[4] = &v43;
        v42[5] = v12;
        -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v10, 0, v42);
      }
    }
    else
    {
      LayoutFragmentForPosition = __NSTextLayoutManagerGetLayoutFragmentForPosition(self, TextContainerEntryAndIndexForLocation, 1, 0.0, a3);
      v44[5] = LayoutFragmentForPosition;
    }
    v14 = (void *)v44[5];
    if (v14)
    {
      objc_msgSend(v14, "layoutFragmentFrame");
      v16 = v15;
      v18 = v17;
      v19 = objc_msgSend((id)objc_msgSend((id)v44[5], "rangeInElement"), "endLocation");
      v10 = (id)v19;
      a5 = v16 + v18;
      v20 = v54;
      if (a5 > a3)
      {
        v54[5] = v19;
        v50[3] = v16 - a3;
      }
    }
    else
    {
      v20 = v54;
    }
    if (!v20[5] && objc_msgSend(v12[2], "isNotEmpty"))
    {
      v21 = v12[2];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_2;
      v41[3] = &unk_1E26039C0;
      v41[4] = &v59;
      if (objc_msgSend((id)objc_msgSend(v21, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(v21, "location"), 2, v41);
      else
        -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", v21, 2, v41);
    }
    _Block_object_dispose(&v43, 8);
  }
  v22 = -[NSTextLayoutManager textContentManager](self, "textContentManager", a6);
  v23 = -[NSTextRange endLocation](-[NSTextContentManager documentRange](v22, "documentRange"), "endLocation");
  v24 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfSeedElements");
  v25 = objc_msgSend((id)objc_msgSend((id)v60[5], "rangeInElement"), "location");
  if (!v54[5])
  {
    v28 = (void *)v25;
    do
    {
      if (objc_msgSend(v10, "compare:", v23) != -1)
        break;
      v43 = 0;
      v44 = &v43;
      v45 = 0x3052000000;
      v46 = __Block_byref_object_copy__2;
      v47 = __Block_byref_object_dispose__2;
      v48 = 0;
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v40[3] = 0;
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      v39[3] = 0;
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x2020000000;
      v38[3] = 0;
      if (!v28 || (objc_msgSend(v10, "isEqual:", v28) & 1) == 0)
      {
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_3;
        v37[3] = &unk_1E2603A10;
        v37[4] = v28;
        v37[5] = self;
        v37[8] = v38;
        v37[9] = v40;
        *(double *)&v37[14] = a5;
        *(double *)&v37[15] = a3;
        v37[10] = v39;
        v37[11] = &v53;
        v37[12] = &v49;
        v37[13] = v24;
        v37[6] = v22;
        v37[7] = &v43;
        v10 = -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](v22, "enumerateTextElementsFromLocation:options:usingBlock:", v10, 0, v37);

      }
      if (!v54[5])
      {
        v29 = (void *)v60[5];
        if (v29)
        {
          objc_msgSend(v29, "layoutFragmentFrame");
          v31 = v30;
          v33 = v32;
          if (!self->_softInvalidationLocation || objc_msgSend(v28, "compare:") == -1)
            a5 = v31 + v33;
          if (a5 <= a3)
          {
            v10 = (id)objc_msgSend((id)objc_msgSend((id)v60[5], "rangeInElement"), "endLocation");
            v60[5] = 0;
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_5;
            v36[3] = &unk_1E26039C0;
            v36[4] = &v59;
            -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v10, 2, v36);
            v28 = (void *)objc_msgSend((id)objc_msgSend((id)v60[5], "rangeInElement"), "location");
          }
          else
          {
            v54[5] = (uint64_t)v28;
            v50[3] = v31 - a3;
          }
        }
      }
      _Block_object_dispose(v38, 8);
      _Block_object_dispose(v39, 8);
      _Block_object_dispose(v40, 8);
      _Block_object_dispose(&v43, 8);
    }
    while (!v54[5]);
  }
  if (v35)
    *v35 = *((_QWORD *)v50 + 3);
  v26 = (void *)v54[5];
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  return v26;
}

+ (int64_t)maximumNumberOfSeedElements
{
  return 20;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textContentManager);
}

- (void)setRequiresCTLineRef:(BOOL)a3
{
  self->_requiresCTLineRef = a3;
}

uint64_t __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  if (result)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

id __45__NSTextLayoutManager__extraTextLineFragment__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id result;
  void *v8;
  uint64_t v9;

  result = (id)objc_msgSend((id)objc_msgSend(a3, "endLocation"), "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = (id)objc_msgSend(a2, "state");
    if (result == (id)3)
    {
      v8 = (void *)objc_msgSend(a2, "textLineFragments");
      result = (id)objc_msgSend(v8, "count");
      if ((unint64_t)result >= 2)
      {
        result = (id)objc_msgSend((id)objc_msgSend(v8, "lastObject"), "characterRange");
        if (!v9)
        {
          result = (id)objc_msgSend(v8, "lastObject");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
        }
      }
    }
  }
  *a4 = 1;
  return result;
}

BOOL __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int8x16_t v33;
  __int128 v34;

  v4 = (void *)objc_msgSend(a2, "elementRange");
  v5 = v4;
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend((id)objc_msgSend(v4, "location"), "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    return 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)objc_msgSend(v5, "location");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(_QWORD *)(v6 + 24) + 1;
  *(_QWORD *)(v6 + 24) = v7;
  if (v7 < *(_QWORD *)(a1 + 104))
  {
    objc_msgSend(a2, "estimatedIntrinsicContentSizeForTextLayoutManager:", *(_QWORD *)(a1 + 40));
    v9 = v8;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(double *)(v10 + 24);
    v12 = *(double *)(a1 + 120);
    v13 = v8 + *(double *)(a1 + 112) + v11;
    v14 = v13 <= v12;
    if (v13 > v12)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 112)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                              + 24)
                                                                  - *(double *)(a1 + 120);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v11 = *(double *)(v10 + 24);
    }
    v15 = v9 + v11;
    goto LABEL_13;
  }
  v16 = objc_msgSend(*(id *)(a1 + 40), "offsetFromLocation:toLocation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), objc_msgSend(v5, "endLocation"));
  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (!v17)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "offsetFromLocation:toLocation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40), objc_msgSend(v5, "location"));
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v19 = *(double *)(a1 + 112);
  v20 = *(double *)(a1 + 120);
  if (v19 + v18 * ((double)v16 / (double)v17) <= v20)
  {
    v22 = objc_msgSend(*(id *)(a1 + 48), "locationFromLocation:withOffset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (unint64_t)((v20 - v19) * (double)v17 / v18));
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_4;
    v28[3] = &unk_1E26039E8;
    v23 = *(_QWORD *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 88);
    v25 = *(_QWORD *)(a1 + 96);
    v29 = *(id *)(a1 + 48);
    v30 = v24;
    v31 = v23;
    v32 = v25;
    v26 = *(_OWORD *)(a1 + 112);
    v33 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v34 = v26;
    objc_msgSend(v29, "enumerateTextElementsFromLocation:options:usingBlock:", v22, 1, v28);
    return 0;
  }
  v21 = objc_msgSend(*(id *)(a1 + 40), "offsetFromLocation:toLocation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), objc_msgSend(v5, "location"));
  v14 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
  v15 = *(double *)(a1 + 112)
      + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
      * ((double)v21
       / (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      - *(double *)(a1 + 120);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
LABEL_13:
  *(double *)(v10 + 24) = v15;
  return v14;
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)viewProviderForTextAttachment:(id)a3 location:(id)a4
{
  return -[NSTextLayoutFragment textAttachmentViewProviderForLocation:](-[NSTextLayoutManager textLayoutFragmentForLocation:](self, "textLayoutFragmentForLocation:", a4), "textAttachmentViewProviderForLocation:", a4);
}

- (NSTextLayoutFragment)textLayoutFragmentForLocation:(id)location
{
  NSTextLayoutFragment *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__NSTextLayoutManager_textLayoutFragmentForLocation___block_invoke;
  v5[3] = &unk_1E2603B90;
  v5[4] = location;
  v5[5] = &v6;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", location, 0, v5);
  v3 = (NSTextLayoutFragment *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSTextContainer)templateTextContainer
{
  return (NSTextContainer *)objc_getProperty(self, a2, 288, 1);
}

- (void)setViewProvider:(id)a3 forTextAttachment:(id)a4 location:(id)a5
{
  -[NSTextLayoutFragment setTextAttachmentProvider:forLocation:](-[NSTextLayoutManager textLayoutFragmentForLocation:](self, "textLayoutFragmentForLocation:", a5, a4), "setTextAttachmentProvider:forLocation:", a3, a5);
}

- (id)adjustedTextSelectionsForEditingContextFromTextSelections:(id)a3
{
  NSTextContentManager *v5;
  id v6;
  _QWORD v8[6];

  -[NSTextLayoutManager textContentManager](self, "textContentManager");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v5 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  if (!-[NSTextContentManager adjustedRangeFromRange:forEditingTextSelection:](v5, "adjustedRangeFromRange:forEditingTextSelection:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "textRanges"), "lastObject"), 1))return 0;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__NSTextLayoutManager_adjustedTextSelectionsForEditingContextFromTextSelections___block_invoke;
  v8[3] = &unk_1E2603F18;
  v8[4] = v5;
  v8[5] = v6;
  objc_msgSend(a3, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
  return v6;
}

- (id)_viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5 textContainer:(id)a6
{
  id v11;

  v11 = -[NSTextLayoutManager viewProviderForTextAttachment:location:](self, "viewProviderForTextAttachment:location:", a3, a5);
  if (!v11)
  {
    v11 = (id)objc_msgSend(a3, "viewProviderForParentView:location:textContainer:", a4, a5, a6);
    if (v11)
      -[NSTextLayoutManager setViewProvider:forTextAttachment:location:](self, "setViewProvider:forTextAttachment:location:", v11, a3, a5);
  }
  return v11;
}

- (NSTextLineFragment)_extraTextLineFragment
{
  id v3;
  NSTextLineFragment *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v3 = -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__NSTextLayoutManager__extraTextLineFragment__block_invoke;
  v6[3] = &unk_1E2603BB8;
  v6[4] = v3;
  v6[5] = &v7;
  -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v3, 1, v6);
  v4 = (NSTextLineFragment *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (double)_estimatedVerticalSizeForTextRange:(id)a3 adjustedTextRange:(id *)a4
{
  NSTextContentManager *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSTextRange *v14;
  uint64_t v15;
  uint64_t v16;
  NSTextRange *v17;
  double v18;
  _QWORD v20[11];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  _QWORD v33[4];
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;

  v7 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v8 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfSeedElements");
  v9 = objc_msgSend(a3, "location");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__NSTextLayoutManager__estimatedVerticalSizeForTextRange_adjustedTextRange___block_invoke;
  v20[3] = &unk_1E26038E8;
  v20[6] = v33;
  v20[7] = &v27;
  v20[4] = a3;
  v20[5] = self;
  v20[8] = &v34;
  v20[9] = &v21;
  v20[10] = v8;
  -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](v7, "enumerateTextElementsFromLocation:options:usingBlock:", v9, 0, v20);
  v10 = (void *)v22[5];
  if (v10 && objc_msgSend(v10, "compare:", objc_msgSend(a3, "endLocation")) == -1)
  {
    v11 = v28[5];
    if (!v11)
      v11 = objc_msgSend(a3, "location");
    v12 = -[NSTextContentManager offsetFromLocation:toLocation:](v7, "offsetFromLocation:toLocation:", v11, v22[5]);
    if (v12)
    {
      v13 = -[NSTextContentManager offsetFromLocation:toLocation:](v7, "offsetFromLocation:toLocation:", objc_msgSend(a3, "location"), objc_msgSend(a3, "endLocation"));
      v35[3] = (double)v13 / (double)v12 * v35[3];
    }
  }
  if (v22[5] || v28[5])
  {
    if (a4)
    {
      v14 = [NSTextRange alloc];
      v15 = v28[5];
      if (!v15)
        v15 = objc_msgSend(a3, "location");
      v16 = v22[5];
      if (!v16)
        v16 = objc_msgSend(a3, "endLocation");
      v17 = -[NSTextRange initWithLocation:endLocation:](v14, "initWithLocation:endLocation:", v15, v16);
    }
    else
    {
      v17 = 0;
    }

    if (v17)
      *a4 = v17;
  }
  v18 = v35[3];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);
  return v18;
}

- (void)_addTextContainerForLocation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (self->_delegateWithTextContainerQuery)
    v4 = (void *)objc_msgSend(-[NSTextLayoutManager delegate](self, "delegate"), "textLayoutManager:textContainerForLocation:", self, a3);
  else
    v4 = 0;
  v5 = v4;
  if (v5
    || (v5 = (id)-[NSTextContainer copy](-[NSTextLayoutManager templateTextContainer](self, "templateTextContainer"), "copy")) != 0)
  {
    v6 = v5;
    -[NSTextLayoutManager _addTextContainer:](self, "_addTextContainer:", v5);

  }
}

- (BOOL)_hasLayoutForLocation:(id)a3
{
  return -[_NSTextLayoutFragmentStorage textLayoutFragmentForTextLocation:allowsTrailingEdge:](self->_textLayoutFragmentStorage, "textLayoutFragmentForTextLocation:allowsTrailingEdge:", a3, 0) != 0;
}

+ (BOOL)_throwsOnAssertionError
{
  int v2;

  v2 = __NSTextLayoutManagerThrowsExceptionOnAssertionError;
  if (__NSTextLayoutManagerThrowsExceptionOnAssertionError < 0)
  {
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("__NSTextLayoutManagerThrowsExceptionOnAssertionError"));
    __NSTextLayoutManagerThrowsExceptionOnAssertionError = v2;
  }
  return v2 != 0;
}

+ (void)_setThrowsOnAssertionError:(BOOL)a3
{
  __NSTextLayoutManagerThrowsExceptionOnAssertionError = a3;
}

+ (BOOL)_validatesInternalCaches
{
  int v2;

  v2 = __NSTextLayoutManagerValidatesInternalCaches;
  if (__NSTextLayoutManagerValidatesInternalCaches < 0)
  {
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("__NSTextLayoutManagerValidatesInternalCaches"));
    __NSTextLayoutManagerValidatesInternalCaches = v2;
  }
  return v2 != 0;
}

+ (void)_setValidatesInternalCaches:(BOOL)a3
{
  __NSTextLayoutManagerValidatesInternalCaches = a3;
}

- (BOOL)_validateTextContainerEntries
{
  int v3;
  unint64_t textContainerEntriesSize;
  BOOL v5;
  unint64_t textContainerEntriesCount;
  BOOL v7;
  char v8;
  BOOL result;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntriesAccessHint;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  unint64_t v12;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *v13;
  BOOL v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_msgSend((id)objc_opt_class(), "_throwsOnAssertionError");
  textContainerEntriesSize = self->_textContainerEntriesSize;
  v5 = (textContainerEntriesSize == 0) ^ (self->_textContainerEntries != 0);
  if ((textContainerEntriesSize == 0) == (self->_textContainerEntries != 0) && ((v3 ^ 1) & 1) == 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSTextLayoutManager _validateTextContainerEntries]"), CFSTR("NSTextLayoutManager.m"), 695, CFSTR("_textContainerEntries inconsistency, _textContainerEntries:%p, _textContainerEntriesSize:%lu"), self->_textContainerEntries, self->_textContainerEntriesSize);
    textContainerEntriesSize = self->_textContainerEntriesSize;
  }
  textContainerEntriesCount = self->_textContainerEntriesCount;
  v7 = textContainerEntriesCount >= textContainerEntriesSize;
  if (textContainerEntriesCount >= textContainerEntriesSize)
    v8 = 1;
  else
    v8 = v3 ^ 1;
  result = v7 && v5;
  if ((v8 & 1) == 0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSTextLayoutManager _validateTextContainerEntries]"), CFSTR("NSTextLayoutManager.m"), 701, CFSTR("_textContainerEntriesSize inconsistency, _textContainerEntriesSize:%lu, _textContainerEntriesCount:%lu"), self->_textContainerEntriesSize, self->_textContainerEntriesCount);
    result = 0;
  }
  textContainerEntriesAccessHint = self->_textContainerEntriesAccessHint;
  if (textContainerEntriesAccessHint)
  {
    textContainerEntries = self->_textContainerEntries;
    if (textContainerEntriesAccessHint < textContainerEntries)
    {
      if (!v3)
        return 0;
LABEL_26:
      v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSTextLayoutManager _validateTextContainerEntries]"), CFSTR("NSTextLayoutManager.m"), 707, CFSTR("_textContainerEntriesAccessHint inconsistency, _textContainerEntriesAccessHint:%p, _textContainerEntries:%p, _textContainerEntriesCount:%lu, (_textContainerEntriesAccessHint - _textContainerEntries):%ld"), self->_textContainerEntriesAccessHint, self->_textContainerEntries, self->_textContainerEntriesCount, 0x8E38E38E38E38E39* (((char *)self->_textContainerEntriesAccessHint - (char *)self->_textContainerEntries) >> 3));
      return 0;
    }
    v12 = self->_textContainerEntriesCount;
    v13 = &textContainerEntries[v12];
    if (v12)
      v14 = v13 > textContainerEntriesAccessHint;
    else
      v14 = 1;
    if (v14)
      v15 = 1;
    else
      v15 = v3 ^ 1;
    if (!v14)
      result = 0;
    if ((v15 & 1) == 0)
      goto LABEL_26;
  }
  return result;
}

- (id)_currentTextLayoutFragmentEnumerated
{
  $2B150901B53E279622BCD82FC26F074A *activeEnumerationCache;

  activeEnumerationCache = self->_activeEnumerationCache;
  if (activeEnumerationCache)
    return activeEnumerationCache->var0;
  else
    return 0;
}

- (int64_t)_numberOfLinesToCurrentlyEnumeratedTextLayoutFragment
{
  $2B150901B53E279622BCD82FC26F074A *activeEnumerationCache;

  activeEnumerationCache = self->_activeEnumerationCache;
  if (activeEnumerationCache && activeEnumerationCache->var0)
    return activeEnumerationCache->var3;
  else
    return 0;
}

- (id)_textContainerForCurrentEnumeratedElement
{
  $2B150901B53E279622BCD82FC26F074A *activeEnumerationCache;

  activeEnumerationCache = self->_activeEnumerationCache;
  if (activeEnumerationCache && activeEnumerationCache->var6)
    return activeEnumerationCache->var5;
  else
    return 0;
}

+ (Class)companionLayoutManagerClass
{
  return (Class)objc_opt_class();
}

- (id)companionLayoutManager
{
  objc_sync_enter(self);
  if (!self->_companion)
    self->_companion = (NSLayoutManager *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "companionLayoutManagerClass"));
  objc_sync_exit(self);
  return self->_companion;
}

+ (id)validRenderingAttributes
{
  if (validRenderingAttributes_onceToken != -1)
    dispatch_once(&validRenderingAttributes_onceToken, &__block_literal_global_69);
  return (id)validRenderingAttributes_renderingAttributes;
}

uint64_t __47__NSTextLayoutManager_validRenderingAttributes__block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  result = objc_msgSend(v0, "initWithObjects:", CFSTR("NSColor"), CFSTR("NSBackgroundColor"), CFSTR("NSShadow"), CFSTR("NSTextEffect"), CFSTR("NSLink"), CFSTR("NSTextAlternatives"), CFSTR("NSSpellingState"), CFSTR("NSTextAlternativesDisplayStyle"), NSTemporaryTextCorrectionAttributeName, 0);
  validRenderingAttributes_renderingAttributes = result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextLayoutManager)initWithCoder:(NSCoder *)coder
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  int16x8_t v8;
  id v9;

  -[NSTextLayoutManager _commonInit](self, "_commonInit");
  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v5 = -[NSCoder decodeInt32ForKey:](coder, "decodeInt32ForKey:", CFSTR("NS.flags"));
    -[NSTextLayoutManager setDelegate:](self, "setDelegate:", -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NS.delegate")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    -[NSTextLayoutManager setTextContentManager:](self, "setTextContentManager:", -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), CFSTR("NS.textContentManager")));
    -[NSTextLayoutManager setTemplateTextContainer:](self, "setTemplateTextContainer:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.templateTextContainer")));
    -[NSTextLayoutManager setLayoutQueue:](self, "setLayoutQueue:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.layoutQueue")));
    self->_usesFontLeading = v5 & 1;
    v8.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(v5) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)&self->_limitsLayoutForSuspiciousContents = vmovn_s16(v8).u32[0];
    v9 = -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NS.firstTextContainer"));
    if (v9)
      __NSTextLayoutManagerAddTextContainerEntry((uint64_t)self, v9);
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSTextContentManager *v5;
  id v6;
  NSTextContainer *templateTextContainer;
  NSOperationQueue *layoutQueue;
  unsigned int usesFontLeading;
  uint64_t v10;
  _QWORD *p_textContainer;
  NSTextContainer *textContainer;
  unint64_t textContainerEntriesCount;
  uint64_t v14;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
    v6 = -[NSTextLayoutManager delegate](self, "delegate");
    if (v6)
      objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.delegate"));
    if (v5)
      objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NS.textContentManager"));
    templateTextContainer = self->_templateTextContainer;
    if (templateTextContainer)
      objc_msgSend(a3, "encodeObject:forKey:", templateTextContainer, CFSTR("NS.templateTextContainer"));
    layoutQueue = self->_layoutQueue;
    if (layoutQueue)
      objc_msgSend(a3, "encodeObject:forKey:", layoutQueue, CFSTR("NS.layoutQueue"));
    usesFontLeading = self->_usesFontLeading;
    if (self->_limitsLayoutForSuspiciousContents)
      usesFontLeading |= 2u;
    if (self->_usesHyphenation)
      usesFontLeading |= 4u;
    if (self->_allowsFontSubstitutionAffectingVerticalMetrics)
      usesFontLeading |= 8u;
    if (self->_breaksLinesForInteractiveText)
      v10 = usesFontLeading | 0x10;
    else
      v10 = usesFontLeading;
    if ((_DWORD)v10)
      objc_msgSend(a3, "encodeInt32:forKey:", v10, CFSTR("NS.flags"));
    p_textContainer = &self->_lastTextContainerEntry.textContainer;
    textContainer = self->_lastTextContainerEntry.textContainer;
    textContainerEntriesCount = self->_textContainerEntriesCount;
    if (textContainer)
      v14 = -1;
    else
      v14 = 0;
    if (textContainerEntriesCount != v14)
    {
      if (textContainerEntriesCount)
      {
        p_textContainer = &self->_textContainerEntries->var0;
      }
      else if (!textContainer)
      {
        p_textContainer = 0;
      }
      if (*p_textContainer)
        objc_msgSend(a3, "encodeObject:forKey:", *p_textContainer, CFSTR("NS.firstTextContainer"));
    }
  }
}

- (void)setUsesHyphenation:(BOOL)usesHyphenation
{
  _BOOL4 v3;

  v3 = usesHyphenation;
  objc_sync_enter(self);
  if (self->_usesHyphenation != v3)
  {
    self->_usesHyphenation = v3;
    -[NSTextLayoutManager invalidateLayoutForRange:](self, "invalidateLayoutForRange:", -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"));
  }
  objc_sync_exit(self);
}

- (void)setAllowsFontSubstitutionAffectingVerticalMetrics:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  objc_sync_enter(self);
  if (self->_allowsFontSubstitutionAffectingVerticalMetrics != v3)
  {
    self->_allowsFontSubstitutionAffectingVerticalMetrics = v3;
    -[NSTextLayoutManager invalidateLayoutForRange:](self, "invalidateLayoutForRange:", -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"));
  }
  objc_sync_exit(self);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("textSelections")) & 1) != 0)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSTextLayoutManager;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)replaceTextContentManager:(NSTextContentManager *)textContentManager
{
  NSTextLayoutManager *v5;

  objc_sync_enter(self);
  v5 = self;
  -[NSTextContentManager removeTextLayoutManager:](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "removeTextLayoutManager:", self);
  -[NSTextContentManager addTextLayoutManager:](textContentManager, "addTextLayoutManager:", self);

  objc_sync_exit(self);
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  objc_sync_enter(self);
  if (!a3)
    a3 = _NSTextScalingTypeForCurrentEnvironment();
  self->_applicationFrameworkContext = a3;
  objc_sync_exit(self);
}

- (void)_removeTextContainer
{
  uint64_t v3;
  unint64_t textContainerEntriesCount;
  unint64_t v5;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  objc_sync_enter(self);
  if (self->_lastTextContainerEntry.textContainer)
    v3 = -1;
  else
    v3 = 0;
  if (self->_textContainerEntriesCount != v3)
  {
    __NSTextLayoutManagerClearTextContainerEntry((uint64_t)&self->_lastTextContainerEntry);
    textContainerEntriesCount = self->_textContainerEntriesCount;
    if (textContainerEntriesCount)
    {
      v5 = textContainerEntriesCount - 1;
      self->_textContainerEntriesCount = v5;
      v6 = &self->_textContainerEntries[v5];
      *(_OWORD *)&self->_lastTextContainerEntry.textContainer = *(_OWORD *)&v6->var0;
      v7 = *(_OWORD *)&v6->var2;
      v8 = *(_OWORD *)&v6->var3.origin.y;
      v9 = *(_OWORD *)&v6->var3.size.height;
      *(_QWORD *)&self->_lastTextContainerEntry.containerFilled = *(_QWORD *)&v6->var5;
      *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.origin.y = v8;
      *(_OWORD *)&self->_lastTextContainerEntry.usageBounds.size.height = v9;
      *(_OWORD *)&self->_lastTextContainerEntry.textRange = v7;
      self->_textContainerEntriesAccessHint = 0;
    }

    self->_textContainers = 0;
  }
  objc_sync_exit(self);
}

- (BOOL)allowsAddingTextContainer
{
  id *TextContainerEntryAtIndex;
  _BOOL4 v4;
  BOOL result;

  TextContainerEntryAtIndex = (id *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(self, 0x7FFFFFFFFFFFFFFFuLL, 1);
  v4 = -[NSTextLayoutManager usesContiguousLayout](self, "usesContiguousLayout");
  result = 0;
  if (v4)
  {
    if (TextContainerEntryAtIndex)
      return objc_msgSend(*TextContainerEntryAtIndex, "lineBreakMode") < 2;
  }
  return result;
}

uint64_t __40__NSTextLayoutManager_setTextContainer___block_invoke()
{
  return 0;
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsLocation:", objc_msgSend(a3, "location"));
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_4(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 80)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24)
                                                              * ((double)objc_msgSend(*(id *)(a1 + 32), "offsetFromLocation:toLocation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 40))/ (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)+ 8)+ 24))- *(double *)(a1 + 88);
  return 0;
}

uint64_t __107__NSTextLayoutManager__estimatedTextLocationForVerticalOffset_originLocation_originOffset_deltaFromOffset___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "state");
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)_estimatedTextLocationForVerticalOffset:(double)a3 originLocation:(id)a4 originOffset:(double)a5
{
  return -[NSTextLayoutManager _estimatedTextLocationForVerticalOffset:originLocation:originOffset:deltaFromOffset:](self, "_estimatedTextLocationForVerticalOffset:originLocation:originOffset:deltaFromOffset:", a4, 0, a3, a5);
}

- (id)renderingColorForDocumentColor:(id)a3 atLocation:(id)a4
{
  id v5;

  v5 = -[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:", a4);
  if (v5)
    return (id)objc_msgSend(v5, "renderingColorForDocumentColor:", a3);
  else
    return a3;
}

- (id)_fillSoftInvalidationToLocation:(id)a3 verticalOffset:(double)a4
{
  return (id)__NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)self, a3, a4);
}

uint64_t __67__NSTextLayoutManager_updateLayoutWithTextLayoutFragment_addition___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

BOOL __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "location") == *(_QWORD *)(a1 + 32);
}

BOOL __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "textElement"), "textContentManager") == 0;
}

uint64_t __58__NSTextLayoutManager__invalidateLayoutForTextRange_hard___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  const __CFString *v12;
  const __CFString *v13;

  if (NSTextLayoutManagerBreakOnNilContentManager_onceToken != -1)
    dispatch_once(&NSTextLayoutManagerBreakOnNilContentManager_onceToken, &__block_literal_global_4);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(uint64_t **)(a1 + 40);
  v7 = v5[7];
  v9 = v5[1];
  v8 = v5[2];
  v10 = *v5;
  v11 = NSStringFromRect(*(NSRect *)(v5 + 3));
  v12 = CFSTR("Y");
  if (*((_BYTE *)v5 + 64))
    v13 = CFSTR("Y");
  else
    v13 = CFSTR("N");
  if (!*((_BYTE *)v5 + 65))
    v12 = CFSTR("N");
  return objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: NSTextContainer range out of document range %@: %@"), a2, v6, objc_msgSend(v4, "stringWithFormat:", CFSTR("NSTextContainer entry %p: %@ %lu, textRange=%@, startLocation=%@, usageBounds=%@, filled=%@, anchored=%@"), v5, v10, v7, v8, v9, v11, v13, v12));
}

- (id)textLayoutFragmentForPosition:(CGPoint)a3 inTextContainerAtIndex:(int64_t)a4
{
  return -[NSTextLayoutManager textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:](self, "textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:", a4, 0, a3.x, a3.y);
}

- (NSTextLayoutFragment)textLayoutFragmentForPosition:(CGPoint)position
{
  return (NSTextLayoutFragment *)-[NSTextLayoutManager textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:](self, "textLayoutFragmentForPosition:inTextContainerAtIndex:avoidsAdditionalLayout:", 0x7FFFFFFFFFFFFFFFLL, 0, position.x, position.y);
}

- (id)textLayoutFragmentForPosition:(CGPoint)a3 inTextContainerAtIndex:(int64_t)a4 avoidsAdditionalLayout:(BOOL)a5
{
  double y;
  double x;
  $CD956B2ACB38B728AB2E3DF9A3B345A0 *textContainerEntries;
  NSTextLayoutManager *p_lastTextContainerEntry;
  NSTextLayoutManager *v12;
  NSTextRange *textContainers;
  uint64_t v14;
  void *v15;
  uint64_t LayoutFragmentForPosition;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  y = a3.y;
  x = a3.x;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  objc_sync_enter(self);
  if (v20[5])
    goto LABEL_21;
  if (self->_textContainerEntriesCount <= a4)
  {
    p_lastTextContainerEntry = (NSTextLayoutManager *)&self->_lastTextContainerEntry;
    if (self->_lastTextContainerEntry.textContainer)
      goto LABEL_6;
LABEL_21:
    objc_sync_exit(self);
    v15 = (void *)v20[5];
    goto LABEL_22;
  }
  textContainerEntries = self->_textContainerEntries;
  if (!textContainerEntries)
    goto LABEL_21;
  p_lastTextContainerEntry = (NSTextLayoutManager *)&textContainerEntries[a4];
LABEL_6:
  if (p_lastTextContainerEntry == (NSTextLayoutManager *)&self->_lastTextContainerEntry && !a5)
    -[NSTextLayoutManager ensureLayoutForBounds:](self, "ensureLayoutForBounds:", x, y, 1.0, 1.0);
  if (y > 0.0
    || (!self->_textContainerEntriesCount
      ? (self->_lastTextContainerEntry.textContainer
       ? (v12 = (NSTextLayoutManager *)&self->_lastTextContainerEntry)
       : (v12 = 0))
      : (v12 = (NSTextLayoutManager *)self->_textContainerEntries),
        v12 == p_lastTextContainerEntry
      ? (textContainers = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange")): (textContainers = (NSTextRange *)p_lastTextContainerEntry->_textContainers), (v14 = -[NSTextRange location](textContainers, "location")) == 0))
  {
    LayoutFragmentForPosition = __NSTextLayoutManagerGetLayoutFragmentForPosition(self, (id *)&p_lastTextContainerEntry->super.isa, 0, x, y);
    v20[5] = LayoutFragmentForPosition;
    goto LABEL_21;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__NSTextLayoutManager_textLayoutFragmentForPosition_inTextContainerAtIndex_avoidsAdditionalLayout___block_invoke;
  v18[3] = &unk_1E2603B68;
  v18[4] = &v19;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v14, 0, v18);
  v15 = (void *)v20[5];
  objc_sync_exit(self);
LABEL_22:
  _Block_object_dispose(&v19, 8);
  return v15;
}

uint64_t __99__NSTextLayoutManager_textLayoutFragmentForPosition_inTextContainerAtIndex_avoidsAdditionalLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

uint64_t __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > *(_QWORD *)(a1 + 40))
    *a4 = 1;
  return result;
}

BOOL __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  double MinY;

  v4 = (void *)objc_msgSend(a2, "rangeInElement");
  v5 = objc_msgSend(v4, "endLocation");
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "compare:", v5);
  if (v6 != -1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) += objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "count");
    v7 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(a2, "layoutFragmentFrame");
    if (v7)
      MinY = CGRectGetMinY(*(CGRect *)&v8);
    else
      MinY = CGRectGetMaxY(*(CGRect *)&v8);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = MinY;
    if (*(_BYTE *)(a1 + 48))
      v5 = objc_msgSend(v4, "location");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v5;
  }
  return v6 != -1;
}

uint64_t __83__NSTextLayoutManager_enumerateTextLayoutFragmentsFromLocation_options_usingBlock___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSTextRange *v11;

  if (!*(_BYTE *)(a1 + 72))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_msgSend(a2, "elementRange");
  v4 = v3;
  if (*(_BYTE *)(a1 + 73))
    v5 = objc_msgSend(v3, "endLocation");
  else
    v5 = objc_msgSend(v3, "location");
  v6 = (void *)v5;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v7)
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v9)
      goto LABEL_12;
    v7 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 73))
      goto LABEL_7;
LABEL_10:
    v8 = objc_msgSend(v7, "endLocation");
    goto LABEL_11;
  }
  if (!*(_BYTE *)(a1 + 73))
    goto LABEL_10;
LABEL_7:
  v8 = objc_msgSend(v7, "location");
LABEL_11:
  v9 = (void *)v8;
LABEL_12:
  if ((objc_msgSend(v6, "isEqual:", v9) & 1) == 0
    && (objc_msgSend(v4, "containsLocation:", v9) & 1) == 0
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsRange:", v4) & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 73))
      v10 = v6;
    else
      v10 = v9;
    if (*(_BYTE *)(a1 + 73))
      v6 = v9;
    v11 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v10, v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v4;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (CGSize)estimatedSizeForLastTextContainer
{
  id v3;
  id v4;
  uint64_t v5;
  NSTextRange *v6;
  id v7;
  NSTextRange *v8;
  CGFloat *v9;
  NSArray *v10;
  unint64_t v11;
  uint64_t v12;
  double v16;
  double v17;
  CGFloat Height;
  double v19;
  double v20;
  _QWORD v21[5];
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  CGFloat *v31;
  uint64_t v32;
  const char *v33;
  __int128 v34;
  CGSize result;

  v30 = 0;
  v31 = (CGFloat *)&v30;
  v32 = 0x3010000000;
  v33 = "";
  v34 = *MEMORY[0x1E0C9D820];
  v3 = -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation");
  v4 = v3;
  if (v3)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__2;
    v27 = __Block_byref_object_dispose__2;
    v28 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke;
    v22[3] = &unk_1E2603CF8;
    v22[4] = v3;
    v22[5] = v29;
    v22[6] = &v23;
    v22[7] = &v30;
    -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v3, 11, v22);
    if (!-[NSTextLayoutManager usesContiguousLayout](self, "usesContiguousLayout"))
    {
      v6 = [NSTextRange alloc];
      if (v24[5])
        v7 = (id)v24[5];
      else
        v7 = v4;
      v8 = -[NSTextRange initWithLocation:](v6, "initWithLocation:", v7);
      -[NSTextLayoutManager ensureLayoutForRange:](self, "ensureLayoutForRange:", v8);
      v21[0] = v5;
      v21[1] = 3221225472;
      v21[2] = __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke_2;
      v21[3] = &unk_1E2603D20;
      v21[4] = &v30;
      -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](self, "enumerateTextSegmentsInRange:type:options:usingBlock:", v8, 1, 1, v21);

    }
    v9 = v31;
    if (v31[4] > 0.0 && v31[5] <= 0.0)
    {
      if (-[NSTextLayoutManager usesContiguousLayout](self, "usesContiguousLayout") || v24[5])
      {
        v10 = -[NSTextLayoutManager textContainers](self, "textContainers");
        v11 = -[NSArray indexOfObject:](v10, "indexOfObject:", -[NSTextLayoutManager textContainer](self, "textContainer"));
        if (v11 >= -[NSArray count](v10, "count"))
          -[NSTextLayoutManager usageBoundsForTextContainer](self, "usageBoundsForTextContainer");
        else
          -[NSTextLayoutManager usageBoundsInTextContainerAtIndex:](self, "usageBoundsInTextContainerAtIndex:", v11);
        Height = CGRectGetHeight(*(CGRect *)&v12);
        v9 = v31;
        v31[5] = Height;
      }
      else
      {
        v9 = v31;
      }
    }
    v16 = v9[4];
    v17 = v9[5];
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    v16 = v31[4];
    v17 = v31[5];
  }
  _Block_object_dispose(&v30, 8);
  v19 = v16;
  v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

BOOL __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke(_QWORD *a1, void *a2)
{
  double v4;
  double v5;
  uint64_t v6;

  objc_msgSend(a2, "layoutFragmentFrame");
  v5 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", a1[4]) & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation");
  }
  v6 = *(_QWORD *)(a1[7] + 8);
  if (v5 > *(double *)(v6 + 32))
    *(double *)(v6 + 32) = v5;
  return ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) < 0x64uLL;
}

uint64_t __56__NSTextLayoutManager_estimatedSizeForLastTextContainer__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a3 + a5;
  return 1;
}

- (id)_rangeForAllLinesContainingTextInRange:(id)a3
{
  NSTextContentManager *v5;
  id v6;
  NSTextLayoutFragment *v7;
  NSTextParagraph *v8;
  NSTextParagraph *v9;
  NSTextRange *v10;
  NSTextLineFragment *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSTextRange *v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v5 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  v6 = (id)objc_msgSend(a3, "location");
  -[NSTextLayoutManager _debugPrintVariableName:andRange:](self, "_debugPrintVariableName:andRange:", CFSTR("-------\nHighlight: runRange"), a3);
  v7 = -[NSTextLayoutManager textLayoutFragmentForLocation:](self, "textLayoutFragmentForLocation:", v6);
  v8 = -[NSTextLayoutFragment textParagraph](v7, "textParagraph");
  if (!v8)
    return 0;
  v9 = v8;
  if (!-[NSTextRange containsLocation:](-[NSTextParagraph paragraphContentRange](v8, "paragraphContentRange"), "containsLocation:", v6))
  {
    v6 = -[NSTextRange endLocation](-[NSTextParagraph paragraphSeparatorRange](v9, "paragraphSeparatorRange"), "endLocation");
    if (objc_msgSend(v6, "compare:", objc_msgSend(a3, "endLocation")) != -1)
      return 0;
  }
  v11 = -[NSTextLayoutFragment textLineFragmentForTextLocation:isUpstreamAffinity:](v7, "textLineFragmentForTextLocation:isUpstreamAffinity:", v6, 0);
  v12 = objc_msgSend(-[NSTextLineFragment textLineFragmentRange](v11, "textLineFragmentRange"), "location");
  if (!v12)
    v12 = -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](v7, "rangeInElement"), "location");
  -[NSTextLayoutManager _debugPrintVariableName:andRange:](self, "_debugPrintVariableName:andRange:", CFSTR("Highlight: rangeStartLayoutFragment"), -[NSTextLayoutFragment rangeInElement](v7, "rangeInElement"));
  -[NSTextLayoutManager _debugPrintVariableName:andRange:](self, "_debugPrintVariableName:andRange:", CFSTR("Highlight: rangeStartLineFragment"), -[NSTextLineFragment textLineFragmentRange](v11, "textLineFragmentRange"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v13 = -[NSTextRange endLocation](-[NSTextContentManager documentRange](v5, "documentRange"), "endLocation");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__NSTextLayoutManager__rangeForAllLinesContainingTextInRange___block_invoke;
  v20[3] = &unk_1E2603D48;
  v20[4] = v7;
  v20[5] = a3;
  v20[6] = &v21;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v13, 1, v20);
  v14 = (void *)objc_msgSend((id)v22[5], "textLineFragmentForTextLocation:isUpstreamAffinity:", objc_msgSend(a3, "endLocation"), 1);
  v15 = v14;
  if (v14)
    v16 = (void *)objc_msgSend(v14, "textLineFragmentRange");
  else
    v16 = (void *)objc_msgSend((id)v22[5], "rangeInElement");
  v17 = objc_msgSend(v16, "endLocation");
  -[NSTextLayoutManager _debugPrintVariableName:andRange:](self, "_debugPrintVariableName:andRange:", CFSTR("Highlight: rangeEndLayoutFragment"), objc_msgSend((id)v22[5], "rangeInElement"));
  -[NSTextLayoutManager _debugPrintVariableName:andRange:](self, "_debugPrintVariableName:andRange:", CFSTR("Highlight: rangeEndLineFragment"), objc_msgSend(v15, "textLineFragmentRange"));
  v18 = (NSTextRange *)objc_msgSend((id)v22[5], "textParagraph");
  v10 = v18;
  if (v18)
  {
    if ((objc_msgSend((id)-[NSTextRange paragraphContentRange](v18, "paragraphContentRange"), "containsLocation:", v17) & 1) == 0)
      v17 = objc_msgSend((id)-[NSTextRange paragraphContentRange](v10, "paragraphContentRange"), "endLocation");
    v10 = 0;
    if (v12 && v17)
      v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v12, v17);
    -[NSTextLayoutManager _debugPrintVariableName:andRange:](self, "_debugPrintVariableName:andRange:", CFSTR("Highlight: linesRange"), v10);
  }
  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t __62__NSTextLayoutManager__rangeForAllLinesContainingTextInRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (*(void **)(a1 + 32) != a2
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "endLocation")) & 1) == 0&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "location"), "compare:", objc_msgSend(*(id *)(a1 + 40), "endLocation")) != -1)
  {
    return 1;
  }
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2;
  return result;
}

+ (int64_t)maximumNumberOfCachedTextLayoutFragments
{
  if (maximumNumberOfCachedTextLayoutFragments_onceToken != -1)
    dispatch_once(&maximumNumberOfCachedTextLayoutFragments_onceToken, &__block_literal_global_144);
  return maximumNumberOfCachedTextLayoutFragments_maxTextLayoutFragments;
}

uint64_t __63__NSTextLayoutManager_maximumNumberOfCachedTextLayoutFragments__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("_NSTextLayoutManagerMaximumNumberOfCachedTextLayoutFragments"));
  v1 = 2000;
  if (result >= 1)
    v1 = result;
  maximumNumberOfCachedTextLayoutFragments_maxTextLayoutFragments = v1;
  return result;
}

- (int64_t)maximumNumberOfCachedTextLayoutFragments
{
  if (self->_maximumNumberOfCachedTextLayoutFragments <= 0)
    return objc_msgSend((id)objc_opt_class(), "maximumNumberOfCachedTextLayoutFragments");
  else
    return self->_maximumNumberOfCachedTextLayoutFragments;
}

- (void)setMaximumNumberOfCachedTextLayoutFragments:(int64_t)a3
{
  self->_maximumNumberOfCachedTextLayoutFragments = a3;
}

- (BOOL)flushTextLayoutFragmentsFromLocation:(id)a3 direction:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  NSTextRange *v8;
  id v9;
  BOOL v10;
  NSTextRange *v12;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;

  v4 = a4;
  objc_sync_enter(self);
  v7 = -[NSMapTable count](self->_textLayoutFragmentTable, "count");
  if (v7 > -[NSTextLayoutManager maximumNumberOfCachedTextLayoutFragments](self, "maximumNumberOfCachedTextLayoutFragments"))
  {
    v8 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange");
    if (v4)
    {
      v9 = -[NSTextRange location](v8, "location");
    }
    else
    {
      v9 = a3;
      a3 = -[NSTextRange endLocation](v8, "endLocation");
    }
    if (objc_msgSend(v9, "compare:", a3) == -1)
    {
      v12 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v9, a3);
      __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange((id *)&self->super.isa, v12, 0);
      if ((self->_textContainerEntriesCount & 0x8000000000000000) != 0)
      {
        p_lastTextContainerEntry = ($93589CBA8E1B80577C20324DFAADD895 *)&self->_textContainerEntries[-1];
      }
      else
      {
        p_lastTextContainerEntry = &self->_lastTextContainerEntry;
        if (!self->_lastTextContainerEntry.textContainer)
          goto LABEL_13;
      }
      p_lastTextContainerEntry->containerFilled = 0;
LABEL_13:

      v10 = 1;
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:
  objc_sync_exit(self);
  return v10;
}

- (void)_enumerateTextSegmentAndCategoryInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 allowsZeroWidthExtensions:(BOOL)a6 usingBlock:(id)a7
{
  char v12;
  unsigned int v13;
  unint64_t v14;
  BOOL v15;
  int v16;
  _BOOL4 v17;
  BOOL v18;
  unint64_t v19;
  id v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;
  NSUInteger v39;
  void *v40;
  char v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __n128 v47;
  __n128 v48;
  double v49;
  double v50;
  char v51;
  void *v52;
  NSUInteger v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  _BOOL4 v59;
  void (**v60)(__n128, __n128, double);
  BOOL v61;
  unint64_t v62;
  unsigned int v63;
  uint64_t *v64;
  _QWORD v65[7];
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  uint64_t v72;
  _QWORD v73[11];
  char v74;
  char v75;
  char v76;
  BOOL v77;
  BOOL v78;
  BOOL v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  uint64_t v86;
  _QWORD v87[3];
  BOOL v88;
  _QWORD v89[2];
  uint64_t (*v90)(uint64_t, void *, uint64_t, double, double, uint64_t, uint64_t, int, int, void *, double *);
  void *v91;
  NSTextLayoutManager *v92;
  id v93;
  BOOL v94;
  BOOL v95;
  BOOL v96;
  char v97;
  char v98;
  BOOL v99;
  char v100;
  BOOL v101;
  char v102;
  NSRange v103;
  NSRange v104;

  v63 = (a5 >> 1) & 1;
  v12 = a5 & 1;
  v13 = BYTE3(a5) & 1;
  v14 = a4 - 1;
  v15 = (unint64_t)(a4 - 1) < 2;
  v16 = objc_msgSend(a3, "isEmpty");
  v17 = +[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled](NSTextLayoutFragment, "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled");
  v89[0] = MEMORY[0x1E0C809B0];
  v62 = v14;
  v18 = v14 > 1;
  v61 = v14 > 1;
  v89[1] = 3221225472;
  v90 = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke;
  v91 = &unk_1E2603D98;
  v59 = v17;
  v94 = v17;
  v19 = (a5 >> 3) & 1;
  v95 = (a5 & 0x4000000) == 0;
  v96 = (a5 & 0x8000000) != 0;
  v97 = v13;
  v60 = (void (**)(__n128, __n128, double))a7;
  v98 = v12;
  v20 = a3;
  v21 = v16;
  v99 = a6;
  v100 = v16;
  v101 = v15;
  v92 = self;
  v93 = a7;
  v22 = MEMORY[0x1E0C809B0];
  v102 = v16 & (a5 >> 4);
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v88 = (a5 & 4) != 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x3052000000;
  v84 = __Block_byref_object_copy__2;
  v85 = __Block_byref_object_dispose__2;
  v86 = 0;
  v80 = 0;
  if (v18)
    v23 = 1;
  else
    v23 = v16;
  if (v23)
    v24 = 0;
  else
    v24 = &v80;
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_3;
  v73[3] = &unk_1E2603DE0;
  v74 = v63;
  v75 = v16;
  v73[4] = self;
  v73[5] = v20;
  v76 = v16 & (a5 >> 4);
  v77 = (a5 & 8) != 0;
  v78 = v15;
  v73[9] = v24;
  v73[10] = a5;
  v73[6] = v89;
  v73[7] = v87;
  v64 = v24;
  v73[8] = &v81;
  v79 = (a5 & 4) != 0;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsInTextRange:options:usingBlock:](self, "enumerateTextLayoutFragmentsInTextRange:options:usingBlock:", v20, 12, v73);
  if (v16)
    v25 = objc_msgSend((id)objc_msgSend(v20, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation"));
  else
    v25 = 0;
  if (v82[5] || v25)
  {
    v67 = 0;
    v68 = &v67;
    v69 = 0x3052000000;
    v70 = __Block_byref_object_copy__2;
    v71 = __Block_byref_object_dispose__2;
    v72 = 0;
    v65[0] = v22;
    v65[1] = 3221225472;
    v65[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_5;
    v65[3] = &unk_1E2603E08;
    v65[4] = v20;
    v65[5] = &v81;
    v66 = v25;
    v65[6] = &v67;
    -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", objc_msgSend(v20, "endLocation"), 13, v65);
    v26 = (void *)v68[5];
    if (v26)
    {
      v27 = (void *)objc_msgSend(v26, "textParagraph");
      v58 = (void *)objc_msgSend((id)v68[5], "rangeInElement");
      v57 = -[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:", objc_msgSend(v58, "location"));
      if (v27)
      {
        v28 = (void *)objc_msgSend((id)v68[5], "textLineFragments");
        v29 = objc_msgSend(v27, "_resolvedBaseWritingDirectionWithFallbackDirection:", -[NSTextLayoutManager _fallbackWritingDirection](self, "_fallbackWritingDirection"));
        v30 = objc_msgSend(v28, "count");
        v56 = v29;
        objc_msgSend((id)v68[5], "layoutFragmentFrameOrigin");
        if (v30 >= 1)
        {
          v33 = v31;
          v34 = v32;
          if (v25)
          {
            v35 = (void *)objc_msgSend(v28, "lastObject");
            objc_msgSend(v35, "characterRange");
            if (v36)
            {
              if (v62 < 2)
                v37 = v21 ^ 1u;
              else
                v37 = 0;
              ((void (*)(_QWORD *, void *, id, void *, uint64_t, uint64_t, _QWORD, id, double, double, _QWORD))v90)(v89, v35, v20, v58, v29, v37, 0, v57, v33, v34, 0);
            }
            else
            {
              objc_msgSend(v35, "glyphOrigin");
              v44 = v43;
              objc_msgSend(v57, "lineFragmentPadding");
              v46 = v45;
              objc_msgSend(v35, "typographicBounds");
              if (v59)
                v50 = v44;
              else
                v50 = v33;
              if (v59)
                v49 = v49 + v46 * -2.0;
              v47.n128_f64[0] = v50 + v47.n128_f64[0];
              v48.n128_f64[0] = v34 + v48.n128_f64[0];
              if (v29 == 1)
                v49 = -0.0;
              v47.n128_f64[0] = v47.n128_f64[0] + v49;
              v60[2](v47, v48, 0.0);
            }
          }
          else
          {
            v38 = objc_msgSend(v27, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v58, "location"), 0);
            v39 = objc_msgSend(v27, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v20, "endLocation"), 1);
            v40 = (void *)objc_msgSend(v27, "paragraphSeparatorRange");
            v41 = (a5 & 8) != 0 || v61;
            if ((v41 & 1) == 0)
            {
              v42 = v40;
              if ((objc_msgSend(v40, "isEmpty") & 1) != 0)
                LOBYTE(v19) = 0;
              else
                LOBYTE(v19) = objc_msgSend((id)objc_msgSend(v42, "endLocation"), "isEqual:", objc_msgSend(v20, "endLocation"));
            }
            while (1)
            {
              v18 = v30-- < 1;
              if (v18)
                break;
              v51 = v19;
              v52 = (void *)objc_msgSend(v28, "objectAtIndexedSubscript:", v30);
              v104.location = objc_msgSend(v52, "characterRange");
              v104.length = v53;
              v103.location = v38;
              v103.length = v39;
              LOBYTE(v19) = 0;
              if (NSIntersectionRange(v103, v104).length)
              {
                v54 = objc_msgSend(v58, "textRangeByIntersectingWithTextRange:", v20);
                if (v62 < 2)
                  v55 = v21 ^ 1u;
                else
                  v55 = 0;
                ((void (*)(_QWORD *, void *, uint64_t, void *, uint64_t, uint64_t, _QWORD, id, double, double, uint64_t *))v90)(v89, v52, v54, v58, v56, v55, v51 & 1, v57, v33, v34, v64);
                break;
              }
            }
          }
        }
      }

    }
    _Block_object_dispose(&v67, 8);
  }
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(v87, 8);
}

uint64_t __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5, uint64_t a6, uint64_t a7, int a8, int a9, void *a10, double *a11)
{
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  void *v45;
  double v46;
  NSTextRange *v47;
  NSTextRange *v48;
  double v49;
  NSTextRange *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  NSTextRange *v56;
  NSTextRange *v57;
  NSTextRange *v58;
  NSTextRange *v59;
  double v60;
  NSTextRange *v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v83;
  _QWORD v84[6];
  __int128 v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  char v105;
  int v106;
  char v107;
  __int16 v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  void (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  void (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  uint64_t v124;
  CGRect v125;
  CGRect v126;

  v18 = (void *)objc_msgSend((id)objc_msgSend(a10, "textLayoutManager"), "textViewportLayoutController");
  objc_msgSend(a2, "glyphOrigin");
  v80 = v19;
  v21 = v20;
  objc_msgSend(a10, "size");
  v23 = v22;
  v24 = 10000000.0;
  v25 = v22 >= 10000000.0 || v22 <= 0.0;
  if (v18)
  {
    objc_msgSend(v18, "_viewportBounds");
    v24 = v26;
  }
  v75 = v21;
  objc_msgSend(a10, "lineFragmentPadding");
  v28 = v27;
  v29 = v23 - v27;
  if (v25)
    v29 = v24;
  v83 = v29;
  objc_msgSend(a2, "typographicBounds");
  v34 = v33;
  if (a11)
    v35 = *a11;
  else
    v35 = 0.0;
  v37 = *MEMORY[0x1E0CB3438];
  v36 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v39 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v38 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v119 = 0;
  v120 = &v119;
  v121 = 0x3052000000;
  v122 = __Block_byref_object_copy__2;
  v123 = __Block_byref_object_dispose__2;
  v124 = 0;
  v113 = 0;
  v114 = &v113;
  v115 = 0x3052000000;
  v116 = __Block_byref_object_copy__2;
  v117 = __Block_byref_object_dispose__2;
  v118 = 0;
  v109 = 0;
  v110 = &v109;
  v111 = 0x2020000000;
  v112 = 0;
  v40 = v31 + v28 * -2.0;
  if (!*(_BYTE *)(a1 + 48))
    v40 = v31;
  v73 = v40;
  if (*(_BYTE *)(a1 + 48))
    v41 = v80;
  else
    v41 = a4;
  v42 = a5 + v30;
  v43 = v35 < a5 + v30;
  v44 = v32 + a5 + v30 - v35;
  if (v35 > 0.0 && v43)
    v42 = v35;
  else
    v44 = v32;
  v76 = v42;
  v77 = v44;
  if (v28 >= v83)
  {
    v78 = v38;
    v79 = v39;
    v52 = v36;
    v53 = v37;
  }
  else
  {
    v45 = (void *)objc_msgSend(a2, "textLineFragmentRange");
    v74 = v38;
    v72 = v34 + v41;
    if (a8)
    {
      v46 = v37;
      v47 = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", objc_msgSend(v45, "location"));
      v48 = v47;
      if (a7 == 1)
      {
        v37 = v73 + v72;
        v49 = v77;
        if (v77 <= 0.0)
        {
          v51 = v39;
          v70 = v76;
          v71 = v74;
          v39 = v83 - (v73 + v72);
        }
        else
        {
          v50 = v47;
          v51 = v39;
          if (v83 - (v73 + v72) >= 0.0)
            v39 = v83 - (v73 + v72);
          else
            v39 = 0.0;
          v114[5] = (uint64_t)v50;
          v70 = v76;
          v71 = v74;
          v49 = v77;
        }
        v53 = v46;
        v52 = v36;
      }
      else
      {
        v51 = v72 - v28;
        if (v77 <= 0.0)
        {
          v71 = v77;
        }
        else
        {
          v56 = v47;
          if (v51 < 0.0)
            v51 = 0.0;
          v71 = v77;
          v120[5] = (uint64_t)v56;
        }
        v70 = v36;
        v52 = v76;
        v53 = v28;
        v49 = v74;
      }
      v78 = v49;
      v79 = v39;

      v54 = v70;
      v74 = v71;
      v55 = v37;
    }
    else
    {
      v51 = v39;
      v78 = v74;
      v79 = v39;
      v54 = v36;
      v52 = v36;
      v55 = v37;
      v53 = v37;
    }
    if (a9)
    {
      v37 = v55;
      v36 = v54;
      v39 = v51;
      v38 = v74;
      v57 = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", objc_msgSend(v45, "endLocation"));
      v58 = v57;
      if (a7 == 1)
      {
        v39 = v72 - v28;
        v38 = v77;
        if (v77 > 0.0)
        {
          v59 = v57;
          if (v39 < 0.0)
            v39 = 0.0;
          v120[5] = (uint64_t)v59;
          v38 = v77;
        }
        v52 = v76;
        v53 = v28;
      }
      else
      {
        v37 = v73 + v72;
        v79 = v83 - (v73 + v72);
        v60 = v77;
        if (v77 <= 0.0)
        {
          v36 = v76;
        }
        else
        {
          v61 = v57;
          v62 = v83 - (v73 + v72);
          if (v79 < 0.0)
            v62 = 0.0;
          v79 = v62;
          v114[5] = (uint64_t)v61;
          v36 = v76;
          v60 = v77;
        }
        v78 = v60;
      }

    }
    else
    {
      v37 = v55;
      v36 = v54;
      v39 = v51;
      v38 = v74;
    }
  }
  v63 = *(unsigned __int8 *)(a1 + 49);
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_2;
  v84[3] = &unk_1E2603D70;
  v105 = *(_BYTE *)(a1 + 48);
  v89 = a4;
  v90 = a5;
  v91 = v35;
  v84[4] = a2;
  v86 = &v119;
  v92 = a7;
  v93 = v53;
  v94 = v52;
  v95 = v39;
  v96 = v38;
  v106 = *(_DWORD *)(a1 + 50);
  v97 = v80;
  v98 = v75;
  v84[5] = a10;
  v87 = &v109;
  v88 = &v113;
  v99 = v37;
  v100 = v36;
  v101 = v79;
  v102 = v78;
  v107 = *(_BYTE *)(a1 + 54);
  v108 = *(_WORD *)(a1 + 55);
  v85 = *(_OWORD *)(a1 + 32);
  v103 = v28;
  v104 = v83;
  objc_msgSend(a2, "enumerateTextSegmentBoundsInTextRange:dataSourceLocationsOnly:usingBlock:", a3, v63, v84);
  if (v120[5])
  {
    if (*(_BYTE *)(a1 + 53)
      || (v125.origin.x = v53,
          v125.origin.y = v52,
          v125.size.width = v39,
          v125.size.height = v38,
          CGRectGetWidth(v125) > 0.0))
    {
      if (*(_BYTE *)(a1 + 52))
        v64 = 0;
      else
        v64 = v120[5];
      v65 = (*(uint64_t (**)(_QWORD, uint64_t, void *, uint64_t, double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v64, a10, 2, v53, v52, v39, v38, v75);
      *((_BYTE *)v110 + 24) = v65 ^ 1;
    }
  }
  if (v114[5])
  {
    if (*(_BYTE *)(a1 + 53)
      || (v126.origin.x = v37,
          v126.origin.y = v36,
          v126.size.height = v78,
          v126.size.width = v79,
          CGRectGetWidth(v126) > 0.0))
    {
      if (*(_BYTE *)(a1 + 52))
        v66 = 0;
      else
        v66 = v114[5];
      v67 = (*(uint64_t (**)(_QWORD, uint64_t, void *, uint64_t, double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v66, a10, 4, v37, v36, v79, v78, v75);
      *((_BYTE *)v110 + 24) = v67 ^ 1;
    }
  }

  if (a11)
    *a11 = v76 + v77;
  v68 = *((unsigned __int8 *)v110 + 24);
  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v119, 8);
  return v68;
}

void __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_2(uint64_t a1, void *a2, __n128 a3, double a4, __n128 a5, double a6)
{
  double width;
  double x;
  double y;
  double height;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  NSRect v22;
  NSRect v23;
  NSRect v24;
  NSRect v25;

  width = a5.n128_f64[0];
  x = a3.n128_f64[0];
  if (!*(_BYTE *)(a1 + 216))
    x = a3.n128_f64[0] + *(double *)(a1 + 88);
  y = a4 + *(double *)(a1 + 96);
  if (*(_BYTE *)(a1 + 217))
  {
    objc_msgSend(*(id *)(a1 + 32), "glyphOrigin");
    height = 2.0;
    y = y + v12 + 2.0;
  }
  else
  {
    v13 = *(double *)(a1 + 104);
    v14 = v13 > 0.0 && v13 < y;
    v15 = a6 + y - v13;
    if (v14)
      y = *(double *)(a1 + 104);
    if (v14)
      height = v15;
    else
      height = a6;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (*(_QWORD *)(a1 + 112) == 1)
      v16 = objc_msgSend(a2, "endLocation");
    else
      v16 = objc_msgSend(a2, "location");
    if (*(_BYTE *)(a1 + 218)
      || x - (*(double *)(a1 + 120) + *(double *)(a1 + 136)) >= 0.001
      || !objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "endLocation"), "isEqual:", v16))
    {
      if (*(_BYTE *)(a1 + 220) || CGRectGetWidth(*(CGRect *)(a1 + 120)) > 0.0)
      {
        if (*(_BYTE *)(a1 + 219))
          v18 = 0;
        else
          v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t, double, double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v18, *(_QWORD *)(a1 + 40), 2, *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 160)) ^ 1;
      }
      v17 = 1;
    }
    else
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v23 = NSUnionRect(v22, *(NSRect *)(a1 + 120));
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
      if (!*(_BYTE *)(a1 + 219))
        a2 = (void *)objc_msgSend(a2, "textRangeByFormingUnionWithTextRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v17 = 3;
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = 0;
  }
  else
  {
    v17 = 1;
  }
  if (!*(_BYTE *)(a1 + 218))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) && *(double *)(a1 + 168) - (x + width) < 0.001)
    {
      v19 = *(_QWORD *)(a1 + 112) == 1 ? objc_msgSend(a2, "location") : objc_msgSend(a2, "endLocation");
      if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "location"), "isEqual:", v19))
      {
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = NSUnionRect(v24, *(NSRect *)(a1 + 168));
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        if (!*(_BYTE *)(a1 + 219))
          a2 = (void *)objc_msgSend(a2, "textRangeByFormingUnionWithTextRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
        v17 |= 4uLL;

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = 0;
      }
    }
    if (!*(_BYTE *)(a1 + 218))
    {
      if (*(_BYTE *)(a1 + 221))
      {
        if (*(_BYTE *)(a1 + 222))
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "textSelectionNavigation"), "_caretOffsetForTextLocation:affinity:", objc_msgSend(a2, "location"), *(_BYTE *)(a1 + 223) == 0);
          if (a3.n128_f64[0] >= 0.0)
            x = a3.n128_f64[0];
        }
      }
      if (!*(_BYTE *)(a1 + 222))
        goto LABEL_54;
      a3.n128_u64[0] = *(_QWORD *)(a1 + 200);
      v20 = *(double *)(a1 + 208);
      if (a3.n128_f64[0] >= v20)
        goto LABEL_54;
      if (width + x > v20)
        width = v20 - x;
      if (x < a3.n128_f64[0])
        width = width - (a3.n128_f64[0] - x);
      else
LABEL_54:
        a3.n128_f64[0] = x;
      if (width >= 0.0)
        a5.n128_f64[0] = width;
      else
        a5.n128_f64[0] = 0.0;
      if (*(_BYTE *)(a1 + 219))
        v21 = 0;
      else
        v21 = a2;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (*(uint64_t (**)(_QWORD, void *, _QWORD, uint64_t, __n128, double, __n128, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v21, *(_QWORD *)(a1 + 40), v17, a3, y, a5, height, *(double *)(a1 + 160)) ^ 1;
    }
  }
}

char *__113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_3(uint64_t a1, void *a2, BOOL *a3)
{
  void *v6;
  void *v7;
  char *result;
  BOOL v9;
  char *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  char *v22;
  NSUInteger v23;
  uint64_t v24;
  char v25;
  NSUInteger v26;
  void *v27;
  NSUInteger location;
  NSUInteger length;
  NSRange v30;
  _BOOL4 v31;
  NSUInteger v32;
  double v33;
  double v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  void *v40;
  BOOL *v41;
  void *v42;
  NSUInteger v43;
  char v44;
  NSUInteger v45;
  int v46;
  void *v47;
  char *v48;
  uint64_t v49;
  _QWORD v50[6];
  NSRange v51;
  NSRange v52;

  v6 = (void *)objc_msgSend(a2, "textParagraph");
  v7 = (void *)objc_msgSend(a2, "rangeInElement");
  result = (char *)objc_msgSend(*(id *)(a1 + 32), "textContainerForLocation:", objc_msgSend(v7, "location"));
  if (*(_BYTE *)(a1 + 88))
  {
    v9 = 1;
    if (!v6)
      goto LABEL_58;
  }
  else
  {
    v9 = *(_BYTE *)(a1 + 89) != 0;
    if (!v6)
      goto LABEL_58;
  }
  result = (char *)objc_msgSend(*(id *)(a1 + 40), "textRangeByIntersectingWithTextRange:", v7);
  if (result)
  {
    v10 = result;
    result = (char *)objc_msgSend(result, "isEmpty");
    if (!(_DWORD)result
      || *(_BYTE *)(a1 + 89)
      && (result = (char *)objc_msgSend(v7, "containsLocation:", objc_msgSend(*(id *)(a1 + 40), "location")),
          (_DWORD)result))
    {
      v11 = (void *)objc_msgSend(v6, "paragraphSeparatorRange");
      v12 = (void *)objc_msgSend(a2, "textLineFragments");
      objc_msgSend(v6, "_resolvedBaseWritingDirectionWithFallbackDirection:", objc_msgSend(*(id *)(a1 + 32), "_fallbackWritingDirection"));
      v47 = v12;
      v49 = objc_msgSend(v12, "count");
      objc_msgSend(a2, "layoutFragmentFrameOrigin");
      v14 = v13;
      v16 = v15;
      if (*(_BYTE *)(a1 + 89)
        || (v17 = v7,
            v18 = objc_msgSend(v10, "endLocation"),
            v19 = objc_msgSend(*(id *)(a1 + 40), "endLocation"),
            v20 = (void *)v18,
            v7 = v17,
            objc_msgSend(v20, "isEqual:", v19)))
      {
        if ((objc_msgSend(v11, "isEmpty") & 1) == 0)
          objc_msgSend((id)objc_msgSend(v11, "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "endLocation"));
        v21 = 0;
      }
      else
      {
        v21 = 1;
      }
      v22 = *(_BYTE *)(a1 + 89) ? *(char **)(a1 + 40) : v10;
      result = (char *)objc_msgSend(v6, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v22, "location"), 0);
      v23 = (NSUInteger)result;
      if (*(_BYTE *)(a1 + 89))
      {
        v48 = 0;
      }
      else
      {
        result = (char *)objc_msgSend(v6, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v10, "endLocation"), 1);
        v48 = &result[-v23];
      }
      if (v49 >= 1)
      {
        v40 = v6;
        v24 = 0;
        v42 = a2;
        v43 = (NSUInteger)&v48[v23];
        if (v48)
          v25 = v21;
        else
          v25 = 1;
        v44 = v25;
        v46 = v21 ^ 1;
        v26 = (NSUInteger)v48;
        v45 = v23;
        v41 = a3;
        do
        {
          v27 = (void *)objc_msgSend(v47, "objectAtIndexedSubscript:", v24);
          v51.location = objc_msgSend(v27, "characterRange");
          location = v51.location;
          length = v51.length;
          v52.location = v23;
          v52.length = v26;
          v30 = NSIntersectionRange(v51, v52);
          result = (char *)v30.location;
          if (v30.length)
          {
            v31 = v46;
            if ((v44 & 1) == 0)
              v31 = location + length >= v43;
          }
          else
          {
            if (v26)
            {
              v32 = location + length;
LABEL_32:
              if (v32 <= v23)
              {
                v26 = (NSUInteger)v48;
                if (*(_QWORD *)(a1 + 72) && (*(_BYTE *)(a1 + 83) & 2) != 0)
                {
                  result = (char *)objc_msgSend(v27, "typographicBounds");
                  **(double **)(a1 + 72) = v16 + v33 + v34;
                }
              }
              else
              {
                v9 = 1;
                v26 = (NSUInteger)v48;
              }
              goto LABEL_54;
            }
            if (v23 < location || (v31 = v46, v23 - location >= length))
            {
              v32 = location + length;
              if (!*(_BYTE *)(a1 + 90))
                goto LABEL_32;
              v31 = v46;
              if (v23 != v32)
                goto LABEL_32;
            }
          }
          v35 = *(double **)(a1 + 72);
          if (v35 && *v35 == 0.0 && (*(_BYTE *)(a1 + 83) & 2) != 0)
          {
            v36 = objc_msgSend(v42, "textLayoutManager", *v35);
            v37 = objc_msgSend(v7, "location");
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_4;
            v50[3] = &__block_descriptor_40_e30_B16__0__NSTextLayoutFragment_8l;
            v50[4] = *(_QWORD *)(a1 + 72);
            v38 = (void *)v36;
            a3 = v41;
            objc_msgSend(v38, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v37, 5, v50);
          }
          result = (char *)(*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 48) + 16))(v14, v16);
          if ((_DWORD)result)
            v9 = 1;
          if (v9)
          {
            if (((v31 | result) & 1) == 0)
            {
              result = (char *)(id)objc_msgSend(v40, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", location + length, 0, 0);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
            }
            break;
          }
          v39 = *(_BYTE *)(a1 + 92) && !*(_BYTE *)(a1 + 89) || *(_BYTE *)(a1 + 93) != 0;
          v23 = v45;
          v26 = (NSUInteger)v48;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v39;
LABEL_54:
          ++v24;
        }
        while (v49 != v24);
      }
    }
  }
LABEL_58:
  *a3 = v9;
  return result;
}

uint64_t __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "textLineFragments"), "lastObject");
  if (v4)
  {
    objc_msgSend(v4, "typographicBounds");
    v7 = v5 + v6;
    objc_msgSend(a2, "layoutFragmentFrameOrigin");
    **(double **)(a1 + 32) = v8 + v7;
  }
  return 0;
}

uint64_t __113__NSTextLayoutManager__enumerateTextSegmentAndCategoryInRange_type_options_allowsZeroWidthExtensions_usingBlock___block_invoke_5(uint64_t a1, void *a2)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation")) == -1|| *(_BYTE *)(a1 + 56)&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "location")))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2;
  }
  return 0;
}

- (void)enumerateTextSegmentAndCategoryInRange:(id)a3 type:(int64_t)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  -[NSTextLayoutManager _enumerateTextSegmentAndCategoryInRange:type:options:allowsZeroWidthExtensions:usingBlock:](self, "_enumerateTextSegmentAndCategoryInRange:type:options:allowsZeroWidthExtensions:usingBlock:", a3, a4, a5, 1, a6);
}

- (void)synchronize
{
  -[NSTextContentManager synchronizeTextLayoutManagers:](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "synchronizeTextLayoutManagers:", 0);
}

- (void)replaceContentsInRange:(NSTextRange *)range withTextElements:(NSArray *)textElements
{
  -[NSTextContentManager replaceContentsInRange:withTextElements:](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "replaceContentsInRange:withTextElements:", range, textElements);
}

- (void)replaceContentsInRange:(NSTextRange *)range withAttributedString:(NSAttributedString *)attributedString
{
  -[NSTextLayoutManager replaceContentsInRange:withTextElements:](self, "replaceContentsInRange:withTextElements:", range, +[NSTextParagraph textParagraphsForAttributedString:range:](NSTextParagraph, "textParagraphsForAttributedString:range:", attributedString, 0, -[NSAttributedString length](attributedString, "length")));
}

- (void)enumerateRenderingAttributesFromLocation:(id)location reverse:(BOOL)reverse usingBlock:(void *)block
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__NSTextLayoutManager_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke;
  v5[3] = &unk_1E2603E58;
  v5[4] = block;
  -[NSTextLayoutManager enumerateTemporaryAttributesFromLocation:reverse:usingBlock:](self, "enumerateTemporaryAttributesFromLocation:reverse:usingBlock:", location, reverse, v5);
}

uint64_t __83__NSTextLayoutManager_enumerateRenderingAttributesFromLocation_reverse_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a5 = result ^ 1;
  return result;
}

uint64_t __83__NSTextLayoutManager_enumerateTemporaryAttributesFromLocation_reverse_usingBlock___block_invoke(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  if (result)
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], a1[4], a2, objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)), a4);
  return result;
}

- (id)temporaryAttributesTable
{
  id result;

  result = self->_temporaryAttributesTable;
  if (!result)
  {
    result = -[_NSTextRunStorage initWithDataSource:]([_NSTextAttributeStorage alloc], "initWithDataSource:", self);
    self->_temporaryAttributesTable = (_NSTextAttributeStorage *)result;
  }
  return result;
}

- (void)setTemporaryAttributes:(id)a3 forTextRange:(id)a4
{
  uint64_t v7;

  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  if (objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "setAttributes:forTextRange:", a3, a4))
  {
    if (objc_msgSend((id)objc_msgSend(a4, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager", MEMORY[0x1E0C809B0], 3221225472, __59__NSTextLayoutManager_setTemporaryAttributes_forTextRange___block_invoke, &unk_1E2603EA8, a3, a4), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a4, "location"),
        0,
        &v7);
    else
      -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", a4, 0, &v7);
  }
  self->_isProcessingRenderingAttributesMethod = 0;
  objc_sync_exit(self);
}

uint64_t __59__NSTextLayoutManager_setTemporaryAttributes_forTextRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend(a2, "layoutManagerDidSetTemporaryAttributes:forTextRange:", *(_QWORD *)(a1 + 32), objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", *(_QWORD *)(a1 + 40)));
}

- (void)addTemporaryAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5
{
  _QWORD v9[7];

  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  if (objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "addAttribute:value:forTextRange:", a3, a4, a5))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__NSTextLayoutManager_addTemporaryAttribute_value_forTextRange___block_invoke;
    v9[3] = &unk_1E2603ED0;
    v9[4] = a3;
    v9[5] = a4;
    v9[6] = a5;
    if (objc_msgSend((id)objc_msgSend(a5, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager"), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a5, "location"), 0, v9);
    else
      -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", a5, 0, v9);
  }
  self->_isProcessingRenderingAttributesMethod = 0;
  objc_sync_exit(self);
}

uint64_t __64__NSTextLayoutManager_addTemporaryAttribute_value_forTextRange___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a1[5];
  v5 = a1[4];
  v6[0] = v3;
  return objc_msgSend(a2, "layoutManagerDidSetTemporaryAttributes:forTextRange:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1), objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", a1[6]));
}

- (void)removeTemporaryAttribute:(id)a3 forTextRange:(id)a4
{
  uint64_t v7;

  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  if (objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "removeAttribute:forTextRange:", a3, a4))
  {
    if (objc_msgSend((id)objc_msgSend(a4, "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager", MEMORY[0x1E0C809B0], 3221225472, __61__NSTextLayoutManager_removeTemporaryAttribute_forTextRange___block_invoke, &unk_1E2603EA8, a3, a4), "documentRange"), "endLocation")))-[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentFromLocation:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a4, "location"),
        0,
        &v7);
    else
      -[_NSTextLayoutFragmentStorage enumerateTextLayoutFragmentInTextRange:options:usingBlock:](self->_textLayoutFragmentStorage, "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", a4, 0, &v7);
  }
  self->_isProcessingRenderingAttributesMethod = 0;
  objc_sync_exit(self);
}

uint64_t __61__NSTextLayoutManager_removeTemporaryAttribute_forTextRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  v8[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return objc_msgSend(a2, "layoutManagerDidSetTemporaryAttributes:forTextRange:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", *(_QWORD *)(a1 + 40)));
}

- (void)invalidateTemporaryAttributesForTextRange:(id)a3
{
  objc_sync_enter(self);
  self->_isProcessingRenderingAttributesMethod = 1;
  objc_msgSend(-[NSTextLayoutManager temporaryAttributesTable](self, "temporaryAttributesTable"), "invalidateElementsInRange:delta:", a3, 0);
  self->_isProcessingRenderingAttributesMethod = 0;
  objc_sync_exit(self);
}

+ (NSDictionary)linkRenderingAttributes
{
  if (linkRenderingAttributes_onceToken != -1)
    dispatch_once(&linkRenderingAttributes_onceToken, &__block_literal_global_158);
  return (NSDictionary *)linkRenderingAttributes_defaultLinkAttributes;
}

uint64_t __46__NSTextLayoutManager_linkRenderingAttributes__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  id v2;
  uint64_t result;

  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v0 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", 1);
  }
  else
  {
    v0 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v1 = -[objc_class linkColor](v0, "linkColor");
  v2 = objc_alloc(MEMORY[0x1E0C99D80]);
  result = objc_msgSend(v2, "initWithObjectsAndKeys:", v1, CFSTR("NSColor"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1), CFSTR("NSUnderline"), 0);
  linkRenderingAttributes_defaultLinkAttributes = result;
  return result;
}

+ (NSDictionary)linkRenderingAttributesForLabels
{
  if (linkRenderingAttributesForLabels_onceToken != -1)
    dispatch_once(&linkRenderingAttributesForLabels_onceToken, &__block_literal_global_160);
  return (NSDictionary *)linkRenderingAttributesForLabels_defaultLinkAttributes;
}

uint64_t __55__NSTextLayoutManager_linkRenderingAttributesForLabels__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t result;

  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v0 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", 1);
  }
  else
  {
    v0 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v1 = -[objc_class linkColor](v0, "linkColor");
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v1, CFSTR("NSColor"), 0);
  linkRenderingAttributesForLabels_defaultLinkAttributes = result;
  return result;
}

- (NSDictionary)renderingAttributesForLink:(id)link atLocation:(id)location
{
  NSDictionary *v7;
  id v8;
  NSDictionary *result;

  v7 = (NSDictionary *)objc_msgSend((id)objc_opt_class(), "linkRenderingAttributes");
  v8 = -[NSTextLayoutManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = (NSDictionary *)objc_msgSend(v8, "textLayoutManager:renderingAttributesForLink:atLocation:defaultAttributes:", self, link, location, v7);
  else
    result = (NSDictionary *)objc_msgSend(-[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:", location), "linkTextAttributes");
  if (!result)
    return v7;
  return result;
}

- (void)markedTextAttributesForRange:(id)a3 usingBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v7 = (void *)objc_msgSend(a3, "location");
  v8 = objc_msgSend(a3, "endLocation");
  if (v8)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x18D7917B4]();
    while (objc_msgSend(v7, "compare:", v9) == -1)
    {
      v13 = 0;
      v11 = -[NSTextLayoutManager _selectionAndMarkedTextAttributesForLocation:inTextRange:effectiveTextRange:](self, "_selectionAndMarkedTextAttributesForLocation:inTextRange:effectiveTextRange:", v7, a3, &v13);
      v12 = v13;
      if (!v13)
        v12 = a3;
      v7 = (void *)objc_msgSend(v12, "endLocation");
      (*((void (**)(id, void *, id))a4 + 2))(a4, v13, v11);
    }
    objc_autoreleasePoolPop(v10);
  }
}

void __81__NSTextLayoutManager_adjustedTextSelectionsForEditingContextFromTextSelections___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = (void *)objc_msgSend(a2, "textRanges");
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)MEMORY[0x18D7917B4]();
  if (v9 < 1)
    goto LABEL_9;
  v11 = 0;
  v12 = v9 + 1;
  do
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "adjustedRangeFromRange:forEditingTextSelection:", objc_msgSend(v8, "objectAtIndexedSubscript:", v12 - 2), 1);
    if (!v13)
      break;
    v14 = v13;
    if (!v11)
      v11 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v12 - 2, v14);
    --v12;
  }
  while (v12 > 1);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "textSelectionWithTextRanges:", v11));

  }
  else
  {
LABEL_9:
    *a4 = 1;
  }
  objc_autoreleasePoolPop(v10);
}

- (void)setTextSelectionNavigation:(NSTextSelectionNavigation *)textSelectionNavigation
{
  NSTextSelectionNavigation *v5;

  objc_sync_enter(self);
  v5 = self->_textSelectionNavigation;
  if (v5 != textSelectionNavigation)
  {

    self->_textSelectionNavigation = textSelectionNavigation;
  }
  objc_sync_exit(self);
}

- (id)_textRangeForDoubleClickAtLocation:(id)a3
{
  NSTextContentManager *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v4 = -[NSTextLayoutManager textContentManager](self, "textContentManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NSTextLayoutManager__textRangeForDoubleClickAtLocation___block_invoke;
  v7[3] = &unk_1E2603F68;
  v7[4] = a3;
  v7[5] = &v8;
  -[NSTextContentManager enumerateTextElementsFromLocation:options:usingBlock:](v4, "enumerateTextElementsFromLocation:options:usingBlock:", a3, 0, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __58__NSTextLayoutManager__textRangeForDoubleClickAtLocation___block_invoke(uint64_t a1, void *a2)
{
  int v4;
  void *v5;
  CFIndex v6;
  const __CFString *v7;
  char isKindOfClass;
  const __CFAllocator *v9;
  const __CFString *v10;
  __CFStringTokenizer *v11;
  CFRange CurrentTokenRange;
  CFIndex length;
  CFIndex location;
  uint64_t v15;
  uint64_t v16;
  CFRange v18;

  v4 = objc_msgSend((id)objc_msgSend(a2, "elementRange"), "containsLocation:", *(_QWORD *)(a1 + 32));
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(a2, "attributedString");
      v6 = objc_msgSend(a2, "rangeForLocation:allowsTrailingEdge:", *(_QWORD *)(a1 + 32), 0);
      v7 = (const __CFString *)objc_msgSend(v5, "attribute:atIndex:effectiveRange:", NSLanguageAttributeName, v6, 0);
      if (v7)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        if ((isKindOfClass & 1) != 0)
          v7 = (const __CFString *)CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7);
        else
          v7 = 0;
      }
      else
      {
        v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      }
      v10 = (const __CFString *)objc_msgSend(v5, "string");
      v18.length = objc_msgSend(v5, "length");
      v18.location = 0;
      v11 = CFStringTokenizerCreate(v9, v10, v18, 4uLL, (CFLocaleRef)v7);
      CFStringTokenizerGoToTokenAtIndex(v11, v6);
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      CFRelease(v11);
      if (v7)
        CFRelease(v7);
      if (CurrentTokenRange.length <= 0)
        length = 0;
      else
        length = CurrentTokenRange.length;
      if (CurrentTokenRange.length <= 0)
        location = 0x7FFFFFFFFFFFFFFFLL;
      else
        location = CurrentTokenRange.location;
      if (length)
      {
        v15 = objc_msgSend(a2, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", location, 0, 0);
        v16 = objc_msgSend(a2, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", location + length, 0, 0);
        if (v15)
        {
          if (v16)
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v15, v16);
        }
      }
    }
  }
  return v4 ^ 1u;
}

- (id)textRangeForSelectionGranularity:(int64_t)a3 enclosingLocation:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t *v10;
  id v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  id v21;

  v21 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  if (a3 == 1)
  {
    v7 = -[NSTextLayoutManager _textRangeForDoubleClickAtLocation:](self, "_textRangeForDoubleClickAtLocation:", a4);
  }
  else
  {
    if ((unint64_t)(a3 - 2) > 2)
      v8 = 2;
    else
      v8 = qword_18D6CBE00[a3 - 2];
    v7 = +[NSTextSelectionNavigation _substringRangeForEnumerationType:location:dataSource:string:enclosingRange:](NSTextSelectionNavigation, "_substringRangeForEnumerationType:location:dataSource:string:enclosingRange:", v8, a4, self, 0, &v21);
  }
  v9 = v7;
  v10 = v16;
  v16[5] = (uint64_t)v9;
  if (a3 && !v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__NSTextLayoutManager_textRangeForSelectionGranularity_enclosingLocation___block_invoke;
    v14[3] = &unk_1E26036A0;
    v14[4] = a4;
    v14[5] = &v15;
    -[NSTextLayoutManager enumerateSubstringsFromLocation:options:usingBlock:](self, "enumerateSubstringsFromLocation:options:usingBlock:", a4, 514, v14);
    v10 = v16;
  }
  v11 = (id)v10[5];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {

    v11 = v21;
    v16[5] = (uint64_t)v11;
  }
  v12 = v11;
  _Block_object_dispose(&v15, 8);
  return v12;
}

id __74__NSTextLayoutManager_textRangeForSelectionGranularity_enclosingLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = (id)objc_msgSend(a3, "containsLocation:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  *a5 = 1;
  return result;
}

- (id)_copyTextLineFragmentRangeForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 pointPlacement:(unint64_t *)a5
{
  double y;
  double x;
  char *TextContainerEntryAndIndexForLocation;
  uint64_t v10;
  NSTextViewportLayoutController *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  uint64_t *v27;
  id v28;
  unint64_t v29;
  void *v30;
  _QWORD v32[10];
  _QWORD v33[4];
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  uint64_t v47;
  NSPoint v48;
  NSRect v49;

  y = a3.y;
  x = a3.x;
  TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a4);
  if (TextContainerEntryAndIndexForLocation)
    v10 = *((_QWORD *)TextContainerEntryAndIndexForLocation + 7);
  else
    v10 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3052000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  v47 = 0;
  v11 = -[NSTextLayoutManager textViewportLayoutController](self, "textViewportLayoutController");
  *a5 = 0;
  -[NSTextViewportLayoutController viewportBounds](v11, "viewportBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v48.x = x;
  v48.y = y;
  v49.origin.x = v13;
  v49.origin.y = v15;
  v49.size.width = v17;
  v49.size.height = v19;
  if (NSPointInRect(v48, v49)
    && (v20 = -[NSTextViewportLayoutController textViewportElementAtPoint:](v11, "textViewportElementAtPoint:", x, y),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & (v20 != 0)) != 0)
    || (v20 = -[NSTextLayoutManager textLayoutFragmentForPosition:inTextContainerAtIndex:](self, "textLayoutFragmentForPosition:inTextContainerAtIndex:", v10, x, y)) != 0)
  {
    objc_msgSend(v20, "layoutFragmentFrameOrigin");
    v22 = v21;
    v24 = v23;
    v38 = 0;
    v39 = (double *)&v38;
    v40 = 0x2020000000;
    v41 = 0xBFF0000000000000;
    v34 = 0;
    v35 = (double *)&v34;
    v36 = 0x2020000000;
    v37 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0x7FEFFFFFFFFFFFFFLL;
    v25 = (void *)objc_msgSend(v20, "textLineFragments");
    v26 = y - v24;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __95__NSTextLayoutManager__copyTextLineFragmentRangeForPoint_inContainerAtLocation_pointPlacement___block_invoke;
    v32[3] = &unk_1E2603F90;
    v32[4] = &v38;
    v32[5] = &v34;
    *(double *)&v32[8] = x - v22;
    *(double *)&v32[9] = v26;
    v32[6] = &v42;
    v32[7] = v33;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v32);
    v27 = v43;
    if (!v43[5])
    {
      if (v26 < v39[3])
      {
        v28 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "textLineFragments"), "firstObject"), "textLineFragmentRange");
        v29 = 2;
LABEL_13:
        v27 = v43;
        v43[5] = (uint64_t)v28;
        *a5 = v29;
        goto LABEL_14;
      }
      if (v26 >= v35[3])
      {
        v28 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "textLineFragments"), "lastObject"), "textLineFragmentRange");
        v29 = 4;
        goto LABEL_13;
      }
    }
LABEL_14:
    v30 = (void *)v27[5];
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    goto LABEL_15;
  }
  v30 = 0;
LABEL_15:
  _Block_object_dispose(&v42, 8);
  return v30;
}

id __95__NSTextLayoutManager__copyTextLineFragmentRangeForPoint_inContainerAtLocation_pointPlacement___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;

  result = (id)objc_msgSend(a2, "typographicBounds");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(double *)(v12 + 24);
  if (v13 < 0.0 || v13 < v9)
    *(double *)(v12 + 24) = v9;
  v15 = v9 + v11;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v15 > *(double *)(v16 + 24))
    *(double *)(v16 + 24) = v15;
  v17 = *(double *)(a1 + 72);
  if (v17 >= v9)
  {
    if (v17 >= v15)
      return result;
    v18 = *(double *)(a1 + 64);
    if (v18 >= v8)
    {
      v20 = v8 + v10;
      if (v20 > v18)
      {
LABEL_16:
        result = (id)objc_msgSend(a2, "textLineFragmentRange");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
        goto LABEL_20;
      }
      v19 = v18 - v20;
    }
    else
    {
      v19 = v8 - v18;
    }
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v19 < *(double *)(v21 + 24))
    {
      *(double *)(v21 + 24) = v19;

      result = (id)objc_msgSend(a2, "textLineFragmentRange");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
      return result;
    }
  }
  else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    goto LABEL_16;
  }
LABEL_20:
  *a4 = 1;
  return result;
}

- (id)lineFragmentRangeForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4
{
  uint64_t v5;

  v5 = 0;
  return -[NSTextLayoutManager _copyTextLineFragmentRangeForPoint:inContainerAtLocation:pointPlacement:](self, "_copyTextLineFragmentRangeForPoint:inContainerAtLocation:pointPlacement:", a4, &v5, a3.x, a3.y);
}

- (unint64_t)placementOfPoint:(CGPoint)a3 inContainerAtLocation:(id)a4
{
  unint64_t v5;

  v5 = 0;

  return v5;
}

- (void)enumerateContainerBoundariesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL4 v6;
  $93589CBA8E1B80577C20324DFAADD895 *p_lastTextContainerEntry;
  int64_t textContainerEntriesCount;
  char *TextContainerEntryAndIndexForLocation;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  NSTextRange *v18;
  uint64_t v19;
  char v20;
  char v21;

  v6 = a4;
  p_lastTextContainerEntry = &self->_lastTextContainerEntry;
  if (self->_lastTextContainerEntry.textContainer)
    textContainerEntriesCount = self->_textContainerEntriesCount + 1;
  else
    textContainerEntriesCount = self->_textContainerEntriesCount;
  if (textContainerEntriesCount < 2)
  {
    v18 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](self, "textContentManager", a3), "documentRange");
    v20 = 0;
    if (v6)
      v19 = -[NSTextRange location](v18, "location");
    else
      v19 = -[NSTextRange endLocation](v18, "endLocation");
    (*((void (**)(id, uint64_t, char *))a5 + 2))(a5, v19, &v20);
  }
  else
  {
    TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(self, a3);
    if (TextContainerEntryAndIndexForLocation)
    {
      v11 = *((_QWORD *)TextContainerEntryAndIndexForLocation + 7);
      if ((v11 & 0x8000000000000000) == 0 && v11 < textContainerEntriesCount)
      {
        if (v6)
        {
          textContainerEntriesCount = -1;
          v12 = -1;
        }
        else
        {
          v12 = 1;
        }
        v21 = 0;
        v13 = v12 + v11;
        v14 = v12 + v11;
        do
        {
          v15 = (void *)*((_QWORD *)TextContainerEntryAndIndexForLocation + 2);
          if (v6)
            v16 = objc_msgSend(v15, "location");
          else
            v16 = objc_msgSend(v15, "endLocation");
          (*((void (**)(id, uint64_t, char *))a5 + 2))(a5, v16, &v21);
          if (v21)
            break;
          if (self->_textContainerEntriesCount <= v13)
            TextContainerEntryAndIndexForLocation = p_lastTextContainerEntry->textContainer
                                                  ? (char *)p_lastTextContainerEntry
                                                  : 0;
          else
            TextContainerEntryAndIndexForLocation = (char *)&self->_textContainerEntries[v14];
          v17 = !TextContainerEntryAndIndexForLocation || textContainerEntriesCount == v13;
          v13 += v12;
          v14 += v12;
        }
        while (!v17);
      }
    }
  }
}

- (int64_t)textLayoutOrientationAtLocation:(id)a3
{
  int64_t result;

  result = -[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:", a3);
  if (result)
    return objc_msgSend((id)result, "layoutOrientation");
  return result;
}

uint64_t __54__NSTextLayoutManager_baseWritingDirectionAtLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

BOOL __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSTextRange *v10;
  NSTextRange *v11;
  _BOOL8 v12;
  void *v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(a2, "paragraphContentRange");
    v5 = v4;
    if (*(_QWORD *)(a1 + 56) == 1)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        if (!*(_BYTE *)(a1 + 72))
        {
          v14 = (void *)objc_msgSend(a2, "paragraphSeparatorRange");
          v15 = v14;
          if (v14)
          {
            if ((objc_msgSend(v14, "isEmpty") & 1) == 0
              && !objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(v15, "location")))
            {
              goto LABEL_18;
            }
          }
        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
        && objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend((id)objc_msgSend(a2, "paragraphSeparatorRange"), "location"))&& (*(_BYTE *)(a1 + 65) & 2) == 0)
      {
        objc_msgSend((id)objc_msgSend(a2, "attributedString"), "string");
      }
      if (objc_msgSend((id)objc_msgSend(a2, "childElements"), "count"))
      {
        v8 = (void *)objc_msgSend(a2, "paragraphSeparatorRange");
        v9 = v5;
        if (v8)
        {
          v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(v5, "location"), objc_msgSend(v8, "endLocation"));
LABEL_17:
          v11 = v10;
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          goto LABEL_18;
        }
      }
      else
      {
        v9 = (void *)objc_msgSend(a2, "elementRange");
      }
      v10 = v9;
      goto LABEL_17;
    }
    if (!objc_msgSend(v4, "isEmpty") || *(_QWORD *)(a1 + 56) != 3)
    {
      v6 = *(_QWORD *)(a1 + 64);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_5;
      v16[3] = &unk_1E2604030;
      v7 = *(_QWORD *)(a1 + 32);
      v16[4] = *(_QWORD *)(a1 + 40);
      v16[5] = &v17;
      objc_msgSend(a2, "enumerateSubstringsFromLocation:options:usingBlock:", v7, v6, v16);
    }
  }
LABEL_18:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v12 = *((_BYTE *)v18 + 24) == 0;
  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __74__NSTextLayoutManager_enumerateSubstringsFromLocation_options_usingBlock___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a5;
  return result;
}

- (id)_textViewRespondingToSelector:(SEL)a3
{
  NSArray *v3;
  id result;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[NSTextLayoutManager textContainers](self, "textContainers", 0);
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "textView");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          return v8;
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)_textSelectionsFromTextView
{
  id result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  result = -[NSTextLayoutManager _textViewRespondingToSelector:](self, "_textViewRespondingToSelector:", sel__textSelection);
  if (result)
  {
    result = (id)objc_msgSend(result, "_textSelection");
    if (result)
    {
      v3[0] = result;
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
    }
  }
  return result;
}

- (BOOL)_shouldDrawTextCorrectionMarkerWithType:(int64_t)a3 inRange:(id)a4
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  NSTextLayoutManager *v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v26 = __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke;
    v27 = &unk_1E26040D0;
    v28 = a4;
    v29 = self;
    v5 = -[NSTextLayoutManager textSelections](self, "textSelections");
    if (v5
      || (v6 = -[NSTextLayoutManager _textSelectionsFromTextView](self, "_textSelectionsFromTextView"), (v5 = v6) != 0))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v6 = (NSArray *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v6)
      {
        v7 = (uint64_t)v6;
        v8 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v22 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v17 = 0u;
            v18 = 0u;
            v19 = 0u;
            v20 = 0u;
            v11 = (void *)objc_msgSend(v10, "textRanges", 0);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v18;
LABEL_11:
              v15 = 0;
              while (1)
              {
                if (*(_QWORD *)v18 != v14)
                  objc_enumerationMutation(v11);
                if ((v26((uint64_t)v25, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15)) & 1) != 0)
                  goto LABEL_20;
                if (v13 == ++v15)
                {
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
                  if (v13)
                    goto LABEL_11;
                  break;
                }
              }
            }
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
          LOBYTE(v6) = 0;
          if (v7)
            continue;
          break;
        }
      }
    }
  }
  else
  {
LABEL_20:
    LOBYTE(v6) = 1;
  }
  return (char)v6;
}

uint64_t __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  NSTextRange *v7;
  NSTextRange *v8;
  BOOL v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  if (textRangesAreConnected(a2, *(void **)(a1 + 32)))
    return 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  v5 = *(void **)(a1 + 40);
  v6 = objc_msgSend(a2, "location");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke_2;
  v11[3] = &unk_1E2603678;
  v11[4] = &v12;
  objc_msgSend(v5, "enumerateSubstringsFromLocation:options:usingBlock:", v6, 771, v11);
  v4 = 0;
  if (v13[5])
  {
    v7 = [NSTextRange alloc];
    v8 = -[NSTextRange initWithLocation:endLocation:](v7, "initWithLocation:endLocation:", v13[5], objc_msgSend(a2, "endLocation"));
    v9 = textRangesAreConnected(v8, *(void **)(a1 + 32));

    if (v9)
      v4 = 1;
  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

id __71__NSTextLayoutManager__shouldDrawTextCorrectionMarkerWithType_inRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = (id)objc_msgSend(a3, "location");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)attributedStringForTruncatedRange:(id)a3 defaultAttributedString:(id)a4
{
  id v7;
  id result;

  v7 = -[NSTextLayoutManager delegate](self, "delegate");
  if (self->_delegateWithTruncationToken)
    result = (id)objc_msgSend(v7, "textLayoutManager:attributedStringForTruncatedRange:defaultAttributedString:", self, a3, a4);
  else
    result = 0;
  if (!result)
    return a4;
  return result;
}

+ (BOOL)shouldBeUsedForNSTextView
{
  if (shouldBeUsedForNSTextView_once != -1)
    dispatch_once(&shouldBeUsedForNSTextView_once, &__block_literal_global_177);
  return shouldBeUsedForNSTextView_result;
}

uint64_t __48__NSTextLayoutManager_shouldBeUsedForNSTextView__block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSUsesTextLayoutManager"));
  if (v0)
    result = objc_msgSend(v0, "BOOLValue");
  else
    result = 1;
  shouldBeUsedForNSTextView_result = result;
  return result;
}

+ (double)_textHighlightBackgroundColorPercentage
{
  if (_textHighlightBackgroundColorPercentage_onceToken != -1)
    dispatch_once(&_textHighlightBackgroundColorPercentage_onceToken, &__block_literal_global_180);
  return *(double *)&_textHighlightBackgroundColorPercentage_percentage;
}

uint64_t __62__NSTextLayoutManager__textHighlightBackgroundColorPercentage__block_invoke()
{
  void *v0;
  uint64_t result;
  uint64_t v2;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "valueForKey:", CFSTR("_NSTextHighlightBackgroundColorPercentage"));
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(v0, "doubleValue");
    _textHighlightBackgroundColorPercentage_percentage = v2;
  }
  return result;
}

- (id)textHighlightRenderingAttributesForTextRange:(id)a3 attributes:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NSTextHighlightStyle"));
  if (!v7)
    return (id)MEMORY[0x1E0C9AA70];
  v8 = (void *)v7;
  v9 = -[NSTextLayoutManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "textLayoutManager:textHighlightRenderingAttributesForTextRange:attributes:", self, a3, a4);
LABEL_7:
    v11 = (id)v10;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "textLayoutManager:textHighlightAttributesForTextRange:highlightStyle:", self, a3, v8);
    goto LABEL_7;
  }
  v11 = 0;
LABEL_9:
  if (!objc_msgSend(v11, "count"))
  {
    v11 = (id)objc_msgSend(-[NSTextLayoutManager textContainerForLocation:](self, "textContainerForLocation:", objc_msgSend(a3, "location")), "textHighlightRenderingAttributesForAttributes:", a4);
    if (!objc_msgSend(v11, "count"))
    {
      v12 = -[NSTextLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext");
      v13 = (void *)objc_opt_class();
      if (v12 == 1)
        v14 = objc_msgSend(v13, "textHighlightAttributes_iOS");
      else
        v14 = objc_msgSend(v13, "textHighlightAttributes_macOS");
      v11 = (id)v14;
    }
    if ((objc_msgSend((id)objc_opt_class(), "_usesOutlinedHighlightByDefault") & 1) == 0
      && (objc_msgSend(v8, "isEqualToString:", CFSTR("NSTextHighlightStyleOutlined")) & 1) == 0
      && objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSTextHighlightOutlineColor")))
    {
      objc_sync_enter(self);
      if (objc_msgSend((id)textHighlightRenderingAttributesForTextRange_attributes__baseAttributes, "isEqualToDictionary:", v11))
      {
        v15 = (void *)textHighlightRenderingAttributesForTextRange_attributes__attributesWithoutOutline;
      }
      else
      {
        v15 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("NSTextHighlightOutlineColor"));

        textHighlightRenderingAttributesForTextRange_attributes__baseAttributes = (uint64_t)v11;
        textHighlightRenderingAttributesForTextRange_attributes__attributesWithoutOutline = (uint64_t)v15;
      }
      v11 = v15;
      objc_sync_exit(self);
    }
  }
  return v11;
}

- (NSTextHighlightShapeProvider)_textHighlightShapeProvider
{
  NSTextHighlightShapeProvider *textHighlightShapeProvider;

  objc_sync_enter(self);
  textHighlightShapeProvider = self->_textHighlightShapeProvider;
  if (!textHighlightShapeProvider)
  {
    textHighlightShapeProvider = -[NSTextHighlightShapeProvider initWithTextLayoutManager:]([NSTextHighlightShapeProvider alloc], "initWithTextLayoutManager:", self);
    self->_textHighlightShapeProvider = textHighlightShapeProvider;
  }
  objc_sync_exit(self);
  return textHighlightShapeProvider;
}

- (void)drawTextHighlightBackgroundForTextRange:(id)a3 attributes:(id)a4 options:(unint64_t)a5 origin:(CGPoint)a6 context:(CGContext *)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  _NSCGTextGraphicsContext *v20;
  _QWORD v21[12];

  if (a7)
  {
    y = a6.y;
    x = a6.x;
    v13 = -[NSTextLayoutManager textHighlightRenderingAttributesForTextRange:attributes:](self, "textHighlightRenderingAttributesForTextRange:attributes:", a3, a4);
    v14 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor"));
    v15 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSTextHighlightOutlineColor"));
    if (v14
      || ((v16 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSColor")),
           v17 = -[NSTextLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext"),
           v18 = (void *)objc_opt_class(),
           v17 != 1)
        ? (v19 = objc_msgSend(v18, "textHighlightBackgroundColorForForegroundColor_macOS:", v16))
        : (v19 = objc_msgSend(v18, "textHighlightBackgroundColorForForegroundColor_iOS:", v16)),
          v14 = v19,
          v19 | v15))
    {
      v20 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", a7);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __97__NSTextLayoutManager_drawTextHighlightBackgroundForTextRange_attributes_options_origin_context___block_invoke;
      v21[3] = &unk_1E2604160;
      v21[7] = v15;
      v21[8] = a7;
      *(CGFloat *)&v21[9] = x;
      *(CGFloat *)&v21[10] = y;
      v21[4] = self;
      v21[5] = a3;
      v21[11] = a5;
      v21[6] = v14;
      +[NSTextGraphicsContextProvider setCurrentTextGraphicsContext:duringBlock:](NSTextGraphicsContextProvider, "setCurrentTextGraphicsContext:duringBlock:", v20, v21);

    }
  }
}

void __97__NSTextLayoutManager_drawTextHighlightBackgroundForTextRange_attributes_options_origin_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  CGContextSaveGState(*(CGContextRef *)(a1 + 64));
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_textHighlightShapeProvider");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 88);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__NSTextLayoutManager_drawTextHighlightBackgroundForTextRange_attributes_options_origin_context___block_invoke_2;
  v5[3] = &unk_1E2604138;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateHighlightPathsForRange:options:usingBlock:", v3, v4, v5);
  CGContextRestoreGState(*(CGContextRef *)(a1 + 64));
}

void __97__NSTextLayoutManager_drawTextHighlightBackgroundForTextRange_attributes_options_origin_context___block_invoke_2(uint64_t a1, const CGPath *a2, const CGPath *a3)
{
  void *v5;
  void *v7;

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "set");
    CGContextAddPath(*(CGContextRef *)(a1 + 48), a2);
    CGContextFillPath(*(CGContextRef *)(a1 + 48));
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v7, "set");
    CGContextAddPath(*(CGContextRef *)(a1 + 48), a3);
    CGContextStrokePath(*(CGContextRef *)(a1 + 48));
  }
}

- (void)drawTextHighlightBackgroundForTextRange:(id)a3 highlightStyle:(id)a4 options:(unint64_t)a5 origin:(CGPoint)a6 context:(CGContext *)a7
{
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("NSTextHighlightStyle");
  v8[0] = a4;
  -[NSTextLayoutManager drawTextHighlightBackgroundForTextRange:attributes:options:origin:context:](self, "drawTextHighlightBackgroundForTextRange:attributes:options:origin:context:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a5, a7, a6.x, a6.y);
}

+ (BOOL)_usesOutlinedHighlightByDefault
{
  if (_usesOutlinedHighlightByDefault_onceToken != -1)
    dispatch_once(&_usesOutlinedHighlightByDefault_onceToken, &__block_literal_global_191_0);
  return _usesOutlinedHighlightByDefault_usesOutlinedHighlightByDefault;
}

uint64_t __54__NSTextLayoutManager__usesOutlinedHighlightByDefault__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("_NSTextLayoutManagerUsesOutlinedHighlight"));
  _usesOutlinedHighlightByDefault_usesOutlinedHighlightByDefault = result;
  return result;
}

- (BOOL)_adjustedTextLayoutFragmentBoundaryTextRangeForTextRange:(id)a3 location:(id *)a4 endLocation:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v9 = objc_msgSend(a3, "location");
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke;
  v18[3] = &unk_1E2603B68;
  v18[4] = &v19;
  -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v9, 0, v18);
  v11 = v20[5];
  if (v11)
  {
    v12 = (void *)objc_msgSend((id)v20[5], "rangeInElement");
    if ((objc_msgSend((id)objc_msgSend(v12, "location"), "isEqual:", objc_msgSend(a3, "location")) & 1) != 0)
      v13 = 0;
    else
      v13 = (void *)objc_msgSend(v12, "location");
    v14 = objc_msgSend((id)objc_msgSend(v12, "endLocation"), "compare:", objc_msgSend(a3, "endLocation"));
    if (v14 == -1)
    {
      v20[5] = 0;
    }
    else if (v14 == 1)
    {
      v15 = (void *)objc_msgSend(v12, "endLocation");
      if (v15)
      {
LABEL_14:
        *a4 = v13;
        *a5 = v15;
        goto LABEL_15;
      }
    }
    if (v20[5])
    {
      v15 = 0;
    }
    else
    {
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke_2;
      v17[3] = &unk_1E2603B90;
      v17[4] = a3;
      v17[5] = &v19;
      -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](self, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", objc_msgSend(a3, "endLocation"), 1, v17);
      v15 = (void *)v20[5];
      if (v15)
        v15 = (void *)objc_msgSend((id)objc_msgSend(v15, "rangeInElement"), "endLocation");
    }
    goto LABEL_14;
  }
LABEL_15:
  _Block_object_dispose(&v19, 8);
  return v11 != 0;
}

uint64_t __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  return 0;
}

uint64_t __101__NSTextLayoutManager__adjustedTextLayoutFragmentBoundaryTextRangeForTextRange_location_endLocation___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "endLocation")) & 1) == 0)*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return 0;
}

- (void)_invalidateTextAnimationContextForTextRange:(id)a3 reason:(int64_t)a4
{
  _NSTextRunStorage *textAnimationContextStorage;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  textAnimationContextStorage = self->_textAnimationContextStorage;
  v7 = objc_msgSend(a3, "location");
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke;
  v11[3] = &unk_1E26041A8;
  v11[4] = a3;
  v11[5] = v9;
  -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](textAnimationContextStorage, "enumerateObjectsFromLocation:options:usingBlock:", v7, 2, v11);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke_2;
  v10[3] = &unk_1E26041D0;
  v10[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

uint64_t __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "enclosingTextRange"), "location"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  if (result == -1)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  *a4 = 1;
  return result;
}

uint64_t __74__NSTextLayoutManager__invalidateTextAnimationContextForTextRange_reason___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_overridden");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setObject:forRange:", 0, objc_msgSend(a2, "enclosingTextRange"));
}

- (BOOL)_addTextAnimationContext:(id)a3
{
  void *v5;
  NSTextRange *v6;
  uint64_t v7;
  NSTextRange *v8;
  NSTextRange *v9;
  _NSTextRunStorage *textAnimationContextStorage;
  __int128 v12;

  objc_sync_enter(self);
  v5 = (void *)objc_msgSend(a3, "enclosingTextRange");
  if (v5)
  {
    v12 = 0uLL;
    if (-[NSTextLayoutManager _adjustedTextLayoutFragmentBoundaryTextRangeForTextRange:location:endLocation:](self, "_adjustedTextLayoutFragmentBoundaryTextRangeForTextRange:location:endLocation:", v5, (char *)&v12 + 8, &v12))
    {
      if (v12 == 0)
      {
        v8 = v5;
      }
      else
      {
        v6 = [NSTextRange alloc];
        v7 = *((_QWORD *)&v12 + 1);
        if (!*((_QWORD *)&v12 + 1))
          v7 = objc_msgSend(v5, "location");
        if (!(_QWORD)v12)
          objc_msgSend(v5, "endLocation");
        v8 = -[NSTextRange initWithLocation:endLocation:](v6, "initWithLocation:endLocation:", v7);
      }
      v9 = v8;
      if (-[NSTextRange isNotEmpty](v8, "isNotEmpty"))
      {
        if (self->_textAnimationContextStorage)
        {
          -[NSTextLayoutManager _invalidateTextAnimationContextForTextRange:reason:](self, "_invalidateTextAnimationContextForTextRange:reason:", v9, 1);
          textAnimationContextStorage = self->_textAnimationContextStorage;
        }
        else
        {
          textAnimationContextStorage = -[_NSTextRunStorage initWithDataSource:]([_NSTextRunStorage alloc], "initWithDataSource:", self);
          self->_textAnimationContextStorage = textAnimationContextStorage;
        }
        -[_NSTextRunStorage setObject:forRange:](textAnimationContextStorage, "setObject:forRange:", a3, v9);
        objc_msgSend(a3, "_updateEnclosingLocation:endLocation:", -[NSTextRange location](v9, "location"), -[NSTextRange endLocation](v9, "endLocation"));
      }

    }
  }
  objc_sync_exit(self);
  return 1;
}

- (void)_removeTextAnimationContext:(id)a3
{
  objc_sync_enter(self);
  -[_NSTextRunStorage setObject:forRange:](self->_textAnimationContextStorage, "setObject:forRange:", 0, objc_msgSend(a3, "enclosingTextRange"));
  objc_sync_exit(self);
}

- (id)_textAnimationContextForLocation:(id)a3
{
  _NSTextRunStorage *textAnimationContextStorage;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  objc_sync_enter(self);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  textAnimationContextStorage = self->_textAnimationContextStorage;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSTextLayoutManager__textAnimationContextForLocation___block_invoke;
  v8[3] = &unk_1E26041F8;
  v8[4] = a3;
  v8[5] = &v9;
  -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](textAnimationContextStorage, "enumerateObjectsFromLocation:options:usingBlock:", a3, 2, v8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  objc_sync_exit(self);
  return v6;
}

uint64_t __56__NSTextLayoutManager__textAnimationContextForLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "enclosingTextRange"), "containsLocation:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *a4 = 1;
  return result;
}

- (id)isSelectionOverridableColor
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setIsSelectionOverridableColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void)renderingAttributesValidator
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setRenderingAttributesValidator:(void *)renderingAttributesValidator
{
  objc_setProperty_atomic_copy(self, a2, renderingAttributesValidator, 280);
}

- (void)setRendersBackgroundColorAttribute:(BOOL)a3
{
  self->_rendersBackgroundColorAttribute = a3;
}

- (void)setTemplateTextContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSOperationQueue)layoutQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 296, 1);
}

- (void)setLayoutQueue:(NSOperationQueue *)layoutQueue
{
  objc_setProperty_atomic(self, a2, layoutQueue, 296);
}

+ (id)textHighlightAttributes_iOS
{
  if (textHighlightAttributes_iOS_onceToken != -1)
    dispatch_once(&textHighlightAttributes_iOS_onceToken, &__block_literal_global_16);
  return (id)textHighlightAttributes_iOS_attributes;
}

id __79__NSTextLayoutManager_UIFoundation_UIKitAdditions__textHighlightAttributes_iOS__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  id result;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v0 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", 1);
  }
  else
  {
    v0 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v1 = v0;
  v3[0] = CFSTR("NSColor");
  v3[1] = CFSTR("NSTextHighlightOutlineColor");
  v4[0] = -[objc_class selectionHighlightColor](v0, "selectionHighlightColor");
  v4[1] = -[objc_class secondaryLabelColor](v1, "secondaryLabelColor");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  textHighlightAttributes_iOS_attributes = (uint64_t)result;
  return result;
}

+ (id)textHighlightBackgroundColorForForegroundColor_iOS:(id)a3
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "alphaComponent");
  v6 = v5;
  objc_msgSend(a1, "_textHighlightBackgroundColorPercentage");
  return (id)objc_msgSend(a3, "colorWithAlphaComponent:", v6 * v7);
}

@end
