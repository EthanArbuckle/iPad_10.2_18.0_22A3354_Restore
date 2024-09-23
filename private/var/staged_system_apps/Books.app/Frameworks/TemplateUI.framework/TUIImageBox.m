@implementation TUIImageBox

- (TUIImageBox)init
{
  TUIImageBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIImageBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    result->super._storage._data = TUIImageBoxStorageDataset | 1;
  return result;
}

- (void)setLoad:(unint64_t)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->super._flags + 6);
  v4 = *((_WORD *)&self->super._flags + 2);
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xFCFFFFFF | ((a3 & 3) << 24);
  *((_BYTE *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (unint64_t)load
{
  return *(_DWORD *)((char *)&self->super._flags + 3) & 3;
}

- (void)setHflipForRTL:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->super._flags + 6);
  v4 = *((_WORD *)&self->super._flags + 2);
  v5 = 0x4000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xFBFFFFFF | v5;
  *((_BYTE *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)hflipForRTL
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 26) & 1;
}

- (void)setCrossfadesContents:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->super._flags + 6);
  v4 = *((_WORD *)&self->super._flags + 2);
  v5 = 0x8000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xF7FFFFFF | v5;
  *((_BYTE *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)crossfadesContents
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 27) & 1;
}

- (void)setContinuousCorners:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->super._flags + 6);
  v4 = *((_WORD *)&self->super._flags + 2);
  v5 = 0x10000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xEFFFFFFF | v5;
  *((_BYTE *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)continuousCorners
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 28) & 1;
}

- (void)setShouldRasterize:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->super._flags + 6);
  v4 = *((_WORD *)&self->super._flags + 2);
  v5 = 0x20000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->super._flags = *(_DWORD *)&self->super._flags & 0xDFFFFFFF | v5;
  *((_BYTE *)&self->super._flags + 6) = v3;
  *((_WORD *)&self->super._flags + 2) = v4;
}

- (BOOL)shouldRasterize
{
  return ((unint64_t)*(_DWORD *)&self->super._flags >> 29) & 1;
}

- (void)setIntrinsicWidth:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  Storage *p_storage;
  uint64_t v7;
  _QWORD *DataForKey;

  v4 = v3;
  p_storage = &self->super._storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 6u);
    if (!v7)
      return;
    DataForKey = (_QWORD *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 6u);
  }
  else
  {
    DataForKey = (_QWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 6u, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = a3;
  DataForKey[1] = v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)intrinsicWidth
{
  uint64_t v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F **v4;

  v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 6u);
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3)
    v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  return *v4;
}

- (void)setIntrinsicHeight:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  Storage *p_storage;
  uint64_t v7;
  _QWORD *DataForKey;

  v4 = v3;
  p_storage = &self->super._storage;
  if ((v3 & 0x7000000000000) == 0x2000000000000)
  {
    v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 5u);
    if (!v7)
      return;
    DataForKey = (_QWORD *)v7;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 5u);
  }
  else
  {
    DataForKey = (_QWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 5u, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = a3;
  DataForKey[1] = v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)intrinsicHeight
{
  uint64_t v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F **v4;

  v3 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 5u);
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v3)
    v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v3;
  return *v4;
}

- (void)setResourceKind:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x19u, (objc_object *)a3);
}

- (NSString)resourceKind
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x19u);
}

- (void)setResourceInstance:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x18u, (objc_object *)a3);
}

- (id)resourceInstance
{
  return TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x18u);
}

- (void)setResourceOptions:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x29u, (objc_object *)a3);
}

- (id)resourceOptions
{
  return TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x29u);
}

- (void)setUrlString:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 4u, (objc_object *)a3);
}

- (NSString)urlString
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 4u);
}

- (void)setBaseURL:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 3u, (objc_object *)a3);
}

- (NSURL)baseURL
{
  return (NSURL *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 3u);
}

- (void)setMaskColor:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0xCu, (objc_object *)a3);
}

- (UIColor)maskColor
{
  return (UIColor *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0xCu);
}

- (void)setFallbackColor:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0xFu, (objc_object *)a3);
}

- (UIColor)fallbackColor
{
  return (UIColor *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0xFu);
}

- (void)setContentsGravity:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 2u, (objc_object *)a3);
}

- (NSString)contentsGravity
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 2u);
}

- (void)setFilter:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x10u, (objc_object *)a3);
}

- (NSString)filter
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x10u);
}

- (void)setBlendMode:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 1u, (objc_object *)a3);
}

- (NSString)blendMode
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 1u);
}

- (void)setCornerRadius:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super._storage;
  v4 = a3;
  if (v4 == 0.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x14u);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x14u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x14u, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)cornerRadius
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x14u);
  if (v2)
    return *v2;
  else
    return 0.0;
}

- (void)setOpacity:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super._storage;
  v4 = a3;
  if (v4 == 1.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x2Du);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x2Du);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super._storage, 0x2Du, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)opacity
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super._storage, 0x2Du);
  if (v2)
    return *v2;
  else
    return 1.0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIImageBoxLayout, a2);
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

@end
