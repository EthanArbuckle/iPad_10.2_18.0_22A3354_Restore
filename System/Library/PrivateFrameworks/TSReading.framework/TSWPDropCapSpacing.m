@implementation TSWPDropCapSpacing

- (TSWPDropCapSpacing)init
{
  TSWPDropCapSpacing *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPDropCapSpacing;
  result = -[TSWPDropCapSpacing init](&v3, sel_init);
  if (result)
  {
    result->_lineCount = 0;
    result->_elevatedLineCount = 0;
    result->_followingLineCount = 0x7FFFFFFFFFFFFFFFLL;
    result->_padding = 0.0;
    result->_allowSpanParagraphs = 1;
    result->_flags = 0;
    result->_maxWidthFactor = 1.0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPDropCapSpacing;
  -[TSWPDropCapSpacing dealloc](&v2, sel_dealloc);
}

+ (id)dropCapSpacingWithLineCount:(unint64_t)a3 elevatedLineCount:(unint64_t)a4
{
  id v6;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setLineCount:", a3);
  objc_msgSend(v6, "setElevatedLineCount:", a4);
  return v6;
}

- (unint64_t)computedFlagsWithPropertyMap:(id)a3
{
  unint64_t result;
  double v6;

  result = self->_flags;
  if (!result)
  {
    -[TSWPDropCapSpacing padding](self, "padding");
    if (v6 == 0.0 && !objc_msgSend(a3, "containsProperty:", 38))
      return 102;
    else
      return 121;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setLineCount:", self->_lineCount);
  objc_msgSend(v4, "setElevatedLineCount:", self->_elevatedLineCount);
  objc_msgSend(v4, "setPadding:", self->_padding);
  objc_msgSend(v4, "setFollowingLineCount:", self->_followingLineCount);
  objc_msgSend(v4, "setAllowSpanParagraphs:", self->_allowSpanParagraphs);
  objc_msgSend(v4, "setFlags:", self->_flags);
  objc_msgSend(v4, "setMaxWidthFactor:", self->_maxWidthFactor);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TSWPDropCapSpacing allowSpanParagraphs](self, "allowSpanParagraphs");
    if (v6 == objc_msgSend(v5, "allowSpanParagraphs")
      && (v7 = -[TSWPDropCapSpacing lineCount](self, "lineCount"), v7 == objc_msgSend(v5, "lineCount"))
      && (v8 = -[TSWPDropCapSpacing elevatedLineCount](self, "elevatedLineCount"),
          v8 == objc_msgSend(v5, "elevatedLineCount"))
      && (-[TSWPDropCapSpacing padding](self, "padding"), v10 = v9, objc_msgSend(v5, "padding"), v10 == v11)
      && (v12 = -[TSWPDropCapSpacing followingLineCount](self, "followingLineCount"),
          v12 == objc_msgSend(v5, "followingLineCount")))
    {
      v13 = -[TSWPDropCapSpacing flags](self, "flags");
      LOBYTE(v4) = v13 == objc_msgSend(v5, "flags");
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double v6;

  v3 = -[TSWPDropCapSpacing allowSpanParagraphs](self, "allowSpanParagraphs");
  v4 = v3 | (2 * -[TSWPDropCapSpacing lineCount](self, "lineCount"));
  v5 = v4 ^ (8 * -[TSWPDropCapSpacing elevatedLineCount](self, "elevatedLineCount"));
  -[TSWPDropCapSpacing padding](self, "padding");
  return v5 ^ ((unint64_t)v6 << 6) ^ (-[TSWPDropCapSpacing followingLineCount](self, "followingLineCount") << 10) ^ self->_flags;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  unint64_t v6;
  unint64_t v7;
  double padding;
  unint64_t v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[TSWPDropCapSpacing lineCount](self, "lineCount");
  v7 = -[TSWPDropCapSpacing elevatedLineCount](self, "elevatedLineCount");
  padding = self->_padding;
  v9 = -[TSWPDropCapSpacing followingLineCount](self, "followingLineCount");
  if (-[TSWPDropCapSpacing allowSpanParagraphs](self, "allowSpanParagraphs"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: lineCount=%lu elevatedLineCount=%lu padding=%f followingLineCount=%lu allowSpanParagraphs=%@ flags=%lu>"), v5, v6, v7, *(_QWORD *)&padding, v9, v10, -[TSWPDropCapSpacing flags](self, "flags"));
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (void)setLineCount:(unint64_t)a3
{
  self->_lineCount = a3;
}

- (unint64_t)elevatedLineCount
{
  return self->_elevatedLineCount;
}

- (void)setElevatedLineCount:(unint64_t)a3
{
  self->_elevatedLineCount = a3;
}

- (unint64_t)followingLineCount
{
  return self->_followingLineCount;
}

- (void)setFollowingLineCount:(unint64_t)a3
{
  self->_followingLineCount = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (BOOL)allowSpanParagraphs
{
  return self->_allowSpanParagraphs;
}

- (void)setAllowSpanParagraphs:(BOOL)a3
{
  self->_allowSpanParagraphs = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (double)maxWidthFactor
{
  return self->_maxWidthFactor;
}

- (void)setMaxWidthFactor:(double)a3
{
  self->_maxWidthFactor = a3;
}

@end
