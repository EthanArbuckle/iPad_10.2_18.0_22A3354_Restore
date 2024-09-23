@implementation _UITextAssistantManager

- (void)targetedPreviewFor:(_TtC5UIKit21UITextEffectTextChunk *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC5UIKit21UITextEffectTextChunk *v15;
  _UITextAssistantManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD85D98);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_186507774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EDD8A6F0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EDD8A6F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_185763474((uint64_t)v9, (uint64_t)&unk_1EDD8A700, (uint64_t)v14);
  swift_release();
}

- (void)updateTextChunkVisibilityForAnimation:(_TtC5UIKit21UITextEffectTextChunk *)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC5UIKit21UITextEffectTextChunk *v17;
  _UITextAssistantManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD85D98);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_186507774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EDD8A6B0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EDD85DB0;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_185763474((uint64_t)v11, (uint64_t)&unk_1EDD85DB8, (uint64_t)v16);
  swift_release();
}

- (void)beginTextAssistantAnticipation
{
  _UITextAssistantManager *v2;

  v2 = self;
  sub_1857614A4();

}

- (void)beginTextAssistantAnticipationForProofreadingRange:(id)a3
{
  id v5;
  _UITextAssistantManager *v6;

  v5 = a3;
  v6 = self;
  sub_185761660(a3);
  sub_185761874(a3);

}

- (void)endTextAssistantAnticipation
{
  _UITextAssistantManager *v2;

  v2 = self;
  sub_18576203C();

}

- (void)animateRewrittenTextForDelivery:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _UITextAssistantManager *v8;
  uint64_t v9;

  v4 = sub_186506BBC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_186506BA4();
  v8 = self;
  sub_1857622F4((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setHasDeliveredReplacement:(BOOL)a3 forDelivery:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _UITextAssistantManager *v10;
  uint64_t v11;
  uint64_t v12;
  _UITextAssistantManager *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_186506BBC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_186506BA4();
  v10 = self;
  v11 = sub_185765118((uint64_t)v9, v10);
  if (v11)
  {
    v12 = v11;
    swift_beginAccess();
    v13 = (_UITextAssistantManager *)*(id *)(v12 + 24);
    swift_release();
    type metadata accessor for UITextAssistantDeliveryChunk();
    v14 = swift_dynamicCastClass();
    if (v14)
      *(_BYTE *)(v14 + OBJC_IVAR____TtC5UIKit28UITextAssistantDeliveryChunk_hasDeliveredReplacement) = a3;

    v10 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)invalidateReplacementForDelivery:(id)a3 animated:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _UITextAssistantManager *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD85D98);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_186506BBC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_186506BA4();
  v12 = self;
  v13 = sub_185765118((uint64_t)v11, v12);
  if (v13)
  {
    v14 = v13;
    v15 = sub_186507774();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
    sub_18650775C();
    swift_retain();
    v16 = sub_186507750();
    v17 = (_QWORD *)swift_allocObject();
    v18 = MEMORY[0x1E0DF06E8];
    v17[2] = v16;
    v17[3] = v18;
    v17[4] = v14;
    sub_18563FB24((uint64_t)v7, (uint64_t)&unk_1EDD86410, (uint64_t)v17);

    swift_release();
    swift_release();
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)visualizationCleanup
{
  _UITextAssistantManager *v2;

  v2 = self;
  sub_185762E9C();

}

- (_UITextAssistantManager)initWithTextView:(id)a3
{
  id v4;
  _UITextAssistantManager *v5;
  _UITextAssistantManager *v6;
  NSMutableArray *v7;
  NSMutableArray *writingToolsDelegateMessageInvocationBuffer;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITextAssistantManager;
  v5 = -[_UITextAssistantManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textView, v4);
    v6->_proofreadingDeliveryProcessedRange = (_NSRange)xmmword_186679030;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    writingToolsDelegateMessageInvocationBuffer = v6->_writingToolsDelegateMessageInvocationBuffer;
    v6->_writingToolsDelegateMessageInvocationBuffer = v7;

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSUUID *activeSessionUUID;
  id WeakRetained;
  void *v7;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITextAssistantManager;
  -[_UITextAssistantManager description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  activeSessionUUID = self->_activeSessionUUID;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v7 = WeakRetained;
  if (activeSessionUUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" textView=%p tracker=%p"), WeakRetained, self->_replacementTracker);
  else
    objc_msgSend(v4, "appendFormat:", CFSTR(" textView=%p NO ACTIVE SESSION"), WeakRetained, v9);

  return (NSString *)v4;
}

- (void)sessionCleanup
{
  UITextView **p_textView;
  id WeakRetained;
  id v5;
  id v6;
  UIView *infillViewPreceedingEvaluatedRange;
  UIView *infillViewFollowingEvaluatedRange;
  id v9;
  _UITextChoiceInteraction *proofreadingInteraction;
  NSMutableDictionary *backingProofreadingSuggestionStatesByUUID;
  NSMutableAttributedString *proofreadingDeliveryReplacement;
  NSMutableArray *proofreadingDeliverySuggestionIDs;
  _UITextAssistantReplacementTracker *replacementTracker;
  _UIWritingToolsUndoRoller *undoRoller;
  _UIAssertion *grabberSuppression;
  _UIAssertion *selectionUIHiddenAssertion;
  NSUUID *inFlightDeliveryID;

  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "_setWritingToolsStreamingReplacements:", 0);

  v5 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v5, "_setUniqueWritingToolsAnimatedLayoutInfo:", 0);

  v6 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v6, "_removeLayoutFragmentViewHiding");

  -[UIView removeFromSuperview](self->_infillViewPreceedingEvaluatedRange, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_infillViewFollowingEvaluatedRange, "removeFromSuperview");
  infillViewPreceedingEvaluatedRange = self->_infillViewPreceedingEvaluatedRange;
  self->_infillViewPreceedingEvaluatedRange = 0;

  infillViewFollowingEvaluatedRange = self->_infillViewFollowingEvaluatedRange;
  self->_infillViewFollowingEvaluatedRange = 0;

  self->_followingInfillViewBaseMinY = 0.0;
  self->_originalFollowingInfillViewMinY = 0.0;
  if (self->_proofreadingInteraction)
  {
    v9 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v9, "removeInteraction:", self->_proofreadingInteraction);

    proofreadingInteraction = self->_proofreadingInteraction;
    self->_proofreadingInteraction = 0;

  }
  objc_storeWeak((id *)&self->_proofreadingTextViewDelegate, 0);
  backingProofreadingSuggestionStatesByUUID = self->_backingProofreadingSuggestionStatesByUUID;
  self->_backingProofreadingSuggestionStatesByUUID = 0;

  self->_showingOriginal = 0;
  self->_proofreadingDeliveryProcessedRange.location = 0x7FFFFFFFFFFFFFFFLL;
  self->_proofreadingDeliveryProcessedRange.length = 0;
  proofreadingDeliveryReplacement = self->_proofreadingDeliveryReplacement;
  self->_proofreadingDeliveryGapLength = 0;
  self->_proofreadingDeliveryReplacement = 0;

  proofreadingDeliverySuggestionIDs = self->_proofreadingDeliverySuggestionIDs;
  self->_proofreadingDeliverySuggestionIDs = 0;

  replacementTracker = self->_replacementTracker;
  self->_replacementTracker = 0;

  undoRoller = self->_undoRoller;
  self->_undoRoller = 0;

  -[_UIAssertion _invalidate](self->_grabberSuppression, "_invalidate");
  grabberSuppression = self->_grabberSuppression;
  self->_grabberSuppression = 0;

  -[_UITextAssistantManager visualizationCleanup](self, "visualizationCleanup");
  -[_UIAssertion _invalidate](self->_selectionUIHiddenAssertion, "_invalidate");
  selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
  self->_selectionUIHiddenAssertion = 0;

  *(_WORD *)&self->_isEndingSessionByRequest = 0;
  inFlightDeliveryID = self->_inFlightDeliveryID;
  self->_inFlightDeliveryID = 0;

  self->_offsetToContextualRange = 0;
  -[NSMutableArray removeAllObjects](self->_writingToolsDelegateMessageInvocationBuffer, "removeAllObjects");
}

- (id)contextForWritingToolsWithCompositionSessionType:(int64_t)a3
{
  UITextView **p_textView;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id *v45;
  NSUInteger v46;
  NSUInteger v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t i;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSRange v63;
  unint64_t v64;
  NSObject *v65;
  NSObject *v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  id *location;
  id obj;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  NSUInteger v94;
  _BYTE v95[128];
  uint64_t v96;
  NSRange v97;
  NSRange v98;

  v96 = *MEMORY[0x1E0C80C00];
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v8, "textLayoutController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  v11 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v10, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "offsetFromPosition:toPosition:", v12, v13) < 0)
  {

LABEL_7:
    v22 = 0;
    v23 = 0;
    goto LABEL_48;
  }
  location = (id *)p_textView;
  v14 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v7, "end");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v10;
  objc_msgSend(v10, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "offsetFromPosition:toPosition:", v15, v16);

  if (v17 < 0)
  {
    v22 = 0;
    v23 = 0;
    v10 = v76;
    goto LABEL_48;
  }
  if (a3 == 10)
  {
    v18 = location;
    v19 = objc_loadWeakRetained(location);
    objc_msgSend(v19, "textLayoutController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "documentRange");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v76;
  }
  else
  {
    v24 = objc_msgSend(v7, "isEmpty");
    v18 = location;
    v19 = objc_loadWeakRetained(location);
    objc_msgSend(v19, "textLayoutController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;
    v10 = v76;
    if (v24)
      objc_msgSend(v25, "documentRange");
    else
      objc_msgSend(v25, "_writingToolsMinimumContextualRangeForRange:", v7);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (!v21)
    v21 = v7;
  v75 = v21;
  v26 = objc_loadWeakRetained(v18);
  objc_msgSend(v21, "start");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v26, "offsetFromPosition:toPosition:", v27, v28);

  v30 = objc_loadWeakRetained(v18);
  objc_msgSend(v30, "_nsrangeForTextRange:", v7);
  v32 = v31;

  if ((v29 | v32) >= 0)
    v33 = v29;
  else
    v33 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v29 | v32) >= 0)
    v34 = v32;
  else
    v34 = 0;
  v73 = v34;
  v74 = v33;
  v35 = objc_loadWeakRetained(v18);
  objc_msgSend(v35, "textLayoutController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "documentRange");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "start");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "start");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v35, "offsetFromPosition:toPosition:", v38, v39);

  self->_offsetToContextualRange = v40;
  v23 = v75;

  v41 = objc_loadWeakRetained(v18);
  objc_msgSend(v41, "attributedTextInRange:", v75);
  v77 = objc_claimAutoreleasedReturnValue();

  v42 = objc_loadWeakRetained(v18);
  LODWORD(v36) = objc_msgSend(v42, "_delegateSuppliesWritingToolsIgnoredRanges");

  if ((_DWORD)v36)
  {
    v72 = v7;
    v43 = objc_loadWeakRetained(v18);
    v44 = objc_msgSend(v43, "_nsrangeForTextRange:", v75);
    v45 = v18;
    v47 = v46;

    v48 = objc_loadWeakRetained(v45);
    objc_msgSend(v48, "delegate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_loadWeakRetained(v45);
    objc_msgSend(v49, "textView:writingToolsIgnoredRangesInEnclosingRange:", v50, v44, v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v52 = v51;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
    if (v53)
    {
      v54 = v53;
      obj = v52;
      v55 = 0;
      v56 = *(_QWORD *)v82;
      v80 = *MEMORY[0x1E0DDA138];
      v57 = (void *)v77;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v82 != v56)
            objc_enumerationMutation(obj);
          v59 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          v60 = objc_msgSend(v59, "rangeValue");
          v62 = v61;
          v97.location = objc_msgSend(v59, "rangeValue");
          v98.location = 0;
          v98.length = v47;
          v63 = NSIntersectionRange(v97, v98);
          if ((uint64_t)v63.length < 1)
          {
            v64 = contextForWritingToolsWithCompositionSessionType____s_category;
            if (!contextForWritingToolsWithCompositionSessionType____s_category)
            {
              v64 = __UILogCategoryGetNode("WritingTools", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v64, (unint64_t *)&contextForWritingToolsWithCompositionSessionType____s_category);
            }
            v65 = *(NSObject **)(v64 + 8);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              v66 = v65;
              v67 = objc_loadWeakRetained(location);
              objc_msgSend(v67, "delegate");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v86 = v68;
              v87 = 2048;
              v88 = v60;
              v89 = 2048;
              v90 = v62;
              v91 = 2048;
              v92 = 0;
              v93 = 2048;
              v94 = v47;
              _os_log_impl(&dword_185066000, v66, OS_LOG_TYPE_ERROR, "Delegate, %@, requested range to ignore, {.location=%lu,.length=%lu}, does not intersect enclosing range, {.location=%lu,.length=%lu}", buf, 0x34u);

              v57 = (void *)v77;
            }
          }
          else
          {
            if (!v55)
              v55 = (void *)objc_msgSend(v57, "mutableCopy");
            objc_msgSend(v55, "addAttribute:value:range:", v80, &unk_1E1A99390, v63.location, v63.length);
          }
        }
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
      }
      while (v54);
      v52 = obj;

      v10 = v76;
      if (!v55)
      {
        v70 = v74;
        v23 = v75;
        goto LABEL_43;
      }
      v69 = objc_msgSend(v55, "copy");

      v57 = (void *)v69;
      v70 = v74;
      v23 = v75;
    }
    else
    {
      v55 = v52;
      v70 = v74;
      v57 = (void *)v77;
    }

