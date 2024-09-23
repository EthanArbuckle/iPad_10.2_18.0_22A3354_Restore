@implementation UITextView(NCTextSupportingAdditions)

- (uint64_t)nc_numberOfLines
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "textContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "maximumNumberOfLines");

  return v2;
}

- (void)nc_setNumberOfLines:()NCTextSupportingAdditions
{
  id v4;

  objc_msgSend(a1, "textContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", a3);

}

- (uint64_t)unui_numberOfLinesInFrame:()NCTextSupportingAdditions maximum:drawingContext:
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v14 = a8;
  objc_msgSend(a1, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "unui_numberOfLinesForText:inFrame:maximum:drawingContext:", v16, a7, v14, a2, a3, a4, a5);

  return v17;
}

- (double)unui_measuringHeightWithNumberOfLines:()NCTextSupportingAdditions
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unui_measuringHeightForText:withNumberOfLines:", v6, a3);
  v8 = v7;

  return v8;
}

- (double)unui_drawingHeightWithNumberOfLines:()NCTextSupportingAdditions
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unui_drawingHeightForText:withNumberOfLines:additionalPadding:", v6, a3, 1.5);
  v8 = v7;

  return v8;
}

@end
