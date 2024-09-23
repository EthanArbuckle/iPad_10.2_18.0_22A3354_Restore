@implementation _UIFlowLayoutItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rowObject);
  objc_destroyWeak((id *)&self->_section);
}

- (id)copy
{
  id result;
  CGSize size;
  int v5;
  unsigned int v6;

  result = objc_alloc_init(_UIFlowLayoutItem);
  size = self->_itemFrame.size;
  *((_OWORD *)result + 2) = self->_itemFrame.origin;
  *((CGSize *)result + 3) = size;
  v5 = *((_BYTE *)result + 8) & 0xFE | *(_BYTE *)&self->_itemFlags & 1;
  *((_BYTE *)result + 8) = v5;
  v6 = v5 & 0xFFFFFFFD | (2 * ((*(_BYTE *)&self->_itemFlags >> 1) & 1));
  *((_BYTE *)result + 8) = v6;
  *((_BYTE *)result + 8) = v6 & 0xFB | *(_BYTE *)&self->_itemFlags & 4;
  return result;
}

@end