LABEL_43:
    v7 = v72;
    goto LABEL_44;
  }
  v70 = v74;
  v57 = (void *)v77;
LABEL_44:
  if (v70 == 0x7FFFFFFFFFFFFFFFLL)
    v22 = 0;
  else
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDA130]), "initWithAttributedText:range:", v57, v70, v73);

LABEL_48:
  return v22;
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  void *v4;
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSUUID *v15;
  NSUUID *activeSessionUUID;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  __CFString *v24;
  uint8_t buf[4];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  if (objc_opt_class())
  {
    if (self->_activeSessionUUID)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 284, CFSTR("New writing tools session starting without having ended the previous session"));

    }
    -[_UITextAssistantManager contextForWritingToolsWithCompositionSessionType:](self, "contextForWritingToolsWithCompositionSessionType:", objc_msgSend(v8, "compositionSessionType"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v27[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v12);

    }
    else
    {
      v9[2](v9, (void *)MEMORY[0x1E0C9AA60]);
    }
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v18 = _MergedGlobals_1164;
      if (!_MergedGlobals_1164)
      {
        v18 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&_MergedGlobals_1164);
      }
      v19 = *(id *)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if (v11)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "attributedText");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v11, "range");
          objc_msgSend(v11, "range");
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Created context for new Writing Tools session\n%@\nrequested range = {.location=%lu, .length=%lu"), v4, v21, v22);
          v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = CFSTR("Failed to create context for Writing Tools session");
        }
        *(_DWORD *)buf = 138412290;
        v24 = (__CFString *)v23;
        v26 = v23;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        if (v11)
        {

        }
      }

    }
    objc_msgSend(v8, "uuid");
    v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    activeSessionUUID = self->_activeSessionUUID;
    self->_activeSessionUUID = v15;

  }
  else
  {
    v13 = qword_1ECD7F390;
    if (!qword_1ECD7F390)
    {
      v13 = __UILogCategoryGetNode("TextAssistant", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD7F390);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "The WritingTools framework is not available", buf, 2u);
    }
  }

}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  UITextView **p_textView;
  id WeakRetained;
  void *v15;
  _UIAssertion *v16;
  _UIAssertion *selectionUIHiddenAssertion;
  _UITextAssistantReplacementTracker *v18;
  void *v19;
  unint64_t offsetToContextualRange;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _UITextAssistantReplacementTracker *v26;
  _UITextAssistantReplacementTracker *replacementTracker;
  void *v28;
  id v29;
  void *v30;
  _UITextAssistantReplacementTracker *v31;
  void *v32;
  _UITextAssistantReplacementTracker *v33;
  _UITextAssistantReplacementTracker *v34;
  id v35;
  NSUInteger v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  UIView *v41;
  UIView *infillViewPreceedingEvaluatedRange;
  id v43;
  NSUInteger v44;
  void *v45;
  void *v46;
  unint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  UIView *v52;
  UIView *infillViewFollowingEvaluatedRange;
  double MinY;
  id v55;
  void *v56;
  unint64_t v57;
  NSObject *v58;
  unint64_t v59;
  NSObject *v60;
  unint64_t v61;
  NSObject *v62;
  _UITextAssistantReplacementTracker *v63;
  unint64_t v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  _UITextAssistantReplacementTracker *v70;
  unint64_t v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  _UITextAssistantReplacementTracker *v76;
  NSObject *v77;
  NSObject *v78;
  id *location;
  void *v80;
  uint8_t buf[4];
  _UITextAssistantReplacementTracker *v82;
  __int16 v83;
  NSUInteger v84;
  __int16 v85;
  NSUInteger v86;
  uint64_t v87;
  CGRect v88;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 299, CFSTR("Can't have begun a writing tools session without any contexts"));

  }
  if (objc_msgSend(v8, "count") != 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v77, OS_LOG_TYPE_FAULT, "Only supporting one context at a time in UITextView right now", buf, 2u);
      }

    }
    else
    {
      v57 = qword_1ECD7F398;
      if (!qword_1ECD7F398)
      {
        v57 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v57, (unint64_t *)&qword_1ECD7F398);
      }
      v58 = *(NSObject **)(v57 + 8);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v58, OS_LOG_TYPE_ERROR, "Only supporting one context at a time in UITextView right now", buf, 2u);
      }
    }
  }
  if (self->_replacementTracker)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v78, OS_LOG_TYPE_FAULT, "Starting a writing tools session with a lingering replacement tracker that will be overwritten", buf, 2u);
      }

    }
    else
    {
      v59 = qword_1ECD7F3A0;
      if (!qword_1ECD7F3A0)
      {
        v59 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v59, (unint64_t *)&qword_1ECD7F3A0);
      }
      v60 = *(NSObject **)(v59 + 8);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v60, OS_LOG_TYPE_ERROR, "Starting a writing tools session with a lingering replacement tracker that will be overwritten", buf, 2u);
      }
    }
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "range");
  v12 = v11;

  self->_evaluatedRange.location = v10;
  self->_evaluatedRange.length = v12;
  -[_UIAssertion _invalidate](self->_selectionUIHiddenAssertion, "_invalidate");
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "_selectionDisplayInteraction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_obtainSelectionUIHiddenAssertionForReason:animated:", CFSTR("Writing Tools Began Session"), 1);
  v16 = (_UIAssertion *)objc_claimAutoreleasedReturnValue();
  selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
  self->_selectionUIHiddenAssertion = v16;

  if (objc_msgSend(v7, "type") == 1)
  {
    location = (id *)&self->_textView;
    v80 = v7;
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
    {
      v64 = qword_1ECD7F3A8;
      if (!qword_1ECD7F3A8)
      {
        v64 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v64, (unint64_t *)&qword_1ECD7F3A8);
      }
      v65 = *(NSObject **)(v64 + 8);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = v65;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "attributedText");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "string");
        v69 = v8;
        v70 = (_UITextAssistantReplacementTracker *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v82 = v70;
        v83 = 2048;
        v84 = v10;
        v85 = 2048;
        v86 = v12;
        _os_log_impl(&dword_185066000, v66, OS_LOG_TYPE_ERROR, "Begin proofread of\n%@\n with range {%lu, %lu}", buf, 0x20u);

        v8 = v69;
      }
    }
    v18 = [_UITextAssistantReplacementTracker alloc];
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    offsetToContextualRange = self->_offsetToContextualRange;
    v21 = v8;
    v22 = objc_alloc((Class)&sel_convertRectWithDocumentScale_[8]);
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributedText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithContextString:contextRange:delegate:", v24, v10, v12, self);
    v26 = -[_UITextAssistantReplacementTracker initFromSessionContext:offsetForSessionRange:withProofreadingController:](v18, "initFromSessionContext:offsetForSessionRange:withProofreadingController:", v19, offsetToContextualRange, v25);
    replacementTracker = self->_replacementTracker;
    self->_replacementTracker = v26;

    v8 = v21;
    v7 = v80;
    objc_msgSend(v80, "textViewDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_proofreadingTextViewDelegate, v28);

    p_textView = &self->_textView;
    v29 = objc_loadWeakRetained(location);
    objc_msgSend(v29, "_nonNullUITextRangeFromNSRange:", self->_offsetToContextualRange + v10, v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextAssistantManager beginTextAssistantAnticipationForProofreadingRange:](self, "beginTextAssistantAnticipationForProofreadingRange:", v30);

  }
  else if (objc_msgSend(v7, "type") == 2)
  {
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
    {
      v71 = qword_1ECD7F3B0;
      if (!qword_1ECD7F3B0)
      {
        v71 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v71, (unint64_t *)&qword_1ECD7F3B0);
      }
      v72 = *(NSObject **)(v71 + 8);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        v73 = v72;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "attributedText");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "string");
        v76 = (_UITextAssistantReplacementTracker *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v82 = v76;
        v83 = 2048;
        v84 = v10;
        v85 = 2048;
        v86 = v12;
        _os_log_impl(&dword_185066000, v73, OS_LOG_TYPE_ERROR, "Begin rewrite of\n%@\n with range {%lu, %lu}", buf, 0x20u);

      }
    }
    v31 = [_UITextAssistantReplacementTracker alloc];
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[_UITextAssistantReplacementTracker initFromSessionContext:offsetForSessionRange:withProofreadingController:](v31, "initFromSessionContext:offsetForSessionRange:withProofreadingController:", v32, self->_offsetToContextualRange, 0);
    v34 = self->_replacementTracker;
    self->_replacementTracker = v33;

    -[_UITextAssistantManager beginTextAssistantAnticipation](self, "beginTextAssistantAnticipation");
  }
  v35 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v35, "_setWritingToolsStreamingReplacements:", 1);

  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
  {
    v61 = qword_1ECD7F3B8;
    if (!qword_1ECD7F3B8)
    {
      v61 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v61, (unint64_t *)&qword_1ECD7F3B8);
    }
    v62 = *(NSObject **)(v61 + 8);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = self->_replacementTracker;
      *(_DWORD *)buf = 138412290;
      v82 = v63;
      _os_log_impl(&dword_185066000, v62, OS_LOG_TYPE_ERROR, "Created replacement tracker: %@", buf, 0xCu);
    }
  }
  v36 = self->_evaluatedRange.location;
  if (v36)
  {
    v37 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v37, "textLayoutController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "textRangeForCharacterRange:", self->_offsetToContextualRange, self->_evaluatedRange.location);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_targetedPreviewForRange:withRenderingAttributes:", v39, MEMORY[0x1E0C9AA70]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "view");
    v41 = (UIView *)objc_claimAutoreleasedReturnValue();
    infillViewPreceedingEvaluatedRange = self->_infillViewPreceedingEvaluatedRange;
    self->_infillViewPreceedingEvaluatedRange = v41;

    v43 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v43, "addSubview:", self->_infillViewPreceedingEvaluatedRange);

    v36 = self->_evaluatedRange.location;
  }
  v44 = self->_evaluatedRange.length + v36;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0, location);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "attributedText");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "length");

  if (v47 > v44)
  {
    self->_infillTextLength = v47 - v44;
    v48 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v48, "textLayoutController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "textRangeForCharacterRange:", self->_offsetToContextualRange + v44, self->_infillTextLength);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_targetedPreviewForRange:withRenderingAttributes:", v50, MEMORY[0x1E0C9AA70]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "view");
    v52 = (UIView *)objc_claimAutoreleasedReturnValue();
    infillViewFollowingEvaluatedRange = self->_infillViewFollowingEvaluatedRange;
    self->_infillViewFollowingEvaluatedRange = v52;

    -[UIView frame](self->_infillViewFollowingEvaluatedRange, "frame");
    MinY = CGRectGetMinY(v88);
    self->_originalFollowingInfillViewMinY = MinY;
    self->_followingInfillViewBaseMinY = MinY;
    v55 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v55, "addSubview:", self->_infillViewFollowingEvaluatedRange);

  }
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v7;
  NSUUID *activeSessionUUID;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  activeSessionUUID = self->_activeSessionUUID;
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _confirmMatchingWritingToolsSession(activeSessionUUID, v9, a2);

  if (self->_inFlightDeliveryID)
  {
    v25[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextAssistantManager bufferInvocationForSelector:arguments:](self, "bufferInvocationForSelector:arguments:", a2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v17 = writingToolsSession_didReceiveAction____s_category;
      if (!writingToolsSession_didReceiveAction____s_category)
      {
        v17 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&writingToolsSession_didReceiveAction____s_category);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        if (a4 == 1)
        {
          v19 = CFSTR("ShowOriginal");
        }
        else if (a4 == 2)
        {
          v19 = CFSTR("ShowRewritten");
        }
        else
        {
          v19 = CFSTR("<unrecognized>");
          if (a4 == 3)
            v19 = CFSTR("CompositionRestart");
        }
        v21 = 138412546;
        v22 = v19;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Packaged up Writing Tools action, %@, to deliver after animation finishes, %@", (uint8_t *)&v21, 0x16u);
      }
    }

  }
  else if (objc_msgSend(v7, "type") == 2)
  {
    if ((unint64_t)(a4 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 353, CFSTR("UITextAssistantManager received unknown composition action"));

      v13 = -1;
    }
    else
    {
      v13 = qword_186681CF0[a4 - 1];
    }
    if (-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState") | v13)
    {
      -[_UITextAssistantManager endTextAssistantAnticipation](self, "endTextAssistantAnticipation");
      -[_UITextAssistantManager updateToCompositionSessionState:](self, "updateToCompositionSessionState:", v13);
    }
  }
  else
  {
    -[_UITextAssistantManager endTextAssistantAnticipation](self, "endTextAssistantAnticipation");
    if (objc_msgSend(v7, "type") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 362, CFSTR("UITextAssistantManager received action for unknown session type"));

    }
    if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 363, CFSTR("UITextAssistantManager received unknown proofreading action"));
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(WeakRetained, "_setWritingToolsStreamingReplacements:", 1);

      -[_UITextAssistantManager updateProofreadingTextAndTrackerToShowOriginal:](self, "updateProofreadingTextAndTrackerToShowOriginal:", a4 == 1);
      v15 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v15, "_setWritingToolsStreamingReplacements:", 0);
    }

  }
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSUUID *activeSessionUUID;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  id WeakRetained;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSUUID *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];

  v4 = a4;
  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  activeSessionUUID = self->_activeSessionUUID;
  self->_activeSessionUUID = 0;

  -[_UITextAssistantManager endTextAssistantAnticipation](self, "endTextAssistantAnticipation");
  -[NSMutableArray removeAllObjects](self->_writingToolsDelegateMessageInvocationBuffer, "removeAllObjects");
  if (self->_inFlightDeliveryID)
  {
    -[_UITextAssistantManager cleanUpAnimatedTextLayoutInfoIfNecessary](self, "cleanUpAnimatedTextLayoutInfoIfNecessary");
    v29[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextAssistantManager bufferInvocationForSelector:arguments:](self, "bufferInvocationForSelector:arguments:", a2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v12 = qword_1ECD7F3C0;
      if (!qword_1ECD7F3C0)
      {
        v12 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD7F3C0);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = CFSTR("reverted");
        if (v4)
          v14 = CFSTR("accepted");
        v25 = 138412546;
        v26 = (uint64_t)v14;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Ending session with delivery in flight, %@. Deferring until most recent delivery lands. %@", (uint8_t *)&v25, 0x16u);
      }
    }
    goto LABEL_30;
  }
  if (self->_isEndingSessionByRequest)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "selectedTextRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finish:", v4);

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v7, "type") != 1)
  {
    if (objc_msgSend(v7, "type") == 2)
    {
      -[_UITextAssistantManager didEndRewritingSession:accepted:](self, "didEndRewritingSession:accepted:", v7, v4);
      goto LABEL_27;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        goto LABEL_26;
      v24 = objc_msgSend(v7, "type");
      v21 = objc_loadWeakRetained((id *)&self->_textView);
      v25 = 134218242;
      v26 = v24;
      v27 = 2112;
      v28 = v21;
      _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Could not end unexpected Writing Tools session type, %lu, for %@", (uint8_t *)&v25, 0x16u);
    }
    else
    {
      v17 = qword_1ECD7F3C8;
      if (!qword_1ECD7F3C8)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7F3C8);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v19 = v18;
      v20 = objc_msgSend(v7, "type");
      v21 = objc_loadWeakRetained((id *)&self->_textView);
      v25 = 134218242;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Could not end unexpected Writing Tools session type, %lu, for %@", (uint8_t *)&v25, 0x16u);
    }

