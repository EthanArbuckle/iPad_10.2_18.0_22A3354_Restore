@implementation SCRO2DBrailleData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCRO2DBrailleData)initWithCoder:(id)a3
{
  id v4;
  SCRO2DBrailleData *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *strings;
  void *v11;
  uint64_t v12;
  NSData *imageData;
  SCRO2DBrailleData *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SCRO2DBrailleData;
  v5 = -[SCRO2DBrailleData init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("strings"));
    v9 = objc_claimAutoreleasedReturnValue();
    strings = v5->_strings;
    v5->_strings = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focusedIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_focusedIndex = objc_msgSend(v11, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v12;

    v5->_truncateStrings = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("truncateStrings"));
    v5->_alignAtTop = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alignAtTop"));
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *strings;
  void *v5;
  id v6;

  strings = self->_strings;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", strings, CFSTR("strings"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_focusedIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("focusedIndex"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_truncateStrings, CFSTR("truncateStrings"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_alignAtTop, CFSTR("alignAtTop"));

}

- (SCRO2DBrailleData)initWithStrings:(id)a3 focusedIndex:(int64_t)a4 truncateStrings:(BOOL)a5 alignAtTop:(BOOL)a6
{
  id v11;
  SCRO2DBrailleData *v12;
  SCRO2DBrailleData *v13;
  int64_t v14;
  SCRO2DBrailleData *v15;
  objc_super v17;

  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCRO2DBrailleData;
  v12 = -[SCRO2DBrailleData init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_strings, a3);
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    if ((a4 & 0x8000000000000000) == 0 && objc_msgSend(v11, "count") > (unint64_t)a4)
      v14 = a4;
    v13->_focusedIndex = v14;
    v13->_truncateStrings = a5;
    v13->_alignAtTop = a6;
    v15 = v13;
  }

  return v13;
}

- (SCRO2DBrailleData)initWithImageData:(id)a3
{
  id v5;
  SCRO2DBrailleData *v6;
  SCRO2DBrailleData *v7;
  SCRO2DBrailleData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCRO2DBrailleData;
  v6 = -[SCRO2DBrailleData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageData, a3);
    v8 = v7;
  }

  return v7;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSArray)strings
{
  return self->_strings;
}

- (int64_t)focusedIndex
{
  return self->_focusedIndex;
}

- (BOOL)truncateStrings
{
  return self->_truncateStrings;
}

- (BOOL)alignAtTop
{
  return self->_alignAtTop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
