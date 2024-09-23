@implementation SiriSharedUISystemAssistantExperienceContainerView

- (SiriSharedUISystemAssistantExperienceContainerView)initWithFrame:(CGRect)a3
{
  return (SiriSharedUISystemAssistantExperienceContainerView *)sub_1DE11B8CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SiriSharedUISystemAssistantExperienceContainerView)initWithCoder:(id)a3
{
  return (SiriSharedUISystemAssistantExperienceContainerView *)SiriSharedUISystemAssistantExperienceContainerView.init(coder:)(a3);
}

- (double)textFieldHeight
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldHeight);
  swift_beginAccess();
  return *v2;
}

- (void)setTextFieldHeight:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldHeight);
  swift_beginAccess();
  *v4 = a3;
}

- (id)createDefaultMaterialBackgroundView
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;
  id v3;
  id v4;
  char *v5;

  v2 = self;
  v3 = -[SiriSharedUISystemAssistantExperienceContainerView traitCollection](v2, sel_traitCollection);
  objc_msgSend(v3, sel_userInterfaceStyle);

  v4 = objc_allocWithZone((Class)type metadata accessor for SiriSharedUIStandardViewDropletMaterial());
  v5 = sub_1DE1000AC(1);

  return v5;
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  SiriSharedUISystemAssistantExperienceContainerView *v5;
  Swift::Bool v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = SiriSharedUISystemAssistantExperienceContainerView.hasContentAt(point:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  return v6;
}

- (BOOL)isDisplayingResponse
{
  _QWORD *v4;
  uint64_t v5;
  SiriSharedUISystemAssistantExperienceContainerView *v6;

  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultView))
    return 1;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_loadingViews);
  swift_beginAccess();
  if (*v4 >> 62)
  {
    v6 = self;
    swift_bridgeObjectRetain();
    v5 = sub_1DE130C14();

    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

- (void)setTextFieldWithTextFieldView:(id)a3
{
  id v5;
  SiriSharedUISystemAssistantExperienceContainerView *v6;

  v5 = a3;
  v6 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setTextField(textFieldView:)((UIView_optional *)a3);

}

- (void)setSuggestions:(id)a3 animatedBlur:(BOOL)a4
{
  SiriSharedUISystemAssistantExperienceContainerView *v5;
  id v6;

  sub_1DE1005A8(0, (unint64_t *)&qword_1F0435290);
  sub_1DE1309BC();
  v5 = self;
  v6 = (id)sub_1DE1309B0();
  -[SiriSharedUISystemAssistantExperienceContainerView setSuggestions:](v5, sel_setSuggestions_, v6);

  swift_bridgeObjectRelease();
}

- (void)setSuggestions:(id)a3
{
  uint64_t v4;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  sub_1DE1005A8(0, (unint64_t *)&qword_1F0435290);
  v4 = sub_1DE1309BC();
  v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setSuggestions(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (BOOL)isSuggestionEqualToSuggestion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  SiriSharedUISystemAssistantExperienceContainerView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DE12A844((uint64_t)v6, (uint64_t)v7);

  return v9 & 1;
}

- (void)removeSuggestions
{
  SiriSharedUISystemAssistantExperienceContainerView *v3;
  id v4;

  sub_1DE1005A8(0, (unint64_t *)&qword_1F0435290);
  v3 = self;
  v4 = (id)sub_1DE1309B0();
  -[SiriSharedUISystemAssistantExperienceContainerView setSuggestions:animatedBlur:](v3, sel_setSuggestions_animatedBlur_, v4, 0);

}

- (void)setVoiceLoading:(id)a3
{
  UIView *v4;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  v4 = (UIView *)a3;
  v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setVoiceLoading(_:)(v4);

}

- (void)setBottomFloatingButton:(id)a3
{
  UIView *v4;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  v4 = (UIView *)a3;
  v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setBottomFloatingButton(_:)(v4);

}

- (void)updateBottomFloatingButtonVisibility:(BOOL)a3
{
  SiriSharedUISystemAssistantExperienceContainerView *v4;

  v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateBottomFloatingButtonVisibility(_:)(a3);

}

- (void)cleanupBottomFloatingButtonIfNeeded
{
  uint64_t v3;
  _BYTE *v4;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomFloatingButtonView);
  if (v3)
  {
    v4 = (_BYTE *)(v3 + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_removeOnNextLayoutPass);
    swift_beginAccess();
    *v4 = 1;
  }
  v5 = self;
  -[SiriSharedUISystemAssistantExperienceContainerView setNeedsLayout](v5, sel_setNeedsLayout);
  -[SiriSharedUISystemAssistantExperienceContainerView layoutIfNeeded](v5, sel_layoutIfNeeded);

}

- (void)setResultWithResultView:(id)a3 resultSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  UIView *v7;
  SiriSharedUISystemAssistantExperienceContainerView *v8;

  height = a4.height;
  width = a4.width;
  v7 = (UIView *)a3;
  v8 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setResult(resultView:resultSize:)(v7, (CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

}

- (void)updateResultSizeWithResultSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateResultSize(resultSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

}

- (void)updateLoadingPillSizeWithCandidateSize:(CGSize)a3
{
  CGFloat width;
  unint64_t v4;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  width = a3.width;
  v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateLoadingPillSize(withCandidateSize:)((CGSize)__PAIR128__(v4, *(unint64_t *)&width));

}

- (void)setTransitionLoadingToResultWithResultSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  SiriSharedUISystemAssistantExperienceContainerView.setTransitionLoadingToResult(resultSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

}

- (void)setMergedResultsForTransition
{
  sub_1DE122BA4(self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultViewState, 2);
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  SiriSharedUISystemAssistantExperienceContainerView *v5;

  if (*((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isInAmbient) != a3)
  {
    v3 = a3;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isInAmbient) = a3;
    v4 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_snippetsDropletView);
    v5 = self;
    objc_msgSend(v4, sel_setHidden_, v3);
    -[SiriSharedUISystemAssistantExperienceContainerView setNeedsLayout](v5, sel_setNeedsLayout);

  }
}

- (SiriSharedUISystemAssistantExperienceContainerViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_delegate;
  swift_beginAccess();
  return (SiriSharedUISystemAssistantExperienceContainerViewDelegate *)(id)MEMORY[0x1DF0E8588](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (int64_t)inputType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_inputType);
  swift_beginAccess();
  return *v2;
}

- (void)setInputType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_inputType);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)showsSensitiveUI
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_showsSensitiveUI;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsSensitiveUI:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_showsSensitiveUI;
  swift_beginAccess();
  *v4 = a3;
}