LABEL_26:
    goto LABEL_27;
  }
  -[_UITextAssistantManager didEndProofreadingSession:accepted:](self, "didEndProofreadingSession:accepted:", v7, v4);
LABEL_27:
  if (self->_isEndingSessionByRequest)
  {
    v22 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v22, "setSelectedTextRange:", v11);

  }
  -[_UITextAssistantManager sessionCleanup](self, "sessionCleanup");
  v23 = self->_activeSessionUUID;
  self->_activeSessionUUID = 0;

LABEL_30:
}

- (BOOL)hasActiveWritingToolsSession
{
  return self->_activeSessionUUID != 0;
}

- (id)bufferInvocationForSelector:(SEL)a3 arguments:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  const char *aSelector;
  _UITextAssistantManager *v24;
  id v25;
  uint64_t v26;

  v6 = a4;
  v24 = self;
  -[_UITextAssistantManager methodSignatureForSelector:](self, "methodSignatureForSelector:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "retainArguments");
  aSelector = a3;
  objc_msgSend(v8, "setSelector:", a3);
  v9 = objc_msgSend(v6, "count");
  if (v9 >= 1)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      v12 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "getArgumentTypeAtIndex:", v11 + 2);
      if (!strcmp(v12, "@"))
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setArgument:atIndex:", &v25, v11 + 2);

        goto LABEL_12;
      }
      if (!strcmp(v12, "Q") || !strcmp(v12, "q"))
        break;
      if (!strcmp(v12, "B"))
      {
        LOBYTE(v25) = 0;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        LOBYTE(v25) = v18;
        goto LABEL_10;
      }
      if (!strcmp(v12, "{_NSRange=QQ}"))
      {
        v25 = 0;
        v26 = 0;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v19, "rangeValue");
        v26 = v20;

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v24, CFSTR("_UITextAssistantManager.m"), 438, CFSTR("Packaging implementation required for invocation argument type, %s in %@"), v12, v14);

LABEL_12:
      if (v10 == ++v11)
        goto LABEL_16;
    }
    v25 = 0;
    objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "integerValue");

    v25 = v16;
LABEL_10:
    objc_msgSend(v8, "setArgument:atIndex:", &v25, v11 + 2);
    goto LABEL_12;
  }
LABEL_16:
  -[NSMutableArray addObject:](v24->_writingToolsDelegateMessageInvocationBuffer, "addObject:", v8);

  return v8;
}

- (void)proofreadingOrCompositionFinished
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_inFlightDeliveryID)
  {
    -[_UITextAssistantManager bufferInvocationForSelector:arguments:](self, "bufferInvocationForSelector:arguments:", a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v4 = proofreadingOrCompositionFinished___s_category;
      if (!proofreadingOrCompositionFinished___s_category)
      {
        v4 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&proofreadingOrCompositionFinished___s_category);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v8 = v3;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Packaged up cleanup following Writing Tools streaming, to deliver after animation finishes, %@", buf, 0xCu);
      }
    }

  }
  else
  {
    -[UIView removeFromSuperview](self->_infillViewPreceedingEvaluatedRange, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_infillViewFollowingEvaluatedRange, "removeFromSuperview");
    -[_UITextAssistantManager updateSelectedRangeForCompositionIfFinished](self, "updateSelectedRangeForCompositionIfFinished");
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "_setWritingToolsStreamingReplacements:", 0);

  }
}

- (void)cleanUpAnimatedTextLayoutInfoIfNecessary
{
  UITextView **p_textView;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "_uniqueWritingToolsAnimatedLayoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v5, "_setUniqueWritingToolsAnimatedLayoutInfo:", 0);

    v8 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v8, "textLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textViewportLayoutController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (void)replacementEffectDidLandInFlightDelivery:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSUUID *inFlightDeliveryID;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  NSMutableArray *writingToolsDelegateMessageInvocationBuffer;
  NSObject *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_inFlightDeliveryID) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 475, CFSTR("Replacement animation landed mismatched delivery, %@. _inFlightDeliveryID=%@"), v5, self->_inFlightDeliveryID);

  }
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
  {
    v20 = qword_1ECD7F3D0;
    if (!qword_1ECD7F3D0)
    {
      v20 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&qword_1ECD7F3D0);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      inFlightDeliveryID = self->_inFlightDeliveryID;
      *(_DWORD *)buf = 138412290;
      v34 = (uint64_t)inFlightDeliveryID;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "In-flight delivery has landed. %@", buf, 0xCu);
    }
  }
  -[_UITextAssistantReplacementTracker nextDeliveryForDelivery:](self->_replacementTracker, "nextDeliveryForDelivery:", self->_inFlightDeliveryID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 477, CFSTR("replacement tracker should not have to queue deliveries"));

  }
  -[_UITextAssistantManager updateVisualizationForProofreadingSuggestionsInDelivery:](self, "updateVisualizationForProofreadingSuggestionsInDelivery:", v5);
  -[_UITextAssistantManager _setInFlightDeliveryID:](self, "_setInFlightDeliveryID:", 0);
  if (-[NSMutableArray count](self->_writingToolsDelegateMessageInvocationBuffer, "count"))
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v24 = qword_1ECD7F3D8;
      if (!qword_1ECD7F3D8)
      {
        v24 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v24, (unint64_t *)&qword_1ECD7F3D8);
      }
      v25 = *(NSObject **)(v24 + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        writingToolsDelegateMessageInvocationBuffer = self->_writingToolsDelegateMessageInvocationBuffer;
        v27 = v25;
        v28 = -[NSMutableArray count](writingToolsDelegateMessageInvocationBuffer, "count");
        *(_DWORD *)buf = 134217984;
        v34 = v28;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "Animation finished. Delivering buffered writingToolsDelegate messages. Count = %lu", buf, 0xCu);

      }
    }
    v7 = (void *)-[NSMutableArray copy](self->_writingToolsDelegateMessageInvocationBuffer, "copy");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
          -[NSMutableArray removeObjectAtIndex:](self->_writingToolsDelegateMessageInvocationBuffer, "removeObjectAtIndex:", 0);
          if (os_variant_has_internal_diagnostics()
            && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
          {
            v14 = qword_1ECD7F3E0;
            if (!qword_1ECD7F3E0)
            {
              v14 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v14, (unint64_t *)&qword_1ECD7F3E0);
            }
            v15 = *(NSObject **)(v14 + 8);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = v15;
              NSStringFromSelector((SEL)objc_msgSend(v13, "selector"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v34 = (uint64_t)v13;
              v35 = 2112;
              v36 = v17;
              _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Delivering buffered invocation, %p, %@", buf, 0x16u);

            }
          }
          objc_msgSend(v13, "invokeWithTarget:", self);
          ++v12;
        }
        while (v10 != v12);
        v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        v10 = v18;
      }
      while (v18);
    }

  }
  -[_UITextAssistantManager beginTextAssistantAnticipation](self, "beginTextAssistantAnticipation");

}

