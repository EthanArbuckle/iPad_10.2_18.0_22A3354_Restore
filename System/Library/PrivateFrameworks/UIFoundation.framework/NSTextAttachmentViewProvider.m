@implementation NSTextAttachmentViewProvider

- (UIView)view
{
  UIView *v3;

  if (!self->_view)
    -[NSTextAttachmentViewProvider loadView](self, "loadView");
  objc_sync_enter(self);
  v3 = self->_view;
  objc_sync_exit(self);
  return v3;
}

- (BOOL)tracksTextAttachmentViewBounds
{
  return self->_tracksTextAttachmentViewBounds;
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (NSTextAttachment)textAttachment
{
  return (NSTextAttachment *)objc_loadWeak((id *)&self->_textAttachment);
}

- (void)setView:(UIView *)view
{
  if (self->_view != view)
  {
    objc_sync_enter(self);

    self->_view = view;
    objc_sync_exit(self);
  }
}

- (void)setTracksTextAttachmentViewBounds:(BOOL)tracksTextAttachmentViewBounds
{
  self->_tracksTextAttachmentViewBounds = tracksTextAttachmentViewBounds;
}

- (void)setTextLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_textLayoutManager, a3);
}

- (void)setTextAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_textAttachment, a3);
}

- (NSTextAttachmentViewProvider)initWithTextAttachment:(NSTextAttachment *)textAttachment parentView:(UIView *)parentView textLayoutManager:(NSTextLayoutManager *)textLayoutManager location:(id)location
{
  NSTextAttachmentViewProvider *v9;
  NSTextAttachmentViewProvider *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSTextAttachmentViewProvider;
  v9 = -[NSTextAttachmentViewProvider init](&v12, sel_init, textAttachment, parentView);
  v10 = v9;
  if (v9)
  {
    -[NSTextAttachmentViewProvider setTextAttachment:](v9, "setTextAttachment:", textAttachment);
    v10->_location = (NSTextLocation *)location;
    -[NSTextAttachmentViewProvider setTracksTextAttachmentViewBounds:](v10, "setTracksTextAttachmentViewBounds:", 0);
    -[NSTextAttachmentViewProvider setTextLayoutManager:](v10, "setTextLayoutManager:", textLayoutManager);
  }
  return v10;
}

- (void)removeView
{
  UIView *v3;

  v3 = -[NSTextAttachmentViewProvider view](self, "view");
  if (v3)
    -[NSTextAttachment detachView:fromParentView:](-[NSTextAttachmentViewProvider textAttachment](self, "textAttachment"), "detachView:fromParentView:", v3, -[UIView superview](v3, "superview"));
}

- (void)dealloc
{
  UIView *view;
  UIView *v4;
  objc_super v5;

  view = self->_view;
  if (view)
  {
    -[NSTextAttachment detachView:fromParentView:](-[NSTextAttachmentViewProvider textAttachment](self, "textAttachment"), "detachView:fromParentView:", view, -[UIView superview](view, "superview"));
    v4 = self->_view;
  }
  else
  {
    v4 = 0;
  }

  -[NSTextAttachmentViewProvider setTextAttachment:](self, "setTextAttachment:", 0);
  -[NSTextAttachmentViewProvider setTextLayoutManager:](self, "setTextLayoutManager:", 0);
  -[NSTextAttachmentViewProvider setLayoutManager:](self, "setLayoutManager:", 0);
  v5.receiver = self;
  v5.super_class = (Class)NSTextAttachmentViewProvider;
  -[NSTextAttachmentViewProvider dealloc](&v5, sel_dealloc);
}

- (CGRect)attachmentBoundsForAttributes:(NSDictionary *)attributes location:(id)location textContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)proposedLineFragment position:(CGPoint)position
{
  uint64_t v7;
  double v8;
  double v9;
  UIView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v7 = MEMORY[0x1E0CB3438];
  v8 = *MEMORY[0x1E0CB3438];
  v9 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v10 = -[NSTextAttachmentViewProvider view](self, "view", attributes, location, textContainer, proposedLineFragment.origin.x, proposedLineFragment.origin.y, proposedLineFragment.size.width, proposedLineFragment.size.height, position.x, position.y);
  if (v10)
  {
    -[UIView intrinsicContentSize](v10, "intrinsicContentSize");
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *(double *)(v7 + 16);
    v14 = *(double *)(v7 + 24);
  }
  v15 = v8;
  v16 = v9;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)previewImageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  return 0;
}

- (NSTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 characterIndex:(unint64_t)a5 layoutManager:(id)a6
{
  NSCountableTextLocation *v11;
  NSTextAttachmentViewProvider *v12;
  NSTextAttachmentViewProvider *v13;

  v11 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", a5);
  v12 = -[NSTextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](self, "initWithTextAttachment:parentView:textLayoutManager:location:", a3, a4, 0, v11);
  v13 = v12;
  if (v12)
  {
    -[NSTextAttachmentViewProvider setLayoutManager:](v12, "setLayoutManager:", a6);
    v13->_characterIndex = a5;
  }

  return v13;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  uint64_t v6;
  double v7;
  double v8;
  UIView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v6 = MEMORY[0x1E0CB3438];
  v7 = *MEMORY[0x1E0CB3438];
  v8 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v9 = -[NSTextAttachmentViewProvider view](self, "view", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  if (v9)
  {
    -[UIView intrinsicContentSize](v9, "intrinsicContentSize");
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = *(double *)(v6 + 16);
    v13 = *(double *)(v6 + 24);
  }
  v14 = v7;
  v15 = v8;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)location
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)characterIndex
{
  return self->_characterIndex;
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_loadWeak((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_layoutManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_textLayoutManager);
  objc_destroyWeak((id *)&self->_textAttachment);
}

@end
