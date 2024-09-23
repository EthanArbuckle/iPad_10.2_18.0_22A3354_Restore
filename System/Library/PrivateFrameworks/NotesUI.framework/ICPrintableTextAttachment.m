@implementation ICPrintableTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect result;

  v11.receiver = self;
  v11.super_class = (Class)ICPrintableTextAttachment;
  -[ICPrintableTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v11, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  -[ICPrintableTextAttachment adjustedBounds:forProposedLineFragment:](self, "adjustedBounds:forProposedLineFragment:");
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGRect result;

  v12.receiver = self;
  v12.super_class = (Class)ICPrintableTextAttachment;
  -[ICPrintableTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v12, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  -[ICPrintableTextAttachment adjustedBounds:forProposedLineFragment:](self, "adjustedBounds:forProposedLineFragment:");
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)adjustedBounds:(CGRect)a3 forProposedLineFragment:(CGRect)a4
{
  double width;
  CGFloat height;
  CGFloat v6;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  width = a4.size.width;
  height = a3.size.height;
  v6 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICPrintableTextAttachment frameOffset](self, "frameOffset", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v11 = v10;
  -[ICPrintableTextAttachment frameOffset](self, "frameOffset");
  v13 = v12;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = v6;
  v24.size.height = height;
  v25 = CGRectOffset(v24, v11, v13);
  v14 = v25.origin.x;
  v15 = v25.origin.y;
  v16 = v25.size.width;
  v17 = v25.size.height;
  if (width / v25.size.width < 1.0)
  {
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, width / v25.size.width, width / v25.size.width);
    v22 = v23;
    v26.origin.x = v14;
    v26.origin.y = v15;
    v26.size.width = v16;
    v26.size.height = v17;
    v27 = CGRectApplyAffineTransform(v26, &v22);
    v14 = v27.origin.x;
    v15 = v27.origin.y;
    v16 = v27.size.width;
    v17 = v27.size.height;
  }
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGPoint)frameOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_frameOffset.x;
  y = self->_frameOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFrameOffset:(CGPoint)a3
{
  self->_frameOffset = a3;
}

@end