- (void)_resetUnderlinesForSuggestionsFollowingChangeLocationIndex:(unint64_t)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  id v25;
  id *location;
  _UITextAssistantManager *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)&self->_textView;
  v27 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_selectionViewManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v14, "originalRange") > a3 && (unint64_t)objc_msgSend(v14, "state") <= 1)
        {
          objc_msgSend(v14, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "editTracker");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "originalRange");
          v19 = objc_msgSend(v16, "rangeOfSuggestionWithRange:UUID:applyDelta:", v17, v18, v15, 1);
          v21 = v20;
          v22 = v27->_offsetToContextualRange + v19;

          v23 = objc_loadWeakRetained(location);
          objc_msgSend(v23, "_nonNullUITextRangeFromNSRange:", v22, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = (id)objc_msgSend(v8, "_underlineTextInRange:animated:preferredUUID:", v24, 1, v15);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

}

- (void)updateProofreadingTextAndTrackerToShowOriginal:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *backingProofreadingSuggestionStatesByUUID;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_showingOriginal != a3)
  {
    -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      v9 = 3;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          if (!a3)
          {
            backingProofreadingSuggestionStatesByUUID = self->_backingProofreadingSuggestionStatesByUUID;
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "uuid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](backingProofreadingSuggestionStatesByUUID, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v14, "integerValue");

          }
          -[_UITextAssistantManager updateForProofreadingSuggestion:state:saveState:](self, "updateForProofreadingSuggestion:state:saveState:", v11, v9, 0);
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    self->_showingOriginal = a3;
  }
}

- (void)updateVisualizationForProofreadingSuggestion:(id)a3 previousState:(int64_t)a4 delta:(int64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  UITextView **p_textView;
  id WeakRetained;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  _UIAssertion *selectionUIHiddenAssertion;
  _UIAssertion *grabberSuppression;
  NSUUID *activeReviewingUUID;
  _BOOL4 v29;
  _UIAssertion *v30;
  NSUUID *v31;
  id v32;
  void *v33;
  _UIAssertion *v34;
  _UIAssertion *v35;
  _UIAssertion *v36;
  NSUUID *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  unint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  unint64_t v48;
  NSObject *v49;
  const __CFString *v50;
  const __CFString *v51;
  unint64_t v52;
  NSObject *v53;
  NSObject *v54;
  int64_t v55;
  void *v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  double v68;
  uint64_t v69;

  v55 = a5;
  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "state");
  -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "editTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "originalRange");
  v15 = objc_msgSend(v12, "rangeOfSuggestionWithRange:UUID:applyDelta:", v13, v14, v9, v10 < 2);
  v17 = v16;
  v18 = self->_offsetToContextualRange + v15;

  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
  {
    v43 = qword_1ECD7F3E8;
    if (!qword_1ECD7F3E8)
    {
      v43 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v43, (unint64_t *)&qword_1ECD7F3E8);
    }
    v44 = *(id *)(v43 + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v45;
      if (v10 > 4)
        v47 = CFSTR("unknown");
      else
        v47 = off_1E16D9748[v10];
      if ((unint64_t)a4 > 4)
        v51 = CFSTR("unknown");
      else
        v51 = off_1E16D9748[a4];
      *(_DWORD *)buf = 138413570;
      v58 = v45;
      v59 = 2112;
      v60 = v47;
      v61 = 2112;
      v62 = v51;
      v63 = 2048;
      v64 = v18;
      v65 = 2048;
      v66 = v17;
      v67 = 2048;
      v68 = (double)v55;
      _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_ERROR, "%@, state=%@, previousState=%@, range={%lu, %lu} delta=%g", buf, 0x3Eu);

    }
  }
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_selectionViewManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
    {
      v48 = qword_1ECD7F3F8;
      if (!qword_1ECD7F3F8)
      {
        v48 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v48, (unint64_t *)&qword_1ECD7F3F8);
      }
      v49 = *(NSObject **)(v48 + 8);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        if (v10 > 4)
          v50 = CFSTR("unknown");
        else
          v50 = off_1E16D9748[v10];
        *(_DWORD *)buf = 138412290;
        v58 = (uint64_t)v50;
        v54 = v49;
        _os_log_impl(&dword_185066000, v54, OS_LOG_TYPE_ERROR, "Unexpected request to update visualization for a %@ proofreading suggestion with a 0-length range", buf, 0xCu);

      }
    }
    if (-[NSUUID isEqual:](self->_activeReviewingUUID, "isEqual:", v9, v55))
    {
      -[_UIAssertion _invalidate](self->_selectionUIHiddenAssertion, "_invalidate");
      selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
      self->_selectionUIHiddenAssertion = 0;

      -[_UIAssertion _invalidate](self->_grabberSuppression, "_invalidate");
      grabberSuppression = self->_grabberSuppression;
      self->_grabberSuppression = 0;

      activeReviewingUUID = self->_activeReviewingUUID;
      self->_activeReviewingUUID = 0;

    }
    v29 = 1;
    objc_msgSend(v56, "_removeUnderlineWithIdentifier:animated:", v9, 1);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = 0;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_29;
    }
    v32 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v32, "_nonNullUITextRangeFromNSRange:", v18, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    goto LABEL_28;
  }
  if (v10 > 1)
  {
    objc_msgSend(v56, "_removeUnderlineWithIdentifier:animated:", v9, 1);
    v25 = 0;
  }
  else
  {
    v22 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v22, "_nonNullUITextRangeFromNSRange:", v18, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v56, "_underlineTextInRange:animated:preferredUUID:", v23, 1, v9);

    if (v10)
      v25 = v17;
    else
      v25 = 0;
    if (v10)
      v17 = 0;
  }
  if (v10 == a4)
    goto LABEL_24;
  if (a4 == 1)
  {
    -[_UIAssertion _invalidate](self->_grabberSuppression, "_invalidate");
    v30 = self->_grabberSuppression;
    self->_grabberSuppression = 0;

    v31 = self->_activeReviewingUUID;
    self->_activeReviewingUUID = 0;
LABEL_23:

LABEL_24:
    v29 = 1;
LABEL_25:
    v18 += v17;
    if (v29 && v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v38, "_nonNullUITextRangeFromNSRange:", v18, v25);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
      v29 = 1;
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (v10 != 4)
  {
    if (v10 != 1)
    {
      v29 = self->_activeReviewingUUID == 0;
      goto LABEL_25;
    }
    -[_UIAssertion _invalidate](self->_selectionUIHiddenAssertion, "_invalidate");
    v34 = self->_selectionUIHiddenAssertion;
    self->_selectionUIHiddenAssertion = 0;

    objc_msgSend(v56, "_obtainGrabberSuppressionAssertion");
    v35 = (_UIAssertion *)objc_claimAutoreleasedReturnValue();
    v36 = self->_grabberSuppression;
    self->_grabberSuppression = v35;

    objc_msgSend(v8, "uuid");
    v37 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v31 = self->_activeReviewingUUID;
    self->_activeReviewingUUID = v37;
    goto LABEL_23;
  }
  if (!os_variant_has_internal_diagnostics())
  {
    v25 = 0;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_28;
  }
  v25 = 0;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v29 = 1;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
  {
    v52 = qword_1ECD7F3F0;
    if (!qword_1ECD7F3F0)
    {
      v52 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v52, (unint64_t *)&qword_1ECD7F3F0);
    }
    v53 = *(NSObject **)(v52 + 8);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v53, OS_LOG_TYPE_ERROR, "Surprise! updating visualization for invalid state with valid range. Invalidating the selection range", buf, 2u);
    }
    v25 = 0;
  }
LABEL_29:
  if (v55)
    -[_UITextAssistantManager _resetUnderlinesForSuggestionsFollowingChangeLocationIndex:](self, "_resetUnderlinesForSuggestionsFollowingChangeLocationIndex:", objc_msgSend(v8, "originalRange"));
  if (v29)
  {
    v40 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v40, "_nonNullUITextRangeFromNSRange:", v18, v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v42, "setSelectedTextRange:", v41);

  }
}

- (void)updateVisualizationForProofreadingSuggestionsInDelivery:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _UIAssertion *selectionUIHiddenAssertion;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_proofreadingSuggestionIDsPerDeliveryID, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "suggestionWithUUID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "replacementString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");
        objc_msgSend(v11, "originalRange");
        v15 = v13 - v14;

        -[_UITextAssistantManager updateVisualizationForProofreadingSuggestion:previousState:delta:](self, "updateVisualizationForProofreadingSuggestion:previousState:delta:", v11, 0, v15);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (-[_UITextAssistantReplacementTracker isFinished](self->_replacementTracker, "isFinished"))
  {
    -[_UIAssertion _invalidate](self->_selectionUIHiddenAssertion, "_invalidate");
    selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
    self->_selectionUIHiddenAssertion = 0;

  }
}

- (BOOL)updateProofreadingDeliveryReplacementAccordingToProofreadingSuggestion:(id)a3 replacingCharactersInRange:(_NSRange)a4 newState:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSMutableArray *proofreadingDeliverySuggestionIDs;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSMutableAttributedString *proofreadingDeliveryReplacement;
  void *v15;
  void *v17;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  proofreadingDeliverySuggestionIDs = self->_proofreadingDeliverySuggestionIDs;
  objc_msgSend(v9, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](proofreadingDeliverySuggestionIDs, "addObject:", v11);

  -[_UITextAssistantReplacementTracker rewrittenText](self->_replacementTracker, "rewrittenText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = location - (self->_proofreadingDeliveryGapLength + self->_evaluatedRange.location) - objc_msgSend(v12, "length");

  if ((v13 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 662, CFSTR("Range calculation error for accumulating proofreading replacements"));

  }
  proofreadingDeliveryReplacement = self->_proofreadingDeliveryReplacement;
  objc_msgSend(v9, "replacementString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](proofreadingDeliveryReplacement, "replaceCharactersInRange:withAttributedString:", v13, length, v15);

  return 1;
}

- (BOOL)updateTextAccordingToProofreadingSuggestion:(id)a3 replacingCharactersInRange:(_NSRange)a4 newState:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  unint64_t v10;
  UITextView **p_textView;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL isSynchronizingWithUndoRedo;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v28;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  self->_proofreadingVisualizationReplacementDelta = 0;
  v10 = self->_offsetToContextualRange + location;
  p_textView = &self->_textView;
  v12 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v12, "_textRangeFromNSRange:", v10, length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributedTextInRange:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 3)
  {
    v15 = objc_msgSend(v9, "originalRange");
    v17 = v16;
    v18 = v15 + self->_evaluatedRange.location;
    -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
    v28 = v10;
    v19 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contextString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributedSubstringFromRange:", v18, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    a5 = 3;
    p_textView = &self->_textView;

    v9 = v19;
    v10 = v28;
  }
  else
  {
    objc_msgSend(v9, "replacementString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_isSynchronizingWithUndoRedo)
  {
    isSynchronizingWithUndoRedo = 1;
LABEL_11:
    v26 = objc_msgSend(v22, "length");
    self->_proofreadingVisualizationReplacementDelta = v26 - objc_msgSend(v14, "length");
    goto LABEL_12;
  }
  if ((objc_msgSend(v14, "isEqualToAttributedString:", v22) & 1) == 0)
  {
    isSynchronizingWithUndoRedo = 1;
    self->_isReplacingTextByRequest = 1;
    v24 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v24, "_textRangeFromNSRange:", v10, length);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "replaceRange:withAttributedText:", v25, v22);

    self->_isReplacingTextByRequest = 0;
    goto LABEL_11;
  }
  isSynchronizingWithUndoRedo = self->_isSynchronizingWithUndoRedo;
  if (self->_isSynchronizingWithUndoRedo)
    goto LABEL_11;
  isSynchronizingWithUndoRedo = 0;
  if (objc_msgSend(v9, "state") != a5)
    goto LABEL_11;
LABEL_12:

  return isSynchronizingWithUndoRedo;
}

