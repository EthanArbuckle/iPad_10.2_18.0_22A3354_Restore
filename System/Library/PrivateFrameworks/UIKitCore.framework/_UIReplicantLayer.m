@implementation _UIReplicantLayer

- (void)setContents:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = setContents____s_category;
  if (!setContents____s_category)
  {
    v3 = __UILogCategoryGetNode("Snapshotting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&setContents____s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Snapshot layer doesn't allow its contents to be set.", v5, 2u);
  }
}

- (void)_setSlotId:(id)a3
{
  _UISlotId *v4;
  void *v5;
  _UISlotId *slotId;
  objc_super v7;

  v4 = (_UISlotId *)a3;
  -[_UISlotId object](v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_UIReplicantLayer;
  -[_UIReplicantLayer setContents:](&v7, sel_setContents_, v5);

  slotId = self->__slotId;
  self->__slotId = v4;

}

- (_UISlotId)_slotId
{
  return self->__slotId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slotId, 0);
}

@end
