@implementation WFSlotTemplateImageAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[WFSlotTemplateImageAttachment image](self, "image", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;

  -[WFSlotTemplateImageAttachment fontForAlignment](self, "fontForAlignment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wf_lineHeight");
  v14 = v13 * 0.75;

  if (v11 < v14)
    v14 = v11;
  v15 = v9 / v11 * v14;
  -[WFSlotTemplateImageAttachment fontForAlignment](self, "fontForAlignment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "capHeight");
  v18 = (v17 - v14) * 0.5;

  v19 = 0.0;
  v20 = v18;
  v21 = v15;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UIFont)fontForAlignment
{
  return self->_fontForAlignment;
}

- (void)setFontForAlignment:(id)a3
{
  objc_storeStrong((id *)&self->_fontForAlignment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontForAlignment, 0);
}

@end
