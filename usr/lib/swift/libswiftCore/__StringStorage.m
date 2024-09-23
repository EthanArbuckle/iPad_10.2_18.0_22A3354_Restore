@implementation __StringStorage

- (_TtCs15__StringStorage)init
{
  _TtCs15__StringStorage *result;

  closure #1 in _unimplementedInitializer(className:initName:file:line:column:)("Swift.__StringStorage", 21, "init()", 6, 2, "Swift/StringStorage.swift", 25, 2, 0xFAuLL, 0x16uLL);
  __break(1u);
  return result;
}

- (int64_t)length
{
  return String.UTF16View.count.getter(*(_QWORD *)self->_countAndFlags, (unint64_t)self);
}

- (unint64_t)hash
{
  if ((*(_QWORD *)self->_countAndFlags & 0x8000000000000000) != 0)
    return _swift_stdlib_CFStringHashCString();
  else
    return _swift_stdlib_CFStringHashNSString();
}

- (unsigned)characterAtIndex:(int64_t)a3
{
  return __StringStorage.character(at:)(a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(id)a4
{
  __StringStorage.getCharacters(_:range:)((unint64_t)a3, a4.var0, a4.var1, (char *)a4.var0);
}

- (const)_fastCStringContents:(char)a3
{
  return (const char *)((unint64_t)&self[1] & (*(uint64_t *)self->_countAndFlags >> 63));
}

- (const)UTF8String
{
  return (const char *)&self[1];
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  if (a3 == 1 && *(uint64_t *)self->_countAndFlags < 0 || a3 == 4)
    return (const char *)&self[1];
  else
    return (const char *)_swift_stdlib_NSStringCStringUsingEncodingTrampoline(self, a3);
}

- (char)getCString:(char *)a3 maxLength:(int64_t)a4 encoding:(unint64_t)a5
{
  return __StringStorage.getCString(_:maxLength:encoding:)(a3, a4, a5);
}

- (unint64_t)fastestEncoding
{
  if (*(uint64_t *)self->_countAndFlags < 0)
    return 1;
  else
    return 4;
}

- (char)isEqualToString:(id)a3
{
  return __StringStorage.isEqualToString(to:)((uint64_t)a3);
}

- (char)isEqual:(id)a3
{
  return __StringStorage.isEqualToString(to:)((uint64_t)a3);
}

@end
