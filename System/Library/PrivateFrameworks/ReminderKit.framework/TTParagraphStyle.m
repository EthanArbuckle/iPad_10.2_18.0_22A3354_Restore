@implementation TTParagraphStyle

+ (int64_t)textAlignmentForParagraphStyleAlignment:(int)a3
{
  if (a3 >= 4)
    return 4;
  else
    return a3;
}

+ (int)paragraphStyleAlignmentForTextAlignment:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
    return 4;
  else
    return a3;
}

- (TTParagraphStyle)initWithData:(id)a3
{
  id v4;
  id v5;
  char *v6;
  int v7;
  TTParagraphStyle *v8;
  NSObject *v9;
  _BYTE v11[72];

  v4 = a3;
  topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v11);
  v5 = objc_retainAutorelease(v4);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v5, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = -[TTParagraphStyle initWithArchive:](self, "initWithArchive:", v11);
    v8 = self;
  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TTParagraphStyle(TTParagraphStylePersistenceAdditions) initWithData:].cold.1(v9);

    v8 = 0;
  }
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v11);

  return v8;
}

- (TTParagraphStyle)initWithArchive:(const void *)a3
{
  TTParagraphStyle *v4;
  TTParagraphStyle *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int v9;

  v4 = -[TTParagraphStyle init](self, "init");
  v5 = v4;
  if (v4)
  {
    if ((*((_DWORD *)a3 + 8) & 1) != 0)
      v6 = *((unsigned int *)a3 + 10);
    else
      v6 = 3;
    -[TTParagraphStyle setStyle:](v4, "setStyle:", v6);
    if ((*((_BYTE *)a3 + 32) & 2) != 0)
      v7 = +[TTParagraphStyle textAlignmentForParagraphStyleAlignment:](TTParagraphStyle, "textAlignmentForParagraphStyleAlignment:", *((unsigned int *)a3 + 11));
    else
      v7 = 4;
    -[TTParagraphStyle setAlignment:](v5, "setAlignment:", v7);
    if ((*((_BYTE *)a3 + 32) & 4) != 0)
      v8 = +[TTMergeableAttributedString writingDirectionForAttribute:](TTMergeableAttributedString, "writingDirectionForAttribute:", *((unsigned int *)a3 + 12));
    else
      v8 = -1;
    -[TTParagraphStyle setWritingDirection:](v5, "setWritingDirection:", v8);
    v9 = *((_DWORD *)a3 + 8);
    if ((v9 & 8) != 0)
    {
      -[TTParagraphStyle setIndent:](v5, "setIndent:", *((int *)a3 + 13));
      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x40) != 0)
    {
      -[TTParagraphStyle setStartingItemNumber:](v5, "setStartingItemNumber:", *((unsigned int *)a3 + 17));
      v9 = *((_DWORD *)a3 + 8);
    }
    if ((v9 & 0x20) != 0)
      -[TTParagraphStyle setHints:](v5, "setHints:", *((unsigned int *)a3 + 16));
  }
  return v5;
}