- (BOOL)proofreadingController:(id)a3 replaceCharactersInRange:(_NSRange)a4 withSuggestion:(id)a5 state:(int64_t)a6
{
  if (self->_proofreadingDeliveryReplacement)
    return -[_UITextAssistantManager updateProofreadingDeliveryReplacementAccordingToProofreadingSuggestion:replacingCharactersInRange:newState:](self, "updateProofreadingDeliveryReplacementAccordingToProofreadingSuggestion:replacingCharactersInRange:newState:", a5, a4.location, a4.length, a6);
  else
    return -[_UITextAssistantManager updateTextAccordingToProofreadingSuggestion:replacingCharactersInRange:newState:](self, "updateTextAccordingToProofreadingSuggestion:replacingCharactersInRange:newState:", a5, a4.location, a4.length, a6);
}

- (BOOL)textChoiceInteraction:(id)a3 shouldRespondToTapAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  NSWritingToolsProofreadingSuggestion **p_chosenSuggestion;
  NSWritingToolsProofreadingSuggestion *v9;
  id WeakRetained;
  void *v11;
  id v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  unint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSWritingToolsProofreadingSuggestion *chosenSuggestion;
  _UIAssertion *grabberSuppression;
  BOOL v34;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _UITextAssistantManager *v40;
  id v41;
  id *location;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  uint64_t v50;
  NSRange v51;
  NSRange v52;

  y = a4.y;
  x = a4.x;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  p_chosenSuggestion = &self->_chosenSuggestion;
  if (self->_chosenSuggestion)
  {
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
    {
      v36 = textChoiceInteraction_shouldRespondToTapAtPoint____s_category;
      if (!textChoiceInteraction_shouldRespondToTapAtPoint____s_category)
      {
        v36 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v36, (unint64_t *)&textChoiceInteraction_shouldRespondToTapAtPoint____s_category);
      }
      v37 = *(NSObject **)(v36 + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Previous _chosenSuggestion hasn't been cleared before next tap in proofreading session. Reexamine the logic.", buf, 2u);
      }
    }
    v9 = *p_chosenSuggestion;
    *p_chosenSuggestion = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "characterRangeAtPoint:", x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)&self->_textView);
  v13 = objc_msgSend(v12, "_nsrangeForTextRange:", v11);
  v15 = v14;
  v16 = v13 - self->_offsetToContextualRange;
  if (v16 >= 0x7FFFFFFFFFFFFFFFLL)
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v17 = v13 - self->_offsetToContextualRange;

  -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "editTracker");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 <= 0x7FFFFFFFFFFFFFFELL && v15)
  {
    v39 = v11;
    v40 = self;
    v41 = v7;
    location = (id *)&self->_chosenSuggestion;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v38 = v18;
    objc_msgSend(v18, "suggestions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (!objc_msgSend(v24, "state"))
          {
            v25 = objc_msgSend(v24, "originalRange");
            v27 = v26;
            objc_msgSend(v24, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v43, "rangeOfSuggestionWithRange:UUID:applyDelta:", v25, v27, v28, 1);
            v31 = v30;

            v51.location = v29;
            v51.length = v31;
            v52.location = v17;
            v52.length = v15;
            if (NSIntersectionRange(v51, v52).length)
            {
              objc_storeStrong(location, v24);
              goto LABEL_20;
            }
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_20:

    self = v40;
    v7 = v41;
    p_chosenSuggestion = (NSWritingToolsProofreadingSuggestion **)location;
    v18 = v38;
    v11 = v39;
  }
  chosenSuggestion = *p_chosenSuggestion;
  if (!*p_chosenSuggestion)
  {
    -[_UIAssertion _invalidate](self->_grabberSuppression, "_invalidate");
    grabberSuppression = self->_grabberSuppression;
    self->_grabberSuppression = 0;

    chosenSuggestion = self->_chosenSuggestion;
  }
  v34 = chosenSuggestion != 0;

  return v34;
}

- (void)textChoiceInteraction:(id)a3 receivedTapAtLocation:(CGPoint)a4
{
  NSWritingToolsProofreadingSuggestion *chosenSuggestion;
  id WeakRetained;
  NSWritingToolsProofreadingSuggestion *v7;
  id v8;

  chosenSuggestion = self->_chosenSuggestion;
  if (chosenSuggestion)
  {
    -[NSWritingToolsProofreadingSuggestion uuid](chosenSuggestion, "uuid", a3, a4.x, a4.y);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_proofreadingTextViewDelegate);
    objc_msgSend(WeakRetained, "proofreadingSessionWithUUID:updateState:forSuggestionWithUUID:", self->_activeSessionUUID, 1, v8);

    -[_UITextAssistantManager updateForProofreadingSuggestion:state:saveState:](self, "updateForProofreadingSuggestion:state:saveState:", self->_chosenSuggestion, 1, 1);
    v7 = self->_chosenSuggestion;
    self->_chosenSuggestion = 0;

  }
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  NSUUID *activeSessionUUID;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SEL v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  const __CFString *v29;
  NSUInteger v30;
  void *v31;
  void *v32;
  NSMutableAttributedString *v33;
  NSMutableAttributedString *proofreadingDeliveryReplacement;
  NSMutableArray *v35;
  NSMutableArray *proofreadingDeliverySuggestionIDs;
  _UITextChoiceInteraction *v37;
  _UITextChoiceInteraction *proofreadingInteraction;
  id WeakRetained;
  uint64_t i;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableDictionary *v52;
  NSMutableDictionary *backingProofreadingSuggestionStatesByUUID;
  void *v54;
  void *v55;
  NSMutableAttributedString *v56;
  NSMutableArray *v57;
  unint64_t v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  NSUInteger v65;
  _BOOL4 v66;
  id v67;
  id v68;
  id v69;
  id obj;
  uint64_t v71;
  const char *v72;
  const char *v73;
  void *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  NSUInteger v86;
  __int16 v87;
  NSUInteger v88;
  __int16 v89;
  const __CFString *v90;
  _QWORD v91[8];

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v91[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  activeSessionUUID = self->_activeSessionUUID;
  objc_msgSend(v14, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _confirmMatchingWritingToolsSession(activeSessionUUID, v18, a2);

  if (self->_inFlightDeliveryID)
  {
    v19 = (id)MEMORY[0x1E0C9AA60];
    if (v15)
      v19 = v15;
    v91[0] = v14;
    v91[1] = v19;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v20;
    v91[3] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v91[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 5);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = a2;
    v24 = (void *)v22;
    -[_UITextAssistantManager bufferInvocationForSelector:arguments:](self, "bufferInvocationForSelector:arguments:", v23, v22);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
    {
      v25 = qword_1ECD7F400;
      if (!qword_1ECD7F400)
      {
        v25 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&qword_1ECD7F400);
      }
      v26 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        v28 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134219010;
        v29 = &stru_1E16EDF20;
        v82 = v28;
        v83 = 2112;
        if (v7)
          v29 = CFSTR(" [FINISHED]");
        v84 = (uint64_t)v74;
        v85 = 2048;
        v86 = location;
        v87 = 2048;
        v88 = length;
        v89 = 2112;
        v90 = v29;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "Packaged up %lu proofreading suggestions to deliver after animation finishes, %@\n\tprocessedRange={%lu, %lu}%@", buf, 0x34u);

      }
    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
    {
      v58 = qword_1ECD7F408;
      if (!qword_1ECD7F408)
      {
        v58 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v58, (unint64_t *)&qword_1ECD7F408);
      }
      v59 = *(NSObject **)(v58 + 8);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v60 = v59;
        v61 = objc_msgSend(v15, "count");
        objc_msgSend(v14, "uuid");
        v62 = objc_claimAutoreleasedReturnValue();
        v73 = a2;
        v63 = (void *)v62;
        *(_DWORD *)buf = 134219010;
        v64 = &stru_1E16EDF20;
        v82 = v61;
        v83 = 2112;
        if (v7)
          v64 = CFSTR(" [FINISHED]");
        v84 = v62;
        v85 = 2048;
        v86 = location;
        v87 = 2048;
        v88 = length;
        v89 = 2112;
        v90 = v64;
        _os_log_impl(&dword_185066000, v60, OS_LOG_TYPE_ERROR, "Received %lu suggestions in proofreading session %@. Processed range = {%lu, %lu}.%@", buf, 0x34u);

        a2 = v73;
      }
    }
    v30 = self->_proofreadingDeliveryProcessedRange.location;
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      self->_proofreadingDeliveryGapLength = location - (v30 + self->_proofreadingDeliveryProcessedRange.length);
    v69 = v14;
    self->_proofreadingDeliveryProcessedRange.location = location;
    self->_proofreadingDeliveryProcessedRange.length = length;
    v67 = v16;
    objc_msgSend(v16, "attributedText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = length;
    objc_msgSend(v31, "attributedSubstringFromRange:", location, length);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (NSMutableAttributedString *)objc_msgSend(v32, "mutableCopy");
    proofreadingDeliveryReplacement = self->_proofreadingDeliveryReplacement;
    self->_proofreadingDeliveryReplacement = v33;

    if (objc_msgSend(v15, "count") || v7)
    {
      -[_UITextAssistantManager endTextAssistantAnticipation](self, "endTextAssistantAnticipation");
      if (objc_msgSend(v15, "count"))
      {
        v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        proofreadingDeliverySuggestionIDs = self->_proofreadingDeliverySuggestionIDs;
        self->_proofreadingDeliverySuggestionIDs = v35;

        if (!self->_proofreadingInteraction)
        {
          v37 = -[_UITextChoiceInteraction initWithDelegate:]([_UITextChoiceInteraction alloc], "initWithDelegate:", self);
          proofreadingInteraction = self->_proofreadingInteraction;
          self->_proofreadingInteraction = v37;

          WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
          objc_msgSend(WeakRetained, "addInteraction:", self->_proofreadingInteraction);

        }
      }
    }
    v66 = v7;
    -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v68 = v15;
    obj = v15;
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v75)
    {
      v71 = *(_QWORD *)v77;
      v72 = a2;
      do
      {
        for (i = 0; i != v75; ++i)
        {
          if (*(_QWORD *)v77 != v71)
            objc_enumerationMutation(obj);
          v41 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          v42 = objc_msgSend(v41, "originalRange");
          v44 = v43;
          v45 = v42 - self->_evaluatedRange.location;
          if (v45 < 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 810, CFSTR("Unexpected range for proofreading suggestion received from Writing Tools"));

          }
          objc_msgSend(v74, "contextString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "attributesAtIndex:effectiveRange:", v45, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v41, "replacement");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v48, "initWithString:attributes:", v49, v47);

          objc_msgSend(v41, "uuid");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "addSuggestionWithUUID:originalRange:replacementString:", v51, v45, v44, v50);
          if (!self->_backingProofreadingSuggestionStatesByUUID)
          {
            v52 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(obj, "count"));
            backingProofreadingSuggestionStatesByUUID = self->_backingProofreadingSuggestionStatesByUUID;
            self->_backingProofreadingSuggestionStatesByUUID = v52;

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v41, "state"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingProofreadingSuggestionStatesByUUID, "setObject:forKeyedSubscript:", v54, v51);

          a2 = v72;
        }
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      }
      while (v75);
    }

    v16 = v67;
    -[_UITextAssistantManager updateReplacementTrackerWithText:forRange:inContext:finished:](self, "updateReplacementTrackerWithText:forRange:inContext:finished:", self->_proofreadingDeliveryReplacement, location, v65, v67, v66);
    v56 = self->_proofreadingDeliveryReplacement;
    self->_proofreadingDeliveryReplacement = 0;

    v57 = self->_proofreadingDeliverySuggestionIDs;
    self->_proofreadingDeliverySuggestionIDs = 0;

    if (v66)
      -[_UITextAssistantManager proofreadingOrCompositionFinished](self, "proofreadingOrCompositionFinished");
    v15 = v68;
    v14 = v69;
  }

}

