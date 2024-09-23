@implementation TTKKeyboardPlane

- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 layoutUtils:(id)a4
{
  id v7;
  id v8;
  TTKKeyboardPlane *v9;
  TTKKeyboardPlane *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTKKeyboardPlane;
  v9 = -[TTKKeyboardPlane init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyplane, a3);
    objc_storeStrong((id *)&v10->_layoutUtils, a4);
  }

  return v10;
}

- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 locale:(id)a4
{
  id v7;
  id v8;
  TTKKeyboardPlane *v9;
  TTKKeyboardPlane *v10;
  ACTKeyboardLayoutUtils *v11;
  ACTKeyboardLayoutUtils *layoutUtils;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TTKKeyboardPlane;
  v9 = -[TTKKeyboardPlane init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyplane, a3);
    v11 = -[ACTKeyboardLayoutUtils initWithLocale:]([ACTKeyboardLayoutUtils alloc], "initWithLocale:", v8);
    layoutUtils = v10->_layoutUtils;
    v10->_layoutUtils = v11;

  }
  return v10;
}

- (id)findKey:(id)a3
{
  void *v4;
  TTKKey *v5;
  uint64_t v7;

  LOBYTE(v7) = 1;
  -[ACTKeyboardLayoutUtils anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:](self->_layoutUtils, "anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:", a3, self->_keyplane, 0, 0, 1, 0, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[TTKKey initWithUIKBTree:layoutUtils:]([TTKKey alloc], "initWithUIKBTree:layoutUtils:", v4, self->_layoutUtils);
  else
    v5 = 0;

  return v5;
}

- (id)jsonFrameArrayForWord:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v22;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "substringWithRange:", v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTKKeyboardPlane findKey:](self, "findKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v25[0] = v5;
        v24[0] = CFSTR("k");
        v24[1] = CFSTR("x");
        v8 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v6, "frame");
        objc_msgSend(v8, "numberWithInteger:", (uint64_t)v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v10;
        v24[2] = CFSTR("y");
        v11 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "frame");
        objc_msgSend(v11, "numberWithInteger:", (uint64_t)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = v13;
        v24[3] = CFSTR("w");
        v14 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "frame");
        objc_msgSend(v14, "numberWithInteger:", (uint64_t)v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[3] = v16;
        v24[4] = CFSTR("h");
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "frame");
        objc_msgSend(v17, "numberWithInteger:", (uint64_t)v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25[4] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v20);

      }
      ++v4;
    }
    while (objc_msgSend(v3, "length") > v4);
  }

  return v22;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBTree frame](self->_keyplane, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutUtils, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end