- (double)bottomContentInset
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomContentInset);
  swift_beginAccess();
  return *v2;
}

- (void)setBottomContentInset:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomContentInset);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isFirstSnippet
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isFirstSnippet;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFirstSnippet:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_isFirstSnippet;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isSuggestionsExpanded
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_suggestionsExpanded);
}

- (BOOL)loadingToResultRequiresMerge
{
  return *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView) != 0;
}

- (BOOL)hasLoadingViews
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  SiriSharedUISystemAssistantExperienceContainerView *v7;

  v3 = (unint64_t *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_loadingViews);
  swift_beginAccess();
  v4 = *v3;
  if (v4 >> 62)
  {
    v7 = self;
    swift_bridgeObjectRetain();
    v5 = sub_1DE130C14();

    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

- (void)cleanupResultTransitionIfNeeded
{
  uint64_t v3;
  void *v4;
  SiriSharedUISystemAssistantExperienceContainerView *v5;
  char *v6;
  id v7;

  v3 = OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView);
  v5 = self;
  if (v4)
  {
    v6 = v4;
    sub_1DE11CDDC(v6);

    v7 = *(Class *)((char *)&self->super.super.super.super.isa + v3);
  }
  else
  {
    v7 = 0;
  }
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = 0;

}

- (void)cleanupLoadingTransitionIfNeeded
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_voiceLoadingView);
  if (v2)
    objc_msgSend(v2, sel_removeFromSuperview);
}

- (void)cleanupResponseElements:(unint64_t)a3
{
  char v3;
  SiriSharedUISystemAssistantExperienceContainerView *v4;

  v3 = a3;
  v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.cleanupResponseElements(_:)(v3);

}

- (void)suggestionTapAnimationWithIndex:(int64_t)a3 isTouchUp:(BOOL)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  SiriSharedUISystemAssistantExperienceContainerView *v10;
  _QWORD v11[6];

  v7 = (void *)objc_opt_self();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = self;
  *(_QWORD *)(v8 + 24) = a3;
  *(_BYTE *)(v8 + 32) = a4;
  v11[4] = sub_1DE12B2BC;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1DE1144E4;
  v11[3] = &block_descriptor_82;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_release();
  objc_msgSend(v7, sel_animateWithDuration_animations_, v9, 0.1);
  _Block_release(v9);

}

- (void)transitionToSuggestionsExpanded
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionToSuggestionsExpanded()();

}

- (void)transitionToSuggestionsCollapsedWithIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  SiriSharedUISystemAssistantExperienceContainerView *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionToSuggestionsCollapsedWith(index:animated:completionBlock:)(a3, a4, (uint64_t)sub_1DE12B0A8, v9);

  swift_release();
}

- (void)transitionToSuggestionsCollapsed
{
  sub_1DE122BA4(self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_suggestionsExpanded, 0);
}

- (void)transitionSuggestionToLoadingWithIndex:(int64_t)a3
{
  SiriSharedUISystemAssistantExperienceContainerView *v4;

  v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionSuggestionToLoading(index:)(a3);

}

- (void)transitionVoiceLoadingToLoading
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionVoiceLoadingToLoading()();

}

