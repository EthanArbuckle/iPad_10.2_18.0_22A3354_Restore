@implementation PUImageTextAttachment

- (PUImageTextAttachment)initWithImageView:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  PUImageTextAttachment *v9;
  PUImageTextAttachment *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUImageTextAttachment;
  v9 = -[PUImageTextAttachment initWithData:ofType:](&v12, sel_initWithData_ofType_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageView, a3);
    v10->_size.width = width;
    v10->_size.height = height;
  }

  return v10;
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  return 0;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  _PUImageTextAttachmentViewProvider *viewProvider;
  id v9;
  id v10;
  id v11;
  _PUImageTextAttachmentViewProvider *v12;
  void *v13;
  _PUImageTextAttachmentViewProvider *v14;
  _PUImageTextAttachmentViewProvider *v15;

  viewProvider = self->_viewProvider;
  if (!viewProvider)
  {
    v9 = a5;
    v10 = a4;
    v11 = a3;
    v12 = [_PUImageTextAttachmentViewProvider alloc];
    objc_msgSend(v9, "textLayoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[NSTextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](v12, "initWithTextAttachment:parentView:textLayoutManager:location:", self, v11, v13, v10);
    v15 = self->_viewProvider;
    self->_viewProvider = v14;

    viewProvider = self->_viewProvider;
  }
  return viewProvider;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)PUImageTextAttachment;
  -[PUImageTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v16, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  v9 = v8;
  -[PUImageTextAttachment size](self, "size");
  v11 = v10;
  v13 = v12;
  v14 = round(v12 / -5.0);
  v15 = v9;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

@end