- (void)saveToArchive:(void *)a3
{
  unsigned int v5;
  topotext *v6;
  int v7;
  topotext *v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;

  if (-[TTParagraphStyle style](self, "style") != 3)
  {
    v5 = -[TTParagraphStyle style](self, "style");
    *((_DWORD *)a3 + 8) |= 1u;
    *((_DWORD *)a3 + 10) = v5;
  }
  if (-[TTParagraphStyle alignment](self, "alignment") != 4)
  {
    v6 = (topotext *)+[TTParagraphStyle paragraphStyleAlignmentForTextAlignment:](TTParagraphStyle, "paragraphStyleAlignmentForTextAlignment:", -[TTParagraphStyle alignment](self, "alignment"));
    v7 = (int)v6;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v6))
      -[TTParagraphStyle(TTParagraphStylePersistenceAdditions) saveToArchive:].cold.2();
    *((_DWORD *)a3 + 8) |= 2u;
    *((_DWORD *)a3 + 11) = v7;
  }
  if (-[TTParagraphStyle writingDirection](self, "writingDirection") != -1)
  {
    v8 = (topotext *)+[TTMergeableAttributedString attributeForWritingDirection:](TTMergeableAttributedString, "attributeForWritingDirection:", -[TTParagraphStyle writingDirection](self, "writingDirection"));
    v9 = (int)v8;
    if (!topotext::AttributeRun_WritingDirection_IsValid(v8))
      -[TTParagraphStyle(TTParagraphStylePersistenceAdditions) saveToArchive:].cold.1();
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 12) = v9;
  }
  if (-[TTParagraphStyle indent](self, "indent"))
  {
    v10 = -[TTParagraphStyle indent](self, "indent");
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 13) = v10;
  }
  if (-[TTParagraphStyle startingItemNumber](self, "startingItemNumber"))
  {
    v11 = -[TTParagraphStyle startingItemNumber](self, "startingItemNumber");
    *((_DWORD *)a3 + 8) |= 0x40u;
    *((_DWORD *)a3 + 17) = v11;
  }
  if (-[TTParagraphStyle hints](self, "hints"))
  {
    v12 = -[TTParagraphStyle hints](self, "hints");
    *((_DWORD *)a3 + 8) |= 0x20u;
    *((_DWORD *)a3 + 16) = v12;
  }
}

- (id)serialize
{
  id v2;
  void *v3;
  int v4;
  _BYTE v6[72];

  -[TTParagraphStyle saveToArchive:](self, "saveToArchive:", v6, topotext::ParagraphStyle::ParagraphStyle((topotext::ParagraphStyle *)v6));
  v2 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::ParagraphStyle::ByteSize((topotext::ParagraphStyle *)v6)));
  v3 = (void *)objc_msgSend(v2, "mutableBytes");
  v4 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v2, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v6, v3, v4);
  topotext::ParagraphStyle::~ParagraphStyle((topotext::ParagraphStyle *)v6);
  return v2;
}

