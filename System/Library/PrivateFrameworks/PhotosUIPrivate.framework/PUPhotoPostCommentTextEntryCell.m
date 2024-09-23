@implementation PUPhotoPostCommentTextEntryCell

- (PUPhotoPostCommentTextEntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUPhotoPostCommentTextEntryCell *v4;
  PUPhotoPostCommentTextEntryCell *v5;
  PUPhotoCommentEntryView *v6;
  uint64_t v7;
  PUPhotoCommentEntryView *textEntryView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPhotoPostCommentTextEntryCell;
  v4 = -[PUPhotoPostCommentTextEntryCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUPhotoPostCommentTextEntryCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = [PUPhotoCommentEntryView alloc];
    v7 = -[PUPhotoCommentEntryView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textEntryView = v5->_textEntryView;
    v5->_textEntryView = (PUPhotoCommentEntryView *)v7;

    -[PUPhotoPostCommentTextEntryCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5->_textEntryView);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPostCommentTextEntryCell;
  -[PUPhotoPostCommentTextEntryCell layoutSubviews](&v8, sel_layoutSubviews);
  -[PUPhotoPostCommentTextEntryCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[PUPhotoCommentEntryView setFrame:](self->_textEntryView, "setFrame:", 0.0, 0.0, v5, v7);
}

- (PUPhotoCommentEntryView)textEntryView
{
  return self->_textEntryView;
}

- (void)setTextEntryView:(id)a3
{
  objc_storeStrong((id *)&self->_textEntryView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEntryView, 0);
}

+ (double)heightForWidth:(double)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double result;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PUPhotoPostCommentTextEntryCell_heightForWidth___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (heightForWidth__onceToken != -1)
    dispatch_once(&heightForWidth__onceToken, block);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (!IsAccessibilityCategory)
    return 54.0;
  result = *(double *)&_cachedAccessibilityHeight;
  if (*(double *)&_cachedAccessibilityHeight < 0.0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
    objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commentEntryFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v10);

    objc_msgSend(v8, "setText:", CFSTR("A"));
    objc_msgSend(v8, "sizeThatFits:", a3, 0.0);
    v12 = v11;
    objc_msgSend(v8, "textContainerInset");
    v14 = v12 + v13;
    objc_msgSend(v8, "textContainerInset");
    *(double *)&_cachedAccessibilityHeight = v14 + v15;

    return *(double *)&_cachedAccessibilityHeight;
  }
  return result;
}

+ (void)preferredContentSizeDidChange
{
  _cachedAccessibilityHeight = 0xBFF0000000000000;
}

void __50__PUPhotoPostCommentTextEntryCell_heightForWidth___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_preferredContentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

}

@end
