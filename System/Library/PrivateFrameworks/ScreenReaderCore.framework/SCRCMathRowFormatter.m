@implementation SCRCMathRowFormatter

- (SCRCMathRowFormatter)init
{
  return -[SCRCMathRowFormatter initWithIsNumberOverride:](self, "initWithIsNumberOverride:", 0);
}

- (SCRCMathRowFormatter)initWithIsNumberOverride:(BOOL)a3
{
  SCRCMathRowFormatter *v4;
  uint64_t v5;
  NSMutableArray *childrenStack;
  NSMutableArray *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCRCMathRowFormatter;
  v4 = -[SCRCMathRowFormatter init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    childrenStack = v4->_childrenStack;
    v4->_childrenStack = (NSMutableArray *)v5;

    v7 = v4->_childrenStack;
    v8 = (void *)objc_opt_new();
    -[NSMutableArray addObject:](v7, "addObject:", v8);

    v4->_isNumberOverride = a3;
  }
  return v4;
}

- (void)addNumber:(id)a3 implicit:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a4;
    v10[0] = CFSTR("AXMType");
    v10[1] = CFSTR("AXMContent");
    v11[0] = CFSTR("Number");
    v11[1] = a3;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a3;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    if (v4)
      objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsImplicit"));
    -[SCRCMathRowFormatter _addDictionary:](self, "_addDictionary:", v9);

  }
}

- (void)addOperator:(id)a3 implicit:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[4];

  v4 = a4;
  v14[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "length") == 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v7, "characterAtIndex:", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = CFSTR("AXMType");
      v13[1] = CFSTR("AXMContent");
      v14[0] = CFSTR("Operator");
      v14[1] = v7;
      v13[2] = CFSTR("AXMUnichar");
      v14[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

    }
    else
    {
      v11[0] = CFSTR("AXMType");
      v11[1] = CFSTR("AXMContent");
      v12[0] = CFSTR("Operator");
      v12[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "mutableCopy");
    }

    if (v4)
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsImplicit"));
    if (-[SCRCMathRowFormatter isNumberOverride](self, "isNumberOverride"))
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsNumberOverride"));
    -[SCRCMathRowFormatter _addDictionary:](self, "_addDictionary:", v10);

  }
}

- (void)addIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8[0] = CFSTR("AXMType");
    v8[1] = CFSTR("AXMContent");
    v9[0] = CFSTR("Identifier");
    v9[1] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    if (-[SCRCMathRowFormatter isNumberOverride](self, "isNumberOverride"))
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsNumberOverride"));
    -[SCRCMathRowFormatter _addDictionary:](self, "_addDictionary:", v7);

  }
}

- (void)addRadicalWithRootIndex:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8[0] = CFSTR("AXMType");
    v8[1] = CFSTR("AXMRootIndexObject");
    v9[0] = CFSTR("RootOperation");
    v9[1] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    if (-[SCRCMathRowFormatter isNumberOverride](self, "isNumberOverride"))
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsNumberOverride"));
    -[SCRCMathRowFormatter _addDictionary:](self, "_addDictionary:", v7);

  }
}

- (void)addOpenParenthesis
{
  void *v2;
  id v3;

  -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", v2);

}

- (void)addCloseParenthesis:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v3 = a3;
  v13[4] = *MEMORY[0x24BDAC8D0];
  -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLastObject");

    v12[0] = CFSTR("AXMType");
    v12[1] = CFSTR("AXMChildren");
    v13[0] = CFSTR("Fenced");
    v13[1] = v8;
    v12[2] = CFSTR("AXMOpenOperator");
    v12[3] = CFSTR("AXMCloseOperator");
    v13[2] = CFSTR("(");
    v13[3] = CFSTR(")");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v3)
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsImplicit"));
    if (-[SCRCMathRowFormatter isNumberOverride](self, "isNumberOverride"))
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsNumberOverride"));
    -[SCRCMathRowFormatter _addDictionary:](self, "_addDictionary:", v11);

  }
}

- (void)addSubscript:(id)a3 superscript:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("SubSuperScript"), CFSTR("AXMType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("AXMSubscriptObject"));
    if (v6)
      objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("AXMSuperscriptObject"));
    if (-[SCRCMathRowFormatter isNumberOverride](self, "isNumberOverride"))
      objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXMIsNumberOverride"));
    -[SCRCMathRowFormatter _addDictionary:](self, "_addDictionary:", v9);

  }
}

- (void)appendMathEquation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Row"));

    if (v8)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("AXMChildren"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObjectsFromArray:", v10);
  }

}

- (void)_addDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (v20)
  {
    -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AXMType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RootOperation")) & 1) != 0)
        {
          objc_msgSend(v7, "lastObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AXMRadicandObject"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            objc_msgSend(v7, "lastObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v12, "mutableCopy");

            objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("AXMRadicandObject"));
            objc_msgSend(v7, "removeLastObject");
            objc_msgSend(v7, "addObject:", v13);

LABEL_12:
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v14 = objc_msgSend(v7, "count");
      v15 = v20;
      if (v14
        && (objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AXMType")),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SubSuperScript")),
            v16,
            v15 = v20,
            v17))
      {
        v18 = (void *)objc_msgSend(v20, "mutableCopy");
        objc_msgSend(v7, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("AXMBaseObject"));

        objc_msgSend(v7, "removeLastObject");
        objc_msgSend(v7, "addObject:", v18);

      }
      else
      {
        objc_msgSend(v7, "addObject:", v15);
      }
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (id)mathEquation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[SCRCMathRowFormatter childrenStack](self, "childrenStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SCRCMathRowFormatter isNumberOverride](self, "isNumberOverride"))
    {
      v16[0] = CFSTR("AXMType");
      v16[1] = CFSTR("AXMChildren");
      v17[0] = CFSTR("Row");
      v17[1] = v6;
      v16[2] = CFSTR("AXMIsNumberOverride");
      v17[2] = MEMORY[0x24BDBD1C8];
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v17;
      v11 = v16;
      v12 = 3;
    }
    else
    {
      v14[0] = CFSTR("AXMType");
      v14[1] = CFSTR("AXMChildren");
      v15[0] = CFSTR("Row");
      v15[1] = v6;
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v15;
      v11 = v14;
      v12 = 2;
    }
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v7;

  return v13;
}

- (NSMutableArray)childrenStack
{
  return self->_childrenStack;
}

- (void)setChildrenStack:(id)a3
{
  objc_storeStrong((id *)&self->_childrenStack, a3);
}

- (BOOL)isNumberOverride
{
  return self->_isNumberOverride;
}

- (void)setIsNumberOverride:(BOOL)a3
{
  self->_isNumberOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childrenStack, 0);
}

@end
