@implementation VKCElementInfo

+ (id)infoWithText:(id)a3 parent:(id)a4
{
  id v5;
  id v6;
  VKCElementInfo *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(VKCElementInfo);
  -[VKCElementInfo setText:](v7, "setText:", v6);

  -[VKCBaseElement setParent:](v7, "setParent:", v5);
  return v7;
}

- (id)children
{
  return 0;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
