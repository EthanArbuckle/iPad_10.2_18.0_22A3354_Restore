@implementation SSItemArtworkImage

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemArtworkImage;
  -[SSItemArtworkImage dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[NSMutableDictionary mutableCopyWithZone:](self->_dictionary, "mutableCopyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_imageKind, "copyWithZone:", a3);
  return v5;
}

- (int64_t)height
{
  void *v3;
  int64_t v4;
  double v5;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("box-height"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (int)objc_msgSend(v3, "intValue");
  else
    v4 = 0;
  -[SSItemArtworkImage imageScale](self, "imageScale");
  if (v5 > 0.00000011920929)
    return (uint64_t)((double)v4 / v5);
  return v4;
}

- (int64_t)imageOrientation
{
  void *v3;
  int64_t v5;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("image-orientation"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isEqualToString:", CFSTR("landscape")) & 1) != 0)
    return 1;
  v5 = -[SSItemArtworkImage width](self, "width");
  return v5 > -[SSItemArtworkImage height](self, "height");
}

- (double)imageScale
{
  void *v2;
  char v3;
  double result;
  float v5;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("scale"));
  v3 = objc_opt_respondsToSelector();
  result = 1.0;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v2, "floatValue", 1.0);
    return v5;
  }
  return result;
}

- (BOOL)isPrerendered
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("needs-shine"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    return 0;
}

- (int64_t)width
{
  void *v3;
  int64_t v4;
  double v5;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("box-width"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (int)objc_msgSend(v3, "intValue");
  else
    v4 = 0;
  -[SSItemArtworkImage imageScale](self, "imageScale");
  if (v5 > 0.00000011920929)
    return (uint64_t)((double)v4 / v5);
  return v4;
}

- (NSURL)URL
{
  uint64_t v2;

  v2 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  NSString *v5;
  const __CFString *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SSItemArtworkImage;
  v4 = -[SSItemArtworkImage description](&v8, sel_description);
  v5 = -[SSItemArtworkImage imageKind](self, "imageKind");
  if (-[SSItemArtworkImage isPrerendered](self, "isPrerendered"))
    v6 = CFSTR(" (prerendered)");
  else
    v6 = &stru_1E47D72B0;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@:%@ %ldx%ld] %@"), v4, v5, v6, -[SSItemArtworkImage width](self, "width"), -[SSItemArtworkImage height](self, "height"), -[SSItemArtworkImage URL](self, "URL"));
}

- (unint64_t)hash
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url")), "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url")), "isEqualToString:", objc_msgSend(a3, "valueForProperty:", CFSTR("url")));
  else
    return 0;
}

- (SSItemArtworkImage)initWithArtworkDictionary:(id)a3
{
  SSItemArtworkImage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSItemArtworkImage;
  v4 = -[SSItemArtworkImage init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  return v4;
}

- (CGSize)imageSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)-[SSItemArtworkImage width](self, "width");
  v4 = (double)-[SSItemArtworkImage height](self, "height");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setImageKindWithTypeName:(id)a3 variantName:(id)a4
{
  id v4;
  double v7;

  v4 = a4;
  if (objc_msgSend(a4, "hasSuffix:", CFSTR("@2x")))
  {
    LODWORD(v7) = 2.0;
    -[SSItemArtworkImage _setValue:forKey:](self, "_setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("scale"));
    v4 = (id)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 3);
  }
  -[SSItemArtworkImage setImageKind:](self, "setImageKind:", objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(".%@"), v4));
}

- (void)setURL:(id)a3
{
  -[SSItemArtworkImage _setValue:forKey:](self, "_setValue:forKey:", objc_msgSend(a3, "absoluteString"), CFSTR("url"));
}

- (NSString)URLString
{
  return (NSString *)-[SSItemArtworkImage valueForProperty:](self, "valueForProperty:", CFSTR("url"));
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (a3)
  {
    if (!dictionary)
    {
      dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_dictionary = dictionary;
    }
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", a4);
  }
}

- (SSItemArtworkImage)initWithXPCEncoding:(id)a3
{
  SSItemArtworkImage *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSItemArtworkImage;
    v5 = -[SSItemArtworkImage init](&v7, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_dictionary = (NSMutableDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v5->_imageKind = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_dictionary);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_imageKind);
  return v3;
}

- (NSString)imageKind
{
  return self->_imageKind;
}

- (void)setImageKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