- (TTParagraphStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  TTParagraphStyle *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufArchiveKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TTParagraphStyle initWithData:](self, "initWithData:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TTParagraphStyle serialize](self, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("protobufArchiveKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultParagraphStyle
{
  if (defaultParagraphStyle_onceToken != -1)
    dispatch_once(&defaultParagraphStyle_onceToken, &__block_literal_global_46);
  return (id)defaultParagraphStyle_defaultParagraphStyle;
}

void __41__TTParagraphStyle_defaultParagraphStyle__block_invoke()
{
  TTParagraphStyle *v0;
  void *v1;

  v0 = objc_alloc_init(TTParagraphStyle);
  v1 = (void *)defaultParagraphStyle_defaultParagraphStyle;
  defaultParagraphStyle_defaultParagraphStyle = (uint64_t)v0;

}

- (TTParagraphStyle)init
{
  TTParagraphStyle *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TTParagraphStyle;
  result = -[TTParagraphStyle init](&v3, sel_init);
  if (result)
  {
    result->_style = 3;
    *(_OWORD *)&result->_alignment = xmmword_1B4B747B0;
  }
  return result;
}

+ (id)paragraphStyleNamed:(unsigned int)a3
{
  uint64_t v3;
  TTParagraphStyle *v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(TTParagraphStyle);
  -[TTParagraphStyle setStyle:](v4, "setStyle:", v3);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TTMutableParagraphStyle *v4;

  v4 = objc_alloc_init(TTMutableParagraphStyle);
  -[TTParagraphStyle setStyle:](v4, "setStyle:", -[TTParagraphStyle style](self, "style"));
  -[TTParagraphStyle setAlignment:](v4, "setAlignment:", self->_alignment);
  -[TTParagraphStyle setWritingDirection:](v4, "setWritingDirection:", self->_writingDirection);
  -[TTParagraphStyle setIndent:](v4, "setIndent:", -[TTParagraphStyle indent](self, "indent"));
  -[TTParagraphStyle setStartingItemNumber:](v4, "setStartingItemNumber:", -[TTParagraphStyle startingItemNumber](self, "startingItemNumber"));
  -[TTParagraphStyle setHints:](v4, "setHints:", -[TTParagraphStyle hints](self, "hints"));
  -[TTParagraphStyle setNeedsParagraphCleanup:](v4, "setNeedsParagraphCleanup:", -[TTParagraphStyle needsParagraphCleanup](self, "needsParagraphCleanup"));
  -[TTParagraphStyle setNeedsListCleanup:](v4, "setNeedsListCleanup:", -[TTParagraphStyle needsListCleanup](self, "needsListCleanup"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TTParagraphStyle isEqualToParagraphStyle:](self, "isEqualToParagraphStyle:", v4);

  return v5;
}

- (BOOL)isEqualToParagraphStyle:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 v7;

  v4 = a3;
  if (-[TTParagraphStyle isEqualToModelParagraphStyle:](self, "isEqualToModelParagraphStyle:", v4)
    && (v5 = -[TTParagraphStyle needsListCleanup](self, "needsListCleanup"),
        v5 == objc_msgSend(v4, "needsListCleanup")))
  {
    v7 = -[TTParagraphStyle needsParagraphCleanup](self, "needsParagraphCleanup");
    v6 = v7 ^ objc_msgSend(v4, "needsParagraphCleanup") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TTParagraphStyle isEqualToModelParagraphStyle:](self, "isEqualToModelParagraphStyle:", v4);

  return v5;
}

- (BOOL)isEqualToModelParagraphStyle:(id)a3
{
  id v4;
  unsigned int v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  BOOL v11;

  v4 = a3;
  v5 = -[TTParagraphStyle style](self, "style");
  if (v5 == objc_msgSend(v4, "style")
    && (v6 = -[TTParagraphStyle alignment](self, "alignment"), v6 == objc_msgSend(v4, "alignment"))
    && (v7 = -[TTParagraphStyle writingDirection](self, "writingDirection"), v7 == objc_msgSend(v4, "writingDirection"))
    && (v8 = -[TTParagraphStyle indent](self, "indent"), v8 == objc_msgSend(v4, "indent"))
    && (v9 = -[TTParagraphStyle startingItemNumber](self, "startingItemNumber"),
        v9 == objc_msgSend(v4, "startingItemNumber")))
  {
    v10 = -[TTParagraphStyle hints](self, "hints");
    v11 = v10 == objc_msgSend(v4, "hints");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;

  v3 = -[TTParagraphStyle style](self, "style");
  v4 = v3 ^ (16 * -[TTParagraphStyle indent](self, "indent"));
  v5 = v4 ^ (-[TTParagraphStyle alignment](self, "alignment") << 6);
  v6 = v5 ^ (-[TTParagraphStyle writingDirection](self, "writingDirection") << 8);
  return v6 ^ -[TTParagraphStyle hints](self, "hints");
}

- (void)setStyle:(unsigned int)a3
{
  self->_style = a3;
}

- (BOOL)isUnknownStyle
{
  return self->_style - 6 < 0x5E;
}

- (BOOL)canIndent
{
  return -[TTParagraphStyle isList](self, "isList") || -[TTParagraphStyle style](self, "style") == 3;
}

- (BOOL)isList
{
  if (-[TTParagraphStyle isUnknownStyle](self, "isUnknownStyle"))
    return -[TTParagraphStyle hints](self, "hints") & 1;
  if (-[TTParagraphStyle style](self, "style") == 100 || -[TTParagraphStyle style](self, "style") == 101)
    return 1;
  return -[TTParagraphStyle style](self, "style") == 102;
}

- (BOOL)isHeader
{
  unsigned int v3;

  v3 = -[TTParagraphStyle style](self, "style");
  if (v3 != 1)
    LOBYTE(v3) = -[TTParagraphStyle style](self, "style") == 2 || -[TTParagraphStyle style](self, "style") == 0;
  return v3;
}

- (BOOL)preferSingleLine
{
  _BOOL4 v3;

  if (-[TTParagraphStyle isUnknownStyle](self, "isUnknownStyle"))
  {
    return (-[TTParagraphStyle hints](self, "hints") >> 1) & 1;
  }
  else if (-[TTParagraphStyle style](self, "style") == 3 || -[TTParagraphStyle style](self, "style") == 4)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    LOBYTE(v3) = !-[TTParagraphStyle isList](self, "isList");
  }
  return v3;
}

- (BOOL)wantsFollowingNewLine
{
  return -[TTParagraphStyle isList](self, "isList") || -[TTParagraphStyle style](self, "style") == 4;
}

- (BOOL)uniqueToLine
{
  return 0;
}

- (id)listBulletInAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  unint64_t v12;
  uint64_t v13;

  v6 = a3;
  v7 = -[TTParagraphStyle style](self, "style");
  if (v7 == 101)
  {
    v11 = CFSTR("–");
  }
  else if (v7 == 102)
  {
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", TTPresentationAttributeNameItemNumber, a4, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a4 && !v8)
    {
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", TTPresentationAttributeNameItemNumber, a4 - 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld."), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = -[TTParagraphStyle indent](self, "indent");
    if (v12 >= 2)
      v13 = 2;
    else
      v13 = v12;
    objc_msgSend(&unk_1E6836F40, "objectAtIndexedSubscript:", v13);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSUUID)trackingUUID
{
  return 0;
}

- (NSString)description
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  _BOOL4 v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;

  if (-[TTParagraphStyle writingDirection](self, "writingDirection"))
  {
    v3 = -[TTParagraphStyle writingDirection](self, "writingDirection");
    v4 = CFSTR("Natural");
    if (v3 == 1)
      v4 = CFSTR("RTL");
  }
  else
  {
    v4 = CFSTR("LTR");
  }
  v5 = v4;
  v6 = -[TTParagraphStyle needsParagraphCleanup](self, "needsParagraphCleanup");
  v7 = CFSTR(" needsParagraphCleanup");
  if (!v6)
    v7 = &stru_1E67FB1F0;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = v7;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TTParagraphStyle style](self, "style");
  v13 = -[TTParagraphStyle alignment](self, "alignment");
  v14 = -[TTParagraphStyle indent](self, "indent");
  v15 = -[TTParagraphStyle needsListCleanup](self, "needsListCleanup");
  v16 = CFSTR(" needsListCleanup");
  if (!v15)
    v16 = &stru_1E67FB1F0;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p style=%lu alignment=%lu indent=%ld %@%@%@%@>"), v11, self, v12, v13, v14, v5, &stru_1E67FB1F0, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (unsigned)style
{
  return self->_style;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (unint64_t)indent
{
  return self->_indent;
}

- (void)setIndent:(unint64_t)a3
{
  self->_indent = a3;
}

- (unint64_t)startingItemNumber
{
  return self->_startingItemNumber;
}

- (void)setStartingItemNumber:(unint64_t)a3
{
  self->_startingItemNumber = a3;
}

- (unsigned)hints
{
  return self->_hints;
}

- (void)setHints:(unsigned int)a3
{
  self->_hints = a3;
}

- (BOOL)needsParagraphCleanup
{
  return self->_needsParagraphCleanup;
}

- (void)setNeedsParagraphCleanup:(BOOL)a3
{
  self->_needsParagraphCleanup = a3;
}

- (BOOL)needsListCleanup
{
  return self->_needsListCleanup;
}

- (void)setNeedsListCleanup:(BOOL)a3
{
  self->_needsListCleanup = a3;
}

@end
