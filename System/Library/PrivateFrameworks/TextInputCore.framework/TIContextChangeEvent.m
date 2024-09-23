@implementation TIContextChangeEvent

- (void)setSelectionLocation:(unint64_t)a3
{
  self->_selectionLocation = a3;
}

- (void)setIsSelection:(BOOL)a3
{
  self->_isSelection = a3;
}

- (void)setInWordRange:(_NSRange)a3
{
  self->_inWordRange = a3;
}

- (void)setInWord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setExtendsPriorWord:(BOOL)a3
{
  self->_extendsPriorWord = a3;
}

- (TIContextChangeEvent)initWithTIKeyboardState:(id)a3 andActionType:(int)a4
{
  uint64_t v4;
  TIContextChangeEvent *v5;
  TIContextChangeEvent *v6;
  objc_super v8;

  v4 = *(_QWORD *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)TIContextChangeEvent;
  v5 = -[TIUserAction initWithTIKeyboardState:](&v8, sel_initWithTIKeyboardState_, a3);
  v6 = v5;
  if (v5)
  {
    -[TIUserAction setActionType:](v5, "setActionType:", v4);
    v6->_inWordRange = (_NSRange)xmmword_1DA910F40;
    v6->_selectionLocation = -1;
  }
  return v6;
}

- (TIContextChangeEvent)initWithCoder:(id)a3
{
  id v4;
  TIContextChangeEvent *v5;
  uint64_t v6;
  NSString *inWord;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIContextChangeEvent;
  v5 = -[TIUserAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_isSelection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSelection"));
    v5->_extendsPriorWord = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("extendsPriorWord"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inWord"));
    v6 = objc_claimAutoreleasedReturnValue();
    inWord = v5->_inWord;
    v5->_inWord = (NSString *)v6;

    v5->_inWordRange.location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cursorLocation"));
    v5->_inWordRange.length = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cursorLength"));
    v5->_selectionLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectionLocation"));
    -[TIUserAction setActionType:](v5, "setActionType:", 2);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIContextChangeEvent;
  v4 = a3;
  -[TIUserAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSelection, CFSTR("isSelection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_extendsPriorWord, CFSTR("extendsPriorWord"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inWord, CFSTR("inWord"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_inWordRange.location, CFSTR("cursorLocation"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_inWordRange.length, CFSTR("cursorLength"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_selectionLocation, CFSTR("selectionLocation"));

}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[TIContextChangeEvent isSelection](self, "isSelection");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[TIUserAction documentState](self, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "selectedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "contextBeforeInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIContextChangeEvent inWord](self, "inWord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserAction documentState](self, "documentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextAfterInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@| <%@> %@"), v7, v9, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)isSelection
{
  return self->_isSelection;
}

- (BOOL)extendsPriorWord
{
  return self->_extendsPriorWord;
}

- (NSString)inWord
{
  return self->_inWord;
}

- (_NSRange)inWordRange
{
  _NSRange *p_inWordRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_inWordRange = &self->_inWordRange;
  location = self->_inWordRange.location;
  length = p_inWordRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)selectionLocation
{
  return self->_selectionLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inWord, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
