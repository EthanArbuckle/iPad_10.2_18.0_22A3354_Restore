@implementation SSPreorder

- (id)_initWithPersistentIdentifier:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSPreorder;
  result = -[SSPreorder init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 8) = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPreorder;
  -[SSPreorder dealloc](&v3, sel_dealloc);
}

- (id)copyReleaseDateStringWithStyle:(int64_t)a3
{
  CFStringRef StringWithDate;
  const __CFLocale *v6;
  const __CFLocale *v7;
  __CFDateFormatter *v8;
  __CFDateFormatter *v9;

  StringWithDate = -[SSPreorder releaseDateString](self, "releaseDateString");
  if (!StringWithDate)
  {
    v6 = CFLocaleCopyCurrent();
    if (v6)
    {
      v7 = v6;
      v8 = CFDateFormatterCreate(0, v6, (CFDateFormatterStyle)a3, kCFDateFormatterNoStyle);
      if (v8)
      {
        v9 = v8;
        StringWithDate = CFDateFormatterCreateStringWithDate(0, v8, (CFDateRef)-[SSPreorder releaseDate](self, "releaseDate"));
        CFRelease(v9);
      }
      else
      {
        StringWithDate = 0;
      }
      CFRelease(v7);
    }
    else
    {
      return 0;
    }
  }
  return (id)StringWithDate;
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_releaseDate);
}

- (void)_setArtistName:(id)a3
{
  NSString *artistName;

  artistName = self->_artistName;
  if (artistName != a3)
  {

    self->_artistName = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)_setImageCollection:(id)a3
{
  SSItemImageCollection *imageCollection;

  imageCollection = self->_imageCollection;
  if (imageCollection != a3)
  {

    self->_imageCollection = (SSItemImageCollection *)objc_msgSend(a3, "copy");
  }
}

- (void)_setItemKind:(id)a3
{
  NSString *itemKind;

  itemKind = self->_itemKind;
  if (itemKind != a3)
  {

    self->_itemKind = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)_setReleaseDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  self->_releaseDate = v4;
}

- (void)_setReleaseDateString:(id)a3
{
  NSString *releaseDateString;

  releaseDateString = self->_releaseDateString;
  if (releaseDateString != a3)
  {

    self->_releaseDateString = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)_setStoreAccountIdentifier:(id)a3
{
  NSNumber *accountID;

  accountID = self->_accountID;
  if (accountID != a3)
  {

    self->_accountID = (NSNumber *)a3;
  }
}

- (void)_setStoreItemIdentifier:(int64_t)a3
{
  self->_itemID = a3;
}

- (void)_setStorePreorderIdentifier:(int64_t)a3
{
  self->_preorderID = a3;
}

- (void)_setTitle:(id)a3
{
  NSString *title;

  title = self->_title;
  if (title != a3)
  {

    self->_title = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPreorder;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: (%lld, \"%@\")"), -[SSPreorder description](&v3, sel_description), self->_pid, self->_title);
}

- (unint64_t)hash
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int64_t v7;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  v7 = -[SSPreorder persistentIdentifier](self, "persistentIdentifier");
  return v7 == objc_msgSend(a3, "persistentIdentifier");
}

- (SSPreorder)initWithXPCEncoding:(id)a3
{
  SSPreorder *v5;
  xpc_object_t value;
  objc_super v8;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSPreorder;
    v5 = -[SSPreorder init](&v8, sel_init);
    if (v5)
    {
      v5->_artistName = (NSString *)SSXPCDictionaryCopyCFObject(a3, "0");
      v5->_itemKind = (NSString *)SSXPCDictionaryCopyCFObject(a3, "2");
      v5->_pid = xpc_dictionary_get_int64(a3, "3");
      v5->_releaseDate = xpc_dictionary_get_double(a3, "4");
      v5->_releaseDateString = (NSString *)SSXPCDictionaryCopyCFObject(a3, "5");
      v5->_accountID = (NSNumber *)SSXPCDictionaryCopyCFObject(a3, "6");
      v5->_itemID = xpc_dictionary_get_int64(a3, "7");
      v5->_preorderID = xpc_dictionary_get_int64(a3, "8");
      v5->_title = (NSString *)SSXPCDictionaryCopyCFObject(a3, "9");
      value = xpc_dictionary_get_value(a3, "1");
      if (value)
        v5->_imageCollection = -[SSItemImageCollection initWithXPCEncoding:]([SSItemImageCollection alloc], "initWithXPCEncoding:", value);
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
  id v4;
  void *v5;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_artistName);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_itemKind);
  xpc_dictionary_set_int64(v3, "3", self->_pid);
  xpc_dictionary_set_double(v3, "4", self->_releaseDate);
  SSXPCDictionarySetCFObject(v3, "5", (__CFString *)self->_releaseDateString);
  SSXPCDictionarySetCFObject(v3, "6", (__CFString *)self->_accountID);
  xpc_dictionary_set_int64(v3, "7", self->_itemID);
  xpc_dictionary_set_int64(v3, "8", self->_preorderID);
  SSXPCDictionarySetCFObject(v3, "9", (__CFString *)self->_title);
  v4 = -[SSItemImageCollection copyXPCEncoding](self->_imageCollection, "copyXPCEncoding");
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_value(v3, "1", v4);
    xpc_release(v5);
  }
  return v3;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (SSItemImageCollection)imageCollection
{
  return self->_imageCollection;
}

- (NSString)itemKind
{
  return self->_itemKind;
}

- (int64_t)persistentIdentifier
{
  return self->_pid;
}

- (NSString)releaseDateString
{
  return self->_releaseDateString;
}

- (NSNumber)storeAccountIdentifier
{
  return self->_accountID;
}

- (unint64_t)storeItemIdentifier
{
  return self->_itemID;
}

- (unint64_t)storePreorderIdentifier
{
  return self->_preorderID;
}

- (NSString)title
{
  return self->_title;
}

@end
