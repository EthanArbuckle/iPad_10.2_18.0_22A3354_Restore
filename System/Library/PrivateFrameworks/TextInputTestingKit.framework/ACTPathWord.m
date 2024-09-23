@implementation ACTPathWord

- (ACTPathWord)initWithPath:(id)a3 intendedString:(id)a4 keyplane:(id)a5 fromUserData:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  ACTPathWord *v14;
  ACTPathWord *v15;
  uint64_t v16;
  NSString *intendedString;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACTPathWord;
  v14 = -[ACTPathWord init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_path, a3);
    v16 = objc_msgSend(v12, "copy");
    intendedString = v15->_intendedString;
    v15->_intendedString = (NSString *)v16;

    objc_storeStrong((id *)&v15->_keyplane, a5);
    v15->_fromUserData = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTPathWord path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTPathWord intendedString](self, "intendedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTPathWord keyplane](self, "keyplane");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ACTPathWord fromUserData](self, "fromUserData");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: path=%@, intended=%@, keyplane=%@, fromUserData=%@>"), v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "isDebugEnabled"))
  {
    objc_msgSend(v6, "getDebugObject:", CFSTR("PATH_ARRAY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v10;

    v23[0] = CFSTR("word");
    -[ACTPathWord intendedString](self, "intendedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    v23[1] = CFSTR("path");
    -[ACTPathWord path](self, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "toJsonDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("samples"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    v23[2] = CFSTR("layout");
    -[ACTPathWord keyplane](self, "keyplane");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTPathWord intendedString](self, "intendedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jsonFrameArrayForWord:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v14;
    v23[3] = CFSTR("userdata");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACTPathWord fromUserData](self, "fromUserData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v16);

    objc_msgSend(v6, "addDebugObject:forKey:", v22, CFSTR("PATH_ARRAY"));
  }
  -[ACTPathWord path](self, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTPathWord callback](self, "callback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performStrokeForPath:typingLog:callback:", v17, v6, v18);

}

- (TIContinuousPath)path
{
  return self->_path;
}

- (NSString)intendedString
{
  return self->_intendedString;
}

- (TTKKeyboardPlane)keyplane
{
  return self->_keyplane;
}

- (BOOL)fromUserData
{
  return self->_fromUserData;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_intendedString, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
