@implementation TUIProgressBox

- (TUIProgressBox)init
{
  TUIProgressBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIProgressBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    result->super._storage._data = TUIProgressBoxStorageDataset | 1;
  return result;
}

- (void)setProgressId:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x2Cu, (objc_object *)a3);
}

- (NSString)progressId
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x2Cu);
}

- (void)setProgressMode:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x21u, (objc_object *)a3);
}

- (NSString)progressMode
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x21u);
}

- (void)setPaused:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->super._flags + 6);
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v4;
  *(_DWORD *)&self->super._flags = self->super._flags;
  *((_BYTE *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = WORD2(v5);
}

- (BOOL)paused
{
  return *((_WORD *)&self->super._flags + 2) & 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIProgressBoxLayout, a2);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProgress, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
}

@end
