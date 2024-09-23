@implementation ICTK2TodoTextAttachment

- (ICTK2TodoTextAttachment)initWithTodo:(id)a3
{
  id v5;
  uint64_t v6;
  ICTK2TodoTextAttachment *v7;
  ICTK2TodoTextAttachment *v8;
  objc_super v10;

  v5 = a3;
  v6 = *MEMORY[0x1E0D636C0];
  v10.receiver = self;
  v10.super_class = (Class)ICTK2TodoTextAttachment;
  v7 = -[ICTextAttachment initWithData:ofType:](&v10, sel_initWithData_ofType_, 0, v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_todo, a3);

  return v8;
}

- (id)viewIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICTK2TodoTextAttachment todo](self, "todo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  +[ICTodoButton defaultSize](ICTodoButton, "defaultSize", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat x;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double y;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  y = a7.y;
  height = a6.size.height;
  width = a6.size.width;
  v9 = a6.origin.y;
  x = a6.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)ICTK2TodoTextAttachment;
  -[ICTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v26, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v27.origin.x = x;
  v27.origin.y = v9;
  v27.size.width = width;
  v27.size.height = height;
  v19 = CGRectGetHeight(v27);
  v28.origin.x = v12;
  v28.origin.y = v14;
  v28.size.width = v16;
  v28.size.height = v18;
  v20 = CGRectGetHeight(v28);
  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  v21 = -(v20 - v19 + y - CGRectGetMidY(v29));
  v22 = v12;
  v23 = v16;
  v24 = v18;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

- (ICTTTodo)todo
{
  return self->_todo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todo, 0);
}

@end
