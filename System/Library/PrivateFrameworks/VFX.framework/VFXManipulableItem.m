@implementation VFXManipulableItem

- (void)setScreenSize:(float)a3
{
  self->_screenSize = a3;
}

- (float)screenSize
{
  return self->_screenSize;
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  objc_super v6;

  objc_msgSend_setNode_(self, a2, 0, v2);
  objc_msgSend_setComponent_(self, v4, 0, v5);
  v6.receiver = self;
  v6.super_class = (Class)VFXManipulableItem;
  -[VFXManipulableItem dealloc](&v6, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend_node(self, v5, v6, v7);
    if (v8 == objc_msgSend_node(a3, v9, v10, v11)
      && (v15 = objc_msgSend_elementIndex(self, v12, v13, v14), v15 == objc_msgSend_elementIndex(a3, v16, v17, v18)))
    {
      v22 = objc_msgSend_component(a3, v19, v20, v21);
      return v22 == objc_msgSend_component(a3, v23, v24, v25);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)VFXManipulableItem;
    return -[VFXManipulableItem isEqual:](&v27, sel_isEqual_, a3);
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_node(self, a2, v2, v3);
  return objc_msgSend_hash(v4, v5, v6, v7);
}

- (double)transform
{
  return *(double *)&VFXMatrix4Identity;
}

- (double)draggedTransform
{
  return *(double *)&VFXMatrix4Identity;
}

- (void)setTransform:(uint64_t)a3
{
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: set transform not implemented on %@"), a3, a4, a5, a6, a7, a8, a1);
}

- (void)setWorldTransform:(uint64_t)a3
{
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: set world transform not implemented on %@"), a3, a4, a5, a6, a7, a8, a1);
}

- (double)worldTransform
{
  return *(double *)&VFXMatrix4Identity;
}

- (double)scale
{
  return 0.00781250185;
}

- (id)parentItem
{
  return 0;
}

- (double)elementPosition
{
  return 0.0;
}

- (id)cloneForManipulators
{
  return 0;
}

- (VFXNode)node
{
  return self->node;
}

- (void)setNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)component
{
  return self->component;
}

- (void)setComponent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)elementIndex
{
  return self->elementIndex;
}

- (void)setElementIndex:(unint64_t)a3
{
  self->elementIndex = a3;
}

- (__n128)setDraggedTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

@end
