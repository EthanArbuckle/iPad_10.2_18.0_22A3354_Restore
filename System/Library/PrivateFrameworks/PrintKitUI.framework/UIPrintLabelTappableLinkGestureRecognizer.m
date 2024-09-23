@implementation UIPrintLabelTappableLinkGestureRecognizer

- (BOOL)didTapAttributedTextInLabel:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  BOOL v28;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0DC33A8]);
  v13 = objc_alloc(MEMORY[0x1E0DC33D8]);
  v14 = (void *)objc_msgSend(v13, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v15 = objc_alloc(MEMORY[0x1E0DC33E0]);
  objc_msgSend(v7, "attributedText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithAttributedString:", v16);

  objc_msgSend(v12, "addTextContainer:", v14);
  objc_msgSend(v17, "addLayoutManager:", v12);
  objc_msgSend(v14, "setLineFragmentPadding:", 0.0);
  objc_msgSend(v14, "setLineBreakMode:", objc_msgSend(v7, "lineBreakMode"));
  objc_msgSend(v14, "setMaximumNumberOfLines:", objc_msgSend(v7, "numberOfLines"));
  objc_msgSend(v14, "setSize:", v9, v11);
  -[UIPrintLabelTappableLinkGestureRecognizer locationInView:](self, "locationInView:", v7);
  v19 = v18;
  v21 = v20;

  objc_msgSend(v12, "usedRectForTextContainer:", v14);
  v26 = objc_msgSend(v12, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v14, 0, v19 - -(v23 - (v9 - v22) * 0.5), v21 - -(v25 - (v11 - v24) * 0.5));
  v28 = v26 >= location && v26 - location < length;

  return v28;
}

@end
