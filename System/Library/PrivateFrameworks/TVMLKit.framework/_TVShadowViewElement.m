@implementation _TVShadowViewElement

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_TVShadowViewElement elementID](self, "elementID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "elementID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVShadowViewElement elementID](self, "elementID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "elementID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVShadowViewElement elementID](self, "elementID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_TVShadowViewElementID)elementID
{
  return self->_elementID;
}

- (void)setElementID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_TVShadowViewElement)parent
{
  return (_TVShadowViewElement *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_elementID, 0);
}

@end
