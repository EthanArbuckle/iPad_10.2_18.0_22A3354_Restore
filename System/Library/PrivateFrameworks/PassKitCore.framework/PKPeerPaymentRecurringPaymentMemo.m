@implementation PKPeerPaymentRecurringPaymentMemo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPaymentMemo)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentMemo *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *emoji;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentRecurringPaymentMemo;
  v5 = -[PKPeerPaymentRecurringPaymentMemo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emoji"));
    v8 = objc_claimAutoreleasedReturnValue();
    emoji = v5->_emoji;
    v5->_emoji = (NSString *)v8;

    v5->_color = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("color"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emoji, CFSTR("emoji"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_color, CFSTR("color"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_text);
  objc_msgSend(v3, "safelyAddObject:", self->_emoji);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_color - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *emoji;
  NSString *v6;
  NSString *text;
  NSString *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  emoji = self->_emoji;
  v6 = (NSString *)v4[2];
  if (emoji && v6)
  {
    if ((-[NSString isEqual:](emoji, "isEqual:") & 1) == 0)
      goto LABEL_12;
  }
  else if (emoji != v6)
  {
    goto LABEL_12;
  }
  text = self->_text;
  v8 = (NSString *)v4[1];
  if (!text || !v8)
  {
    if (text == v8)
      goto LABEL_10;
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  if ((-[NSString isEqual:](text, "isEqual:") & 1) == 0)
    goto LABEL_12;
LABEL_10:
  v9 = self->_color == v4[3];
LABEL_13:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("text: '%@'; "), self->_text);
  objc_msgSend(v3, "appendFormat:", CFSTR("emoji: '%@'; "), self->_emoji);
  PKSemanticColorToString(self->_color);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("color: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentRecurringPaymentMemo *v5;
  uint64_t v6;
  NSString *emoji;
  uint64_t v8;
  NSString *text;

  v5 = -[PKPeerPaymentRecurringPaymentMemo init](+[PKPeerPaymentRecurringPaymentMemo allocWithZone:](PKPeerPaymentRecurringPaymentMemo, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_emoji, "copyWithZone:", a3);
  emoji = v5->_emoji;
  v5->_emoji = (NSString *)v6;

  v5->_color = self->_color;
  v8 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  text = v5->_text;
  v5->_text = (NSString *)v8;

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)emoji
{
  return self->_emoji;
}

- (void)setEmoji:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)color
{
  return self->_color;
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
