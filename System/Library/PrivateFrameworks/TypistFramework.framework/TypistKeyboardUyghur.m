@implementation TypistKeyboardUyghur

- (id)init:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[TypistKeyboardUyghur setSmallLettersInitialVowelMap:](self, "setSmallLettersInitialVowelMap:", &unk_251A99330);
  -[TypistKeyboardUyghur setCapitalLettersInitialVowelMap:](self, "setCapitalLettersInitialVowelMap:", &unk_251A99358);
  v10.receiver = self;
  v10.super_class = (Class)TypistKeyboardUyghur;
  v8 = -[TypistKeyboard init:options:locale:](&v10, sel_init_options_locale_, v7, v6, CFSTR("ug"));

  return v8;
}

- (id)addKeyboardPopupKeys:(id)a3 inPlane:(id)a4 addTo:(id)a5 keyplaneKeycaps:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "containsString:", CFSTR("letters")))
  {
    v14 = v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TypistKeyboardUyghur;
    -[TypistKeyboard addKeyboardPopupKeys:inPlane:addTo:keyplaneKeycaps:](&v17, sel_addKeyboardPopupKeys_inPlane_addTo_keyplaneKeycaps_, v10, v11, v12, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (void)_addDoubleVowelKeys:(id)a3 withMapping:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v43 = a4;
  objc_msgSend(v43, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v46;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
        objc_msgSend(v43, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[TypistKeyboard keyPlanes](self, "keyPlanes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "mutableCopy");
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v9);

          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v24 = v9;
LABEL_10:
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("key"));

          goto LABEL_11;
        }
        objc_msgSend(v14, "objectForKeyedSubscript:", v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v6);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v9);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v34, "mutableCopy");
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v6);
          v37 = v6;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v35, v8);

          v6 = v37;
          -[TypistKeyboard keyPlanes](self, "keyPlanes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v37);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v24 = v8;
          goto LABEL_10;
        }
        TYLog(CFSTR("CRITICAL WARNING: Neither the '%@' nor the %@ key are found!!"), v26, v27, v28, v29, v30, v31, v32, (char)v8);
LABEL_11:

        ++v7;
      }
      while (v44 != v7);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      v44 = v39;
    }
    while (v39);
  }

}

- (void)preprocessing
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardUyghur;
  -[TypistKeyboard preprocessing](&v5, sel_preprocessing);
  -[TypistKeyboardUyghur capitalLettersInitialVowelMap](self, "capitalLettersInitialVowelMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboardUyghur _addDoubleVowelKeys:withMapping:](self, "_addDoubleVowelKeys:withMapping:", CFSTR("capital-letters"), v3);

  -[TypistKeyboardUyghur smallLettersInitialVowelMap](self, "smallLettersInitialVowelMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TypistKeyboardUyghur _addDoubleVowelKeys:withMapping:](self, "_addDoubleVowelKeys:withMapping:", CFSTR("small-letters-small-display"), v4);

}

- (TypistKeyboardUyghur)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardUyghur *v5;
  uint64_t v6;
  NSDictionary *smallLettersInitialVowelMap;
  uint64_t v8;
  NSDictionary *capitalLettersInitialVowelMap;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardUyghur;
  v5 = -[TypistKeyboard initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smallLettersInitialVowelMap"));
    v6 = objc_claimAutoreleasedReturnValue();
    smallLettersInitialVowelMap = v5->_smallLettersInitialVowelMap;
    v5->_smallLettersInitialVowelMap = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capitalLettersInitialVowelMap"));
    v8 = objc_claimAutoreleasedReturnValue();
    capitalLettersInitialVowelMap = v5->_capitalLettersInitialVowelMap;
    v5->_capitalLettersInitialVowelMap = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *smallLettersInitialVowelMap;
  NSDictionary *capitalLettersInitialVowelMap;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardUyghur;
  -[TypistKeyboard encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  smallLettersInitialVowelMap = self->_smallLettersInitialVowelMap;
  if (smallLettersInitialVowelMap)
    objc_msgSend(v4, "encodeObject:forKey:", smallLettersInitialVowelMap, CFSTR("smallLettersInitialVowelMap"));
  capitalLettersInitialVowelMap = self->_capitalLettersInitialVowelMap;
  if (capitalLettersInitialVowelMap)
    objc_msgSend(v4, "encodeObject:forKey:", capitalLettersInitialVowelMap, CFSTR("capitalLettersInitialVowelMap"));

}

- (NSDictionary)smallLettersInitialVowelMap
{
  return self->_smallLettersInitialVowelMap;
}

- (void)setSmallLettersInitialVowelMap:(id)a3
{
  objc_storeStrong((id *)&self->_smallLettersInitialVowelMap, a3);
}

- (NSDictionary)capitalLettersInitialVowelMap
{
  return self->_capitalLettersInitialVowelMap;
}

- (void)setCapitalLettersInitialVowelMap:(id)a3
{
  objc_storeStrong((id *)&self->_capitalLettersInitialVowelMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capitalLettersInitialVowelMap, 0);
  objc_storeStrong((id *)&self->_smallLettersInitialVowelMap, 0);
}

@end
