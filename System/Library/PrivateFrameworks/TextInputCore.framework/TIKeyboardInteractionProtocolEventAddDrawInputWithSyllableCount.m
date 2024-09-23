@implementation TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount

- (TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount)initWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount *v5;
  uint64_t v6;
  NSNumber *syllableCount;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount;
  v5 = -[TIKeyboardInteractionProtocolBase initWithKeyboardState:](&v9, sel_initWithKeyboardState_, a4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    syllableCount = v5->_syllableCount;
    v5->_syllableCount = (NSNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount;
  v4 = a3;
  -[TIKeyboardInteractionProtocolBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_syllableCount, CFSTR("syllableCount"), v5.receiver, v5.super_class);

}

- (TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount *v5;
  uint64_t v6;
  NSNumber *syllableCount;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddDrawInputWithSyllableCount;
  v5 = -[TIKeyboardInteractionProtocolBase initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syllableCount"));
    v6 = objc_claimAutoreleasedReturnValue();
    syllableCount = v5->_syllableCount;
    v5->_syllableCount = (NSNumber *)v6;

  }
  return v5;
}

- (void)sendTo:(id)a3
{
  NSNumber *syllableCount;
  id v5;
  uint64_t v6;
  id v7;

  syllableCount = self->_syllableCount;
  v5 = a3;
  v6 = -[NSNumber unsignedIntegerValue](syllableCount, "unsignedIntegerValue");
  -[TIKeyboardInteractionProtocolBase keyboardState](self, "keyboardState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDrawInputWithSyllableCount:keyboardState:", v6, v7);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Syllable Count: %@>"), self->_syllableCount);
}

- (NSNumber)syllableCount
{
  return self->_syllableCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syllableCount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
