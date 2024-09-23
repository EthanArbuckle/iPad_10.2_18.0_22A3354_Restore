@implementation TMLJSONObject

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, v5, CFSTR("rawJSON")) & 1) != 0)
    LOBYTE(v8) = 0;
  else
    v8 = objc_msgSend_isEqualToString_(v3, v6, v7, CFSTR("SCHEMA")) ^ 1;

  return v8;
}

+ (id)tmlPropertyWithKeyPath:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  TMLPropertyDescriptor *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, v5, CFSTR("rawJSON")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, v7, CFSTR("SCHEMA")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v8, v9, CFSTR("DATA")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v10, v11, CFSTR("STRING")) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v14 = [TMLPropertyDescriptor alloc];
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v15, v16, CFSTR("."), CFSTR("/"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastPathComponent(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend_initWithName_type_attributes_(v14, v21, v22, v20, 16, 0);

  }
  return v12;
}

- (TMLJSONObject)initWithSchema:(id)a3
{
  double v3;

  return (TMLJSONObject *)objc_msgSend_initWithSchema_json_(self, a2, v3, a3, 0);
}

- (TMLJSONObject)initWithSchema:(id)a3 json:(id)a4
{
  id v7;
  id v8;
  TMLJSONObject *v9;
  TMLJSONObject *v10;
  id v11;
  const char *v12;
  double v13;
  uint64_t v14;
  NSMutableDictionary *derived;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TMLJSONObject;
  v9 = -[TMLJSONObject init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_SCHEMA, a3);
    objc_storeStrong((id *)&v10->_rawJSON, a4);
    if (v10->_SCHEMA)
    {
      v11 = objc_alloc(MEMORY[0x24BDBCED8]);
      v14 = objc_msgSend_initWithCapacity_(v11, v12, v13, 16);
      derived = v10->_derived;
      v10->_derived = (NSMutableDictionary *)v14;
    }
    else
    {
      derived = v10->_derived;
      v10->_derived = 0;
    }

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v3;
  void *v5;
  TMLJSONSchema *SCHEMA;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  v5 = (void *)objc_msgSend_allocWithZone_(TMLJSONObject, a2, v3, a3);
  SCHEMA = self->_SCHEMA;
  objc_msgSend_rawJSON(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithSchema_json_(v5, v10, v11, SCHEMA, v9);

  return v12;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  id v8;
  void *v9;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, v5, CFSTR("rawJSON")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, v7, CFSTR("SCHEMA")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v3, v6, v7, CFSTR("DATA")) & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v6, v7, CFSTR("STRING")))
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_255B51B40 != -1)
      dispatch_once(&qword_255B51B40, &unk_24F500090);
    v8 = (id)qword_255B51B38;
  }
  v9 = v8;

  return v9;
}

- (void)setRawJSON:(id)a3
{
  ((void (*)(TMLJSONObject *, char *))MEMORY[0x24BEDD108])(self, sel_setRawJSONSync_);
}

- (void)setRawJSONSync:(id)a3
{
  double v3;

  objc_msgSend_validateJSON_completion_(self, a2, v3, a3, 0);
}

- (BOOL)internalSetJSON:(id)a3
{
  const char *v5;
  NSDictionary *v6;
  double v7;
  NSDictionary *rawJSON;
  const char *v9;
  double v10;
  BOOL v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;

  v6 = (NSDictionary *)a3;
  rawJSON = self->_rawJSON;
  if (rawJSON == v6 || (objc_msgSend_isEqualToDictionary_(rawJSON, v5, v7, v6) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_willChangeValueForKey_(self, v9, v10, CFSTR("rawJSON"));
    objc_storeStrong((id *)&self->_rawJSON, a3);
    objc_msgSend_didChangeValueForKey_(self, v12, v13, CFSTR("rawJSON"));
    objc_msgSend_allValues(self->_derived, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_makeObjectsPerformSelector_withObject_(v16, v17, v18, sel_setRawJSON_, 0);

    objc_msgSend_notifyAllObservers(self, v19, v20);
    objc_msgSend_emitTMLSignal_withArguments_(self, v21, v22, CFSTR("modified"), 0);
    v11 = 1;
  }

  return v11;
}

- (void)validateJSON:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  double v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v8 = a4;
  if (v8)
  {
    dispatch_get_global_queue(2, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22AD3F104;
    block[3] = &unk_24F4FD310;
    block[4] = self;
    v12 = v6;
    v13 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    objc_msgSend_internalValidateJSON_completion_(self, v7, v9, v6, 0);
  }

}

- (void)internalValidateJSON:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  double v17;
  void *v18;
  id v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  uint64_t v24;
  _QWORD block[5];
  id v26;
  void (**v27)(id, uint64_t);
  id v28;
  id v29;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend_isValidJSONObject_(MEMORY[0x24BDD1608], v9, v10, v8))
    {
      v13 = v8;
      goto LABEL_8;
    }
    v29 = 0;
    objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x24BDD1608], v11, v12, v8, 0, &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v29;
    v18 = v15;
    if (v14)
    {
      v28 = v15;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v16, v17, v14, 0, &v28);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v28;

      goto LABEL_8;
    }

  }
  v13 = 0;
