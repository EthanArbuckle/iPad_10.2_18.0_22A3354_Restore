@implementation CNVCardDateScanner

+ (id)scannerWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

- (CNVCardDateScanner)initWithString:(id)a3
{
  id v4;
  CNVCardDateScanner *v5;
  uint64_t v6;
  NSString *string;
  CNVCardDateScanner *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVCardDateScanner;
  v5 = -[CNVCardDateScanner init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v5->_position = 0;
    v8 = v5;
  }

  return v5;
}

- (int64_t)scanComponentValueOfLength:(unint64_t)a3
{
  int v5;
  unint64_t position;
  unint64_t v8;
  void *v9;
  int64_t v10;

  if (-[CNVCardDateScanner isAtEnd](self, "isAtEnd"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = -[CNVCardDateScanner nextCharacter](self, "nextCharacter");
  position = self->_position;
  if (v5 == 45)
  {
    self->_position = position + 1;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = a3 + 1;
  do
    --v8;
  while (position + v8 > -[NSString length](self->_string, "length"));
  -[NSString substringWithRange:](self->_string, "substringWithRange:", position, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_position += v8;
  v10 = objc_msgSend(v9, "integerValue");

  return v10;
}

- (int64_t)scanCalendarUnit:(unint64_t)a3
{
  return -[CNVCardDateScanner scanComponentValueOfLength:](self, "scanComponentValueOfLength:", -[CNVCardDateScanner lengthOfCalendarUnit:](self, "lengthOfCalendarUnit:", a3));
}

- (unint64_t)lengthOfCalendarUnit:(unint64_t)a3
{
  unint64_t v3;
  __int128 v4;

  *((_QWORD *)&v4 + 1) = a3;
  *(_QWORD *)&v4 = a3 - 2;
  v3 = v4 >> 1;
  if (v3 > 7)
    return 0;
  else
    return qword_1D3C2D3F8[v3];
}

- (BOOL)scanLeapMarker
{
  if (-[CNVCardDateScanner isAtEnd](self, "isAtEnd")
    || -[CNVCardDateScanner nextCharacter](self, "nextCharacter") != 76)
  {
    return 0;
  }
  ++self->_position;
  return 1;
}

- (BOOL)isAtEnd
{
  unint64_t position;

  position = self->_position;
  return position >= -[NSString length](self->_string, "length");
}

- (unsigned)nextCharacter
{
  return -[NSString characterAtIndex:](self->_string, "characterAtIndex:", self->_position);
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
