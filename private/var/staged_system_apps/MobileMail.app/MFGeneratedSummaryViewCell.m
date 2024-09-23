@implementation MFGeneratedSummaryViewCell

- (MFGeneratedSummaryViewCellDelegate)delegate
{
  MFGeneratedSummaryViewCell *v2;
  id v5;

  v2 = self;
  v5 = (id)GeneratedSummaryViewCell.delegate.getter();

  return (MFGeneratedSummaryViewCellDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  MFGeneratedSummaryViewCell *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  GeneratedSummaryViewCell.delegate.setter((uint64_t)a3);

}

- (ConversationCellViewModel)viewModel
{
  MFGeneratedSummaryViewCell *v2;
  id v5;

  v2 = self;
  v5 = GeneratedSummaryViewCell.viewModel.getter();

  return (ConversationCellViewModel *)v5;
}

- (void)setViewModel:(id)a3
{
  id v4;
  MFGeneratedSummaryViewCell *v5;

  v4 = a3;
  v5 = self;
  GeneratedSummaryViewCell.viewModel.setter(a3);

}

- (MFGeneratedSummaryViewCell)initWithFrame:(CGRect)a3
{
  return (MFGeneratedSummaryViewCell *)sub_1002491C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MFGeneratedSummaryViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002499F4();
}

- (void)_displayMetricsDidChange
{
  MFGeneratedSummaryViewCell *v2;

  v2 = self;
  GeneratedSummaryViewCell._displayMetricsDidChange()();

}

- (void)prepareForReuse
{
  MFGeneratedSummaryViewCell *v2;

  v2 = self;
  GeneratedSummaryViewCell.prepareForReuse()();

}

- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3
{
  MFGeneratedSummaryViewCell *v3;
  char v6;

  v3 = self;
  v6 = GeneratedSummaryViewCell.canBeginDragWithTouch(at:)();

  return _convertBoolToObjCBool(_:)(v6 & 1) & 1;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  MFGeneratedSummaryViewCell *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  isa = GeneratedSummaryViewCell.preferredLayoutAttributesFitting(_:)((UICollectionViewLayoutAttributes)a3).super.isa;

  return isa;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  MFGeneratedSummaryViewCell *v5;
  UIWindow_optional v8;

  v4 = a3;
  v5 = self;
  v8.value.super.super.super.isa = (Class)a3;
  GeneratedSummaryViewCell.willMove(toWindow:)(v8);

}

- (void).cxx_destruct
{
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___MFGeneratedSummaryViewCell_summaryContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___MFGeneratedSummaryViewCell_summaryView));
  sub_100221900((uint64_t)self + OBJC_IVAR___MFGeneratedSummaryViewCell_delegate);
}

@end
