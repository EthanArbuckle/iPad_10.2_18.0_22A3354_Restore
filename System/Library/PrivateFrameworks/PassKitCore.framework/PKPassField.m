@implementation PKPassField

- (int64_t)foreignReferenceType
{
  return self->_foreignReferenceType;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setUnformattedValue:(id)a3
{
  NSString *value;
  void *v5;
  id unformattedValue;
  id v7;

  v7 = a3;
  value = self->_value;
  if (value)
  {
    self->_value = 0;

  }
  v5 = (void *)objc_msgSend(v7, "copy");
  unformattedValue = self->_unformattedValue;
  self->_unformattedValue = v5;

}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKPassField)init
{
  PKPassField *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassField;
  result = -[PKPassField init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_textAlignment = xmmword_190455180;
    result->_unitType = 0;
  }
  return result;
}

- (void)setLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setForeignReferenceType:(int64_t)a3
{
  self->_foreignReferenceType = a3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  self->_dataDetectorTypes = a3;
}

- (void)setChangeMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (PKPassField)initWithCoder:(id)a3
{
  id v4;
  PKPassField *v5;
  void *v6;
  uint64_t v7;
  NSString *key;
  uint64_t v9;
  NSString *label;
  uint64_t v11;
  PKPassFieldImage *labelImage;
  uint64_t v13;
  NSString *value;
  uint64_t v15;
  PKPassFieldImage *valueImage;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id unformattedValue;
  uint64_t v23;
  PKPassFieldImage *accessoryImage;
  uint64_t v25;
  NSString *link;
  uint64_t v27;
  NSString *changeMessage;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSDictionary *semantics;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSSet *foreignReferenceIdentifiers;
  void *v40;
  float v41;
  float v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PKPassField;
  v5 = -[PKPassField init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v7 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v9 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelImage"));
    v11 = objc_claimAutoreleasedReturnValue();
    labelImage = v5->_labelImage;
    v5->_labelImage = (PKPassFieldImage *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v13 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueImage"));
    v15 = objc_claimAutoreleasedReturnValue();
    valueImage = v5->_valueImage;
    v5->_valueImage = (PKPassFieldImage *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("unformattedValue"));
    v21 = objc_claimAutoreleasedReturnValue();
    unformattedValue = v5->_unformattedValue;
    v5->_unformattedValue = (id)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryImage"));
    v23 = objc_claimAutoreleasedReturnValue();
    accessoryImage = v5->_accessoryImage;
    v5->_accessoryImage = (PKPassFieldImage *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link"));
    v25 = objc_claimAutoreleasedReturnValue();
    link = v5->_link;
    v5->_link = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeMessage"));
    v27 = objc_claimAutoreleasedReturnValue();
    changeMessage = v5->_changeMessage;
    v5->_changeMessage = (NSString *)v27;

    v5->_textAlignment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("textAlignment"));
    v5->_dataDetectorTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dataDetectorTypes"));
    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("semantics"));
    v33 = objc_claimAutoreleasedReturnValue();
    semantics = v5->_semantics;
    v5->_semantics = (NSDictionary *)v33;

    v5->_cellStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellStyle"));
    v5->_foreignReferenceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("foreignReferenceType"));
    v5->_unitType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("unitType"));
    v35 = objc_alloc(MEMORY[0x1E0C99E60]);
    v36 = objc_opt_class();
    v37 = (void *)objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("combinedForeignReferenceIdentifiers"));
    v38 = objc_claimAutoreleasedReturnValue();
    foreignReferenceIdentifiers = v5->_foreignReferenceIdentifiers;
    v5->_foreignReferenceIdentifiers = (NSSet *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("row"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_row = objc_msgSend(v40, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("amount"));
    v5->_amount = v41;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("threshold"));
    v5->_threshold = v42;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignReferenceIdentifiers, 0);
  objc_storeStrong((id *)&self->_semantics, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_valueImage, 0);
  objc_storeStrong((id *)&self->_labelImage, 0);
  objc_storeStrong((id *)&self->_changeMessage, 0);
  objc_storeStrong(&self->_unformattedValue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (NSString)value
{
  NSString **p_value;
  NSString *v4;
  NSString *value;

  value = self->_value;
  p_value = &self->_value;
  v4 = value;
  if (!value)
  {
    objc_storeStrong((id *)p_value, self->_unformattedValue);
    v4 = self->_value;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  void *v6;
  void *v7;
  double amount;
  double threshold;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v10 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("type"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_labelImage, CFSTR("labelImage"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_valueImage, CFSTR("valueImage"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_unformattedValue, CFSTR("unformattedValue"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_accessoryImage, CFSTR("accessoryImage"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_link, CFSTR("link"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_changeMessage, CFSTR("changeMessage"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_textAlignment, CFSTR("textAlignment"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_dataDetectorTypes, CFSTR("dataDetectorTypes"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_semantics, CFSTR("semantics"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_cellStyle, CFSTR("cellStyle"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_foreignReferenceType, CFSTR("foreignReferenceType"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_unitType, CFSTR("unitType"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_foreignReferenceIdentifiers, CFSTR("combinedForeignReferenceIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_row);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("row"));

  amount = self->_amount;
  *(float *)&amount = amount;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("amount"), amount);
  threshold = self->_threshold;
  *(float *)&threshold = threshold;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("threshold"), threshold);

}

- (NSDictionary)semantics
{
  return self->_semantics;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)key
{
  return self->_key;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)unformattedValue
{
  return self->_unformattedValue;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setType:", self->_type);
  v5 = (void *)-[NSString copy](self->_key, "copy");
  objc_msgSend(v4, "setKey:", v5);

  v6 = (void *)-[NSString copy](self->_label, "copy");
  objc_msgSend(v4, "setLabel:", v6);

  v7 = (void *)-[PKPassFieldImage copy](self->_labelImage, "copy");
  objc_msgSend(v4, "setLabelImage:", v7);

  v8 = (void *)-[NSString copy](self->_value, "copy");
  objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("value"));

  v9 = (void *)-[PKPassFieldImage copy](self->_valueImage, "copy");
  objc_msgSend(v4, "setValueImage:", v9);

  v10 = (void *)objc_msgSend(self->_unformattedValue, "copy");
  objc_msgSend(v4, "setUnformattedValue:", v10);

  v11 = (void *)-[PKPassFieldImage copy](self->_accessoryImage, "copy");
  objc_msgSend(v4, "setAccessoryImage:", v11);

  v12 = (void *)-[NSString copy](self->_link, "copy");
  objc_msgSend(v4, "setLink:", v12);

  v13 = (void *)-[NSString copy](self->_changeMessage, "copy");
  objc_msgSend(v4, "setChangeMessage:", v13);

  objc_msgSend(v4, "setTextAlignment:", self->_textAlignment);
  objc_msgSend(v4, "setDataDetectorTypes:", self->_dataDetectorTypes);
  v14 = (void *)-[NSDictionary copy](self->_semantics, "copy");
  objc_msgSend(v4, "setSemantics:", v14);

  objc_msgSend(v4, "setCellStyle:", self->_cellStyle);
  objc_msgSend(v4, "setUnitType:", self->_unitType);
  objc_msgSend(v4, "setForeignReferenceType:", self->_foreignReferenceType);
  v15 = (void *)-[NSSet copy](self->_foreignReferenceIdentifiers, "copy");
  objc_msgSend(v4, "setForeignReferenceIdentifiers:", v15);

  objc_msgSend(v4, "setRow:", self->_row);
  objc_msgSend(v4, "setAmount:", self->_amount);
  objc_msgSend(v4, "setThreshold:", self->_threshold);
  return v4;
}

- (void)flushCachedValue
{
  NSString *value;

  value = self->_value;
  self->_value = 0;

}

- (id)asDictionary
{
  void *v2;
  void *v3;

  -[PKPassField asMutableDictionary](self, "asMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)asMutableDictionary
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *key;
  NSString *label;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *value;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *link;
  NSSet *foreignReferenceIdentifiers;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *changeMessage;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[5];

  v57[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", key, CFSTR("key"));
  label = self->_label;
  if (label)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", label, CFSTR("label"));
  if (self->_labelImage)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99E08]);
    v56[0] = CFSTR("symbolName");
    -[PKPassFieldImage symbolName](self->_labelImage, "symbolName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v13;
    v56[1] = CFSTR("imageName");
    -[PKPassFieldImage imageName](self->_labelImage, "imageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v14;
    v56[2] = CFSTR("tintColor");
    PKSemanticColorToString(-[PKPassFieldImage tintColor](self->_labelImage, "tintColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithDictionary:", v16);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("imageLabel"));

  }
  value = self->_value;
  if (value)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", value, CFSTR("value"));
  if (self->_valueImage)
  {
    v19 = objc_alloc(MEMORY[0x1E0C99E08]);
    v54[0] = CFSTR("symbolName");
    -[PKPassFieldImage symbolName](self->_valueImage, "symbolName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v20;
    v54[1] = CFSTR("imageName");
    -[PKPassFieldImage imageName](self->_valueImage, "imageName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v21;
    v54[2] = CFSTR("tintColor");
    PKSemanticColorToString(-[PKPassFieldImage tintColor](self->_valueImage, "tintColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v19, "initWithDictionary:", v23);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("imageValue"));

  }
  if (self->_accessoryImage)
  {
    v25 = objc_alloc(MEMORY[0x1E0C99E08]);
    v52[0] = CFSTR("symbolName");
    -[PKPassFieldImage symbolName](self->_accessoryImage, "symbolName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v26;
    v52[1] = CFSTR("imageName");
    -[PKPassFieldImage imageName](self->_accessoryImage, "imageName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v27;
    v52[2] = CFSTR("tintColor");
    PKSemanticColorToString(-[PKPassFieldImage tintColor](self->_accessoryImage, "tintColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v25, "initWithDictionary:", v29);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("imageAccessory"));

  }
  link = self->_link;
  if (link)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", link, CFSTR("link"));
  if (self->_foreignReferenceType == 1)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Balance"), CFSTR("foreignReferenceType"));
    foreignReferenceIdentifiers = self->_foreignReferenceIdentifiers;
    if (foreignReferenceIdentifiers)
    {
      v33 = (void *)-[NSSet copy](foreignReferenceIdentifiers, "copy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("combinedForeignReferenceIdentifiers"));

    }
  }
  _PKEnumValueToString(self->_unitType, CFSTR("PKFieldUnitType"), CFSTR("PKFieldUnitTypeNone, PKFieldUnitTypeDefault, PKFieldUnitTypeRides, PKFieldUnitTypeTickets, PKFieldUnitTypeLoyaltyPoints"), v4, v5, v6, v7, v8, -1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, CFSTR("unitType"));

  changeMessage = self->_changeMessage;
  if (changeMessage)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", changeMessage, CFSTR("changeMessage"));
  if (self->_type == 3 && self->_row)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, CFSTR("row"));

  }
  _PKEnumValueToString(self->_textAlignment, CFSTR("PKTextAlignment"), CFSTR("PKTextAlignmentLeft, PKTextAlignmentCenter, PKTextAlignmentRight, PKTextAlignmentNatural"), v35, v36, v37, v38, v39, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v42, CFSTR("textAlignment"));

  _PKEnumValueToString(self->_cellStyle, CFSTR("PKTableViewCellStyle"), CFSTR("PKTableViewCellStyleDefault, PKTableViewCellStyleValue1, PKTableViewCellStyleValue2, PKTableViewCellStyleSubtitle"), v43, v44, v45, v46, v47, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v48, CFSTR("cellStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_amount);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v49, CFSTR("amount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_threshold);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v50, CFSTR("threshold"));

  return v9;
}

- (id)description
{
  void *v2;
  NSString *label;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  label = self->_label;
  -[PKPassField value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@][%@]"), label, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDrillInField
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)changeMessage
{
  return self->_changeMessage;
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (int64_t)unitType
{
  return self->_unitType;
}

- (void)setUnitType:(int64_t)a3
{
  self->_unitType = a3;
}

- (PKPassFieldImage)labelImage
{
  return self->_labelImage;
}

- (void)setLabelImage:(id)a3
{
  objc_storeStrong((id *)&self->_labelImage, a3);
}

- (PKPassFieldImage)valueImage
{
  return self->_valueImage;
}

- (void)setValueImage:(id)a3
{
  objc_storeStrong((id *)&self->_valueImage, a3);
}

- (PKPassFieldImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImage, a3);
}

- (NSString)link
{
  return self->_link;
}

- (unint64_t)row
{
  return self->_row;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setSemantics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (double)amount
{
  return self->_amount;
}

- (void)setAmount:(double)a3
{
  self->_amount = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (NSSet)foreignReferenceIdentifiers
{
  return self->_foreignReferenceIdentifiers;
}

- (void)setForeignReferenceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

@end
