@implementation PXDebugHierarchyMutableElement

- (PXDebugHierarchyMutableElement)init
{
  PXDebugHierarchyMutableElement *v2;
  PXDebugHierarchyMutableElement *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXDebugHierarchyMutableElement;
  v2 = -[PXDebugHierarchyMutableElement init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXDebugHierarchyMutableElement prepareForReuse](v2, "prepareForReuse");
  return v3;
}

- (void)prepareForReuse
{
  -[PXDebugHierarchyMutableElement setFrame:](self, "setFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  -[PXDebugHierarchyMutableElement setZPosition:](self, "setZPosition:", 0.0);
  -[PXDebugHierarchyMutableElement setAlpha:](self, "setAlpha:", 1.0);
  -[PXDebugHierarchyMutableElement setPreviewImage:](self, "setPreviewImage:", 0);
  -[PXDebugHierarchyMutableElement setContentsRect:](self, "setContentsRect:", *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
  -[PXDebugHierarchyMutableElement setContentsGravity:](self, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  -[PXDebugHierarchyMutableElement setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[PXDebugHierarchyMutableElement setName:](self, "setName:", 0);
  -[PXDebugHierarchyMutableElement setCanHaveChildren:](self, "setCanHaveChildren:", 0);
  self->_identifier = ++prepareForReuse_uniqueIdentifier;
  -[PXDebugHierarchyMutableElement setParentIdentifier:](self, "setParentIdentifier:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[PXDebugHierarchyMutableElement frame](self, "frame");
  objc_msgSend(v4, "setFrame:");
  -[PXDebugHierarchyMutableElement zPosition](self, "zPosition");
  objc_msgSend(v4, "setZPosition:");
  -[PXDebugHierarchyMutableElement alpha](self, "alpha");
  objc_msgSend(v4, "setAlpha:");
  objc_msgSend(v4, "setPreviewImage:", -[PXDebugHierarchyMutableElement previewImage](self, "previewImage"));
  -[PXDebugHierarchyMutableElement contentsRect](self, "contentsRect");
  objc_msgSend(v4, "setContentsRect:");
  -[PXDebugHierarchyMutableElement contentsGravity](self, "contentsGravity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsGravity:", v5);

  objc_msgSend(v4, "setBackgroundColor:", -[PXDebugHierarchyMutableElement backgroundColor](self, "backgroundColor"));
  -[PXDebugHierarchyMutableElement name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v4, "setCanHaveChildren:", -[PXDebugHierarchyMutableElement canHaveChildren](self, "canHaveChildren"));
  v4[2] = self->_identifier;
  objc_msgSend(v4, "setParentIdentifier:", -[PXDebugHierarchyMutableElement parentIdentifier](self, "parentIdentifier"));
  return v4;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(double)a3
{
  self->_zPosition = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (CGImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(CGImage *)a3
{
  self->_previewImage = a3;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (NSString)contentsGravity
{
  return self->_contentsGravity;
}

- (void)setContentsGravity:(id)a3
{
  objc_storeStrong((id *)&self->_contentsGravity, a3);
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  self->_backgroundColor = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)canHaveChildren
{
  return self->_canHaveChildren;
}

- (void)setCanHaveChildren:(BOOL)a3
{
  self->_canHaveChildren = a3;
}

- (unint64_t)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(unint64_t)a3
{
  self->_parentIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_contentsGravity, 0);
}

@end
