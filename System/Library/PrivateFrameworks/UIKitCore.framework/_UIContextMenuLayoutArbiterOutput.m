@implementation _UIContextMenuLayoutArbiterOutput

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- ($0B15E5176FD367B837238C983E599B83)preview
{
  __int128 v3;
  __int128 v4;
  CGSize v5;
  CGSize size;

  v3 = *(_OWORD *)&self[1].var1.z;
  *(_OWORD *)&retstr->var2.y = *(_OWORD *)&self[1].var1.x;
  *(_OWORD *)&retstr->var3.b = v3;
  v4 = *(_OWORD *)&self[1].var3.b;
  *(_OWORD *)&retstr->var3.d = *(_OWORD *)&self[1].var2.y;
  *(_OWORD *)&retstr->var3.ty = v4;
  v5 = *(CGSize *)&self->var3.ty;
  retstr->var0.origin = *(CGPoint *)&self->var3.d;
  retstr->var0.size = v5;
  size = self[1].var0.size;
  *(CGPoint *)&retstr->var1.x = self[1].var0.origin;
  *(CGSize *)&retstr->var1.z = size;
  return self;
}

- (void)setPreview:(id *)a3
{
  CGPoint origin;
  CGSize size;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  origin = a3->var0.origin;
  size = a3->var0.size;
  v5 = *(_OWORD *)&a3->var1.z;
  *(_OWORD *)&self->_preview.center.x = *(_OWORD *)&a3->var1.x;
  *(_OWORD *)&self->_preview.center.z = v5;
  self->_preview.bounds.origin = origin;
  self->_preview.bounds.size = size;
  v6 = *(_OWORD *)&a3->var2.y;
  v7 = *(_OWORD *)&a3->var3.b;
  v8 = *(_OWORD *)&a3->var3.ty;
  *(_OWORD *)&self->_preview.transform.d = *(_OWORD *)&a3->var3.d;
  *(_OWORD *)&self->_preview.transform.ty = v8;
  *(_OWORD *)&self->_preview.anchorPoint.y = v6;
  *(_OWORD *)&self->_preview.transform.b = v7;
}

- ($0B15E5176FD367B837238C983E599B83)menu
{
  __int128 v3;
  __int128 v4;
  CGSize v5;
  CGSize size;

  v3 = *(_OWORD *)&self[2].var1.z;
  *(_OWORD *)&retstr->var2.y = *(_OWORD *)&self[2].var1.x;
  *(_OWORD *)&retstr->var3.b = v3;
  v4 = *(_OWORD *)&self[2].var3.b;
  *(_OWORD *)&retstr->var3.d = *(_OWORD *)&self[2].var2.y;
  *(_OWORD *)&retstr->var3.ty = v4;
  v5 = *(CGSize *)&self[1].var3.ty;
  retstr->var0.origin = *(CGPoint *)&self[1].var3.d;
  retstr->var0.size = v5;
  size = self[2].var0.size;
  *(CGPoint *)&retstr->var1.x = self[2].var0.origin;
  *(CGSize *)&retstr->var1.z = size;
  return self;
}

- (void)setMenu:(id *)a3
{
  CGPoint origin;
  CGSize size;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  origin = a3->var0.origin;
  size = a3->var0.size;
  v5 = *(_OWORD *)&a3->var1.z;
  *(_OWORD *)&self->_menu.center.x = *(_OWORD *)&a3->var1.x;
  *(_OWORD *)&self->_menu.center.z = v5;
  self->_menu.bounds.origin = origin;
  self->_menu.bounds.size = size;
  v6 = *(_OWORD *)&a3->var2.y;
  v7 = *(_OWORD *)&a3->var3.b;
  v8 = *(_OWORD *)&a3->var3.ty;
  *(_OWORD *)&self->_menu.transform.d = *(_OWORD *)&a3->var3.d;
  *(_OWORD *)&self->_menu.transform.ty = v8;
  *(_OWORD *)&self->_menu.anchorPoint.y = v6;
  *(_OWORD *)&self->_menu.transform.b = v7;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)anchor
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[2].var1;
  return self;
}

- (void)setAnchor:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  self->_anchor.gravity = a3->var4;
  *(_OWORD *)&self->_anchor.attachmentOffset = v4;
  *(_OWORD *)&self->_anchor.attachment = v3;
}

- (NSMapTable)accessoryPositions
{
  return self->_accessoryPositions;
}

- (void)setAccessoryPositions:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryPositions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryPositions, 0);
}

@end
