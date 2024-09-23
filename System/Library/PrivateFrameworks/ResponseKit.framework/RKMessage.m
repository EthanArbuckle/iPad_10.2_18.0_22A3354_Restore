@implementation RKMessage

- (RKMessage)initWithString:(id)a3 title:(id)a4 languageIdentifier:(id)a5 senderUUID:(id)a6 dateSent:(id)a7 position:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  RKMessage *v18;
  RKMessage *v19;
  objc_super v21;

  v15 = a4;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RKMessage;
  v18 = -[RKText initWithString:andLanguageIdentifier:](&v21, sel_initWithString_andLanguageIdentifier_, a3, a5);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v19->_senderUUID, a6);
    objc_storeStrong((id *)&v19->_dateSent, a7);
    v19->_position = a8;
  }

  return v19;
}

- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4 field:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  NSUInteger v10;
  NSRange v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;
  NSRange v21;
  NSRange v22;
  NSRange v23;
  NSRange v24;
  NSRange v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;
  NSRange v29;

  length = a3.length;
  location = a3.location;
  if (a5 == 1)
    -[RKMessage title](self, "title");
  else
    -[RKText string](self, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v21.location = 0;
  v21.length = v10;
  v28.location = location;
  v28.length = length;
  if (!NSIntersectionRange(v21, v28).length)
  {
    v15 = (void *)MEMORY[0x24BDBCE88];
    v16 = *MEMORY[0x24BDBCB78];
    v24.location = location;
    v24.length = length;
    NSStringFromRange(v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25.location = 0;
    v25.length = v10;
    NSStringFromRange(v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("Annotation range %@ does not intersect text range %@"), v14, v17);
LABEL_11:

    goto LABEL_12;
  }
  v22.location = 0;
  v22.length = v10;
  v29.location = location;
  v29.length = length;
  v11 = NSUnionRange(v22, v29);
  if (v11.location || v11.length != v10)
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCB78];
    v26.location = location;
    v26.length = length;
    NSStringFromRange(v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27.location = 0;
    v27.length = v10;
    NSStringFromRange(v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "raise:format:", v19, CFSTR("Annotation range %@ is not fully contained by text range %@"), v14, v17);
    goto LABEL_11;
  }
  if (!length)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = *MEMORY[0x24BDBCB78];
    v23.location = location;
    v23.length = 0;
    NSStringFromRange(v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("Annotation range %@ is empty"), v14);
LABEL_12:

  }
  v20.receiver = self;
  v20.super_class = (Class)RKMessage;
  -[RKText annotateRange:type:](&v20, sel_annotateRange_type_, location, length, a4);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)senderUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)dateSent
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_senderUUID, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