- (void)updateForProofreadingSuggestion:(id)a3 state:(int64_t)a4 saveState:(BOOL)a5
{
  _BOOL4 v5;
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
  unint64_t v18;
  UITextView **p_textView;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id WeakRetained;
  NSUUID *activeSessionUUID;
  id v32;
  id v33;

  v5 = a5;
  v33 = a3;
  v8 = objc_msgSend(v33, "state");
  objc_msgSend(v33, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSuggestionWithUUID:state:", v9, a4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingProofreadingSuggestionStatesByUUID, "setObject:forKeyedSubscript:", v11, v9);

  }
  -[_UITextAssistantManager updateVisualizationForProofreadingSuggestion:previousState:delta:](self, "updateVisualizationForProofreadingSuggestion:previousState:delta:", v33, v8, self->_proofreadingVisualizationReplacementDelta);
  self->_proofreadingVisualizationReplacementDelta = 0;
  if (objc_msgSend(v33, "state") == 1)
  {
    objc_msgSend(v10, "editTracker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v33, "originalRange");
    v15 = objc_msgSend(v12, "rangeOfSuggestionWithRange:UUID:applyDelta:", v13, v14, v9, 1);
    v17 = v16;
    v18 = self->_offsetToContextualRange + v15;

    p_textView = &self->_textView;
    v20 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v20, "_nonNullUITextRangeFromNSRange:", v18, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_boundingRectForRange:", v21);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    WeakRetained = objc_loadWeakRetained((id *)&self->_proofreadingTextViewDelegate);
    activeSessionUUID = self->_activeSessionUUID;
    v32 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(WeakRetained, "proofreadingSessionWithUUID:showDetailsForSuggestionWithUUID:relativeToRect:inView:", activeSessionUUID, v9, v32, v23, v25, v27, v29);

  }
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSUUID *activeSessionUUID;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  NSObject *v33;
  int v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  activeSessionUUID = self->_activeSessionUUID;
  objc_msgSend(v11, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _confirmMatchingWritingToolsSession(activeSessionUUID, v15, a2);

  if (self->_inFlightDeliveryID)
  {
    v40[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v16;
    v40[2] = v12;
    v40[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextAssistantManager bufferInvocationForSelector:arguments:](self, "bufferInvocationForSelector:arguments:", a2, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
    {
      v19 = qword_1ECD7F410;
      if (!qword_1ECD7F410)
      {
        v19 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD7F410);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        if ((unint64_t)a4 > 4)
          v21 = CFSTR("unknown");
        else
          v21 = off_1E16D9748[a4];
        v34 = 134218498;
        v35 = v18;
        v36 = 2112;
        v37 = (uint64_t)v12;
        v38 = 2112;
        v39 = v21;
        v33 = v20;
        _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "Packaged up proofreading suggestion update to deliver after animation finishes, %p\n\tuuid=%@ state=%@", (uint8_t *)&v34, 0x20u);

      }
    }
  }
  else
  {
    -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "suggestionWithUUID:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "state") == 4)
    {
      if (os_variant_has_internal_diagnostics()
        && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4)
      {
        v23 = qword_1ECD7F418;
        if (!qword_1ECD7F418)
        {
          v23 = __UILogCategoryGetNode("TextAssistantProofread", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v23, (unint64_t *)&qword_1ECD7F418);
        }
        v24 = *(NSObject **)(v23 + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = v24;
          objc_msgSend(v18, "contextString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "string");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v22, "originalRange");
          objc_msgSend(v27, "substringWithRange:", v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v22, "originalRange");
          objc_msgSend(v22, "originalRange");
          v34 = 138412802;
          v35 = v30;
          v36 = 2048;
          v37 = v31;
          v38 = 2048;
          v39 = v32;
          _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Ignoring update for invalid proofreading suggestion for \"%@\" from {.loc=%lu, .len=%lu} in context", (uint8_t *)&v34, 0x20u);

        }
      }
    }
    else
    {
      -[_UITextAssistantManager updateForProofreadingSuggestion:state:saveState:](self, "updateForProofreadingSuggestion:state:saveState:", v22, a4, 1);
    }

  }
}

- (void)didEndProofreadingSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = a4;
  -[_UITextAssistantReplacementTracker proofreadingController](self->_replacementTracker, "proofreadingController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finish:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_selectionViewManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_removeAllProofreadingUnderlinesAnimated:", 0);

}

- (NSUUID)inFlightDeliveryID
{
  return self->_inFlightDeliveryID;
}

- (void)_setInFlightDeliveryID:(id)a3
{
  NSUUID *v5;
  void *v6;
  NSUUID *inFlightDeliveryID;

  v5 = (NSUUID *)a3;
  if (v5)
  {
    if (self->_inFlightDeliveryID)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 894, CFSTR("Only one in-flight delivery at a time"));

    }
  }
  else
  {
    -[_UITextAssistantManager cleanUpAnimatedTextLayoutInfoIfNecessary](self, "cleanUpAnimatedTextLayoutInfoIfNecessary");
  }
  inFlightDeliveryID = self->_inFlightDeliveryID;
  self->_inFlightDeliveryID = v5;

}

- (void)updateSelectedRangeForCompositionIfFinished
{
  -[_UITextAssistantManager updateSelectedRangeForCompositionIfFinishedForcing:](self, "updateSelectedRangeForCompositionIfFinishedForcing:", 0);
}

- (void)updateSelectedRangeForCompositionIfFinishedForcing:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _UIAssertion *selectionUIHiddenAssertion;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (!-[_UITextAssistantReplacementTracker isProofreading](self->_replacementTracker, "isProofreading"))
  {
    v6 = -[_UITextAssistantReplacementTracker isFinished](self->_replacementTracker, "isFinished");
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
    {
      v18 = updateSelectedRangeForCompositionIfFinishedForcing____s_category;
      if (!updateSelectedRangeForCompositionIfFinishedForcing____s_category)
      {
        v18 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&updateSelectedRangeForCompositionIfFinishedForcing____s_category);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        NSStringFromSelector(a2);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        v23 = CFSTR("NO");
        if (v3)
          v24 = CFSTR("YES");
        else
          v24 = CFSTR("NO");
        v25 = 138412802;
        v26 = v21;
        v28 = v24;
        v27 = 2112;
        if (v6)
          v23 = CFSTR("YES");
        v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "%@ force? %@ finished? %@", (uint8_t *)&v25, 0x20u);

      }
    }
    if (v3 || v6)
    {
      v7 = -[_UITextAssistantReplacementTracker originalCharacterRange](self->_replacementTracker, "originalCharacterRange");
      v9 = v8;
      if (-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState") == 2)
      {
        -[_UITextAssistantReplacementTracker rewrittenText](self->_replacementTracker, "rewrittenText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "length");

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(WeakRetained, "interactionAssistant");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_selectionViewManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActivated:", 1);

      v14 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v14, "_nonNullUITextRangeFromNSRange:", v7, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v16, "setSelectedTextRange:", v15);

      -[_UIAssertion _invalidate](self->_selectionUIHiddenAssertion, "_invalidate");
      selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
      self->_selectionUIHiddenAssertion = 0;

    }
  }
}

- (void)updateToCompositionSessionState:(int64_t)a3
{
  BOOL v4;
  id WeakRetained;
  void *v6;
  _UIAssertion *v7;
  _UIAssertion *selectionUIHiddenAssertion;
  id v9;
  UIView *infillViewFollowingEvaluatedRange;
  id v11;
  id v12;

  if (!a3)
  {
    if (-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState") == 2)
    {
      -[_UITextAssistantManager updateTextViewAndTrackerWithIncomingCompositionSessionState:](self, "updateTextViewAndTrackerWithIncomingCompositionSessionState:", 1);
      -[_UITextAssistantReplacementTracker setCompositionSessionState:](self->_replacementTracker, "setCompositionSessionState:", 0);
    }
    -[_UIAssertion _invalidate](self->_selectionUIHiddenAssertion, "_invalidate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "_selectionDisplayInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_obtainSelectionUIHiddenAssertionForReason:animated:", CFSTR("Writing Tools Began Composition"), 1);
    v7 = (_UIAssertion *)objc_claimAutoreleasedReturnValue();
    selectionUIHiddenAssertion = self->_selectionUIHiddenAssertion;
    self->_selectionUIHiddenAssertion = v7;

    -[_UITextAssistantManager beginTextAssistantAnticipation](self, "beginTextAssistantAnticipation");
    if (self->_infillViewPreceedingEvaluatedRange)
    {
      v9 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v9, "addSubview:", self->_infillViewPreceedingEvaluatedRange);

    }
    infillViewFollowingEvaluatedRange = self->_infillViewFollowingEvaluatedRange;
    if (infillViewFollowingEvaluatedRange)
    {
      -[UIView setAlpha:](infillViewFollowingEvaluatedRange, "setAlpha:", 1.0);
      self->_followingInfillViewBaseMinY = self->_originalFollowingInfillViewMinY;
      v11 = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(v11, "addSubview:", self->_infillViewFollowingEvaluatedRange);

    }
    v12 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v12, "_setWritingToolsStreamingReplacements:", 1);

    goto LABEL_15;
  }
  if (a3 == 2)
  {
    if (-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState") != 2)
    {
      -[_UITextAssistantManager updateTextViewAndTrackerWithIncomingCompositionSessionState:](self, "updateTextViewAndTrackerWithIncomingCompositionSessionState:", 2);
      -[_UITextAssistantManager updateSelectedRangeForCompositionIfFinished](self, "updateSelectedRangeForCompositionIfFinished");
    }
LABEL_15:
    v4 = 0;
    goto LABEL_16;
  }
  if (a3 != 1)
    return;
  v4 = 1;
  if (-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState") == 2)
  {
    -[_UITextAssistantManager updateTextViewAndTrackerWithIncomingCompositionSessionState:](self, "updateTextViewAndTrackerWithIncomingCompositionSessionState:", 1);
    -[_UITextAssistantManager updateSelectedRangeForCompositionIfFinished](self, "updateSelectedRangeForCompositionIfFinished");
  }
LABEL_16:
  self->_showingOriginal = v4;
}

- (void)updateTextViewAndTrackerWithIncomingCompositionSessionState:(int64_t)a3
{
  -[_UITextAssistantManager updateTextViewAndTrackerWithIncomingCompositionSessionState:forDelivery:](self, "updateTextViewAndTrackerWithIncomingCompositionSessionState:forDelivery:", a3, 0);
}

- (id)replaceHiddenRange:(id)a3 withHiddenReplacement:(id)a4 deliveryID:(id)a5
{
  id v8;
  id v9;
  UITextView **p_textView;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  BOOL v38;
  NSUUID *v39;
  NSUUID *inFlightDeliveryID;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  unint64_t v49;
  NSObject *v50;
  unint64_t v51;
  NSObject *v52;
  NSUUID *v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v53 = (NSUUID *)a5;
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v12 = objc_msgSend(WeakRetained, "_nsRangeForNonNullUITextRange:", v8);
  v14 = v13;

  v15 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v15, "_NSTextRangeFromNSRange:", v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
  {
    v49 = qword_1ECD7F420;
    if (!qword_1ECD7F420)
    {
      v49 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v49, (unint64_t *)&qword_1ECD7F420);
    }
    v50 = *(NSObject **)(v49 + 8);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v16;
      _os_log_impl(&dword_185066000, v50, OS_LOG_TYPE_ERROR, "Unhiding layout fragment views for range: %@", buf, 0xCu);
    }
  }
  v17 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v17, "_setLayoutFragmentViewsHidden:forTextRange:", 0, v16);

  v18 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v18, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  v21 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v21, "_replaceRange:withAttributedText:updatingSelection:", v8, v9, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_loadWeakRetained((id *)&self->_textView);
  v24 = objc_msgSend(v23, "_textStorageOverridesReplaceCharactersInRangeWithAttributedString");

  if (!v24)
  {
    v39 = v53;
    goto LABEL_14;
  }
  v25 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v25, "textStorage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length") - v20;

  v28 = objc_loadWeakRetained((id *)&self->_textView);
  v29 = objc_msgSend(v28, "_nsrangeForTextRange:", v8);
  v31 = v30;

  v32 = v31 + v27;
  v33 = objc_msgSend(v9, "length");
  if (v32 != v33)
  {
    v34 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v34, "_textRangeFromNSRange:", v29, v32);
    v35 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v35;
  }
  v36 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v36, "attributedTextInRange:", v22);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v32 == v33;
  v39 = v53;
  if (v38 && (objc_msgSend(v37, "isEqualToAttributedString:", v9) & 1) != 0)
    goto LABEL_12;
  if (v37)
  {
    inFlightDeliveryID = v53;
    if (!v53)
      inFlightDeliveryID = self->_inFlightDeliveryID;
    -[_UITextAssistantReplacementTracker updateReplacementChunkForDeliveryID:newText:](self->_replacementTracker, "updateReplacementChunkForDeliveryID:newText:", inFlightDeliveryID, v37);
LABEL_12:

  }