LABEL_8:

  if (objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], v20, v21))
  {
    v24 = objc_msgSend_internalSetJSON_(self, v22, v23, v13);
    if (v7)
      v7[2](v7, v24);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22AD3F30C;
    block[3] = &unk_24F4FD310;
    block[4] = self;
    v26 = v13;
    v27 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)setDATA:(id)a3
{
  const char *v4;
  NSData *v5;
  double v6;
  NSData *DATA;
  const char *v8;
  double v9;
  NSData *v10;
  NSData *v11;
  const char *v12;
  double v13;
  NSObject *v14;
  _QWORD block[5];

  v5 = (NSData *)a3;
  DATA = self->_DATA;
  if (DATA != v5 && (objc_msgSend_isEqualToData_(DATA, v4, v6, v5) & 1) == 0)
  {
    v10 = (NSData *)objc_msgSend_copy(v5, v8, v9);
    v11 = self->_DATA;
    self->_DATA = v10;

    if (v5)
    {
      dispatch_get_global_queue(2, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_22AD3F460;
      block[3] = &unk_24F5000F8;
      block[4] = self;
      dispatch_async(v14, block);

    }
    else
    {
      objc_msgSend_internalSetJSON_(self, v12, v13, 0);
    }
  }

}

- (void)setSTRING:(id)a3
{
  char *v4;
  double v5;
  NSString *STRING;
  char isEqualToString;
  double v8;
  NSString *v9;
  NSString *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  char *v16;

  v4 = (char *)a3;
  STRING = self->_STRING;
  if (STRING != (NSString *)v4)
  {
    v16 = v4;
    isEqualToString = objc_msgSend_isEqualToString_(STRING, v4, v5, v4);
    v4 = v16;
    if ((isEqualToString & 1) == 0)
    {
      v9 = (NSString *)objc_msgSend_copy(v16, v16, v8);
      v10 = self->_STRING;
      self->_STRING = v9;

      objc_msgSend_dataUsingEncoding_(v16, v11, v12, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDATA_(self, v14, v15, v13);

      v4 = v16;
    }
  }

}

- (id)valueForKey:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  id v15;
  void *v17;
  const char *v18;
  double v19;
  TMLJSONObjectDerived *v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  void *v27;
  id v28;
  const char *v29;
  double v30;
  _QWORD v31[4];
  id v32;
  id v33;
  TMLJSONObject *v34;
  objc_super v35;

  v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, v6, CFSTR("rawJSON")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v7, v8, CFSTR("SCHEMA")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v9, v10, CFSTR("DATA")) & 1) != 0
    || objc_msgSend_isEqualToString_(v4, v11, v12, CFSTR("STRING")))
  {
    v35.receiver = self;
    v35.super_class = (Class)TMLJSONObject;
    -[TMLJSONObject valueForKey:](&v35, sel_valueForKey_, v4);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_valueForKey_(self->_rawJSON, v13, v14, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(self->_derived, v18, v19, v4);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v20 = [TMLJSONObjectDerived alloc];
        v15 = (id)objc_msgSend_initWithParent_keyPath_(v20, v21, v22, self, v4);
        objc_msgSend_setObject_forKey_(self->_derived, v23, v24, v15, v4);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (void *)objc_msgSend_mutableCopy(v17, v25, v26);
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = sub_22AD3F730;
        v31[3] = &unk_24F500120;
        v28 = v27;
        v32 = v28;
        v33 = v4;
        v34 = self;
        objc_msgSend_enumerateObjectsUsingBlock_(v28, v29, v30, v31);
        v15 = v28;

      }
      else
      {
        v15 = v17;
      }
    }

  }
  return v15;
}

- (id)valueForKeyPath:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  id v15;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  double v29;
  TMLJSONObjectDerived *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  void *v37;
  id v38;
  const char *v39;
  double v40;
  _QWORD v41[4];
  id v42;
  id v43;
  TMLJSONObject *v44;
  objc_super v45;

  v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, v6, CFSTR("rawJSON")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v7, v8, CFSTR("SCHEMA")) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v9, v10, CFSTR("DATA")) & 1) != 0
    || objc_msgSend_isEqualToString_(v4, v11, v12, CFSTR("STRING")))
  {
    v45.receiver = self;
    v45.super_class = (Class)TMLJSONObject;
    -[TMLJSONObject valueForKeyPath:](&v45, sel_valueForKeyPath_, v4);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend_hasSuffix_(v4, v13, v14, CFSTR(".rawJSON")))
  {
    v19 = objc_msgSend_length(v4, v17, v18);
    objc_msgSend_substringToIndex_(v4, v20, v21, v19 - 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rawValueForKeyPath_dictionary_(self, v23, v24, v22, self->_rawJSON);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v15 = v26;

  }
  else
  {
    objc_msgSend_rawValueForKeyPath_dictionary_(self, v17, v18, v4, self->_rawJSON);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(self->_derived, v28, v29, v4);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v30 = [TMLJSONObjectDerived alloc];
        v15 = (id)objc_msgSend_initWithParent_keyPath_(v30, v31, v32, self, v4);
        objc_msgSend_setObject_forKey_(self->_derived, v33, v34, v15, v4);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = (void *)objc_msgSend_mutableCopy(v27, v35, v36);
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = sub_22AD3FA84;
        v41[3] = &unk_24F500120;
        v38 = v37;
        v42 = v38;
        v43 = v4;
        v44 = self;
        objc_msgSend_enumerateObjectsUsingBlock_(v27, v39, v40, v41);
        v15 = v38;

      }
      else
      {
        v15 = v27;
      }
    }

  }
  return v15;
}

