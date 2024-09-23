@implementation TSWPTextHostLayout

- (void)dealloc
{
  objc_super v3;

  -[TSDLayout setParent:](self->_editingShapeLayout, "setParent:", 0);

  self->_editingShapeLayout = 0;
  self->_editingShapeInfo = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextHostLayout;
  -[TSDDrawableLayout dealloc](&v3, sel_dealloc);
}

- (void)updateChildrenFromInfo
{
  TSDInfo *editingShapeInfo;
  TSWPShapeLayout *editingShapeLayout;
  TSWPShapeLayout *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  editingShapeInfo = -[TSDLayout info](self->_editingShapeLayout, "info");
  editingShapeLayout = self->_editingShapeLayout;
  if (editingShapeInfo == (TSDInfo *)self->_editingShapeInfo)
  {
    if (editingShapeLayout)
    {
LABEL_7:
      v8[0] = editingShapeLayout;
      v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
      goto LABEL_8;
    }
  }
  else
  {
    -[TSDLayout setParent:](self->_editingShapeLayout, "setParent:", 0);

    self->_editingShapeLayout = 0;
    editingShapeInfo = (TSDInfo *)self->_editingShapeInfo;
  }
  if (editingShapeInfo)
  {
    v6 = (TSWPShapeLayout *)objc_msgSend(objc_alloc((Class)-[TSDInfo layoutClass](editingShapeInfo, "layoutClass")), "initWithInfo:", self->_editingShapeInfo);
    self->_editingShapeLayout = v6;
    -[TSDLayout setParent:](v6, "setParent:", self);
    editingShapeLayout = self->_editingShapeLayout;
    if (editingShapeLayout)
      goto LABEL_7;
  }
  v7 = 0;
LABEL_8:
  -[TSDAbstractLayout setChildren:](self, "setChildren:", v7);
  objc_msgSend(v7, "makeObjectsPerformSelector:", a2);
}

- (void)setEditingShape:(id)a3
{
  TSWPShapeInfo *editingShapeInfo;

  editingShapeInfo = self->_editingShapeInfo;
  if (editingShapeInfo != a3)
  {
    -[TSDDrawableInfo setParentInfo:](editingShapeInfo, "setParentInfo:", 0);

    self->_editingShapeInfo = (TSWPShapeInfo *)a3;
    -[TSDDrawableInfo setParentInfo:](self->_editingShapeInfo, "setParentInfo:", -[TSDLayout info](self, "info"));
    -[TSDLayout invalidateChildren](self, "invalidateChildren");
  }
}

- (TSWPShapeLayout)editingShapeLayout
{
  return self->_editingShapeLayout;
}

- (TSWPShapeInfo)editingShape
{
  return self->_editingShapeInfo;
}

@end