LABEL_14:
  v41 = objc_loadWeakRetained((id *)&self->_textView);
  v42 = objc_msgSend(v41, "_nsRangeForNonNullUITextRange:", v22);
  v44 = v43;

  v45 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v45, "_NSTextRangeFromNSRange:", v42, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
  {
    v51 = qword_1ECD7F428;
    if (!qword_1ECD7F428)
    {
      v51 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v51, (unint64_t *)&qword_1ECD7F428);
    }
    v52 = *(NSObject **)(v51 + 8);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v46;
      _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_ERROR, "Hiding layout fragment views for range: %@", buf, 0xCu);
    }
  }
  v47 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v47, "_setLayoutFragmentViewsHidden:forTextRange:", 1, v46);

  return v22;
}

- (void)updateTextViewAndTrackerWithIncomingCompositionSessionState:(int64_t)a3 forDelivery:(id)a4
{
  -[_UITextAssistantManager updateTextViewAndTrackerWithIncomingCompositionSessionState:forDelivery:hidden:](self, "updateTextViewAndTrackerWithIncomingCompositionSessionState:forDelivery:hidden:", a3, a4, 0);
}

- (void)updateTextViewAndTrackerWithIncomingCompositionSessionState:(int64_t)a3 forDelivery:(id)a4 hidden:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  _UITextAssistantReplacementTracker *replacementTracker;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _UITextAssistantReplacementTracker *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  unint64_t v29;
  _UITextAssistantReplacementTracker *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  void *v35;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint8_t buf[4];
  _BYTE v44[10];
  void *v45;
  __int16 v46;
  void *v47;
  _QWORD v48[2];

  v5 = a5;
  v48[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  replacementTracker = self->_replacementTracker;
  if (self->_isSynchronizingWithUndoRedo)
  {
    -[_UITextAssistantReplacementTracker setCompositionSessionState:](replacementTracker, "setCompositionSessionState:", a3);
    goto LABEL_22;
  }
  v11 = -[_UITextAssistantReplacementTracker isProofreading](replacementTracker, "isProofreading");
  if (!v9 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 1040, CFSTR("Full-text updates are not supported by the replacement tracker when proofreading"));

    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    v12 = -[_UITextAssistantReplacementTracker activeCharacterRange](self->_replacementTracker, "activeCharacterRange");
    goto LABEL_9;
  }
  v12 = -[_UITextAssistantReplacementTracker sourceRangeForChunkFromDelivery:](self->_replacementTracker, "sourceRangeForChunkFromDelivery:", v9);
LABEL_9:
  v15 = v12;
  v16 = v13;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _UICompositionSessionStateDescription(a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 1043, CFSTR("Can't update text view with %@. Lost track of delivery when calculating source range. %@"), v28, v9);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "_NSTextRangeFromNSRange:", v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_loadWeakRetained((id *)&self->_textView);
  v48[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_rangeForTextKitRanges:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextAssistantReplacementTracker setCompositionSessionState:](self->_replacementTracker, "setCompositionSessionState:", a3);
  v22 = self->_replacementTracker;
  if (v9)
    -[_UITextAssistantReplacementTracker rewrittenChunkTextForDelivery:](v22, "rewrittenChunkTextForDelivery:", v9);
  else
    -[_UITextAssistantReplacementTracker activeText](v22, "activeText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics()
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
  {
    v29 = qword_1ECD7F430;
    if (!qword_1ECD7F430)
    {
      v29 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v29, (unint64_t *)&qword_1ECD7F430);
    }
    v41 = *(NSObject **)(v29 + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = v41;
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      _UICompositionSessionStateDescription(a3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v44 = v40;
      *(_WORD *)&v44[8] = 2112;
      v45 = v39;
      v46 = 2112;
      v47 = v21;
      _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_ERROR, "%@ incomingState=%@\nReplacing range now. %@", buf, 0x20u);

    }
  }
  if (v5)
  {
    v24 = -[_UITextAssistantManager replaceHiddenRange:withHiddenReplacement:deliveryID:](self, "replaceHiddenRange:withHiddenReplacement:deliveryID:", v21, v23, v9);
  }
  else
  {
    self->_isReplacingTextByRequest = 1;
    v25 = objc_loadWeakRetained((id *)&self->_textView);
    v26 = (id)objc_msgSend(v25, "_replaceRange:withAttributedText:updatingSelection:", v21, v23, 0);

    self->_isReplacingTextByRequest = 0;
  }
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC&& os_variant_has_internal_diagnostics())
  {
    v30 = self->_replacementTracker;
    if (v9)
      v31 = -[_UITextAssistantReplacementTracker targetRangeForChunkFromDelivery:](v30, "targetRangeForChunkFromDelivery:", v9);
    else
      v31 = -[_UITextAssistantReplacementTracker activeCharacterRange](v30, "activeCharacterRange");
    v33 = v31;
    v34 = v32;
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
    {
      v37 = qword_1ECD7F438;
      if (!qword_1ECD7F438)
      {
        v37 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v37, (unint64_t *)&qword_1ECD7F438);
      }
      v38 = *(NSObject **)(v37 + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v44 = v33;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v34;
        _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "New active character range: {%u, %u}", buf, 0xEu);
      }
    }
    if (v33 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      _UICompositionSessionStateDescription(a3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 1061, CFSTR("Can't update text view with %@. Lost track of delivery when calculating target range. %@"), v36, v9);

    }
  }

LABEL_22:
}

- (void)updateReplacementTrackerWithText:(id)a3 forRange:(_NSRange)a4 inContext:(id)a5 finished:(BOOL)a6
{
  _BOOL8 v6;
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  NSUInteger v14;
  void *v15;
  NSMutableArray *proofreadingDeliverySuggestionIDs;
  NSMutableDictionary *proofreadingSuggestionIDsPerDeliveryID;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = self->_evaluatedRange.location;
  if (location < v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 1068, CFSTR("%@ - range argument location is out of bounds"), v21);

    v14 = self->_evaluatedRange.location;
  }
  -[_UITextAssistantReplacementTracker recordRewrittenText:forRange:withContext:finished:](self->_replacementTracker, "recordRewrittenText:forRange:withContext:finished:", v12, location - v14, length, v13, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics()
    && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
  {
    v22 = updateReplacementTrackerWithText_forRange_inContext_finished____s_category;
    if (!updateReplacementTrackerWithText_forRange_inContext_finished____s_category)
    {
      v22 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&updateReplacementTrackerWithText_forRange_inContext_finished____s_category);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Replacement tracker recorded delivery %@\n%@", buf, 0x16u);
    }
  }
  if (v15)
  {
    proofreadingDeliverySuggestionIDs = self->_proofreadingDeliverySuggestionIDs;
    if (proofreadingDeliverySuggestionIDs)
    {
      proofreadingSuggestionIDsPerDeliveryID = self->_proofreadingSuggestionIDsPerDeliveryID;
      if (!proofreadingSuggestionIDsPerDeliveryID)
      {
        v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v19 = self->_proofreadingSuggestionIDsPerDeliveryID;
        self->_proofreadingSuggestionIDsPerDeliveryID = v18;

        proofreadingSuggestionIDsPerDeliveryID = self->_proofreadingSuggestionIDsPerDeliveryID;
        proofreadingDeliverySuggestionIDs = self->_proofreadingDeliverySuggestionIDs;
      }
      -[NSMutableDictionary setObject:forKey:](proofreadingSuggestionIDsPerDeliveryID, "setObject:forKey:", proofreadingDeliverySuggestionIDs, v15);
    }
    if (self->_inFlightDeliveryID)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantManager.m"), 1079, CFSTR("It should no longer be necessary to queue replacement deliveries"));

    }
    -[_UITextAssistantManager _setInFlightDeliveryID:](self, "_setInFlightDeliveryID:", v15);
    -[_UITextAssistantManager endTextAssistantAnticipation](self, "endTextAssistantAnticipation");
    -[_UITextAssistantManager animateRewrittenTextForDelivery:](self, "animateRewrittenTextForDelivery:", v15);
  }

}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v14;
  __CFString *v15;
  id v16;
  NSUUID *activeSessionUUID;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  unint64_t v27;
  NSObject *v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSUInteger v32;
  NSObject *v33;
  uint64_t v34;
  const __CFString *v35;
  NSObject *v36;
  NSUInteger v37;
  uint64_t v38;
  uint8_t buf[4];
  NSUInteger v40;
  __int16 v41;
  NSUInteger v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  _QWORD v49[6];

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v49[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (__CFString *)a4;
  v16 = a6;
  activeSessionUUID = self->_activeSessionUUID;
  objc_msgSend(v14, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _confirmMatchingWritingToolsSession(activeSessionUUID, v18, a2);

  if (self->_inFlightDeliveryID)
  {
    v49[0] = v14;
    v19 = v15;
    if (!v15)
      v19 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
    v49[1] = v19;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length, location, length);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v20;
    v49[3] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextAssistantManager bufferInvocationForSelector:arguments:](self, "bufferInvocationForSelector:arguments:", a2, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
    {
      v24 = qword_1ECD7F440;
      if (!qword_1ECD7F440)
      {
        v24 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v24, (unint64_t *)&qword_1ECD7F440);
      }
      v25 = *(NSObject **)(v24 + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = &stru_1E16EDF20;
        *(_DWORD *)buf = 138413314;
        v40 = (NSUInteger)v23;
        v41 = 2048;
        if (v7)
          v26 = CFSTR(" [FINISHED]");
        v42 = v37;
        v43 = 2048;
        v44 = v38;
        v45 = 2112;
        v46 = v15;
        v47 = 2112;
        v48 = v26;
        _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Packaged up composition replacement to deliver after animation finishes, %@\n\trange={%lu, %lu} replacement=%@%@", buf, 0x34u);
      }
    }

  }
  else
  {
    if (-[_UITextAssistantReplacementTracker isFinished](self->_replacementTracker, "isFinished"))
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v36, OS_LOG_TYPE_FAULT, "Received a composition update after WritingTools previously signaled that composition updates had finished. This is a WritingTools error", buf, 2u);
        }

      }
      else
      {
        v27 = qword_1ECD7F448;
        if (!qword_1ECD7F448)
        {
          v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v27, (unint64_t *)&qword_1ECD7F448);
        }
        v28 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Received a composition update after WritingTools previously signaled that composition updates had finished. This is a WritingTools error", buf, 2u);
        }
      }
    }
    if (os_variant_has_internal_diagnostics()
      && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC)
    {
      v29 = qword_1ECD7F450;
      if (!qword_1ECD7F450)
      {
        v29 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v29, (unint64_t *)&qword_1ECD7F450);
      }
      v30 = *(NSObject **)(v29 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = v30;
        v32 = location;
        v33 = v31;
        v34 = -[__CFString length](v15, "length");
        v35 = &stru_1E16EDF20;
        *(_DWORD *)buf = 134218754;
        v40 = v32;
        if (v7)
          v35 = CFSTR(" FINISHED");
        v41 = 2048;
        v42 = length;
        v43 = 2048;
        v44 = v34;
        v45 = 2112;
        v46 = v35;
        _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "composition session will replace range {%lu, %lu} with text of length %lu.%@", buf, 0x2Au);

        location = v32;
      }
    }
    -[_UITextAssistantManager updateReplacementTrackerWithText:forRange:inContext:finished:](self, "updateReplacementTrackerWithText:forRange:inContext:finished:", v15, location, length, v16, v7);
    if (v7)
      -[_UITextAssistantManager proofreadingOrCompositionFinished](self, "proofreadingOrCompositionFinished");
  }

}