- (id)rawValueForKeyPath:(id)a3 dictionary:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  double v24;
  const char *v25;
  unint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  unint64_t v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;

  v6 = a3;
  v8 = a4;
  if (qword_255B51B58 != -1)
    dispatch_once(&qword_255B51B58, &unk_24F500140);
  v10 = objc_msgSend_rangeOfCharacterFromSet_(v6, v7, v9, qword_255B51B48);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_tmlValueForKeyPath_(v8, v11, v12, v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v10;
    objc_msgSend_substringToIndex_(v6, v11, v12, v10 - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tmlValueForKeyPath_(v8, v16, v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = qword_255B51B50;
      v22 = objc_msgSend_length(v6, v19, v20);
      v26 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v6, v23, v24, v21, 0, v14 + 1, v22 - v14 - 2);
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        v26 = objc_msgSend_length(v6, v25, v27);
      objc_msgSend_substringWithRange_(v6, v25, v27, v14 + 1, v26 + ~v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_integerValue(v28, v29, v30);
      if (v31 >= objc_msgSend_count(v18, v32, v33))
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend_objectAtIndex_(v18, v34, v35, v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26 >= objc_msgSend_length(v6, v37, v38))
        {
          v13 = v36;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_substringFromIndex_(v6, v39, v40, v26 + 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_rawValueForKeyPath_dictionary_(self, v42, v43, v41, v36);
            v13 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v13 = 0;
          }
        }

      }
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)tmlAddObserver:(id)a3 forKeyPath:(id)a4 callback:(id)a5
{
  id v8;
  const char *v9;
  void (**v10)(id, id, id, void *);
  double v11;
  NSMutableSet *observers;
  NSMutableSet *v13;
  NSMutableSet *v14;
  TMLJSONObserverInfo *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a4;
  v10 = (void (**)(id, id, id, void *))a5;
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v9, v11);
    v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v14 = self->_observers;
    self->_observers = v13;

    observers = self->_observers;
  }
  v15 = [TMLJSONObserverInfo alloc];
  v18 = (void *)objc_msgSend_initWithObserver_keyPath_callback_(v15, v16, v17, v24, v8, v10);
  objc_msgSend_addObject_(observers, v19, v20, v18);

  objc_msgSend_valueForKeyPath_(self, v21, v22, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v24, v8, v23);

}

- (void)tmlRemoveObserver:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *observers;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  observers = self->_observers;
  if (observers)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_22AD40010;
    v21 = sub_22AD40020;
    v22 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_22AD40028;
    v13[3] = &unk_24F500168;
    v14 = v6;
    v15 = v7;
    v16 = &v17;
    objc_msgSend_enumerateObjectsUsingBlock_(observers, v9, v10, v13);
    if (v18[5])
      objc_msgSend_removeObject_(self->_observers, v11, v12);

    _Block_object_dispose(&v17, 8);
  }

}

- (void)notifyAllObservers
{
  double v2;
  const char *v4;
  double v5;
  void *v6;
  id v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_count(self->_observers, a2, v2))
  {
    v6 = (void *)objc_msgSend_copy(self->_observers, v4, v5);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v6;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, v9, &v23, v27, 16);
    if (v10)
    {
      v13 = v10;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v7);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend_keyPath(v16, v11, v12, (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_valueForKeyPath_(self, v18, v19, v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_notify_(v16, v21, v22, v20);

        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, v12, &v23, v27, 16);
      }
      while (v13);
    }

  }
}

- (TMLJSONSchema)SCHEMA
{
  return self->_SCHEMA;
}

- (NSDictionary)rawJSON
{
  return self->_rawJSON;
}

- (NSData)DATA
{
  return self->_DATA;
}

- (NSString)STRING
{
  return self->_STRING;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_STRING, 0);
  objc_storeStrong((id *)&self->_DATA, 0);
  objc_storeStrong((id *)&self->_SCHEMA, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_derived, 0);
  objc_storeStrong((id *)&self->_rawJSON, 0);
}

@end
