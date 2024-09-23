@implementation STShowActivityRequest

- (id)_initWithDataType:(int64_t)a3 view:(int64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STShowActivityRequest;
  result = -[AFSiriRequest init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 5) = a3;
    *((_QWORD *)result + 6) = a4;
  }
  return result;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int64_t)view
{
  return self->_view;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowActivityRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dataType, CFSTR("kSTShowActivityRequestDataTypeKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_view, CFSTR("kSTShowActivityRequestViewKey"));

}

- (STShowActivityRequest)initWithCoder:(id)a3
{
  id v4;
  STShowActivityRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STShowActivityRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_dataType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSTShowActivityRequestDataTypeKey"));
    v5->_view = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSTShowActivityRequestViewKey"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
