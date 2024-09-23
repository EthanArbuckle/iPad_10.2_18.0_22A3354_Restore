@implementation TUIWPBox

+ (id)textModelBuilderWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 alignment:(int64_t)a6 writingDirection:(int64_t)a7 language:(id)a8 shouldHyphenate:(BOOL)a9 service:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  TUIWPBuilder *v19;
  uint64_t v21;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a10;
  LOBYTE(v21) = a9;
  v19 = -[TUIWPBuilder initWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:]([TUIWPBuilder alloc], "initWithFontSpec:style:color:alignment:writingDirection:language:shouldHyphenate:service:", v15, a4, v16, a6, a7, v17, v21, v18);

  return v19;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIWPLayout, a2);
}

- (TUIWPBox)initWithTextModel:(id)a3
{
  id v5;
  TUIWPBox *v6;
  TUIWPBox *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIWPBox;
  v6 = -[TUIBox init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->super.super._storage._data = TUIWPBoxStorageDataset | 1;
    objc_storeStrong((id *)&v6->_wpStorage, a3);
    -[TUIBox setAXElement:](v7, "setAXElement:", 1);
  }

  return v7;
}

- (TUIWPBox)init
{
  TUIWPBox *v2;
  TUIWPBox *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIWPBox;
  v2 = -[TUIBox init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->super.super._storage._data = TUIWPBoxStorageDataset | 1;
    -[TUIBox setAXElement:](v2, "setAXElement:", 1);
  }
  return v3;
}

- (TUITextModel)textModel
{
  return (TUITextModel *)self->_wpStorage;
}

- (void)setTextModel:(id)a3
{
  objc_storeStrong((id *)&self->_wpStorage, a3);
}

- (NSString)string
{
  void *v2;
  id v3;
  void *v4;

  if (self->_wpStorage)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage string](self->_wpStorage, "string"));
    v3 = objc_msgSend(v2, "copy");
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPBox placeholderString](self, "placeholderString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));
    v3 = objc_msgSend(v4, "copy");

  }
  return (NSString *)v3;
}

- (void)setMaxLines:(unint64_t)a3
{
  Storage *p_storage;
  int v4;
  _DWORD *DataForKey;
  uint64_t v6;

  p_storage = &self->super.super._storage;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0x7FFFFFFF;
  else
    v4 = a3;
  if (!v4)
  {
    v6 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xDu);
    if (!v6)
      return;
    DataForKey = (_DWORD *)v6;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0xDu);
    goto LABEL_9;
  }
  DataForKey = (_DWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0xDu, 4uLL, 1);
  if (DataForKey)
LABEL_9:
    *DataForKey = v4;
}

- (unint64_t)maxLines
{
  unint64_t result;

  result = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xDu);
  if (result)
  {
    if (*(_DWORD *)result == 0x7FFFFFFF)
      return 0x7FFFFFFFFFFFFFFFLL;
    else
      return *(int *)result;
  }
  return result;
}

- (void)setAllowHangingPunctuation:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  v4 = 0x4000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((_BYTE *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)allowHangingPunctuation
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 6) & 1;
}

- (void)setAllowShrinkToFit:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  v4 = 0x8000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFF7FFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((_BYTE *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)allowShrinkToFit
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 7) & 1;
}

- (void)setHideEllipses:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  v4 = 0x10000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFEFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((_BYTE *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)hideEllipses
{
  return *((_BYTE *)&self->super.super._flags + 5) & 1;
}

- (void)setBlendMode:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 1u, (objc_object *)a3);
}

- (NSString)blendMode
{
  return (NSString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 1u);
}

- (void)setPlaceholderString:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0x24u, (objc_object *)a3);
}

- (NSAttributedString)placeholderString
{
  return (NSAttributedString *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x24u);
}

- (BOOL)axStaticText
{
  return 1;
}

- (TUIWPStorage)storage
{
  return self->_wpStorage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_wpStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wpStorage, 0);
}

@end
