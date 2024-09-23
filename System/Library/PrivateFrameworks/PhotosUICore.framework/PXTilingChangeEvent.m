@implementation PXTilingChangeEvent

- (PXTilingChangeEvent)init
{
  PXTilingChangeEvent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTilingChangeEvent;
  result = -[PXTilingChangeEvent init](&v3, sel_init);
  if (result)
    result->_type = 0;
  return result;
}

- (PXTilingChangeEvent)initWithChangeToLayout:(id)a3
{
  id v5;
  PXTilingChangeEvent *v6;
  PXTilingChangeEvent *v7;

  v5 = a3;
  v6 = -[PXTilingChangeEvent init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_layout, a3);
  }

  return v7;
}

- (PXTilingChangeEvent)initWithChangeToReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  PXTilingChangeEvent *result;

  height = a3.height;
  width = a3.width;
  result = -[PXTilingChangeEvent init](self, "init");
  if (result)
  {
    result->_type = 2;
    result->_referenceSize.width = width;
    result->_referenceSize.height = height;
  }
  return result;
}

- (PXTilingChangeEvent)initWithChangeToContentInset:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  PXTilingChangeEvent *result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  result = -[PXTilingChangeEvent init](self, "init");
  if (result)
  {
    result->_type = 3;
    result->_contentInset.top = top;
    result->_contentInset.left = left;
    result->_contentInset.bottom = bottom;
    result->_contentInset.right = right;
  }
  return result;
}

- (PXTilingChangeEvent)initWithCoordinateSpaceChange
{
  PXTilingChangeEvent *result;

  result = -[PXTilingChangeEvent init](self, "init");
  if (result)
    result->_type = 4;
  return result;
}

- (PXTilingChangeEvent)initWithLayoutInvalidationContext:(id)a3
{
  id v5;
  PXTilingChangeEvent *v6;
  PXTilingChangeEvent *v7;

  v5 = a3;
  v6 = -[PXTilingChangeEvent init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 5;
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  switch(self->_type)
  {
    case 0:
      v5 = CFSTR(", type=?");
      goto LABEL_8;
    case 1:
      objc_msgSend(v3, "appendFormat:", CFSTR(", type=layoutChange, layout=%@"), self->_layout);
      break;
    case 2:
      NSStringFromCGSize(self->_referenceSize);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(", type=referenceSizeChange, referenceSize=%@"), v6);
      goto LABEL_6;
    case 3:
      NSStringFromUIEdgeInsets(self->_contentInset);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(", type=contentInsetChange, contentInset=%@"), v6);
LABEL_6:

      break;
    case 4:
      v5 = CFSTR(", type=coordinateSpaceChange");
LABEL_8:
      objc_msgSend(v3, "appendString:", v5);
      break;
    case 5:
      objc_msgSend(v3, "appendFormat:", CFSTR(", type=layoutInvalidation, context=%@"), self->_context);
      break;
    default:
      break;
  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (PXTilingLayout)layout
{
  return self->_layout;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXTilingLayoutInvalidationContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
