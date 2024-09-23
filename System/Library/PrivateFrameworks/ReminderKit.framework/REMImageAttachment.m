@implementation REMImageAttachment

+ (id)cdEntityName
{
  return CFSTR("REMCDImageAttachment");
}

- (REMImageAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 UTI:(id)a6 fileSize:(unint64_t)a7 fileURL:(id)a8 data:(id)a9 width:(unint64_t)a10 height:(unint64_t)a11
{
  REMImageAttachment *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REMImageAttachment;
  result = -[REMFileAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:](&v12, sel_initWithObjectID_accountID_reminderID_UTI_fileSize_fileURL_data_, a3, a4, a5, a6, a7, a8, a9);
  if (result)
  {
    result->_width = a10;
    result->_height = a11;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMImageAttachment;
  v4 = a3;
  -[REMFileAttachment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMImageAttachment width](self, "width", v5.receiver, v5.super_class), CFSTR("width"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMImageAttachment height](self, "height"), CFSTR("height"));

}

- (REMImageAttachment)initWithCoder:(id)a3
{
  id v4;
  REMImageAttachment *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)REMImageAttachment;
  v5 = -[REMFileAttachment initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
  }

  return v5;
}

- (id)_deepCopy
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMImageAttachment;
  -[REMFileAttachment _deepCopy](&v5, sel__deepCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWidth:", -[REMImageAttachment width](self, "width"));
  objc_msgSend(v3, "setHeight:", -[REMImageAttachment height](self, "height"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMImageAttachment;
  if (-[REMFileAttachment isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "width");
    if (v6 == -[REMImageAttachment width](self, "width"))
    {
      v7 = objc_msgSend(v5, "height");
      v8 = v7 == -[REMImageAttachment height](self, "height");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

@end