- (void)startLatencyLightOnActivePill
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  SiriSharedUISystemAssistantExperienceContainerView *v6;
  id v7;
  void *v8;
  SiriSharedUISystemAssistantExperienceContainerView *v9;

  v3 = (unint64_t *)((char *)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_loadingViews);
  swift_beginAccess();
  v4 = *v3;
  if (v4 >> 62)
  {
    v9 = self;
    swift_bridgeObjectRetain();
    if (sub_1DE130C14())
      goto LABEL_3;
LABEL_8:

    swift_bridgeObjectRelease();
    return;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = self;
  swift_bridgeObjectRetain();
  if (!v5)
    goto LABEL_8;
LABEL_3:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x1DF0E7B5C](0, v4);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v4 + 32);
LABEL_6:
    v8 = v7;
    swift_bridgeObjectRelease();
    sub_1DE12CC78();

    return;
  }
  __break(1u);
}

- (void)transitionTextFieldLoadingToLoading
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionTextFieldLoadingToLoading()();

}

- (void)transitionToRemovedResponseElements:(unint64_t)a3
{
  char v3;
  SiriSharedUISystemAssistantExperienceContainerView *v4;

  v3 = a3;
  v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transition(toRemovedResponseElements:)(v3);

}

- (void)transitionMergedResults
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView))
  {
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultViewState) = 1;
    v2 = self;
    -[SiriSharedUISystemAssistantExperienceContainerView setNeedsLayout](v2, sel_setNeedsLayout);
    -[SiriSharedUISystemAssistantExperienceContainerView layoutIfNeeded](v2, sel_layoutIfNeeded);

  }
}

- (void)transitionToResult
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.transitionToResult()();

}

- (void)transitionToUpdatedContentInset
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  -[SiriSharedUISystemAssistantExperienceContainerView setNeedsLayout](v2, sel_setNeedsLayout);
  -[SiriSharedUISystemAssistantExperienceContainerView layoutIfNeeded](v2, sel_layoutIfNeeded);

}

- (void)prepareForDrillinAnimation
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.prepareForDrillinAnimation()();

}

- (id)resultContentView
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultView);
  if (v2)
    return objc_autoreleaseReturnValue(objc_retain(*(id *)(v2
                                                         + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView)));
  else
    return 0;
}

- (id)blurrableView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_blurrableView));
}

- (void)updateBackgroundView:(id)a3 smartDialogView:(id)a4 isSnippetAsyncColored:(BOOL)a5
{
  UIView *v8;
  id v9;
  SiriSharedUISystemAssistantExperienceContainerView *v10;

  v8 = (UIView *)a3;
  v9 = a4;
  v10 = self;
  SiriSharedUISystemAssistantExperienceContainerView.updateBackgroundView(_:smartDialogView:isSnippetAsyncColored:)(v8, (UIView_optional *)a4, a5);

}

- (void)searchUIBackgroundColorUpdateSuccessful:(BOOL)a3
{
  SiriSharedUISystemAssistantExperienceContainerView *v4;

  v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.searchUIBackgroundColorUpdateSuccessful(_:)(a3);

}

- (void)safeAreaInsetsDidChange
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUISystemAssistantExperienceContainerView;
  v2 = self;
  -[SiriSharedUISystemAssistantExperienceContainerView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[SiriSharedUISystemAssistantExperienceContainerView setNeedsLayout](v2, sel_setNeedsLayout, v3.receiver, v3.super_class);
  -[SiriSharedUISystemAssistantExperienceContainerView layoutIfNeeded](v2, sel_layoutIfNeeded);

}

- (void)layoutSubviews
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.layoutSubviews()();

}

- (void)firstSnippetMaterialAnimation
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.firstSnippetMaterialAnimation()();

}

- (void)suggestionsMitose
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.suggestionsMitose()();

}

- (void)mitoseWithDuration:(float)a3
{
  SiriSharedUISystemAssistantExperienceContainerView *v4;

  v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.mitose(withDuration:)(a3);

}

- (void)postPillMergeBounce
{
  SiriSharedUISystemAssistantExperienceContainerView *v2;

  v2 = self;
  SiriSharedUISystemAssistantExperienceContainerView.postPillMergeBounce()();

}

- (void)preFollowupPulseWithDuration:(float)a3
{
  SiriSharedUISystemAssistantExperienceContainerView *v4;

  v4 = self;
  SiriSharedUISystemAssistantExperienceContainerView.preFollowupPulse(withDuration:)(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_fluidDismissalManager));
  sub_1DE0F92C8((uint64_t)self + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_snippetsDropletView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_suggestionsDropletView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_blurrableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_resultView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_bottomFloatingButtonView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_previousResultView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_voiceLoadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_textFieldLoadingView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SiriSharedUISystemAssistantExperienceContainerView_snippetBackgroundView));
}

@end
