@implementation RBSTagAttribute

- (unint64_t)hash
{
  return -[NSString hash](self->_tag, "hash");
}

- (NSString)tag
{
  return self->_tag;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *tag;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSTagAttribute;
  v6 = 0;
  if (-[RBSAttribute isEqual:](&v8, sel_isEqual_, v4))
  {
    tag = self->_tag;
    if (tag == (NSString *)v4[1] || -[NSString isEqualToString:](tag, "isEqualToString:"))
      v6 = 1;
  }

  return v6;
}

+ (id)attributeWithTag:(id)a3
{
  id v3;
  _QWORD *v4;

  v3 = a3;
  v4 = -[RBSTagAttribute _initWithTag:]([RBSTagAttribute alloc], v3);

  return v4;
}

- (_QWORD)_initWithTag:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)RBSTagAttribute;
    a1 = objc_msgSendSuper2(&v7, sel__init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSTagAttribute;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, CFSTR("tag"), v5.receiver, v5.super_class);

}

- (RBSTagAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSTagAttribute *v5;
  void *v6;
  uint64_t v7;
  NSString *tag;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSTagAttribute;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v10, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    tag = v5->_tag;
    v5->_tag = (NSString *)v7;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| tag:\"%@\">"), v4, self->_tag);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
