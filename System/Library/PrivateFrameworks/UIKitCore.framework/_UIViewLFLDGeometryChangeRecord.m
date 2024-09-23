@implementation _UIViewLFLDGeometryChangeRecord

- (_UIViewLFLDGeometryChangeRecord)initWithGeometricPropertyName:(id)a3 value:(id)a4 currentLayoutView:(id)a5 methodName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _UIViewLFLDGeometryChangeRecord *v15;
  _UIViewLFLDGeometryChangeRecord *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIViewLFLDGeometryChangeRecord;
  v15 = -[_UIViewLFLDChangeRecord init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_geometricPropertyName, a3);
    objc_storeStrong((id *)&v16->_geometricPropertyValue, a4);
    objc_storeStrong((id *)&v16->_currentLayoutView, a5);
    objc_storeStrong((id *)&v16->_currentLayoutMethodName, a6);
  }

  return v16;
}

- (id)description
{
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  NSString *currentLayoutMethodName;
  _BOOL4 v19;
  void *v20;
  __CFString *v21;
  int v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;

  v3 = -[NSValue objCType](self->_geometricPropertyValue, "objCType");
  if (!strcmp(v3, "{CGPoint=dd}"))
  {
    -[NSValue pointValue](self->_geometricPropertyValue, "pointValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%g, %g)"), v5, v6, v25, v26);
  }
  else if (!strcmp(v3, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    -[NSValue rectValue](self->_geometricPropertyValue, "rectValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%g, %g; %g, %g)"), v7, v8, v9, v10);
  }
  else
  {
    if (strcmp(v3, "{UIEdgeInsets=dddd}"))
    {
      v4 = 0;
      goto LABEL_9;
    }
    -[NSValue UIEdgeInsetsValue](self->_geometricPropertyValue, "UIEdgeInsetsValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%g, %g, %g, %g)"), v11, v12, v13, v14);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@ = %@; "),
                  self->_geometricPropertyName,
                  v4);
  if (self->_currentLayoutView)
  {
    v16 = 40;
    v17 = -[NSString isEqualToString:](self->_currentLayoutMethodName, "isEqualToString:", CFSTR("viewWillLayoutSubviews"));
    currentLayoutMethodName = self->_currentLayoutMethodName;
    if (v17
      || (v19 = -[NSString isEqualToString:](self->_currentLayoutMethodName, "isEqualToString:", CFSTR("viewDidLayoutSubviews")), currentLayoutMethodName = self->_currentLayoutMethodName, v19))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[UIView __viewDelegate]((id *)&self->_currentLayoutView->super.super.isa);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ with "), v16);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = 1;
    }
    else
    {
      v22 = 0;
      v21 = &stru_1E16EDF20;
    }
    -[UIView _lfld_minimalDescription](self->_currentLayoutView, "_lfld_minimalDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendFormat:", CFSTR("in -%@ of %@%@; "), currentLayoutMethodName, v21, v23);

    if (v22)
    {

    }
  }
  objc_msgSend(v15, "appendString:", CFSTR(">"));

  return v15;
}

- (NSString)geometricPropertyName
{
  return self->_geometricPropertyName;
}

- (NSValue)geometricPropertyValue
{
  return self->_geometricPropertyValue;
}

- (UIView)currentLayoutView
{
  return self->_currentLayoutView;
}

- (NSString)currentLayoutMethodName
{
  return self->_currentLayoutMethodName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutMethodName, 0);
  objc_storeStrong((id *)&self->_currentLayoutView, 0);
  objc_storeStrong((id *)&self->_geometricPropertyValue, 0);
  objc_storeStrong((id *)&self->_geometricPropertyName, 0);
}

@end
