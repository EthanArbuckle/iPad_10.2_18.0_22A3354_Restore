@implementation USOSerializedUtteranceSpan

- (USOSerializedUtteranceSpan)initWithStartIndex:(unsigned int)a3 endIndex:(unsigned int)a4 startUnicodeScalarIndex:(unsigned int)a5 endUnicodeScalarIndex:(unsigned int)a6
{
  return -[USOSerializedUtteranceSpan initWithStartIndex:endIndex:startUnicodeScalarIndex:endUnicodeScalarIndex:startMilliSeconds:endMilliSeconds:](self, "initWithStartIndex:endIndex:startUnicodeScalarIndex:endUnicodeScalarIndex:startMilliSeconds:endMilliSeconds:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 0, 0);
}

- (USOSerializedUtteranceSpan)initWithStartIndex:(unsigned int)a3 endIndex:(unsigned int)a4 startUnicodeScalarIndex:(unsigned int)a5 endUnicodeScalarIndex:(unsigned int)a6 startMilliSeconds:(int)a7 endMilliSeconds:(int)a8
{
  USOSerializedUtteranceSpan *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)USOSerializedUtteranceSpan;
  result = -[USOSerializedUtteranceSpan init](&v15, sel_init);
  if (result)
  {
    result->_startIndex = a3;
    result->_endIndex = a4;
    result->_startUnicodeScalarIndex = a5;
    result->_endUnicodeScalarIndex = a6;
    result->_startMilliSeconds = a7;
    result->_endMilliSeconds = a8;
  }
  return result;
}

- (USOSerializedUtteranceSpan)initWithCoder:(id)a3
{
  id v4;
  USOSerializedUtteranceSpan *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)USOSerializedUtteranceSpan;
  v5 = -[USOSerializedUtteranceSpan init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startUnicodeScalarIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endUnicodeScalarIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startMilliSeconds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endMilliSeconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_startIndex = objc_msgSend(v6, "unsignedIntValue");
    v5->_endIndex = objc_msgSend(v7, "unsignedIntValue");
    v5->_startUnicodeScalarIndex = objc_msgSend(v8, "unsignedIntValue");
    v5->_endUnicodeScalarIndex = objc_msgSend(v9, "unsignedIntValue");
    v5->_startMilliSeconds = objc_msgSend(v10, "intValue");
    v5->_endMilliSeconds = objc_msgSend(v11, "intValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", -[USOSerializedUtteranceSpan startIndex](self, "startIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("startIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSerializedUtteranceSpan endIndex](self, "endIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("endIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSerializedUtteranceSpan startUnicodeScalarIndex](self, "startUnicodeScalarIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("startUnicodeScalarIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSerializedUtteranceSpan endUnicodeScalarIndex](self, "endUnicodeScalarIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("endUnicodeScalarIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSerializedUtteranceSpan startMilliSeconds](self, "startMilliSeconds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("startMilliSeconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSerializedUtteranceSpan endMilliSeconds](self, "endMilliSeconds"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("endMilliSeconds"));

}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)startUnicodeScalarIndex
{
  return self->_startUnicodeScalarIndex;
}

- (unsigned)endUnicodeScalarIndex
{
  return self->_endUnicodeScalarIndex;
}

- (int)startMilliSeconds
{
  return self->_startMilliSeconds;
}

- (int)endMilliSeconds
{
  return self->_endMilliSeconds;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
