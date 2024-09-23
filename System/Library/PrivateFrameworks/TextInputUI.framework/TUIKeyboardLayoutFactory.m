@implementation TUIKeyboardLayoutFactory

+ (id)sharedKeyboardFactory
{
  if (sharedKeyboardFactory_onceToken != -1)
    dispatch_once(&sharedKeyboardFactory_onceToken, &__block_literal_global_2047);
  return (id)sharedKeyboardFactory_instance;
}

- (TUIKeyboardLayoutFactory)init
{
  TUIKeyboardLayoutFactory *v2;
  TUIKeyboardLayoutFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardLayoutFactory;
  v2 = -[TUIKeyboardLayoutFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TUIKeyboardLayoutFactory _createDecoderIfNecessary](v2, "_createDecoderIfNecessary");
  return v3;
}

- (id)keyboardWithName:(id)a3 inCache:(id)a4
{
  NSMutableDictionary *overlayDecoders;
  TUIKBGraphSerialization *v8;
  id result;

  overlayDecoders = self->_overlayDecoders;
  if (overlayDecoders)
  {
    v8 = (TUIKBGraphSerialization *)-[NSMutableDictionary objectForKeyedSubscript:](overlayDecoders, "objectForKeyedSubscript:", a3);
    if (v8)
      return -[TUIKBGraphSerialization keyboardForName:](v8, "keyboardForName:", a3);
  }
  if (!a4)
  {
    if (!-[TUIKeyboardLayoutFactory internalCache](self, "internalCache"))
      -[TUIKeyboardLayoutFactory setInternalCache:](self, "setInternalCache:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 100));
    a4 = -[TUIKeyboardLayoutFactory internalCache](self, "internalCache");
  }
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("Dynamic")))
    -[TUIKeyboardLayoutFactory _createDecoderFromFilename:](self, "_createDecoderFromFilename:", CFSTR("KBLayouts_Dynamic.dat"));
  else
    -[TUIKeyboardLayoutFactory _createDecoderIfNecessary](self, "_createDecoderIfNecessary");
  result = -[TUIKeyboardLayoutFactory decoder](self, "decoder");
  if (result)
  {
    -[TUIKBGraphSerialization setDeserializationCache:](-[TUIKeyboardLayoutFactory decoder](self, "decoder"), "setDeserializationCache:", a4);
    v8 = -[TUIKeyboardLayoutFactory decoder](self, "decoder");
    return -[TUIKBGraphSerialization keyboardForName:](v8, "keyboardForName:", a3);
  }
  return result;
}

- (TUIKBGraphSerialization)decoder
{
  return (TUIKBGraphSerialization *)objc_getProperty(self, a2, 24, 1);
}

- (void)_createDecoderIfNecessary
{
  TUIKBGraphSerialization *decoder;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  decoder = self->_decoder;
  if (!decoder
    || -[TUIKBGraphSerialization currentFileType](decoder, "currentFileType") == 3
    || -[TUIKBGraphSerialization currentFileType](self->_decoder, "currentFileType") == -1)
  {
    v4 = objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/TextInputUI.framework"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "layoutsFileNameForDeviceClass"));
    -[TUIKeyboardLayoutFactory setDecoder:](self, "setDecoder:", objc_alloc_init(TUIKBGraphSerialization));
    v6 = 0;
    v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 8, &v6);
    if (!v5 || v6)
      -[TUIKeyboardLayoutFactory setDecoder:](self, "setDecoder:", 0);
    else
      -[TUIKBGraphSerialization setSerializedData:](-[TUIKeyboardLayoutFactory decoder](self, "decoder"), "setSerializedData:", v5);
  }
}

- (void)setDecoder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

+ (id)layoutsFileNameForDeviceClass
{
  uint64_t v2;
  const void *v3;
  __CFString *v4;
  const __CFString *v5;

  v2 = MGCopyAnswer();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KBLayouts_%@.dat"), v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("KBLayouts_iPod.dat")))
    v4 = CFSTR("KBLayouts_iPhone.dat");
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("KBLayouts_Watch.dat")))
    v5 = CFSTR("KBLayouts_iPhone.dat");
  else
    v5 = v4;
  if (v5)
    return (id)v5;
  else
    return CFSTR("KBLayouts_iPad.dat");
}

TUIKeyboardLayoutFactory *__49__TUIKeyboardLayoutFactory_sharedKeyboardFactory__block_invoke()
{
  TUIKeyboardLayoutFactory *result;

  result = objc_alloc_init(TUIKeyboardLayoutFactory);
  sharedKeyboardFactory_instance = (uint64_t)result;
  return result;
}

