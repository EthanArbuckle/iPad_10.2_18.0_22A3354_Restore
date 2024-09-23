@implementation _UISlotId

+ (id)snapshotContext
{
  if (qword_1ECD7F940 != -1)
    dispatch_once(&qword_1ECD7F940, &__block_literal_global_454);
  return (id)qword_1ECD7F938;
}

- (_UISlotId)initWithSize:(CGSize)a3
{
  double height;
  double width;
  _UISlotId *v5;
  void *v6;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_UISlotId;
  v5 = -[_UISlotId init](&v8, sel_init);
  if (v5)
  {
    +[_UISlotId snapshotContext](_UISlotId, "snapshotContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_value = objc_msgSend(v6, "createImageSlot:hasAlpha:", 1, width, height);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_value)
  {
    +[_UISlotId snapshotContext](_UISlotId, "snapshotContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteSlot:", self->_value);

  }
  v4.receiver = self;
  v4.super_class = (Class)_UISlotId;
  -[_UISlotId dealloc](&v4, sel_dealloc);
}

- (id)object
{
  void *v2;

  if (self->_value)
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (unsigned)value
{
  return self->_value;
}

@end
