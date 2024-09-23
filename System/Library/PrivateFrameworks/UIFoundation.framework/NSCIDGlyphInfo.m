@implementation NSCIDGlyphInfo

+ (id)glyphInfoWithCharacterIdentifier:(unint64_t)a3 collection:(unint64_t)a4 baseString:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCharacterIdentifier:collection:baseString:", a3, a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (NSCIDGlyphInfo)initWithCharacterIdentifier:(unint64_t)a3 collection:(unint64_t)a4 baseString:(id)a5
{
  unsigned __int16 v6;
  NSCIDGlyphInfo *result;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NSCIDGlyphInfo;
  result = -[NSGlyphInfo initWithBaseString:](&v8, sel_initWithBaseString_, a5);
  result->_cid = v6;
  result->_collection = a4;
  return result;
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  CGFontRef v6;
  unint64_t cid;
  CGFontRef v8;
  unint64_t v9;
  const __CFString *v10;

  LODWORD(v6) = objc_msgSend(a4, "isEqualToString:", self->super._baseString);
  if ((_DWORD)v6)
  {
    if (self->_collection || (cid = self->_cid, objc_msgSend(a3, "numberOfGlyphs") <= cid))
    {
      v6 = CTFontCopyGraphicsFont((CTFontRef)a3, 0);
      if (v6)
      {
        v8 = v6;
        if (self->_collection == 255
          || CGFontGetRegistryOrderingSupplement()
          && CFEqual(0, CFSTR("Adobe"))
          && ((v9 = self->_collection - 1, v9 <= 4) ? (v10 = __NSOrderingTable[v9]) : (v10 = &stru_1E260C7D0),
              CFEqual(0, v10)))
        {
          CGFontGetGlyphsForCIDs();
        }
        CFRelease(v8);
        LODWORD(v6) = 0;
      }
    }
    else
    {
      LODWORD(v6) = self->_cid;
    }
  }
  return v6;
}

- (unint64_t)characterIdentifier
{
  return self->_cid;
}

- (unint64_t)characterCollection
{
  return self->_collection;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  objc_super v5;
  int v6;

  v4 = self->_cid | (LODWORD(self->_collection) << 24);
  v6 = self->_cid | (LODWORD(self->_collection) << 24);
  v5.receiver = self;
  v5.super_class = (Class)NSCIDGlyphInfo;
  -[NSGlyphInfo encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    if ((_DWORD)v4)
      objc_msgSend(a3, "encodeInt32:forKey:", v4, CFSTR("NSCID_RO"));
  }
  else
  {
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v6);
  }
}

- (NSCIDGlyphInfo)initWithCoder:(id)a3
{
  NSCIDGlyphInfo *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  NSCIDGlyphInfo *v11;
  unsigned int v12;
  objc_super v13;
  objc_super v14;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v14.receiver = self;
    v14.super_class = (Class)NSCIDGlyphInfo;
    return -[NSGlyphInfo initWithCoder:](&v14, sel_initWithCoder_, a3);
  }
  v6 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSCIDGlyphInfo"));
  v7 = objc_opt_class();
  if (v7 != objc_opt_class() || v6 != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)NSCIDGlyphInfo;
    v5 = -[NSGlyphInfo initWithCoder:](&v13, sel_initWithCoder_, a3);
    v12 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v12, 4);
    v9 = v12;
    if (v12)
    {
      v5->_cid = v12;
      v5->_collection = v9 >> 24;
    }
    return v5;
  }
  v11 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:](NSFont, "userFontOfSize:", 0.0), &stru_1E260C7D0);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unint64_t collection;
  unint64_t v4;
  const __CFString *v5;
  void *v7;
  uint64_t cid;
  CFIndex Length;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  collection = self->_collection;
  if (!collection)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GID 0x%04X"), self->_cid, v11, v12, v13);
  v4 = collection - 1;
  if (v4 <= 4)
    v5 = __NSOrderingTable[v4];
  else
    v5 = &stru_1E260C7D0;
  v7 = (void *)MEMORY[0x1E0CB3940];
  cid = self->_cid;
  Length = CFStringGetLength(v5);
  v10 = CFSTR("Unspecified");
  if (Length > 0)
    v10 = CFSTR("Adobe-");
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("CID 0x%04X, collection %@%@, string \"%@\"), cid, v10, v5, self->super._baseString);
}

@end
