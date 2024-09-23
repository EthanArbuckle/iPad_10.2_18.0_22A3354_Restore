@implementation RTTUtterance

+ (id)utteranceWithContactPath:(id)a3 andText:(id)a4
{
  return +[RTTUtterance utteranceWithContactPath:andText:isTranscription:](RTTUtterance, "utteranceWithContactPath:andText:isTranscription:", a3, a4, 0);
}

+ (id)utteranceWithContactPath:(id)a3 andText:(id)a4 isTranscription:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  RTTUtterance *v9;
  _BOOL8 v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(RTTUtterance);
  -[RTTUtterance setContactPath:](v9, "setContactPath:", v8);
  -[RTTUtterance updateText:](v9, "updateText:", v7);

  v10 = +[RTTUtterance contactPathIsMe:](RTTUtterance, "contactPathIsMe:", v8);
  -[RTTUtterance setIsMe:](v9, "setIsMe:", v10);
  -[RTTUtterance setIsTranscription:](v9, "setIsTranscription:", v5);
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  -[RTTUtterance contactPath](self, "contactPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setContactPath:", v6);

  -[RTTUtterance text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setText:", v8);

  objc_msgSend(v4, "setIsMe:", -[RTTUtterance isMe](self, "isMe"));
  -[RTTUtterance lastChangeDate](self, "lastChangeDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLastChangeDate:", v10);

  objc_msgSend(v4, "setIgnoreTimeoutTemporarily:", -[RTTUtterance ignoreTimeoutTemporarily](self, "ignoreTimeoutTemporarily"));
  objc_msgSend(v4, "setIsTranscription:", -[RTTUtterance isTranscription](self, "isTranscription"));
  return v4;
}

+ (BOOL)contactPathIsMe:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  ttyLocString(CFSTR("TTYPersonMe"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "contactPathIsMe:", v3);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTTUtterance)initWithCoder:(id)a3
{
  id v4;
  RTTUtterance *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTTUtterance;
  v5 = -[RTTUtterance init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTTUtteranceContactKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUtterance setContactPath:](v5, "setContactPath:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTTUtteranceTextKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUtterance setText:](v5, "setText:", v7);

    -[RTTUtterance contactPath](v5, "contactPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUtterance setIsMe:](v5, "setIsMe:", +[RTTUtterance contactPathIsMe:](RTTUtterance, "contactPathIsMe:", v8));

    -[RTTUtterance setIsTranscription:](v5, "setIsTranscription:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RTTUtteranceIsTranscriptionKey")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RTTUtterance contactPath](self, "contactPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("RTTUtteranceContactKey"));

  -[RTTUtterance text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("RTTUtteranceTextKey"));

  objc_msgSend(v6, "encodeBool:forKey:", -[RTTUtterance isTranscription](self, "isTranscription"), CFSTR("RTTUtteranceIsTranscriptionKey"));
}

- (void)dealloc
{
  objc_super v3;

  -[RTTUtterance setContactPath:](self, "setContactPath:", 0);
  -[RTTUtterance updateText:](self, "updateText:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RTTUtterance;
  -[RTTUtterance dealloc](&v3, sel_dealloc);
}

- (void)updateText:(id)a3
{
  id v4;

  -[RTTUtterance setText:](self, "setText:", a3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTUtterance setLastChangeDate:](self, "setLastChangeDate:", v4);

}

- (BOOL)hasTimedOut
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  if (-[RTTUtterance ignoreTimeoutTemporarily](self, "ignoreTimeoutTemporarily"))
    return 0;
  -[RTTUtterance lastChangeDate](self, "lastChangeDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUtterance lastChangeDate](self, "lastChangeDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v3 = v7 > 3.0;

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)resetTimeout
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTUtterance setLastChangeDate:](self, "setLastChangeDate:", v3);

}

- (BOOL)isComplete
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  -[RTTUtterance text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  ttyLocString(CFSTR("TTYMessageCompleteString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  ttyLocString(CFSTR("TTYMessageGoodbyeString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  ttyLocString(CFSTR("TTYMessageHangupString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  ttyLocString(CFSTR("TTYMessagePoliteHangupString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  ttyLocString(CFSTR("TTYMessageHoldString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUtterance text](self, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v4 - 1));

  if ((_DWORD)v7)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __26__RTTUtterance_isComplete__block_invoke;
    v15[3] = &unk_24D204908;
    v15[4] = self;
    v15[5] = v4;
    v13 = objc_msgSend(v10, "indexOfObjectPassingTest:", v15) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __26__RTTUtterance_isComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 >= objc_msgSend(v3, "length"))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = v6 - objc_msgSend(v3, "length");
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringFromIndex:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTTUtterance contactPath](self, "contactPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      || (-[RTTUtterance contactPath](self, "contactPath"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "contactPath"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToString:", v4)))
    {
      -[RTTUtterance text](self, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v7 == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)RTTUtterance;
  -[RTTUtterance description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUtterance contactPath](self, "contactPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTTUtterance hasTimedOut](self, "hasTimedOut");
  -[RTTUtterance text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ [%d]: %{sensitive}@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)contactPath
{
  return self->_contactPath;
}

- (void)setContactPath:(id)a3
{
  objc_storeStrong((id *)&self->_contactPath, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isTranscription
{
  return self->_isTranscription;
}

- (void)setIsTranscription:(BOOL)a3
{
  self->_isTranscription = a3;
}

- (BOOL)ignoreTimeoutTemporarily
{
  return self->_ignoreTimeoutTemporarily;
}

- (void)setIgnoreTimeoutTemporarily:(BOOL)a3
{
  self->_ignoreTimeoutTemporarily = a3;
}

- (NSDate)lastChangeDate
{
  return self->_lastChangeDate;
}

- (void)setLastChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastChangeDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangeDate, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_contactPath, 0);
}

@end
