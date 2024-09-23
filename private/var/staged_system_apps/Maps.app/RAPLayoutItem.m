@implementation RAPLayoutItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = -[NSString copy](self->_displayText, "copy");
  objc_msgSend(v4, "setDisplayText:", v5);

  v6 = -[NSString copy](self->_placeholderText, "copy");
  objc_msgSend(v4, "setPlaceholderText:", v6);

  v7 = -[NSNumber copy](self->_ordinal, "copy");
  objc_msgSend(v4, "setOrdinal:", v7);

  v8 = -[NSNumber copy](self->_fieldType, "copy");
  objc_msgSend(v4, "setFieldType:", v8);

  return v4;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldType, 0);
  objc_storeStrong((id *)&self->_ordinal, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
