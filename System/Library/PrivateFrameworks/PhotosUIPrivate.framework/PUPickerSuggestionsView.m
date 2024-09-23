@implementation PUPickerSuggestionsView

- (PUPickerSuggestionsViewDelegate)delegate
{
  sub_1AABC4B58();
}

- (void)setDelegate:(id)a3
{
  PUPickerSuggestionsView *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AABC4BB4();

}

- (PHPhotoLibrary)photoLibrary
{
  id v2;

  sub_1AABC4C08();
  return (PHPhotoLibrary *)v2;
}

- (void)setPhotoLibrary:(id)a3
{
  id v5;
  PUPickerSuggestionsView *v6;

  v5 = a3;
  v6 = self;
  sub_1AABC4C78((uint64_t)a3);

}

- (_PHPickerSuggestionGroup)suggestionGroup
{
  id v2;

  sub_1AABC4CA4();
  return (_PHPickerSuggestionGroup *)v2;
}

- (void)setSuggestionGroup:(id)a3
{
  id v5;
  PUPickerSuggestionsView *v6;

  v5 = a3;
  v6 = self;
  sub_1AABC4D14(a3);

}

- (void)clearFilterableSuggestion
{
  PUPickerSuggestionsView *v2;

  v2 = self;
  sub_1AABC4D48();

}

- (PUPickerSuggestionsView)initWithIsProcessing:(BOOL)a3 isDeviceAspectRatioContentMode:(BOOL)a4 contentHasSpecialFilter:(BOOL)a5
{
  PUPickerSuggestionsView *result;

  sub_1AABC4E88();
  return result;
}

- (PUPickerSuggestionsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AABC529C();
}

- (CGSize)intrinsicContentSize
{
  PUPickerSuggestionsView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1AABC5558();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutMarginsDidChange
{
  PUPickerSuggestionsView *v2;

  v2 = self;
  sub_1AABC5584();

}

- (void)layoutSubviews
{
  PUPickerSuggestionsView *v2;

  v2 = self;
  sub_1AABC567C();

}

- (PUPickerSuggestionsView)initWithFrame:(CGRect)a3
{
  sub_1AABC792C();
}

- (void).cxx_destruct
{
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUPickerSuggestionsView_delegate);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionsView_photoLibrary);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionsView_suggestionGroup);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionsView_selectedSuggestion);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionsView_scrollView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionsView_stackView);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUPickerSuggestionsView_contentWidthConstraint);

}

@end