- (void)didEndRewritingSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;

  v4 = a4;
  if (-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState", a3) == 2)
  {
    if (v4)
      return;
    v6 = 1;
    goto LABEL_9;
  }
  if (!-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState")|| -[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState") == 1)
  {
    if (-[_UITextAssistantReplacementTracker compositionSessionState](self->_replacementTracker, "compositionSessionState"))
    {
      if (!v4)
        return;
      goto LABEL_8;
    }
    -[_UITextAssistantManager endTextAssistantAnticipation](self, "endTextAssistantAnticipation");
    if (v4)
    {
LABEL_8:
      v6 = 2;
LABEL_9:
      -[_UITextAssistantManager updateTextViewAndTrackerWithIncomingCompositionSessionState:](self, "updateTextViewAndTrackerWithIncomingCompositionSessionState:", v6);
      -[_UITextAssistantManager updateSelectedRangeForCompositionIfFinishedForcing:](self, "updateSelectedRangeForCompositionIfFinishedForcing:", 1);
    }
  }
}

- (void)cancelSession
{
  id WeakRetained;

  self->_isEndingSessionByRequest = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "_endWritingTools");

}

- (uint64_t)evaluatedRangeInDocument
{
  uint64_t v1;
  void *v2;

  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 240) + *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 208), "rewrittenText");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "length");

  }
  return v1;
}

- (void)endSessionIfNecessaryForChangingCharactersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  NSRange v10;

  length = a3.length;
  location = a3.location;
  v6 = -[_UITextAssistantManager evaluatedRangeInDocument]((uint64_t)self);
  v8 = v7;
  v9.location = location;
  v9.length = length;
  v10.location = v6;
  v10.length = v8;
  if (NSIntersectionRange(v9, v10).length || location + length < v6 + v8)
    -[_UITextAssistantManager cancelSession](self, "cancelSession");
}

- (void)updateForCharactersInRange:(_NSRange)a3 withReplacement:(id)a4 isUndoRedo:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  NSUInteger v13;
  NSUInteger v14;
  BOOL v15;
  char v16;
  _UIWritingToolsUndoRoller *undoRoller;
  _UIWritingToolsUndoRoller *v18;
  _UIWritingToolsUndoRoller *v19;
  _UITextAssistantReplacementTracker *replacementTracker;
  void *v21;
  _UIWritingToolsUndoRoller *v22;
  _UIWritingToolsUndoRoller *v23;
  id v24;
  NSRange v25;
  NSRange v26;

  length = a3.length;
  location = a3.location;
  v24 = a4;
  v9 = -[_UITextAssistantManager evaluatedRangeInDocument]((uint64_t)self);
  v11 = v10;
  v25.location = location;
  v25.length = length;
  v26.location = v9;
  v26.length = v11;
  v12 = NSIntersectionRange(v25, v26);
  v13 = location + length;
  v14 = v9 + v11;
  if (v12.length)
    v15 = 0;
  else
    v15 = v13 >= v14;
  v16 = v15;
  if (v15 || location < v9)
  {
    if (!a5)
      goto LABEL_15;
  }
  else
  {
    if (!a5)
      goto LABEL_15;
    if (v13 <= v14)
      goto LABEL_18;
  }
  undoRoller = self->_undoRoller;
  if (!undoRoller || -[_UIWritingToolsUndoRoller hasFouled](undoRoller, "hasFouled"))
  {
LABEL_15:
    if ((v16 & 1) != 0)
      goto LABEL_17;
LABEL_16:
    -[_UITextAssistantManager cancelSession](self, "cancelSession");
    goto LABEL_17;
  }
LABEL_18:
  v18 = self->_undoRoller;
  if (!v18)
  {
    v19 = [_UIWritingToolsUndoRoller alloc];
    replacementTracker = self->_replacementTracker;
    if (self->_showingOriginal)
      -[_UITextAssistantReplacementTracker originalText](replacementTracker, "originalText");
    else
      -[_UITextAssistantReplacementTracker rewrittenText](replacementTracker, "rewrittenText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[_UIWritingToolsUndoRoller initWithEvaluatedText:offset:](v19, "initWithEvaluatedText:offset:", v21, v9);
    v23 = self->_undoRoller;
    self->_undoRoller = v22;

    v18 = self->_undoRoller;
  }
  -[_UIWritingToolsUndoRoller replaceRange:withText:](v18, "replaceRange:withText:", location, length, v24);
  if (-[_UIWritingToolsUndoRoller hasFouled](self->_undoRoller, "hasFouled"))
    goto LABEL_16;
LABEL_17:

}

- (void)finishUndoRedoChanges
{
  _UIWritingToolsUndoRoller *undoRoller;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _UITextAssistantManager *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _UITextAssistantManager *v18;
  uint64_t v19;
  _UIWritingToolsUndoRoller *v20;
  unint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  _UITextAssistantReplacementTracker *replacementTracker;
  void *v25;
  void *v26;
  int v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  undoRoller = self->_undoRoller;
  if (undoRoller)
  {
    if (-[_UIWritingToolsUndoRoller hasFouled](undoRoller, "hasFouled"))
    {
      if (os_variant_has_internal_diagnostics()
        && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
      {
        v4 = qword_1ECD7F458;
        if (!qword_1ECD7F458)
        {
          v4 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&qword_1ECD7F458);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "_undoRoller fouled while attempting to synchronize with original vs. rewritten text", (uint8_t *)&v27, 2u);
        }
      }
LABEL_22:
      -[_UITextAssistantManager cancelSession](self, "cancelSession");
LABEL_27:
      v20 = self->_undoRoller;
      self->_undoRoller = 0;

      return;
    }
    if (!self->_showingOriginal)
      goto LABEL_17;
    -[_UIWritingToolsUndoRoller rolledReplacement](self->_undoRoller, "rolledReplacement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextAssistantReplacementTracker rewrittenText](self->_replacementTracker, "rewrittenText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (v10)
    {
      self->_isSynchronizingWithUndoRedo = 1;
      if (-[_UITextAssistantReplacementTracker isProofreading](self->_replacementTracker, "isProofreading"))
      {
        v11 = self;
        v12 = 0;
LABEL_20:
        -[_UITextAssistantManager updateProofreadingTextAndTrackerToShowOriginal:](v11, "updateProofreadingTextAndTrackerToShowOriginal:", v12);
LABEL_26:
        self->_isSynchronizingWithUndoRedo = 0;
        goto LABEL_27;
      }
      v18 = self;
      v19 = 2;
      goto LABEL_25;
    }
    if (!self->_showingOriginal)
    {
LABEL_17:
      -[_UIWritingToolsUndoRoller rolledReplacement](self->_undoRoller, "rolledReplacement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextAssistantReplacementTracker originalText](self->_replacementTracker, "originalText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isEqualToString:", v16);

      if (v17)
      {
        self->_isSynchronizingWithUndoRedo = 1;
        if (-[_UITextAssistantReplacementTracker isProofreading](self->_replacementTracker, "isProofreading"))
        {
          v11 = self;
          v12 = 1;
          goto LABEL_20;
        }
        v18 = self;
        v19 = 1;
LABEL_25:
        -[_UITextAssistantManager updateToCompositionSessionState:](v18, "updateToCompositionSessionState:", v19);
        goto LABEL_26;
      }
    }
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v21 = qword_1ECD7F460;
      if (!qword_1ECD7F460)
      {
        v21 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD7F460);
      }
      v22 = *(id *)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        if (self->_showingOriginal)
          v23 = CFSTR("rewritten text");
        else
          v23 = CFSTR("original text");
        replacementTracker = self->_replacementTracker;
        if (self->_showingOriginal)
          -[_UITextAssistantReplacementTracker rewrittenText](replacementTracker, "rewrittenText");
        else
          -[_UITextAssistantReplacementTracker originalText](replacementTracker, "originalText");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIWritingToolsUndoRoller rolledReplacement](self->_undoRoller, "rolledReplacement");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = v23;
        v29 = 2112;
        v30 = v25;
        v31 = 2112;
        v32 = v26;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "_undoRoller failed to synchronize with original vs. rewritten text.\nExpected a match to %@\n%@\nReceived\n%@", (uint8_t *)&v27, 0x20u);

      }
    }
    goto LABEL_22;
  }
}

- (void)reportTextChunkVisibilityUpdateForDelivery:(id)a3 textRange:(id)a4 visible:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  int has_internal_diagnostics;
  unint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  unint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v7)
  {
    if (has_internal_diagnostics
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
    {
      v10 = qword_1ECD7F468;
      if (!qword_1ECD7F468)
      {
        v10 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7F468);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = CFSTR("hidden");
        v19 = 138412802;
        if (v5)
          v12 = CFSTR("visible");
        v20 = v12;
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v7;
        v13 = "Updating chunk visibility to %@ on range %@ for replacement delivery: %@";
        v14 = v11;
        v15 = 32;
LABEL_25:
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, v15);
      }
    }
  }
  else if (has_internal_diagnostics
         && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) == 0&& byte_1EDDA80CC|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) == 0&& byte_1EDDA80D4))
  {
    v16 = qword_1ECD7F470;
    if (!qword_1ECD7F470)
    {
      v16 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&qword_1ECD7F470);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = CFSTR("hidden");
      if (v5)
        v18 = CFSTR("visible");
      v19 = 138412546;
      v20 = v18;
      v21 = 2112;
      v22 = v8;
      v13 = "Updating chunk visibility to %@ on range %@ for pondering effect";
      v14 = v17;
      v15 = 22;
      goto LABEL_25;
    }
  }

}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (NSUUID)_inFlightDeliveryID
{
  return self->_inFlightDeliveryID;
}

- (BOOL)isReplacingTextByRequest
{
  return self->_isReplacingTextByRequest;
}

- (WTTextViewDelegate_Proposed_v1)proofreadingTextViewDelegate
{
  return (WTTextViewDelegate_Proposed_v1 *)objc_loadWeakRetained((id *)&self->_proofreadingTextViewDelegate);
}

- (void)setProofreadingTextViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_proofreadingTextViewDelegate, a3);
}

- (_UITextAssistantReplacementTracker)replacementTracker
{
  return self->_replacementTracker;
}

- (UIView)infillViewFollowingEvaluatedRange
{
  return self->_infillViewFollowingEvaluatedRange;
}

- (double)followingInfillViewBaseMinY
{
  return self->_followingInfillViewBaseMinY;
}

- (void)setFollowingInfillViewBaseMinY:(double)a3
{
  self->_followingInfillViewBaseMinY = a3;
}

- (int64_t)infillTextLength
{
  return self->_infillTextLength;
}

- (unint64_t)offsetToContextualRange
{
  return self->_offsetToContextualRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infillViewFollowingEvaluatedRange, 0);
  objc_storeStrong((id *)&self->_replacementTracker, 0);
  objc_destroyWeak((id *)&self->_proofreadingTextViewDelegate);
  objc_storeStrong((id *)&self->_inFlightDeliveryID, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_infillViewPreceedingEvaluatedRange, 0);
  objc_storeStrong((id *)&self->_writingToolsDelegateMessageInvocationBuffer, 0);
  objc_storeStrong((id *)&self->_undoRoller, 0);
  objc_storeStrong((id *)&self->_proofreadingDeliverySuggestionIDs, 0);
  objc_storeStrong((id *)&self->_proofreadingDeliveryReplacement, 0);
  objc_storeStrong((id *)&self->_backingProofreadingSuggestionStatesByUUID, 0);
  objc_storeStrong((id *)&self->_proofreadingSuggestionIDsPerDeliveryID, 0);
  objc_storeStrong((id *)&self->_chosenSuggestion, 0);
  objc_storeStrong((id *)&self->_activeReviewingUUID, 0);
  objc_storeStrong((id *)&self->_proofreadingInteraction, 0);
  objc_storeStrong((id *)&self->_selectionUIHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_grabberSuppression, 0);
  objc_storeStrong((id *)&self->_activeSessionUUID, 0);
}

@end