+ (id)crescendoLayouts
{
  int v2;
  id result;

  if (TIGetEnableMoltoCrescendoValue_onceToken != -1)
    dispatch_once(&TIGetEnableMoltoCrescendoValue_onceToken, &__block_literal_global_224);
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController"), "valueForPreferenceKey:", CFSTR("EnableMoltoCrescendo")), "BOOLValue");
  result = (id)crescendoLayouts___layouts;
  if (!crescendoLayouts___layouts)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Dvorak"), CFSTR("QWERTY-Chickasaw"), CFSTR("QWERTY-Choctaw"), CFSTR("QWERTY-Mikmaw"), CFSTR("QWERTY-Mvskoke"), CFSTR("QWERTY-Lushootseed"), CFSTR("QWERTY-Shawnee"), CFSTR("Shawnee"), CFSTR("Sami-Inari"), CFSTR("Sami-Julev"), CFSTR("Sami-Julev-Norway"), CFSTR("Sami-Kildin"), CFSTR("Sami-Northern"), CFSTR("Sami-Pite"), CFSTR("Sami-Skolt"), CFSTR("Sami-Southern"), CFSTR("Sami-Ume"),
                   CFSTR("Osage-QWERTY"),
                   CFSTR("Coptic"),
                   CFSTR("Mandaic"),
                   CFSTR("Mandaic-QWERTY"),
                   CFSTR("Mandaic-Alphabetic"),
                   CFSTR("Tamazight-Tifinagh"),
                   CFSTR("Tamazight-Tifinagh-Alphabetic"),
                   CFSTR("QWERTY-Kabyle"),
                   CFSTR("AZERTY-Kabyle"),
                   CFSTR("Ingush"),
                   CFSTR("NKo"),
                   CFSTR("Wancho"),
                   CFSTR("Wancho-QWERTY"),
                   CFSTR("Rejang"),
                   CFSTR("Pahawh-Hmong"),
                   CFSTR("Yi"),
                   CFSTR("Inuktitut"),
                   CFSTR("QWERTY-Wolastoqey"),
                   CFSTR("Chuvash"),
                   CFSTR("QWERTY-Akan"),
                   CFSTR("QWERTY-Hausa"),
                   CFSTR("QWERTY-Yoruba"),
                   CFSTR("Bengali-Alphabetic"),
                   CFSTR("Gujarati-Alphabetic"),
                   CFSTR("Hindi-Alphabetic"),
                   CFSTR("Kannada-Alphabetic"),
                   CFSTR("Malayalam-Alphabetic"),
                   CFSTR("Marathi-Alphabetic"),
                   CFSTR("Oriya-Alphabetic"),
                   CFSTR("Punjabi-Alphabetic"),
                   CFSTR("Tamil-Alphabetic"),
                   CFSTR("Telugu-Alphabetic"),
                   CFSTR("Urdu-Alphabetic"),
                   CFSTR("Zhuyin-Grid"),
                   0);
    crescendoLayouts___layouts = (uint64_t)result;
    if (v2)
    {
      result = (id)objc_msgSend(result, "setByAddingObjectsFromArray:", &unk_1E2517780);
      crescendoLayouts___layouts = (uint64_t)result;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIKeyboardLayoutFactory;
  -[TUIKeyboardLayoutFactory dealloc](&v3, sel_dealloc);
}

- (void)_createDecoderFromFilename:(id)a3
{
  TUIKBGraphSerialization *decoder;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  decoder = self->_decoder;
  if (!decoder || -[TUIKBGraphSerialization currentFileType](decoder, "currentFileType") != 3)
  {
    v6 = objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/TextInputUI.framework"), "stringByAppendingPathComponent:", a3);
    -[TUIKeyboardLayoutFactory setDecoder:](self, "setDecoder:", objc_alloc_init(TUIKBGraphSerialization));
    v10 = 0;
    v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 8, &v10);
    if (v7)
      v8 = v10 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v9 = v7;
      -[TUIKBGraphSerialization setCurrentFileType:](-[TUIKeyboardLayoutFactory decoder](self, "decoder"), "setCurrentFileType:", 3);
      -[TUIKBGraphSerialization setSerializedData:](-[TUIKeyboardLayoutFactory decoder](self, "decoder"), "setSerializedData:", v9);
    }
    else
    {
      -[TUIKeyboardLayoutFactory _createDecoderIfNecessary](self, "_createDecoderIfNecessary");
    }
  }
}

- (id)keyboardPrefixForWidth:(double)a3 andEdge:(BOOL)a4
{
  _BOOL8 v4;
  id result;
  TUIKBGraphSerialization *v8;
  double v9;

  v4 = a4;
  -[TUIKeyboardLayoutFactory _createDecoderIfNecessary](self, "_createDecoderIfNecessary");
  result = -[TUIKeyboardLayoutFactory decoder](self, "decoder");
  if (result)
  {
    v8 = -[TUIKeyboardLayoutFactory decoder](self, "decoder");
    *(float *)&v9 = a3;
    return -[TUIKBGraphSerialization keyboardPrefixForWidth:andEdge:](v8, "keyboardPrefixForWidth:andEdge:", v4, v9);
  }
  return result;
}

- (id)keyboardSuffixForScreenDimensions:(CGSize)a3
{
  float width;
  TUIKBGraphSerialization *v4;
  double v5;

  if (a3.height < a3.width)
    a3.width = a3.height;
  width = a3.width;
  v4 = -[TUIKeyboardLayoutFactory decoder](self, "decoder");
  *(float *)&v5 = width;
  return -[TUIKBGraphSerialization keyboardSuffixForPortraitWidth:](v4, "keyboardSuffixForPortraitWidth:", v5);
}

- (void)setData:(id)a3 forKeyboard:(id)a4
{
  TUIKBGraphSerialization *v7;

  if (-[TUIKeyboardLayoutFactory overlayDecoders](self, "overlayDecoders"))
  {
    if (!a4)
      return;
  }
  else
  {
    -[TUIKeyboardLayoutFactory setOverlayDecoders:](self, "setOverlayDecoders:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    if (!a4)
      return;
  }
  if (a3)
  {
    v7 = objc_alloc_init(TUIKBGraphSerialization);
    -[TUIKBGraphSerialization setSerializedData:](v7, "setSerializedData:", a3);
    -[TUIKBGraphSerialization setDeserializationCache:](v7, "setDeserializationCache:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[TUIKeyboardLayoutFactory overlayDecoders](self, "overlayDecoders"), "setObject:forKeyedSubscript:", v7, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](-[TUIKeyboardLayoutFactory overlayDecoders](self, "overlayDecoders"), "removeObjectForKey:", a4);
  }
}

- (void)layoutsLibraryHandle
{
  return self->_layoutsLibraryHandle;
}

- (NSMutableDictionary)internalCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternalCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)overlayDecoders
{
  return self->_overlayDecoders;
}

- (void)setOverlayDecoders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
