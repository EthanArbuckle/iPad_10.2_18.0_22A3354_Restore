@implementation RTIDocumentRequest

- (int64_t)flags
{
  return self->_flags;
}

- (RTIDocumentRequest)initWithCoder:(id)a3
{
  id v4;
  RTIDocumentRequest *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v9.receiver = self;
  v9.super_class = (Class)RTIDocumentRequest;
  v5 = -[RTIDocumentRequest init](&v9, sel_init);
  if (v5)
  {
    v5->_flags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("reqF"));
    v5->_textGranularity = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("reqG"));
    v5->_rectGranularity = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("rectG"));
    v5->_surroundingGranularityCount = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("reqSC"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("reqRCB")))
      v6 = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("reqRCB"));
    else
      v6 = -1;
    v5->_rectCountBefore = v6;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("reqRCA")))
      v7 = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("reqRCA"));
    else
      v7 = -1;
    v5->_rectCountAfter = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_flags, CFSTR("reqF"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_textGranularity), CFSTR("reqG"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_rectGranularity), CFSTR("rectG"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_surroundingGranularityCount), CFSTR("reqSC"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_rectCountBefore), CFSTR("reqRCB"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_rectCountAfter), CFSTR("reqRCA"));

}

- (int64_t)textGranularity
{
  return self->_textGranularity;
}

- (void)setSurroundingGranularityCount:(int64_t)a3
{
  self->_surroundingGranularityCount = a3;
}

- (void)setRectCountBefore:(int64_t)a3
{
  self->_rectCountBefore = a3;
}

- (void)setRectCountAfter:(int64_t)a3
{
  self->_rectCountAfter = a3;
}

- (void)setFlags:(int64_t)a3
{
  self->_flags = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRectGranularity:(int64_t)a3
{
  self->_rectGranularity = a3;
  self->_didSetRectGranularity = 1;
}

- (int64_t)surroundingGranularityCount
{
  return self->_surroundingGranularityCount;
}

- (void)setTextGranularity:(int64_t)a3
{
  self->_textGranularity = a3;
  if (!self->_didSetRectGranularity)
    self->_rectGranularity = a3;
}

- (RTIDocumentRequest)init
{
  RTIDocumentRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTIDocumentRequest;
  result = -[RTIDocumentRequest init](&v3, sel_init);
  if (result)
  {
    result->_rectCountBefore = -1;
    result->_rectCountAfter = -1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[RTIDocumentRequest init](+[RTIDocumentRequest allocWithZone:](RTIDocumentRequest, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_flags;
  *((_QWORD *)result + 3) = self->_textGranularity;
  *((_QWORD *)result + 4) = self->_rectGranularity;
  *((_QWORD *)result + 5) = self->_surroundingGranularityCount;
  *((_QWORD *)result + 6) = self->_rectCountBefore;
  *((_QWORD *)result + 7) = self->_rectCountAfter;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  RTIDocumentRequest *v4;
  RTIDocumentRequest *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  BOOL v12;

  v4 = (RTIDocumentRequest *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTIDocumentRequest flags](self, "flags");
      if (v6 == -[RTIDocumentRequest flags](v5, "flags")
        && (v7 = -[RTIDocumentRequest textGranularity](self, "textGranularity"),
            v7 == -[RTIDocumentRequest textGranularity](v5, "textGranularity"))
        && (v8 = -[RTIDocumentRequest rectGranularity](self, "rectGranularity"),
            v8 == -[RTIDocumentRequest rectGranularity](v5, "rectGranularity"))
        && (v9 = -[RTIDocumentRequest surroundingGranularityCount](self, "surroundingGranularityCount"),
            v9 == -[RTIDocumentRequest surroundingGranularityCount](v5, "surroundingGranularityCount"))
        && (v10 = -[RTIDocumentRequest rectCountBefore](self, "rectCountBefore"),
            v10 == -[RTIDocumentRequest rectCountBefore](v5, "rectCountBefore")))
      {
        v11 = -[RTIDocumentRequest rectCountAfter](self, "rectCountAfter");
        v12 = v11 == -[RTIDocumentRequest rectCountAfter](v5, "rectCountAfter");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; flags = %ld"), -[RTIDocumentRequest flags](self, "flags"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; textGranularity = %ld"),
    -[RTIDocumentRequest textGranularity](self, "textGranularity"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; rectGranularity = %ld"),
    -[RTIDocumentRequest rectGranularity](self, "rectGranularity"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; surroundingGranularityCount = %ld"),
    -[RTIDocumentRequest surroundingGranularityCount](self, "surroundingGranularityCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; rectCountBefore = %ld"),
    -[RTIDocumentRequest rectCountBefore](self, "rectCountBefore"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; rectCountAfter = %ld"),
    -[RTIDocumentRequest rectCountAfter](self, "rectCountAfter"));
  return v3;
}

- (int64_t)rectGranularity
{
  return self->_rectGranularity;
}

- (int64_t)rectCountBefore
{
  return self->_rectCountBefore;
}

- (int64_t)rectCountAfter
{
  return self->_rectCountAfter;
}

@end
