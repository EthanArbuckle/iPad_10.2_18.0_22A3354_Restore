@implementation _UISSecureControlCategory

- (_UISSecureControlCategory)initWithType:(unint64_t)a3 iconIndex:(unint64_t)a4 labelIndex:(unint64_t)a5
{
  __int16 v5;
  char v6;
  char v7;
  _UISSecureControlCategory *result;
  objc_super v9;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISSecureControlCategory;
  result = -[_UISSecureControlCategory init](&v9, sel_init);
  if (result)
    result->_fields.all = v7 & 0x3F | ((v6 & 0x1F) << 6) | (v5 << 11);
  return result;
}

- (_UISSecureControlCategory)initWithCoder:(id)a3
{
  id v4;
  _UISSecureControlCategory *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UISSecureControlCategory;
  v5 = -[_UISSecureControlCategory init](&v7, sel_init);
  if (v5)
    v5->_fields.all = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("all"));

  return v5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = objc_msgSend(a3, "userInterfaceStyle");
  v5 = &unk_1E2CBB588;
  if (v4 != 1)
    v5 = 0;
  if (v4)
    v6 = v5;
  else
    v6 = &unk_1E2CBB570;
  objc_msgSend(v6, "objectAtIndexedSubscript:", self->_fields.all & 0x3FLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_fields.all, CFSTR("all"));
}

- (unint64_t)hash
{
  return +[_UISSecureControlCategory hash](_UISSecureControlCategory, "hash") ^ self->_fields.all;
}

- (NSString)iconGlyph
{
  void *v3;
  void *v4;

  objc_msgSend(&unk_1E2CBB4F8, "objectAtIndexedSubscript:", self->_fields.all & 0x3FLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", ((unint64_t)self->_fields.all >> 6) & 0x1F);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  BOOL v5;

  v4 = (unsigned __int16 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_fields.all == v4[4];

  return v5;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  char v5;

  if ((self->_fields.all & 0x3F) != 1)
    return 0;
  objc_msgSend(&unk_1E2CBB558, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (self->_fields.all >> 11) & 0xFFE0FFFF | (((self->_fields.all >> 6) & 0x1F) << 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (unsigned)secureName
{
  void *v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(&unk_1E2CBB528, "objectAtIndexedSubscript:", self->_fields.all & 0x3FLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", (unint64_t)self->_fields.all >> 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (unsigned)secureNameForDrawing
{
  if (self->_fields.all >= 0x800u)
    return -[_UISSecureControlCategory secureName](self, "secureName");
  else
    return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)type
{
  return self->_fields.all & 0x3FLL;
}

@end
